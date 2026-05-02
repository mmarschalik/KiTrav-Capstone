import express from "express";
import cors from "cors";
import "dotenv/config";

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));

const PORT = process.env.PORT || 3000;
const AMADEUS_HOST = "https://test.api.amadeus.com";

let tokenCache = {
  access_token: null,
  expires_at: 0,
};

async function getAccessToken() {
  const now = Date.now();

  if (tokenCache.access_token && now < tokenCache.expires_at) {
    console.log("Using cached token");
    return tokenCache.access_token;
  }

  const body = new URLSearchParams({
    grant_type: "client_credentials",
    client_id: process.env.AMADEUS_CLIENT_ID,
    client_secret: process.env.AMADEUS_CLIENT_SECRET,
  });

  console.log("Requesting token...");
  console.log("Client ID exists:", !!process.env.AMADEUS_CLIENT_ID);
  console.log("Client Secret exists:", !!process.env.AMADEUS_CLIENT_SECRET);

  const res = await fetch(`${AMADEUS_HOST}/v1/security/oauth2/token`, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body,
  });

  const text = await res.text();
  console.log("Token status:", res.status);
  console.log("Token response:", text);

  if (!res.ok) {
    throw new Error(`Token error: ${res.status} ${text}`);
  }

  const data = JSON.parse(text);

  tokenCache.access_token = data.access_token;
  tokenCache.expires_at = Date.now() + (data.expires_in - 30) * 1000;

  return tokenCache.access_token;
}

app.get("/api/flights", async (req, res) => {
  try {
    const {
      origin,
      destination,
      date,
      returnDate,
      adults = "1",
      max = "50",
    } = req.query;

    if (!origin || !destination || !date) {
      return res.status(400).json({
        error: "origin, destination, and date are required",
      });
    }

    if (returnDate && returnDate < date) {
      return res.status(400).json({
        error: "returnDate must be the same as or after departure date",
      });
    }

    const token = await getAccessToken();

    const url = new URL(`${AMADEUS_HOST}/v2/shopping/flight-offers`);
    url.searchParams.set("originLocationCode", origin.toUpperCase());
    url.searchParams.set("destinationLocationCode", destination.toUpperCase());
    url.searchParams.set("departureDate", date);
    url.searchParams.set("adults", String(adults));
    url.searchParams.set("max", String(max));

    if (returnDate) {
      url.searchParams.set("returnDate", returnDate);
    }

    console.log("Flights request params:", {
      origin,
      destination,
      date,
      returnDate,
      adults,
      max,
    });
    console.log("Flights URL:", url.toString());

    const apiRes = await fetch(url, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    console.log("Flights API status:", apiRes.status);

    const json = await apiRes.json();
    console.log("Flights API response:", JSON.stringify(json, null, 2));

    if (!apiRes.ok) {
      return res.status(apiRes.status).json(json);
    }

    res.json(json);
  } catch (err) {
    res.status(500).json({
      error: err.message || "Server error",
    });
  }
});

app.get("/api/hotels", async (req, res) => {
  try {
    const {
      destination,
      checkIn,
      checkOut,
      adults = "1",
      currency = "USD",
    } = req.query;

    if (!destination || !checkIn || !checkOut) {
      return res.status(400).json({
        error: "destination, checkIn, and checkOut are required",
      });
    }

    if (!process.env.SERPAPI_KEY) {
      return res.status(500).json({
        error: "SERPAPI_KEY is missing in .env",
      });
    }

    const url = new URL("https://serpapi.com/search");
    url.searchParams.set("engine", "google_hotels");
    url.searchParams.set("q", destination);
    url.searchParams.set("check_in_date", checkIn);
    url.searchParams.set("check_out_date", checkOut);
    url.searchParams.set("adults", String(adults));
    url.searchParams.set("currency", currency);
    url.searchParams.set("gl", "us");
    url.searchParams.set("hl", "en");
    url.searchParams.set("api_key", process.env.SERPAPI_KEY);

    console.log("Hotels request params:", {
      destination,
      checkIn,
      checkOut,
      adults,
      currency,
    });
    console.log("Hotels URL:", url.toString());

    const apiRes = await fetch(url);
    const json = await apiRes.json();

    console.log("Hotels API status:", apiRes.status);
    console.log("Hotels API response:", JSON.stringify(json, null, 2));

    if (!apiRes.ok) {
      return res.status(apiRes.status).json(json);
    }

    const hotels = (json.properties || []).map((hotel) => ({
      name: hotel.name || "No hotel name",
      description: hotel.description || "",
      price: hotel.rate_per_night?.lowest || "N/A",
      numericPrice: hotel.rate_per_night?.extracted_lowest || null,
      rating: hotel.overall_rating || null,
      reviews: hotel.reviews || null,
      amenities: hotel.amenities || [],
      image:
        hotel.images?.[0]?.thumbnail ||
        hotel.thumbnail ||
        "",
      link: hotel.link || "",
    }));

    res.json({ hotels });
  } catch (err) {
    res.status(500).json({
      error: err.message || "Server error",
    });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
