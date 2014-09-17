-- Table: public."NrcScrapedMaterial"

-- DROP TABLE public."NrcScrapedMaterial";

CREATE TABLE public."NrcScrapedMaterial"
(
  reportnum integer NOT NULL,
  chris_code character varying(32),
  name character varying(32) NOT NULL DEFAULT ''::character varying,
  amount double precision,
  unit character varying(32),
  reached_water character varying(16),
  amt_in_water double precision,
  amt_in_water_unit character varying(32),
  ft_id integer,
  st_id integer,
  CONSTRAINT "NrcScrapedMaterial_pkey" PRIMARY KEY (reportnum, name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."NrcScrapedMaterial"
  OWNER TO scraper;

-- Index: public.name

-- DROP INDEX public.name;

CREATE INDEX name
  ON public."NrcScrapedMaterial"
  USING btree
  (name COLLATE pg_catalog."default");

-- Index: public.seqid

-- DROP INDEX public.seqid;

CREATE INDEX seqid
  ON public."NrcScrapedMaterial"
  USING btree
  (st_id);
