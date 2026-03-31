-- migrations/003_trip_summaries.sql
CREATE TABLE IF NOT EXISTS trip_summaries (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  title TEXT DEFAULT 'My Trip',
  notes TEXT NULL,
  status VARCHAR(32) DEFAULT 'draft',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  UNIQUE(user_id)
);

CREATE TABLE IF NOT EXISTS trip_items (
  id SERIAL PRIMARY KEY,
  summary_id INTEGER NOT NULL REFERENCES trip_summaries(id) ON DELETE CASCADE,
  item_type VARCHAR(32) NOT NULL,
  item_ref JSONB NOT NULL,
  title TEXT,
  start_date DATE NULL,
  end_date DATE NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_trip_summaries_user ON trip_summaries(user_id);
CREATE INDEX IF NOT EXISTS idx_trip_items_summary ON trip_items(summary_id);
