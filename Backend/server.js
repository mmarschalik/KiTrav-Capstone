const express = require("express");
const axios = require("axios");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

app.get("/api/flights/search", async (req, res) => {
  try {
    const {
      departure_id,
      arrival_id,
      outbound_date,
      currency = "USD",
      hl = "en",
      gl = "us",
      adults = 1,
      travel_class = 1
    } = req.query;

    if (!departure_id || !arrival_id || !outbound_date) {
      return res.status(400).json({
        error: "departure_id, arrival_id, and outbound_date are required"
      });
    }

    const response = await axios.get("https://serpapi.com/search", {
      params: {
        engine: "google_flights",
        api_key: process.env.SERPAPI_KEY,
        departure_id,
        arrival_id,
        outbound_date,
        currency,
        hl,
        gl,
        type: 2,
        adults,
        travel_class
      }
    });

    const data = response.data;

    const allFlights = [
      ...(data.best_flights || []),
      ...(data.other_flights || [])
    ];

    const cleanedFlights = allFlights.map((flight, index) => {
      const firstLeg = flight.flights?.[0] || {};
      const lastLeg = flight.flights?.[flight.flights.length - 1] || {};

      return {
        id: index + 1,
        price: flight.price || null,
        total_duration: flight.total_duration || null,
        airline: firstLeg.airline || null,
        airline_logo: `https://federal-varsity-pound.ngrok-free.dev/api/airline-logo?url=${encodeURIComponent(flight.airline_logo || firstLeg.airline_logo || '')}`,
        departure_airport: firstLeg.departure_airport?.id || null,
        departure_time: firstLeg.departure_airport?.time || null,
        arrival_airport: lastLeg.arrival_airport?.id || null,
        arrival_time: lastLeg.arrival_airport?.time || null,
        flights_count: flight.flights?.length || 0,
        layovers: flight.layovers || [],
        booking_token: flight.booking_token || null
      };
    });

    res.json({
      success: true,
      price_insights: data.price_insights || null,
      flights: cleanedFlights
    });

  } catch (error) {
    console.error("SerpApi error:", error.response?.data || error.message);
    res.status(500).json({
      success: false,
      error: "Failed to fetch flight data"
    });
  }
});

app.get("/api/flights/booking-options", async (req, res) => {
  try {
    const { booking_token, hl = "en", gl = "us" } = req.query;

    if (!booking_token) {
      return res.status(400).json({ error: "booking_token is required" });
    }

    const response = await axios.get("https://serpapi.com/search", {
      params: {
        engine: "google_flights",
        api_key: process.env.SERPAPI_KEY,
        booking_token,
        hl,
        gl
      }
    });

    const data = response.data;

    const options = (data.booking_options || []).map((option, index) => ({
      id: index + 1,
      seller: option.together?.book_with || null,
      price: option.together?.price || null,
      booking_url: option.together?.booking_request?.url || null
    }));

    res.json({
      success: true,
      options
    });

  } catch (error) {
    console.error("Booking options error:", error.response?.data || error.message);
    res.status(500).json({
      success: false,
      error: "Failed to fetch booking options"
    });
  }
});


app.get("/api/airline-logo", async (req, res) => {
  try {
    const { url } = req.query;
    if (!url) return res.status(400).json({ error: "url is required" });

    const response = await axios.get(url, {
      responseType: "arraybuffer"
    });

    const contentType = response.headers["content-type"] || "image/png";

    res.set("Content-Type", contentType);
    res.set("Access-Control-Allow-Origin", "*");
    res.send(response.data);
  } catch (error) {
    console.error("Logo proxy error:", error.message);
    res.status(500).json({ error: "Failed to fetch logo" });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
