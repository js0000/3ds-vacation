-- drop_iso8601_date.sql
-- housekeeping: removes column i don't need

BEGIN TRANSACTION;
CREATE TEMPORARY TABLE ss_backup( i INTEGER, td TEXT, es INTEGER, l TEXT );
INSERT INTO ss_backup SELECT id, text_date, epoch_seconds, location FROM scheduled_samples order by id;
DROP TABLE scheduled_samples;
CREATE TABLE scheduled_samples (
  id INTEGER PRIMARY KEY,
  text_date TEXT NOT NULL,
  epoch_seconds INTEGER NOT NULL,
  location TEXT
);

INSERT INTO scheduled_samples SELECT i, td, es, l FROM ss_backup order by i;
DROP TABLE ss_backup;
COMMIT;
