// services/amadeusService.js
const axios = require('axios');

class AmadeusService {
  constructor() {
    this.clientId = process.env.AMADEUS_CLIENT_ID;
    this.clientSecret = process.env.AMADEUS_CLIENT_SECRET;
    this.baseUrl = process.env.AMADEUS_ENV === 'production' 
      ? 'https://api.amadeus.com/v1'
      : 'https://test.api.amadeus.com/v1';
    this.accessToken = null;
    this.tokenExpiry = null;
  }

  // Get access token from Amadeus
  async getAccessToken() {
    try {
      // Check if token is still valid
      if (this.accessToken && this.tokenExpiry && Date.now() < this.tokenExpiry) {
        return this.accessToken;
      }

      const response = await axios.post(
        `${this.baseUrl}/security/oauth2/token`,
        new URLSearchParams({
          grant_type: 'client_credentials',
          client_id: this.clientId,
          client_secret: this.clientSecret
        }),
        {
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        }
      );

      this.accessToken = response.data.access_token;
      // Set expiry to 5 minutes before actual expiry for safety
      this.tokenExpiry = Date.now() + (response.data.expires_in - 300) * 1000;
      
      return this.accessToken;
    } catch (error) {
      console.error('Error getting Amadeus token:', error.response?.data || error.message);
      throw new Error('Failed to authenticate with Amadeus');
    }
  }

  // Search for flight offers
  async searchFlights(params) {
    try {
      const token = await this.getAccessToken();
      
      const response = await axios.get(
        `${this.baseUrl}/shopping/flight-offers`,
        {
          headers: { Authorization: `Bearer ${token}` },
          params: {
            originLocationCode: params.origin,
            destinationLocationCode: params.destination,
            departureDate: params.departureDate,
            returnDate: params.returnDate, // optional for one-way
            adults: params.adults || 1,
            children: params.children || 0,
            travelClass: params.travelClass || 'ECONOMY',
            currencyCode: params.currency || 'USD',
            max: params.maxResults || 50
          }
        }
      );

      return this.formatFlightOffers(response.data);
    } catch (error) {
      console.error('Error searching flights:', error.response?.data || error.message);
      throw new Error('Failed to search flights');
    }
  }