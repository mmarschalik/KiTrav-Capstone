const axios = require('axios');
const db = require('./db');
const path = require('path');

const MOCK_PATH = path.join(__dirname, '..', 'mock', 'mock_hotels.json');

class AmadeusHotels {
  constructor() {
    this.clientId = process.env.AMADEUS_CLIENT_ID;
    this.clientSecret = process.env.AMADEUS_CLIENT_SECRET;
    this.baseUrl = process.env.AMADEUS_ENV === 'production'
      ? 'https://api.amadeus.com/v1'
      : 'https://test.api.amadeus.com/v1';
    this.accessToken = null;
    this.tokenExpiry = null;
  }

  async getAccessToken() {
    if (this.accessToken && this.tokenExpiry && Date.now() < this.tokenExpiry) {
      return this.accessToken;
    }
    const res = await axios.post(
      `${this.baseUrl}/security/oauth2/token`,
      new URLSearchParams({
        grant_type: 'client_credentials',
        client_id: this.clientId,
        client_secret: this.clientSecret
      }),
      { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
    );
    this.accessToken = res.data.access_token;
    this.tokenExpiry = Date.now() + (res.data.expires_in - 300) * 1000;
    return this.accessToken;
  }

  // Try Amadeus; on any failure return mock results (so demo works)
  async searchHotels(params = {}) {
    const city = params.city || params.cityCode || params.q;
    if (!city) throw new Error('searchHotels requires a city');

    try {
      const token = await this.getAccessToken();
      const response = await axios.get(
        `${this.baseUrl}/v1/reference-data/locations/hotels/by-city`,
        {
          headers: { Authorization: `Bearer ${token}` },
          params: { cityCode: city }
        }
      );

      const hotels = response.data?.data || [];
      // Save only when we have real data
      if (hotels.length > 0) {
        await this.saveHotels(hotels, city);
      }
      return hotels.length > 0 ? hotels : this._loadMock(city);
    } catch (err) {
      console.error('Hotel search failed (using mock):', err.response?.data || err.message);
      return this._loadMock(city);
    }
  }

  _loadMock(city) {
    try {
      // lazy-load to avoid breaking if mock missing
      const mock = require(MOCK_PATH);
      return mock.filter(h => !city || h.city === city);
    } catch (e) {
      console.error('Failed to load mock hotels:', e.message);
      return [];
    }
  }

  async saveHotels(hotels, city) {
    const client = await db.pool.connect();
    try {
      await client.query('BEGIN');
      const providerRes = await client.query(
        `INSERT INTO providers (name, type, created_at)
         VALUES ($1,$2,now())
         ON CONFLICT (name) DO UPDATE SET type = EXCLUDED.type
         RETURNING id`,
        ['Amadeus', 'hotel']
      );
      const providerId = providerRes.rows[0].id;

      for (const h of hotels.slice(0, 10)) {
        await client.query(
          `INSERT INTO hotels
             (provider_id, name, city, address, stars, data, created_at)
           VALUES ($1,$2,$3,$4,$5,$6,now())
           ON CONFLICT (name) DO NOTHING`,
          [
            providerId,
            h.name || h.hotelName || 'Unknown',
            city,
            (h.address && h.address.lines) ? h.address.lines.join(', ') : (h.address?.line || null),
            h.rating ? parseInt(h.rating) : null,
            h
          ]
        );
      }

      await client.query('COMMIT');
    } catch (e) {
      await client.query('ROLLBACK');
      console.error('saveHotels error', e);
    } finally {
      client.release();
    }
  }
}

module.exports = new AmadeusHotels();
