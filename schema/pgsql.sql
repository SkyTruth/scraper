-- Table: feedentry

-- DROP TABLE feedentry;

CREATE TABLE feedentry
(
  id character(36) NOT NULL,
  title character varying(255) NOT NULL,
  link character varying(255),
  summary text,
  "content" text,
  lat double precision NOT NULL,
  lng double precision NOT NULL,
  source_id integer NOT NULL,
  kml_url character varying(255),
  incident_datetime timestamp without time zone NOT NULL,
  published timestamp without time zone,
  regions integer[],
  tags character varying(64)[],
  the_geom geometry,
  source_item_id integer,
  site_id uuid,
  id_backup character(36)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE feedentry OWNER TO scraper;
GRANT ALL ON TABLE feedentry TO scraper;

-- Index: feedentry_id_old

-- DROP INDEX feedentry_id_old;

CREATE UNIQUE INDEX feedentry_id_old
  ON feedentry
  USING btree
  (id);

-- Index: feedentry_incident_datetime

-- DROP INDEX feedentry_incident_datetime;

CREATE INDEX feedentry_incident_datetime
  ON feedentry
  USING btree
  (incident_datetime DESC);

-- Index: feedentry_latlng

-- DROP INDEX feedentry_latlng;

CREATE INDEX feedentry_latlng
  ON feedentry
  USING btree
  (lat, lng);

-- Index: feedentry_published

-- DROP INDEX feedentry_published;

CREATE INDEX feedentry_published
  ON feedentry
  USING btree
  (published DESC);

-- Index: feedentry_regions

-- DROP INDEX feedentry_regions;

CREATE INDEX feedentry_regions
  ON feedentry
  USING btree
  (regions);

-- Index: feedentry_site_id

-- DROP INDEX feedentry_site_id;

CREATE INDEX feedentry_site_id
  ON feedentry
  USING btree
  (site_id);



-- Function: feedentry_insert()

-- DROP FUNCTION feedentry_insert();

CREATE OR REPLACE FUNCTION feedentry_insert()
  RETURNS trigger AS
$BODY$
    DECLARE
        pub      timestamp;
        loc      geometry;
        reg      integer[];
    BEGIN
	loc := st_setsrid(st_makepoint(NEW.lng, NEW.lat), (4326));
	reg := ARRAY( SELECT region.id FROM region 
		WHERE st_contains(region.the_geom, loc));
	pub := (( SELECT to_timestamp(GREATEST(floor(date_part('epoch'::text, now())), date_part('epoch'::text, max(feedentry.published))) + 0.001::double precision) AS to_timestamp
		FROM feedentry));

	IF EXISTS ( SELECT 1 FROM feedentry WHERE feedentry.id = NEW.id) THEN
		-- this record already exists.  Need to turn this into an update
		-- and return null to cancel the insert
		UPDATE feedentry SET
			title = NEW.title, 
			link = NEW.link, 
			summary = NEW.summary, 
			content = NEW.content, 
			lat = NEW.lat, 
			lng = NEW.lng, 
			source_id = NEW.source_id, 
			source_item_id = NEW.source_item_id, 
			kml_url = NEW.kml_url, 
			incident_datetime = NEW.incident_datetime, 
			tags = NEW.tags,
			the_geom = loc,
			regions = reg
		WHERE id = NEW.id;
		return NULL;
	ELSE
		NEW.published := pub;
		NEW.the_geom := loc;
		NEW.regions := reg;
		return NEW;
	END IF;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION feedentry_insert()
  OWNER TO postgres;


-- Trigger: feedentry_insert on feedentry

-- DROP TRIGGER feedentry_insert ON feedentry;

CREATE TRIGGER feedentry_insert
  BEFORE INSERT
  ON feedentry
  FOR EACH ROW
  EXECUTE PROCEDURE feedentry_insert();


-- Table: region

-- DROP TABLE region;

CREATE TABLE region
(
  id serial NOT NULL,
  "name" character varying(50),
  code character varying(8),
  the_geom geometry,
  kml text,
  simple_geom geometry,
  CONSTRAINT region_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE region OWNER TO postgres;
GRANT ALL ON TABLE region TO postgres;
GRANT ALL ON TABLE region TO scraper;

-- Index: idx_regions_the_geom

-- DROP INDEX idx_regions_the_geom;

CREATE INDEX idx_regions_the_geom
  ON region
  USING gist
  (the_geom);
  
GRANT ALL ON TABLE spatial_ref_sys TO scraper;  

