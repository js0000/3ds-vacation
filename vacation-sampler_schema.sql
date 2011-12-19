-- vs-schema.sql
-- Vacation Sampler
-- for initializing sqlite db


-- SCHEMA

CREATE TABLE scheduled_samples (
  id INTEGER PRIMARY KEY,
  text_date TEXT NOT NULL,

  -- "YYYY-MM-DD HH:MM:SS.SSS"
  iso8601 TEXT NOT NULL,
  epoch_seconds INTEGER NOT NULL,
  location TEXT
);

CREATE TABLE files (
  id INTEGER PRIMARY KEY,
  scheduled_samples_id INTEGER NOT NULL,
  class TEXT,
  value TEXT,
  FOREIGN KEY( scheduled_samples_id ) REFERENCES scheduled_samples( id )
);

CREATE TABLE notes (
  id INTEGER PRIMARY KEY,
  scheduled_samples_id INTEGER NOT NULL,
  class TEXT,
  value TEXT,
  FOREIGN KEY( scheduled_samples_id ) REFERENCES scheduled_samples( id )
);


-- INIT SQL

INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 17 12:20:00 -0500 2011', '2011-12-17 12:20:00', 1324142400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 17 17:40:00 -0500 2011', '2011-12-17 17:40:00', 1324161600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 08:00:00 -0500 2011', '2011-12-18 08:00:00', 1324213200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 09:00:00 -0500 2011', '2011-12-18 09:00:00', 1324216800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 10:00:00 -0500 2011', '2011-12-18 10:00:00', 1324220400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 11:00:00 -0500 2011', '2011-12-18 11:00:00', 1324224000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 12:00:00 -0500 2011', '2011-12-18 12:00:00', 1324227600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 13:00:00 -0500 2011', '2011-12-18 13:00:00', 1324231200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 14:00:00 -0500 2011', '2011-12-18 14:00:00', 1324234800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 15:00:00 -0500 2011', '2011-12-18 15:00:00', 1324238400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 16:00:00 -0500 2011', '2011-12-18 16:00:00', 1324242000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 17:00:00 -0500 2011', '2011-12-18 17:00:00', 1324245600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 18:00:00 -0500 2011', '2011-12-18 18:00:00', 1324249200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 19:00:00 -0500 2011', '2011-12-18 19:00:00', 1324252800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 20:00:00 -0500 2011', '2011-12-18 20:00:00', 1324256400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 21:00:00 -0500 2011', '2011-12-18 21:00:00', 1324260000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 18 22:00:00 -0500 2011', '2011-12-18 22:00:00', 1324263600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 09:00:00 -0500 2011', '2011-12-19 09:00:00', 1324303200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 11:00:00 -0500 2011', '2011-12-19 11:00:00', 1324310400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 13:00:00 -0500 2011', '2011-12-19 13:00:00', 1324317600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 15:00:00 -0500 2011', '2011-12-19 15:00:00', 1324324800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 17:00:00 -0500 2011', '2011-12-19 17:00:00', 1324332000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 19:00:00 -0500 2011', '2011-12-19 19:00:00', 1324339200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Dec 19 21:00:00 -0500 2011', '2011-12-19 21:00:00', 1324346400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 20 10:12:00 -0500 2011', '2011-12-20 10:12:00', 1324393920 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 20 13:24:00 -0500 2011', '2011-12-20 13:24:00', 1324405440 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 20 16:36:00 -0500 2011', '2011-12-20 16:36:00', 1324416960 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 20 19:48:00 -0500 2011', '2011-12-20 19:48:00', 1324428480 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 08:46:40 -0500 2011', '2011-12-21 08:46:40', 1324475200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 10:33:20 -0500 2011', '2011-12-21 10:33:20', 1324481600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 12:20:00 -0500 2011', '2011-12-21 12:20:00', 1324488000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 14:06:40 -0500 2011', '2011-12-21 14:06:40', 1324494400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 15:53:20 -0500 2011', '2011-12-21 15:53:20', 1324500800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 17:40:00 -0500 2011', '2011-12-21 17:40:00', 1324507200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 19:26:40 -0500 2011', '2011-12-21 19:26:40', 1324513600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 21 21:13:20 -0500 2011', '2011-12-21 21:13:20', 1324520000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 22 11:00:00 -0500 2011', '2011-12-22 11:00:00', 1324569600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 22 15:00:00 -0500 2011', '2011-12-22 15:00:00', 1324584000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 22 19:00:00 -0500 2011', '2011-12-22 19:00:00', 1324598400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 23 09:17:08 -0500 2011', '2011-12-23 09:17:08', 1324649828 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 23 11:34:16 -0500 2011', '2011-12-23 11:34:16', 1324658056 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 23 13:51:24 -0500 2011', '2011-12-23 13:51:24', 1324666284 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 23 16:08:32 -0500 2011', '2011-12-23 16:08:32', 1324674512 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 23 18:25:40 -0500 2011', '2011-12-23 18:25:40', 1324682740 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 23 20:42:48 -0500 2011', '2011-12-23 20:42:48', 1324690968 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 24 09:40:00 -0500 2011', '2011-12-24 09:40:00', 1324737600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 24 12:20:00 -0500 2011', '2011-12-24 12:20:00', 1324747200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 24 15:00:00 -0500 2011', '2011-12-24 15:00:00', 1324756800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 24 17:40:00 -0500 2011', '2011-12-24 17:40:00', 1324766400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 24 20:20:00 -0500 2011', '2011-12-24 20:20:00', 1324776000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 08:20:00 -0500 2011', '2011-12-25 08:20:00', 1324819200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 09:40:00 -0500 2011', '2011-12-25 09:40:00', 1324824000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 11:00:00 -0500 2011', '2011-12-25 11:00:00', 1324828800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 12:20:00 -0500 2011', '2011-12-25 12:20:00', 1324833600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 13:40:00 -0500 2011', '2011-12-25 13:40:00', 1324838400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 15:00:00 -0500 2011', '2011-12-25 15:00:00', 1324843200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 16:20:00 -0500 2011', '2011-12-25 16:20:00', 1324848000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 17:40:00 -0500 2011', '2011-12-25 17:40:00', 1324852800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 19:00:00 -0500 2011', '2011-12-25 19:00:00', 1324857600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 20:20:00 -0500 2011', '2011-12-25 20:20:00', 1324862400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Dec 25 21:40:00 -0500 2011', '2011-12-25 21:40:00', 1324867200 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 08:13:50 -0500 2011', '2011-12-27 08:13:50', 1324991630 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 09:27:40 -0500 2011', '2011-12-27 09:27:40', 1324996060 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 10:41:30 -0500 2011', '2011-12-27 10:41:30', 1325000490 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 11:55:20 -0500 2011', '2011-12-27 11:55:20', 1325004920 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 13:09:10 -0500 2011', '2011-12-27 13:09:10', 1325009350 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 14:23:00 -0500 2011', '2011-12-27 14:23:00', 1325013780 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 15:36:50 -0500 2011', '2011-12-27 15:36:50', 1325018210 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 16:50:40 -0500 2011', '2011-12-27 16:50:40', 1325022640 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 18:04:30 -0500 2011', '2011-12-27 18:04:30', 1325027070 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 19:18:20 -0500 2011', '2011-12-27 19:18:20', 1325031500 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 20:32:10 -0500 2011', '2011-12-27 20:32:10', 1325035930 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Tue Dec 27 21:46:00 -0500 2011', '2011-12-27 21:46:00', 1325040360 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Wed Dec 28 15:00:00 -0500 2011', '2011-12-28 15:00:00', 1325102400 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 08:27:16 -0500 2011', '2011-12-29 08:27:16', 1325165236 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 09:54:32 -0500 2011', '2011-12-29 09:54:32', 1325170472 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 11:21:48 -0500 2011', '2011-12-29 11:21:48', 1325175708 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 12:49:04 -0500 2011', '2011-12-29 12:49:04', 1325180944 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 14:16:20 -0500 2011', '2011-12-29 14:16:20', 1325186180 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 15:43:36 -0500 2011', '2011-12-29 15:43:36', 1325191416 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 17:10:52 -0500 2011', '2011-12-29 17:10:52', 1325196652 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 18:38:08 -0500 2011', '2011-12-29 18:38:08', 1325201888 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 20:05:24 -0500 2011', '2011-12-29 20:05:24', 1325207124 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Thu Dec 29 21:32:40 -0500 2011', '2011-12-29 21:32:40', 1325212360 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 08:04:00 -0500 2011', '2011-12-30 08:04:00', 1325250240 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 09:08:00 -0500 2011', '2011-12-30 09:08:00', 1325254080 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 10:12:00 -0500 2011', '2011-12-30 10:12:00', 1325257920 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 11:16:00 -0500 2011', '2011-12-30 11:16:00', 1325261760 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 12:20:00 -0500 2011', '2011-12-30 12:20:00', 1325265600 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 13:24:00 -0500 2011', '2011-12-30 13:24:00', 1325269440 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 14:28:00 -0500 2011', '2011-12-30 14:28:00', 1325273280 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 15:32:00 -0500 2011', '2011-12-30 15:32:00', 1325277120 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 16:36:00 -0500 2011', '2011-12-30 16:36:00', 1325280960 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 17:40:00 -0500 2011', '2011-12-30 17:40:00', 1325284800 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 18:44:00 -0500 2011', '2011-12-30 18:44:00', 1325288640 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 19:48:00 -0500 2011', '2011-12-30 19:48:00', 1325292480 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 20:52:00 -0500 2011', '2011-12-30 20:52:00', 1325296320 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Fri Dec 30 21:56:00 -0500 2011', '2011-12-30 21:56:00', 1325300160 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 07:56:28 -0500 2011', '2011-12-31 07:56:28', 1325336188 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 08:52:56 -0500 2011', '2011-12-31 08:52:56', 1325339576 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 09:49:24 -0500 2011', '2011-12-31 09:49:24', 1325342964 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 10:45:52 -0500 2011', '2011-12-31 10:45:52', 1325346352 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 11:42:20 -0500 2011', '2011-12-31 11:42:20', 1325349740 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 12:38:48 -0500 2011', '2011-12-31 12:38:48', 1325353128 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 13:35:16 -0500 2011', '2011-12-31 13:35:16', 1325356516 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 14:31:44 -0500 2011', '2011-12-31 14:31:44', 1325359904 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 15:28:12 -0500 2011', '2011-12-31 15:28:12', 1325363292 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 16:24:40 -0500 2011', '2011-12-31 16:24:40', 1325366680 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 17:21:08 -0500 2011', '2011-12-31 17:21:08', 1325370068 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 18:17:36 -0500 2011', '2011-12-31 18:17:36', 1325373456 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 19:14:04 -0500 2011', '2011-12-31 19:14:04', 1325376844 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 20:10:32 -0500 2011', '2011-12-31 20:10:32', 1325380232 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 21:07:00 -0500 2011', '2011-12-31 21:07:00', 1325383620 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sat Dec 31 22:03:28 -0500 2011', '2011-12-31 22:03:28', 1325387008 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 08:36:00 -0500 2012', '2012-01-01 08:36:00', 1325424960 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 10:12:00 -0500 2012', '2012-01-01 10:12:00', 1325430720 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 11:48:00 -0500 2012', '2012-01-01 11:48:00', 1325436480 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 13:24:00 -0500 2012', '2012-01-01 13:24:00', 1325442240 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 15:00:00 -0500 2012', '2012-01-01 15:00:00', 1325448000 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 16:36:00 -0500 2012', '2012-01-01 16:36:00', 1325453760 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 18:12:00 -0500 2012', '2012-01-01 18:12:00', 1325459520 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 19:48:00 -0500 2012', '2012-01-01 19:48:00', 1325465280 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Sun Jan 01 21:24:00 -0500 2012', '2012-01-01 21:24:00', 1325471040 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 08:08:34 -0500 2012', '2012-01-02 08:08:34', 1325509714 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 09:17:08 -0500 2012', '2012-01-02 09:17:08', 1325513828 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 10:25:42 -0500 2012', '2012-01-02 10:25:42', 1325517942 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 11:34:16 -0500 2012', '2012-01-02 11:34:16', 1325522056 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 12:42:50 -0500 2012', '2012-01-02 12:42:50', 1325526170 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 13:51:24 -0500 2012', '2012-01-02 13:51:24', 1325530284 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 14:59:58 -0500 2012', '2012-01-02 14:59:58', 1325534398 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 16:08:32 -0500 2012', '2012-01-02 16:08:32', 1325538512 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 17:17:06 -0500 2012', '2012-01-02 17:17:06', 1325542626 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 18:25:40 -0500 2012', '2012-01-02 18:25:40', 1325546740 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 19:34:14 -0500 2012', '2012-01-02 19:34:14', 1325550854 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 20:42:48 -0500 2012', '2012-01-02 20:42:48', 1325554968 );
INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( 'Mon Jan 02 21:51:22 -0500 2012', '2012-01-02 21:51:22', 1325559082 );

