-- Table: public."NrcParsedReport"

-- DROP TABLE public."NrcParsedReport";

CREATE TABLE public."NrcParsedReport"
(
  reportnum integer NOT NULL,
  latitude double precision,
  longitude double precision,
  areaid character varying(32),
  blockid character varying(32),
  zip character varying(16),
  platform_letter character varying(16),
  sheen_size_length character varying(16),
  sheen_size_width character varying(16),
  affected_area character varying(32),
  county character varying(32),
  time_stamp timestamp without time zone NOT NULL DEFAULT now(),
  ft_id integer,
  CONSTRAINT "NrcParsedReport_pkey" PRIMARY KEY (reportnum)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."NrcParsedReport"
  OWNER TO scraper;

-- Index: public.area_block

-- DROP INDEX public.area_block;

CREATE INDEX area_block
  ON public."NrcParsedReport"
  USING btree
  (areaid COLLATE pg_catalog."default", blockid COLLATE pg_catalog."default");
