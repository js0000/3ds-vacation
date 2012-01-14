CREATE TABLE files (
  id INTEGER PRIMARY KEY,
  scheduled_samples_id INTEGER,
  class TEXT,
  created_text_date TEXT,
  created_epoch_seconds INTEGER,
  created_offset_epoch_seconds INTEGER,
  pathfile TEXT,
  md5_checksum TEXT,
  FOREIGN KEY( scheduled_samples_id ) REFERENCES scheduled_samples( id )
);
CREATE TABLE notes (
  id INTEGER PRIMARY KEY,
  scheduled_samples_id INTEGER NOT NULL,
  class TEXT,
  value TEXT,
  FOREIGN KEY( scheduled_samples_id ) REFERENCES scheduled_samples( id )
);
CREATE TABLE scheduled_samples (
  id INTEGER PRIMARY KEY,
  text_date TEXT NOT NULL,
  epoch_seconds INTEGER NOT NULL,
  location TEXT
);
CREATE VIEW ssni AS
  SELECT ss.id, ss.text_date, ss.location, n.id AS 'note_id', n.value
  FROM scheduled_samples ss
  INNER JOIN notes n ON ss.id = n.scheduled_samples_id AND n.class = 'img'
  ORDER BY ss.id, n.id;
CREATE VIEW ssns AS
  SELECT ss.id, ss.text_date, ss.location, n.id AS 'note_id', n.value
  FROM scheduled_samples ss
  INNER JOIN notes n ON ss.id = n.scheduled_samples_id AND n.class = 'snd'
  ORDER BY ss.id, n.id;
CREATE VIEW ssnt AS
  SELECT ss.id, ss.text_date, ss.location, n.id AS 'note_id', n.value
  FROM scheduled_samples ss
  INNER JOIN notes n ON ss.id = n.scheduled_samples_id AND n.class = 'txt'
  ORDER BY ss.id, n.id;
