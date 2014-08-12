-- Table: public."NrcScrapedReport"

-- DROP TABLE public."NrcScrapedReport";

CREATE TABLE public."NrcScrapedReport"
(
  reportnum integer NOT NULL,
  calltype character varying(16),
  recieved_datetime timestamp without time zone,
  description text,
  incident_datetime timestamp without time zone,
  incidenttype character varying(32),
  cause character varying(32),
  location character varying(255),
  state character varying(255),
  nearestcity character varying(255),
  county character varying(255),
  suspected_responsible_company character varying(255),
  medium_affected character varying(255),
  material_name character varying(255),
  full_report_url character varying(255),
  materials_url character varying(255),
  time_stamp timestamp without time zone NOT NULL DEFAULT now(),
  ft_id integer,
  CONSTRAINT "NrcScrapedReport_pkey" PRIMARY KEY (reportnum)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."NrcScrapedReport"
  OWNER TO scraper;

-- Index: public.description

-- DROP INDEX public.description;

CREATE INDEX description
  ON public."NrcScrapedReport"
  USING btree
  (description COLLATE pg_catalog."default");

-- Index: public.incident_datetime

-- DROP INDEX public.incident_datetime;

CREATE INDEX incident_datetime
  ON public."NrcScrapedReport"
  USING btree
  (incident_datetime);

-- Index: public.material_name

-- DROP INDEX public.material_name;

CREATE INDEX material_name
  ON public."NrcScrapedReport"
  USING btree
  (material_name COLLATE pg_catalog."default");

-- Index: public.suspected_responsible_company

-- DROP INDEX public.suspected_responsible_company;

CREATE INDEX suspected_responsible_company
  ON public."NrcScrapedReport"
  USING btree
  (suspected_responsible_company COLLATE pg_catalog."default");

-- Index: public.time_stamp

-- DROP INDEX public.time_stamp;

CREATE INDEX time_stamp
  ON public."NrcScrapedReport"
  USING btree
  (time_stamp);
