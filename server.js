import express from "express";
import cors from "cors";
import "dotenv/config";

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));

const PORT = process.env.PORT || 3000;
const AMADEUS_HOST = "https://test.api.amadeus.com";

let compareList = [];

let tokenCache = {
  access_token: null,
  expires_at: 0,
};

async function getAccessToken() {
  const now = Date.now();

  if (tokenCache.access_token && now < tokenCache.expires_at) {
    return tokenCache.access_token;
  }

  const body = new URLSearchParams({
    grant_type: "client_credentials",
    client_id: process.env.AMADEUS_CLIENT_ID,
    client_secret: process.env.AMADEUS_CLIENT_SECRET,
  });

  const res = await fetch(`${AMADEUS_HOST}/v1/security/oauth2/token`, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body,
  });

  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Token error: ${res.status} ${text}`);
  }

  const data = await res.json();

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

    const apiRes = await fetch(url, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    const json = await apiRes.json();
    res.status(apiRes.status).json(json);
  } catch (err) {
    res.status(500).json({
      error: err.message || "Server error",
    });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

function getSimpleSummary(offer){
  const s = summarizeOffer(offer);

  return {
    route: s.isRT
      ? `${s.out.from} → ${s.out.to} / ${s.back.from} → ${s.back.to}`
      : `${s.out.from} → ${s.out.to}`,
    price: fmtMoney(offer),
    airline: getCarrier(offer),
    stops: s.isRT
      ? `Outbound: ${s.out.stops}, Return: ${s.back.stops}`
      : `${s.out.stops}`
  };
}

function addToCompare(index){
  const offer = displayedOffers[index];
  if(!offer) return;

  if(compareList.includes(index)){
    alert("This flight is already in compare.");
    return;
  }

  if(compareList.length >= 2){
    alert("You can only compare 2 flights at a time.");
    return;
  }

  compareList.push(index);

  if(compareList.length === 2){
    showComparison();
  } else {
    alert("First flight added. Choose one more flight to compare.");
  }
}

function showComparison(){
  if(compareList.length < 2){
    alert("Please choose 2 flights first.");
    return;
  }

  const a = getSimpleSummary(displayedOffers[compareList[0]]);
  const b = getSimpleSummary(displayedOffers[compareList[1]]);

  alert(
`Flight Comparison

Flight 1
Route: ${a.route}
Price: ${a.price}
Airline: ${a.airline}
Stops: ${a.stops}

Flight 2
Route: ${b.route}
Price: ${b.price}
Airline: ${b.airline}
Stops: ${b.stops}`
  );

  compareList = [];
}
