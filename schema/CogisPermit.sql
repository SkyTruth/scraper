--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = scraper, pg_catalog;

ALTER TABLE ONLY public."CogisPermit" DROP CONSTRAINT "CogisPermit_pkey";
DROP TABLE public."CogisPermit";
DROP SEQUENCE public.cogispermit_st_id_seq;
--
-- Name: cogispermit_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE cogispermit_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cogispermit_st_id_seq OWNER TO scraper;

--
-- Name: CogisPermit; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CogisPermit" (
    st_id integer DEFAULT nextval('cogispermit_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    county character varying,
    date_received date,
    date_posted date,
    operator character varying,
    operator_number character varying,
    contact character varying,
    well_name character varying NOT NULL,
    field character varying,
    formation character varying,
    proposed_depth integer,
    permit_number character varying,
    permit_type character varying,
    permit_status character varying,
    permit_status_date date,
    permit_link character varying,
    well_api character varying,
    well_lat double precision NOT NULL,
    well_lng double precision NOT NULL,
    well_status character varying,
    well_status_date date,
    well_spud_date date,
    well_link character varying
);


ALTER TABLE public."CogisPermit" OWNER TO scraper;

--
-- Name: CogisPermit_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "CogisPermit"
    ADD CONSTRAINT "CogisPermit_pkey" PRIMARY KEY (st_id);


