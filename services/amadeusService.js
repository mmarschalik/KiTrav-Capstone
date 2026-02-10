const axios = require('axios');
const db = require('./db');
const crypto = require('crypto');

class AmadeusService {
  constructor() {
    this.clientId = process.env.AMADEUS_CLIENT_ID;
    this.clientSecret = process.env.AMADEUS_CLIENT_SECRET;
    this.baseUrl = process.env.AMADEUS_ENV === 'production'
      ? 'https://api.amadeus.com/v1'
      : 'https://test.api.amadeus.com/v1';
    this.accessToken = null;
    this.tokenExpiry = null;
    this.providerName = 'Amadeus';
  }

  async getAccessToken() {
    if (this.accessToken && this.tokenExpiry && Date.now() < this.tokenExpiry) return this.accessToken;
    try {
      const response = await axios.post(
        `${this.baseUrl}/security/oauth2/token`,
        new URLSearchParams({
          grant_type: 'client_credentials',
          client_id: this.clientId,
          client_secret: this.clientSecret
        }),
        { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
      );
      this.accessToken = response.data.access_token;
      this.tokenExpiry = Date.now() + (response.data.expires_in - 300) * 1000;
      return this.accessToken;
    } catch (err) {
      console.error('Amadeus token error', err.response?.data || err.message);
      throw new Error('Failed to authenticate with Amadeus');
    }
  }

  formatFlightOffers(amadeusResponse) {
    if (!amadeusResponse) return [];
    const offers = Array.isArray(amadeusResponse.data) ? amadeusResponse.data : (amadeusResponse.data?.offers || amadeusResponse.data || []);
    return offers.map(offer => {
      const id = offer.id || offer.offerId || crypto.randomUUID();
      const priceObj = offer.price || offer.prices?.[0] || offer.total || {};
      const amount = priceObj?.total || priceObj?.grandTotal || priceObj?.base || null;
      const currency = priceObj?.currency || priceObj?.currencyCode || (priceObj?.totalCurrency || null);
      const itineraries = offer.itineraries || offer.itinerary || offer.trips || [];
      const segments = (itineraries[0]?.segments) || [];
      const origin = segments[0]?.departure?.iataCode || segments[0]?.departure?.iata || null;
      const destination = segments[segments.length - 1]?.arrival?.iataCode || segments[segments.length - 1]?.arrival?.iata || null;
      const departs_at = segments[0]?.departure?.at || segments[0]?.departure?.scheduledTime || null;
      const arrives_at = segments[segments.length - 1]?.arrival?.at || segments[segments.length - 1]?.arrival?.scheduledTime || null;

      return {
        id,
        price: {
          amount: amount ? parseFloat(amount) : null,
          currency: currency || 'USD'
        },
        origin,
        destination,
        departs_at,
        arrives_at,
        cabin_class: offer.travelClass || offer.travel_class || null,
        seats_available: offer.numberOfBookableSeats || null,
        data: offer
      };
    });
  }

  async searchFlightsAndSave(params, { userId = null } = {}) {
    const token = await this.getAccessToken();
    try {
      const response = await axios.get(
        `${this.baseUrl}/shopping/flight-offers`,
        {
          headers: { Authorization: `Bearer ${token}` },
          params: {
            originLocationCode: params.origin,
            destinationLocationCode: params.destination,
            departureDate: params.departureDate,
            returnDate: params.returnDate,
            adults: params.adults || 1,
            children: params.children || 0,
            travelClass: params.travelClass || 'ECONOMY',
            currencyCode: params.currency || 'USD',
            max: params.maxResults || 50
          }
        }
      );

      const formatted = this.formatFlightOffers(response.data);
      await this.persistSearchAndOffers(params, response.data, formatted, { userId });
      return formatted;
    } catch (err) {
      console.error('searchFlightsAndSave error', err.response?.data || err.message);
      throw new Error('Failed to search flights');
    }
  }

  async persistSearchAndOffers(searchParams, rawResponse, formattedOffers, { userId = null } = {}) {
    const client = await db.pool.connect();
    try {
      await client.query('BEGIN');

      // provider upsert (ensure provider exists)
      const provRes = await client.query(
        `INSERT INTO providers (name, type, metadata, created_at)
         VALUES ($1, $2, $3, now())
         ON CONFLICT (name) DO UPDATE SET metadata = providers.metadata
         RETURNING id`,
        [this.providerName, 'flight', { baseUrl: this.baseUrl }]
      );
      const providerId = provRes.rows[0].id;

      // saves search
      const qJson = {
        origin: searchParams.origin,
        destination: searchParams.destination,
        departureDate: searchParams.departureDate,
        returnDate: searchParams.returnDate,
        adults: searchParams.adults || 1,
        children: searchParams.children || 0,
        travelClass: searchParams.travelClass || 'ECONOMY',
        currency: searchParams.currency || 'USD'
      };
      const searchRes = await client.query(
        `INSERT INTO searches (user_id, query, raw_response, created_at)
         VALUES ($1, $2, $3, now())
         RETURNING id`,
        [userId, qJson, rawResponse]
      );
      const searchId = searchRes.rows[0].id;

      // upsert flights
      const upsertText = `
        INSERT INTO flights
          (id, provider_id, provider_offer_id, origin, destination, departs_at, arrives_at,
           cabin_class, price_amount, price_currency, seats_available, data, created_at)
        VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12, now())
        ON CONFLICT (provider_offer_id) DO UPDATE SET
          provider_id = EXCLUDED.provider_id,
          origin = EXCLUDED.origin,
          destination = EXCLUDED.destination,
          departs_at = EXCLUDED.departs_at,
          arrives_at = EXCLUDED.arrives_at,
          cabin_class = EXCLUDED.cabin_class,
          price_amount = EXCLUDED.price_amount,
          price_currency = EXCLUDED.price_currency,
          seats_available = EXCLUDED.seats_available,
          data = EXCLUDED.data
        RETURNING id
      `;

      for (const offer of formattedOffers) {
        const flightId = offer.id || (offer.data && (offer.data.id || offer.data.offerId)) || crypto.randomUUID();
        const providerOfferId = (offer.data && (offer.data.id || offer.data.offerId)) || offer.id || null;
        await client.query(upsertText, [
          flightId,
          providerId,
          providerOfferId,
          offer.origin,
          offer.destination,
          offer.departs_at ? new Date(offer.departs_at) : null,
          offer.arrives_at ? new Date(offer.arrives_at) : null,
          offer.cabin_class,
          offer.price?.amount,
          offer.price?.currency,
          offer.seats_available,
          offer.data
        ]);
      }

      await client.query('COMMIT');
      return { searchId };
    } catch (err) {
      await client.query('ROLLBACK');
      console.error('persistSearchAndOffers error', err);
      throw err;
    } finally {
      client.release();
    }
  }
}

module.exports = new AmadeusService();
