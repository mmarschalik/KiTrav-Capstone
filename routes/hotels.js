const express = require('express');
const router = express.Router();
const hotels = require('../services/amadeusHotels');

const mockHotels = (() => {
  try { return require('../mock/mock_hotels.json'); }
  catch (e) { return []; }
})();

// POST /api/hotels/search
router.post('/search', async (req, res) => {
  try {
    const city = req.body?.city || req.query?.city;
    if (!city && process.env.MOCK_MODE !== 'true') {
      return res.status(400).json({ ok: false, error: 'Missing required parameter: city' });
    }

    if (process.env.MOCK_MODE === 'true' || !city) {
      const results = mockHotels.filter(h => !city || h.city === city);
      return res.json({ ok: true, count: results.length, results });
    }

    const results = await hotels.searchHotels({ city });
    res.json({ ok: true, count: results.length, results });
  } catch (e) {
    console.error('Hotel route error', e);
    res.status(500).json({ ok: false, error: e.message });
  }
});

module.exports = router;
