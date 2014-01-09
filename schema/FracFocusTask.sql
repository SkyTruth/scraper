--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."FracFocusTask" DROP CONSTRAINT "FracFocusTask_state_code_county_code_key";
ALTER TABLE ONLY public."FracFocusTask" DROP CONSTRAINT "FracFocusTask_pkey";
ALTER TABLE ONLY public."FracFocusTask" DROP CONSTRAINT "FracFocusTask_api_prefix_key";
DROP TABLE public."FracFocusTask";
DROP SEQUENCE public.fracfocustask_seqid_seq;
SET search_path = public, pg_catalog;

--
-- Name: fracfocustask_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocustask_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocustask_seqid_seq OWNER TO scraper;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: FracFocusTask; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusTask" (
    seqid integer DEFAULT nextval('fracfocustask_seqid_seq'::regclass) NOT NULL,
    state_code character varying NOT NULL,
    state_name character varying NOT NULL,
    county_code character varying,
    county_name character varying,
    task_flag integer NOT NULL,
    api_prefix character varying NOT NULL,
    records integer,
    scraped timestamp without time zone,
    score double precision
);


ALTER TABLE public."FracFocusTask" OWNER TO scraper;

--
-- Name: FracFocusTask_api_prefix_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusTask"
    ADD CONSTRAINT "FracFocusTask_api_prefix_key" UNIQUE (api_prefix);


--
-- Name: FracFocusTask_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusTask"
    ADD CONSTRAINT "FracFocusTask_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusTask_state_code_county_code_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusTask"
    ADD CONSTRAINT "FracFocusTask_state_code_county_code_key" UNIQUE (state_code, county_code);


--
-- PostgreSQL database dump complete
--

