const express = require('express');
const router = express.Router();
const svc = require('../services/tripSummary');

// POST /api/trip-summary
router.post('/', async (req, res) => {
  try {
    console.log('DEBUG tripSummary POST body:', req.body); // <--- debug
    const body = req.body || {};
    if (!body.userId) return res.status(400).json({ ok: false, error: 'Missing required field: userId' });

    const summary = await svc.getOrCreateSummary(body.userId, { title: body.title, notes: body.notes });

    let added = null;
    if (body.addItem) {
      const item = {
        item_type: body.addItem.item_type,
        item_ref: body.addItem.item_ref || {},
        title: body.addItem.title || null,
        start_date: body.addItem.start_date || null,
        end_date: body.addItem.end_date || null
      };
      added = await svc.addItemToSummary(body.userId, item);
    }

    return res.json({ ok: true, summary, added });
  } catch (e) {
    console.error('Trip summary POST error', e);
    return res.status(500).json({ ok: false, error: e.message });
  }
});

// GET and DELETE routes unchanged...
router.get('/:userId', async (req, res) => {
  try {
    const userId = Number(req.params.userId);
    if (!userId) return res.status(400).json({ ok: false, error: 'Invalid userId' });

    const summary = await svc.getSummaryByUser(userId);
    if (!summary) return res.json({ ok: true, summary: null });
    return res.json({ ok: true, summary });
  } catch (e) {
    console.error('Trip summary GET error', e);
    return res.status(500).json({ ok: false, error: e.message });
  }
});

router.delete('/:userId/items/:itemId', async (req, res) => {
  try {
    const userId = Number(req.params.userId);
    const itemId = Number(req.params.itemId);
    if (!userId || !itemId) return res.status(400).json({ ok: false, error: 'Invalid ids' });

    await svc.removeItem(itemId, userId);
    return res.json({ ok: true });
  } catch (e) {
    console.error('Trip summary DELETE item error', e);
    return res.status(500).json({ ok: false, error: e.message });
  }
});

module.exports = router;
