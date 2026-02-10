// services/tripSummary.js
const db = require('./db'); // adjust path if your db pool lives elsewhere

async function getOrCreateSummary(userId, opts = {}) {
  const client = await db.pool.connect();
  try {
    await client.query('BEGIN');
    // try find
    const res = await client.query(
      `SELECT * FROM trip_summaries WHERE user_id = $1 LIMIT 1`,
      [userId]
    );
    if (res.rows.length > 0) {
      // optionally update title/notes
      if (opts.title || opts.notes) {
        await client.query(
          `UPDATE trip_summaries SET title = COALESCE($2, title), notes = 
COALESCE($3, notes), updated_at = now() WHERE user_id = $1`,
          [userId, opts.title || null, opts.notes || null]
        );
      }
      await client.query('COMMIT');
      const updated = await client.query(`SELECT * FROM trip_summaries 
WHERE user_id=$1`, [userId]);
      return updated.rows[0];
    }

    // create new
    const insert = await client.query(
      `INSERT INTO trip_summaries (user_id, title, notes, status, 
created_at, updated_at)
       VALUES ($1,$2,$3,'draft', now(), now()) RETURNING *`,
      [userId, opts.title || 'My Trip', opts.notes || null]
    );
    await client.query('COMMIT');
    return insert.rows[0];
  } catch (e) {
    await client.query('ROLLBACK');
    throw e;
  } finally {
    client.release();
  }
}

async function addItemToSummary(userId, item) {
  // item: { item_type, item_ref (object), title, start_date, end_date }
  const client = await db.pool.connect();
  try {
    await client.query('BEGIN');
    // ensure summary exists
    const summary = await getOrCreateSummary(userId);
    const insert = await client.query(
      `INSERT INTO trip_items (summary_id, item_type, item_ref, title, 
start_date, end_date, created_at, updated_at)
       VALUES ($1,$2,$3,$4,$5,$6, now(), now()) RETURNING *`,
      [
        summary.id,
        item.item_type,
        item.item_ref ? JSON.stringify(item.item_ref) : {},
        item.title || null,
        item.start_date || null,
        item.end_date || null
      ]
    );
    await client.query('COMMIT');
    return insert.rows[0];
  } catch (e) {
    await client.query('ROLLBACK');
    throw e;
  } finally {
    client.release();
  }
}

async function getSummaryByUser(userId) {
  const client = await db.pool.connect();
  try {
    const s = await client.query(`SELECT * FROM trip_summaries WHERE 
user_id = $1 LIMIT 1`, [userId]);
    if (s.rows.length === 0) return null;
    const summary = s.rows[0];
    const items = await client.query(
      `SELECT * FROM trip_items WHERE summary_id = $1 ORDER BY created_at 
ASC`,
      [summary.id]
    );
    summary.items = items.rows;
    return summary;
  } finally {
    client.release();
  }
}

async function removeItem(itemId, userId) {
  const client = await db.pool.connect();
  try {
    await client.query('BEGIN');
    // Optional: ensure item belongs to user
    await client.query(
      `DELETE FROM trip_items WHERE id = $1 AND summary_id IN (SELECT id 
FROM trip_summaries WHERE user_id = $2)`,
      [itemId, userId]
    );
    await client.query('COMMIT');
    return { ok: true };
  } catch (e) {
    await client.query('ROLLBACK');
    throw e;
  } finally {
    client.release();
  }
}

module.exports = {
  getOrCreateSummary,
  addItemToSummary,
  getSummaryByUser,
  removeItem
};

