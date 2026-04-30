const express = require('express');
const router = express.Router();
const amadeus = require('../services/amadeusService');

router.post('/search', async (req, res) => {
  try {
    // If you have authentication middleware, replace this
    const userId = req.user?.id || null;
    const params = req.body;

    const offers = await amadeus.searchFlightsAndSave(params, { userId });
    return res.json({ ok: true, count: offers.length, offers });
  } catch (err) {
    console.error('Flight search endpoint error', err);
    return res.status(500).json({ ok: false, error: err.message });
  }
});

module.exports = router;
