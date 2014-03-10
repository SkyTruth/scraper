
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = scraper, pg_catalog;

DROP VIEW scraper.ffs_wo_ffr;
DROP VIEW scraper.ffrc_orphan;
DROP VIEW scraper.ffr_wo_ffs;
DROP VIEW scraper.ffr_dup;
DROP VIEW scraper.ffr_0line;
SET search_path = scraper, pg_catalog;

--
-- Name: ffr_0line; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW ffr_0line AS
    SELECT r.seqid, r.ft_id, r.pdf_seqid, r.api, r.fracture_date, r.state, r.county, r.operator, r.well_name, r.production_type, r.latitude, r.longitude, r.datum, r.true_vertical_depth, r.total_water_volume, r.published, r.total_water_weight, r.total_pct_in_fluid, r.water_pct_in_fluid, r.total_hf_weight, r.err_code, r.err_field, r.err_comment, r.api_old FROM (public."FracFocusReport" r LEFT JOIN (SELECT count(*) AS count, "FracFocusReportChemical".pdf_seqid FROM public."FracFocusReportChemical" GROUP BY "FracFocusReportChemical".pdf_seqid) c ON ((r.pdf_seqid = c.pdf_seqid))) WHERE (c.pdf_seqid IS NULL);


ALTER TABLE scraper.ffr_0line OWNER TO scraper;

--
-- Name: ffr_dup; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW ffr_dup AS
    SELECT r2.seqid, r2.ft_id, r2.pdf_seqid, r2.api, r2.fracture_date, r2.state, r2.county, r2.operator, r2.well_name, r2.production_type, r2.latitude, r2.longitude, r2.datum, r2.true_vertical_depth, r2.total_water_volume, r2.published, r2.total_water_weight, r2.total_pct_in_fluid, r2.water_pct_in_fluid, r2.total_hf_weight, r2.err_code, r2.err_field, r2.err_comment, r2.api_old FROM (public."FracFocusReport" r1 JOIN public."FracFocusReport" r2 ON (((((r1.api)::text = (r2.api)::text) AND (r1.fracture_date = r2.fracture_date)) AND (r1.seqid < r2.seqid))));


ALTER TABLE scraper.ffr_dup OWNER TO scraper;

--
-- Name: ffr_wo_ffs; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW ffr_wo_ffs AS
    SELECT r.seqid, r.ft_id, r.pdf_seqid, r.api, r.fracture_date, r.state, r.county, r.operator, r.well_name, r.production_type, r.latitude, r.longitude, r.datum, r.true_vertical_depth, r.total_water_volume, r.published, r.total_water_weight, r.total_pct_in_fluid, r.water_pct_in_fluid, r.total_hf_weight, r.err_code, r.err_field, r.err_comment, r.api_old FROM (public."FracFocusReport" r LEFT JOIN public."FracFocusScrape" s ON ((r.pdf_seqid = s.seqid))) WHERE (s.seqid IS NULL);


ALTER TABLE scraper.ffr_wo_ffs OWNER TO scraper;

--
-- Name: ffrc_orphan; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW ffrc_orphan AS
    SELECT c.seqid, c.ft_id, c.pdf_seqid, c.api, c.fracture_date, c."row", c.trade_name, c.supplier, c.purpose, c.ingredients, c.cas_number, c.additive_concentration, c.hf_fluid_concentration, c.ingredient_weight, c.comments, c.weight, c.cas_type FROM (public."FracFocusReportChemical" c LEFT JOIN public."FracFocusReport" r ON ((c.pdf_seqid = r.pdf_seqid))) WHERE (r.pdf_seqid IS NULL);


ALTER TABLE scraper.ffrc_orphan OWNER TO scraper;

--
-- Name: ffs_wo_ffr; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW ffs_wo_ffr AS
    SELECT s.seqid, s.scraped, s.ft_id, s.api, s.job_date, s.state, s.county, s.operator, s.well_name, s.well_type, s.latitude, s.longitude, s.datum, s.pdf_download_attempts FROM (public."FracFocusScrape" s LEFT JOIN public."FracFocusReport" r ON ((s.seqid = r.pdf_seqid))) WHERE (r.seqid IS NULL);


ALTER TABLE scraper.ffs_wo_ffr OWNER TO scraper;

--
-- PostgreSQL database dump complete
--

