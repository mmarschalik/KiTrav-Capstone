const express = require('express');
const cors = require('cors');
require('dotenv').config();

const pool = require('./db');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Simple test route
app.get('/', (req, res) => {
  res.send('Kitravia backend is running');
});


app.get('/api/flights/search', async (req, res) => {
  try {
    const { origin, destination, date, adults } = req.query;

    res.status(200).json({
      success: true,
      flights: [
        {
          id: 'FL001',
          airline: 'Delta Airlines',
          price: 325,
          origin,
          destination,
          departureTime: `${date}T08:00:00`,
          arrivalTime: `${date}T09:30:00`,
          adults: Number(adults)
        },
        {
          id: 'FL002',
          airline: 'Southwest',
          price: 199,
          origin,
          destination,
          departureTime: `${date}T10:15:00`,
          arrivalTime: `${date}T11:20:00`,
          adults: Number(adults)
        }
      ]
    });
  } catch (error) {
    console.error('Error fetching flights:', error.message);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch flights'
    });
  }
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});