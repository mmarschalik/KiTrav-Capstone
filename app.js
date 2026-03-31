require('dotenv').config();
const fs = require('fs');
const path = require('path');
const express = require('express');
const app = express();

// middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// helper: safe require if file exists
function safeRequire(relPath) {
  const full = path.join(__dirname, relPath);
  if (fs.existsSync(full + '.js')) {
    return require(full);
  }
  return null;
}

// always-required routers (these should exist)
const flightRouter = safeRequire('./routes/flights');
const hotelRouter = safeRequire('./routes/hotels');
const tripSummaryRouter = safeRequire('./routes/tripSummary');

// optional routers (load only if present)
const pricingRouter = safeRequire('./routes/pricing');
const bookingsRouter = safeRequire('./routes/bookings');

if (flightRouter) app.use('/api/flights', flightRouter);
if (hotelRouter) app.use('/api/hotels', hotelRouter);
if (pricingRouter) app.use('/api/pricing', pricingRouter);
if (bookingsRouter) app.use('/api/bookings', bookingsRouter);
if (tripSummaryRouter) app.use('/api/trip-summary', tripSummaryRouter);

// health
app.get('/health', (req, res) => res.json({ ok: true, ts: new Date().toISOString() }));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`KiTrav API listening on port ${PORT}`));
