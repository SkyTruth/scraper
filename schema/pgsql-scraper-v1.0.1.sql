--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: NrcAnalysis; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcAnalysis" (
    reportnum integer NOT NULL,
    sheen_length double precision,
    sheen_width double precision,
    reported_spill_volume double precision,
    min_spill_volume double precision,
    calltype character varying(20),
    severity character varying(20),
    region character varying(20),
    release_type character varying(20)
);


ALTER TABLE public."NrcAnalysis" OWNER TO scraper;

--
-- Name: NrcGeocode; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcGeocode" (
    reportnum integer DEFAULT 0 NOT NULL,
    source character(16) NOT NULL,
    lat double precision DEFAULT 0 NOT NULL,
    lng double precision DEFAULT 0 NOT NULL,
    "precision" numeric(16,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public."NrcGeocode" OWNER TO scraper;

--
-- Name: NrcParsedReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcParsedReport" (
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
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer
);


ALTER TABLE public."NrcParsedReport" OWNER TO scraper;

--
-- Name: NrcScrapedReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScrapedReport" (
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
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer
);


ALTER TABLE public."NrcScrapedReport" OWNER TO scraper;

--
-- Name: areacodemap_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE areacodemap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areacodemap_id_seq OWNER TO scraper;

--
-- Name: AreaCodeMap; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "AreaCodeMap" (
    id integer DEFAULT nextval('areacodemap_id_seq'::regclass) NOT NULL,
    pattern character varying(64) NOT NULL,
    area_code character(2) NOT NULL
);


ALTER TABLE public."AreaCodeMap" OWNER TO scraper;

--
-- Name: BotTask; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTask" (
    id integer NOT NULL,
    bot character varying(20) NOT NULL,
    name character varying(32) NOT NULL,
    process_interval_secs integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."BotTask" OWNER TO scraper;

--
-- Name: BotTaskError; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTaskError" (
    task_id integer NOT NULL,
    bot character varying(32) NOT NULL,
    code character varying(16) NOT NULL,
    message character varying(1023),
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."BotTaskError" OWNER TO scraper;

--
-- Name: BotTaskParams; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTaskParams" (
    task_id integer NOT NULL,
    bot character varying(20) NOT NULL,
    key character varying(20) NOT NULL,
    value character varying(1024)
);


ALTER TABLE public."BotTaskParams" OWNER TO scraper;

--
-- Name: BotTaskStatus; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTaskStatus" (
    task_id integer NOT NULL,
    bot character varying(32) NOT NULL,
    status character varying(16) NOT NULL,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."BotTaskStatus" OWNER TO scraper;

--
-- Name: CO_Permits; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CO_Permits" (
    seqid character(23) NOT NULL,
    ft_id integer NOT NULL,
    county_name character varying(20),
    received_date date,
    posted_date date,
    operator_name character varying(50),
    operator_number character varying(20),
    approved_date date,
    api character varying(20),
    type_of_permit character varying(8),
    well_name character varying(50),
    well_number character varying(20),
    proposed_td double precision,
    well_location character varying(50),
    footage_call character varying(50),
    field character varying(50),
    latitude double precision,
    longitude double precision,
    elevation character varying(20),
    federal_state_lease character varying(20),
    record_url character varying(255)
);


ALTER TABLE public."CO_Permits" OWNER TO scraper;

--
-- Name: cogisinspection_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE cogisinspection_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cogisinspection_st_id_seq OWNER TO scraper;

--
-- Name: CogisInspection; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CogisInspection" (
    st_id integer DEFAULT nextval('cogisinspection_st_id_seq'::regclass) NOT NULL,
    doc_num character varying(15) NOT NULL,
    county_code character varying(10),
    county_name character varying(30),
    date date,
    doc_href character varying(120),
    loc_id character varying(15),
    operator character varying(60),
    insp_api_num character varying(30),
    insp_status character varying(15),
    insp_overall character varying(30),
    ir_pass_fail character varying(10),
    fr_pass_fail character varying(10),
    violation character varying(10),
    site_lat character varying(20),
    site_lng character varying(20),
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer
);


ALTER TABLE public."CogisInspection" OWNER TO scraper;

--
-- Name: cogisspill_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE cogisspill_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cogisspill_st_id_seq OWNER TO scraper;

--
-- Name: CogisSpill; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CogisSpill" (
    st_id integer DEFAULT nextval('cogisspill_st_id_seq'::regclass) NOT NULL,
    doc_num character varying(15) NOT NULL,
    county_code character varying(10),
    county_name character varying(30),
    date date,
    doc_href character varying(120),
    facility_id character varying(15),
    operator_num character varying(15),
    company_name character varying(60),
    groundwater character varying(10),
    surfacewater character varying(10),
    berm_contained character varying(10),
    spill_area character varying(15),
    spill_lat character varying(20),
    spill_lng character varying(20),
    ft_id integer,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."CogisSpill" OWNER TO scraper;

--
-- Name: FeedEntryTag; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FeedEntryTag" (
    feed_entry_id character(36) NOT NULL,
    tag character varying(64) NOT NULL,
    comment text
);


ALTER TABLE public."FeedEntryTag" OWNER TO scraper;

--
-- Name: feedsource_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE feedsource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedsource_id_seq OWNER TO scraper;

--
-- Name: FeedSource; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FeedSource" (
    id integer DEFAULT nextval('feedsource_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public."FeedSource" OWNER TO scraper;

--
-- Name: FracFocusPDF; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusPDF" (
    seqid integer NOT NULL,
    downloaded timestamp without time zone DEFAULT now() NOT NULL,
    pdf bytea,
    filename character varying(100)
);


ALTER TABLE public."FracFocusPDF" OWNER TO scraper;

--
-- Name: fracfocusparse_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusparse_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusparse_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusParse; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusParse" (
    seqid integer DEFAULT nextval('fracfocusparse_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    production_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    true_vertical_depth double precision,
    total_water_volume double precision,
    extracted timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."FracFocusParse" OWNER TO scraper;

--
-- Name: fracfocusparsechemical_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusparsechemical_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusparsechemical_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusParseChemical; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusParseChemical" (
    seqid integer DEFAULT nextval('fracfocusparsechemical_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    report_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    "row" integer NOT NULL,
    trade_name character varying(200),
    supplier character varying(50),
    purpose character varying(200),
    ingredients character varying(200),
    cas_number character varying(50),
    additive_concentration double precision,
    hf_fluid_concentration double precision,
    ingredient_weight double precision,
    comments character varying(200)
);


ALTER TABLE public."FracFocusParseChemical" OWNER TO scraper;

--
-- Name: fracfocusreport_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusreport_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusreport_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusReport" (
    seqid integer DEFAULT nextval('fracfocusreport_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    pdf_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    production_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    true_vertical_depth double precision,
    total_water_volume double precision,
    published timestamp without time zone DEFAULT now() NOT NULL,
    total_water_weight double precision,
    total_pct_in_fluid double precision,
    water_pct_in_fluid double precision,
    total_hf_weight double precision,
    err_code character varying(20),
    err_field character varying(20),
    err_comment character varying(500)
);


ALTER TABLE public."FracFocusReport" OWNER TO scraper;

--
-- Name: fracfocusreportchemical_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusreportchemical_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusreportchemical_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusReportChemical; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusReportChemical" (
    seqid integer DEFAULT nextval('fracfocusreportchemical_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    pdf_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    "row" integer NOT NULL,
    trade_name character varying(200),
    supplier character varying(50),
    purpose character varying(200),
    ingredients character varying(200),
    cas_number character varying(50),
    additive_concentration double precision,
    hf_fluid_concentration double precision,
    ingredient_weight double precision,
    comments character varying(200),
    weight double precision,
    cas_type character varying(20)
);


ALTER TABLE public."FracFocusReportChemical" OWNER TO scraper;

--
-- Name: fracfocusscrape_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusscrape_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusscrape_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusScrape; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusScrape" (
    seqid integer DEFAULT nextval('fracfocusscrape_seqid_seq'::regclass) NOT NULL,
    scraped timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer,
    api character varying(20),
    job_date date,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    well_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    pdf_download_attempts integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."FracFocusScrape" OWNER TO scraper;

--
-- Name: GeocodeCache; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "GeocodeCache" (
    _key character varying(50) NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL
);


ALTER TABLE public."GeocodeCache" OWNER TO scraper;

--
-- Name: leaseblockcentroid_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE leaseblockcentroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaseblockcentroid_id_seq OWNER TO scraper;

--
-- Name: LeaseBlockCentroid; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "LeaseBlockCentroid" (
    id integer DEFAULT nextval('leaseblockcentroid_id_seq'::regclass) NOT NULL,
    areaid character varying(8) NOT NULL,
    blockid character varying(8) NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    state character varying(8) NOT NULL
);


ALTER TABLE public."LeaseBlockCentroid" OWNER TO scraper;

--
-- Name: Nightfire_file; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "Nightfire_file" (
    id integer NOT NULL,
    filename character varying(60) NOT NULL,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."Nightfire_file" OWNER TO scraper;

--
-- Name: Nightfire_file_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE "Nightfire_file_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Nightfire_file_id_seq" OWNER TO scraper;

--
-- Name: Nightfire_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE "Nightfire_file_id_seq" OWNED BY "Nightfire_file".id;


--
-- Name: Nightfire_record; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "Nightfire_record" (
    file_num bigint NOT NULL,
    "ID" bigint NOT NULL,
    "Lat_GMTCO" double precision,
    "Lon_GMTCO" double precision,
    "CM_IICMO" bigint,
    "COT_IVCOP" double precision,
    "EPS_IVCOP" double precision,
    "QF1_IVCOP" bigint,
    "QF2_IVCOP" bigint,
    "QF3_IVCOP" bigint,
    "Total_Rad" double precision,
    "BB_Temp" bigint,
    "M07_Rad" double precision,
    "M08_Rad" double precision,
    "M10_Rad" double precision,
    "M12_Rad" double precision,
    "M13_Rad" double precision,
    "M14_Rad" double precision,
    "M15_Rad" double precision,
    "M16_Rad" double precision,
    "SOLZ_GMTCO" double precision,
    "SOLA_GMTCO" double precision,
    "SATZ_GMTCO" double precision,
    "SATA_GMTCO" double precision,
    "SCVX_GMTCO" double precision,
    "SCVY_GMTCO" double precision,
    "SCVZ_GMTCO" double precision,
    "SCPX_GMTCO" double precision,
    "SCPY_GMTCO" double precision,
    "SCPZ_GMTCO" double precision,
    "SCAX_GMTCO" double precision,
    "SCAY_GMTCO" double precision,
    "SCAZ_GMTCO" double precision,
    "QF1_GMTCO" bigint,
    "QF2_GMTCO" bigint,
    "QF1_IICMO" bigint,
    "QF2_IICMO" bigint,
    "QF3_IICMO" bigint,
    "QF4_IICMO" bigint,
    "QF5_IICMO" bigint,
    "QF6_IICMO" bigint,
    "Date_Mscan" timestamp without time zone,
    "M10_Center" bigint,
    "M10_Avg" double precision,
    "M10_Std" double precision,
    "M10_Nsigma" bigint,
    "M10_DN" bigint,
    "M10_Sample" bigint,
    "M10_Line" bigint,
    "M10_File" character varying(120) DEFAULT NULL::character varying,
    "Proc_Date" timestamp without time zone,
    "DNB_Sample" bigint,
    "DNB_Line" bigint,
    "DNB_Lat" double precision,
    "DNB_Lon" double precision,
    "DNB_Rad" double precision,
    "DNB_Dist" double precision
);


ALTER TABLE public."Nightfire_record" OWNER TO scraper;

--
-- Name: nrcmaterials_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcmaterials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcmaterials_id_seq OWNER TO scraper;

--
-- Name: NrcMaterials; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcMaterials" (
    id integer DEFAULT nextval('nrcmaterials_id_seq'::regclass) NOT NULL,
    pattern character varying(32) NOT NULL,
    group_label character varying(32) NOT NULL
);


ALTER TABLE public."NrcMaterials" OWNER TO scraper;

--
-- Name: NrcScrapedFullReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScrapedFullReport" (
    reportnum integer NOT NULL,
    full_report_body text,
    full_report_url character varying(255),
    parsed_blockid character varying(32),
    parsed_areaid character varying(32),
    parsed_latitude character varying(32),
    parsed_longitude character varying(32)
);


ALTER TABLE public."NrcScrapedFullReport" OWNER TO scraper;

--
-- Name: nrcscrapedmaterial_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcscrapedmaterial_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcscrapedmaterial_st_id_seq OWNER TO scraper;

--
-- Name: NrcScrapedMaterial; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScrapedMaterial" (
    reportnum integer NOT NULL,
    chris_code character varying(32),
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    amount double precision,
    unit character varying(32),
    reached_water character varying(16),
    amt_in_water double precision,
    amt_in_water_unit character varying(32),
    ft_id integer,
    st_id integer DEFAULT nextval('nrcscrapedmaterial_st_id_seq'::regclass) NOT NULL
);


ALTER TABLE public."NrcScrapedMaterial" OWNER TO scraper;

--
-- Name: nrcscrapertarget_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcscrapertarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcscrapertarget_id_seq OWNER TO scraper;

--
-- Name: NrcScraperTarget; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScraperTarget" (
    id integer DEFAULT nextval('nrcscrapertarget_id_seq'::regclass) NOT NULL,
    done boolean DEFAULT false NOT NULL,
    execute_order integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone
);


ALTER TABLE public."NrcScraperTarget" OWNER TO scraper;

--
-- Name: NrcTag; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcTag" (
    reportnum integer NOT NULL,
    tag character varying(64) NOT NULL,
    comment text
);


ALTER TABLE public."NrcTag" OWNER TO scraper;

--
-- Name: nrcunits_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcunits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcunits_id_seq OWNER TO scraper;

--
-- Name: NrcUnits; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcUnits" (
    id integer DEFAULT nextval('nrcunits_id_seq'::regclass) NOT NULL,
    unit_type character varying(16) NOT NULL,
    pattern character varying(32) NOT NULL,
    standardized_unit character varying(32) NOT NULL,
    conversion_factor double precision NOT NULL
);


ALTER TABLE public."NrcUnits" OWNER TO scraper;

--
-- Name: pa_drillingpermit_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_drillingpermit_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_drillingpermit_st_id_seq OWNER TO scraper;

--
-- Name: PA_DrillingPermit; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_DrillingPermit" (
    st_id integer DEFAULT nextval('pa_drillingpermit_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "County_Name" character varying(20) NOT NULL,
    "Municipality_Name" character varying(20),
    "Auth_Id" integer,
    "Date_Disposed" date NOT NULL,
    "Disposition_Code" character varying(20),
    "Appl_Type_Code" character varying(20),
    "Auth_Type_Description" character varying(60),
    "Complete_API_" character varying(20) NOT NULL,
    "Other_Id" character varying(20) NOT NULL,
    "Marcellus_Shale_Well" character varying(4),
    "Horizontal_Well" character varying(4),
    "Well_Type" character varying(20),
    "Site_Name" character varying(50),
    "Total_Depth" integer,
    "Lat_Deg" double precision,
    "Lat_Min" double precision,
    "Lat_Sec" double precision,
    "Long_Deg" double precision,
    "Long_Min" double precision,
    "Long_Sec" double precision,
    "GIS_Datum" character varying(50),
    "Latitude_Decimal" double precision,
    "Longitude_Decimal" double precision,
    "Client_Id" integer,
    "Operator" character varying(100),
    "Address1" character varying(255),
    "Address2" character varying(255),
    "City" character varying(30),
    "State_Code" character varying(20),
    "Zip_Code" character varying(20),
    "Unconventional" character varying(4),
    "OGO_Num" character varying(20),
    "Facility_Id" character varying(20)
);


ALTER TABLE public."PA_DrillingPermit" OWNER TO scraper;

--
-- Name: pa_spud_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_spud_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_spud_st_id_seq OWNER TO scraper;

--
-- Name: PA_Spud; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_Spud" (
    st_id integer DEFAULT nextval('pa_spud_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "Well_API__" character varying(20) NOT NULL,
    "OGO__" character varying(20) NOT NULL,
    "SPUD_Date" date NOT NULL,
    "County" character varying(20),
    "Municipality" character varying(20),
    "Operator_s_Name" character varying(100),
    "Farm_Name" character varying(50),
    "Well_Number" character varying(20),
    "Latitude" double precision,
    "Longitude" double precision,
    "Marcellus_Ind_" character varying(4),
    "Horizontal_Ind_" character varying(4),
    "Creation_Date" timestamp without time zone,
    "Created_By" character varying(20),
    "Modification_Date" timestamp without time zone,
    "Modified_By" character varying(20),
    "Well_Type" character varying(20),
    "Unconventional" character varying(4),
    "Region" character varying(50)
);


ALTER TABLE public."PA_Spud" OWNER TO scraper;

--
-- Name: pa_violation_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_violation_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_violation_st_id_seq OWNER TO scraper;

--
-- Name: PA_Violation; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_Violation" (
    st_id integer DEFAULT nextval('pa_violation_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "InspectionID" integer NOT NULL,
    "ViolationID" integer NOT NULL,
    "EnforcementID" integer,
    "Operator" character varying(100),
    "Region" character varying(50),
    "InspectionDate" date,
    "InspectionType" character varying(50),
    "Permit_API" character varying(20),
    "IsMarcellus" character varying(8),
    "InspectionCategory" character varying(50),
    "County" character varying(20),
    "Municipality" character varying(20),
    "InspectionResult" character varying(255),
    "InspectionComment" text,
    "ViolationDate" date,
    "ViolationCode" character varying(255),
    "ViolationType" character varying(100),
    "ViolationComment" character varying(255),
    "ResolvedDate" date,
    "EnforcementCode" character varying(100),
    "PenaltyFinalStatus" character varying(100),
    "PenaltyDateFinal" date,
    "EnforcementDateFinal" date,
    "PenaltyAmount" double precision,
    "TotalAmountCollected" double precision,
    "Unconventional" character varying(4)
);


ALTER TABLE public."PA_Violation" OWNER TO scraper;

--
-- Name: publishedfeeditems_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE publishedfeeditems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishedfeeditems_id_seq OWNER TO scraper;

--
-- Name: PublishedFeedItems; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PublishedFeedItems" (
    id integer DEFAULT nextval('publishedfeeditems_id_seq'::regclass) NOT NULL,
    task_id integer NOT NULL,
    feed_item_id character(36) NOT NULL,
    published timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."PublishedFeedItems" OWNER TO scraper;

--
-- Name: RSSEmailSubscription; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RSSEmailSubscription" (
    id character(36) NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL,
    email character varying(255) NOT NULL,
    rss_url character varying(255) NOT NULL,
    interval_hours integer DEFAULT 23 NOT NULL,
    last_email_sent timestamp without time zone,
    last_item_updated timestamp without time zone,
    lat1 double precision,
    lat2 double precision,
    lng1 double precision,
    lng2 double precision,
    last_update_sent timestamp without time zone,
    active smallint DEFAULT 1 NOT NULL,
    name character varying(30)
);


ALTER TABLE public."RSSEmailSubscription" OWNER TO scraper;

--
-- Name: rssfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE rssfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rssfeed_id_seq OWNER TO scraper;

--
-- Name: RssFeed; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RssFeed" (
    id integer DEFAULT nextval('rssfeed_id_seq'::regclass) NOT NULL,
    url character varying(255) NOT NULL,
    last_read timestamp without time zone NOT NULL,
    update_interval_secs integer DEFAULT 0 NOT NULL,
    tag character varying(32),
    name character varying(32),
    source_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."RssFeed" OWNER TO scraper;

--
-- Name: RssFeedItem; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RssFeedItem" (
    item_id character varying(255) NOT NULL,
    content bytea,
    feed_id integer NOT NULL
);


ALTER TABLE public."RssFeedItem" OWNER TO scraper;

--
-- Name: feedentry_published_seq_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE feedentry_published_seq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedentry_published_seq_seq OWNER TO scraper;

--
-- Name: la_lease_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE la_lease_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.la_lease_blocks_id_seq OWNER TO scraper;

--
-- Name: wv_drillingpermit_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE wv_drillingpermit_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wv_drillingpermit_st_id_seq OWNER TO scraper;

SET search_path = scraper, pg_catalog;

--
-- Name: region; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE region (
    id integer NOT NULL,
    name character varying(256),
    code character varying(20),
    the_geom public.geometry,
    kml text,
    simple_geom public.geometry,
    src character varying(128)
);


ALTER TABLE scraper.region OWNER TO scraper;

--
-- Name: feedentry; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE feedentry (
    id character(36) NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255),
    summary text,
    content text,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    source_id integer NOT NULL,
    kml_url character varying(255),
    incident_datetime timestamp without time zone NOT NULL,
    published timestamp without time zone,
    regions integer[],
    tags character varying(64)[],
    the_geom public.geometry,
    source_item_id integer
);


ALTER TABLE scraper.feedentry OWNER TO scraper;

--
-- Name: region_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.region_id_seq OWNER TO scraper;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE region_id_seq OWNED BY region.id;


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY "Nightfire_file" ALTER COLUMN id SET DEFAULT nextval('"Nightfire_file_id_seq"'::regclass);


SET search_path = scraper, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('region_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: AreaCodeMap_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "AreaCodeMap"
    ADD CONSTRAINT "AreaCodeMap_pkey" PRIMARY KEY (id);


--
-- Name: BotTaskError_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTaskError"
    ADD CONSTRAINT "BotTaskError_pkey" PRIMARY KEY (task_id, bot);


--
-- Name: BotTaskParams_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTaskParams"
    ADD CONSTRAINT "BotTaskParams_pkey" PRIMARY KEY (bot, task_id, key);


--
-- Name: BotTaskStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTaskStatus"
    ADD CONSTRAINT "BotTaskStatus_pkey" PRIMARY KEY (task_id, bot);


--
-- Name: BotTask_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTask"
    ADD CONSTRAINT "BotTask_pkey" PRIMARY KEY (id, bot);


--
-- Name: CogisInspection_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "CogisInspection"
    ADD CONSTRAINT "CogisInspection_pkey" PRIMARY KEY (st_id);


--
-- Name: CogisSpill_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "CogisSpill"
    ADD CONSTRAINT "CogisSpill_pkey" PRIMARY KEY (st_id);


--
-- Name: FeedEntryTag_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FeedEntryTag"
    ADD CONSTRAINT "FeedEntryTag_pkey" PRIMARY KEY (tag, feed_entry_id);


--
-- Name: FeedSource_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FeedSource"
    ADD CONSTRAINT "FeedSource_pkey" PRIMARY KEY (id);


--
-- Name: FracFocusPDF_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusPDF"
    ADD CONSTRAINT "FracFocusPDF_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusParseChemical_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusParseChemical"
    ADD CONSTRAINT "FracFocusParseChemical_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusParse_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusParse"
    ADD CONSTRAINT "FracFocusParse_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusReportChemical_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusReportChemical"
    ADD CONSTRAINT "FracFocusReportChemical_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusReport"
    ADD CONSTRAINT "FracFocusReport_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusScrape_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusScrape"
    ADD CONSTRAINT "FracFocusScrape_pkey" PRIMARY KEY (seqid);


--
-- Name: GeocodeCache_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "GeocodeCache"
    ADD CONSTRAINT "GeocodeCache_pkey" PRIMARY KEY (_key);


--
-- Name: LeaseBlockCentroid_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "LeaseBlockCentroid"
    ADD CONSTRAINT "LeaseBlockCentroid_pkey" PRIMARY KEY (id);


--
-- Name: Nightfire_file_filename_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Nightfire_file"
    ADD CONSTRAINT "Nightfire_file_filename_key" UNIQUE (filename);


--
-- Name: Nightfire_file_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Nightfire_file"
    ADD CONSTRAINT "Nightfire_file_pkey" PRIMARY KEY (id);


--
-- Name: Nightfire_record_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Nightfire_record"
    ADD CONSTRAINT "Nightfire_record_pkey" PRIMARY KEY (file_num, "ID");


--
-- Name: NrcAnalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcAnalysis"
    ADD CONSTRAINT "NrcAnalysis_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcGeocode_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcGeocode"
    ADD CONSTRAINT "NrcGeocode_pkey" PRIMARY KEY (reportnum, source);


--
-- Name: NrcMaterials_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcMaterials"
    ADD CONSTRAINT "NrcMaterials_pkey" PRIMARY KEY (id);


--
-- Name: NrcParsedReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcParsedReport"
    ADD CONSTRAINT "NrcParsedReport_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcScrapedFullReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScrapedFullReport"
    ADD CONSTRAINT "NrcScrapedFullReport_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcScrapedMaterial_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScrapedMaterial"
    ADD CONSTRAINT "NrcScrapedMaterial_pkey" PRIMARY KEY (reportnum, name);


--
-- Name: NrcScrapedReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScrapedReport"
    ADD CONSTRAINT "NrcScrapedReport_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcScraperTarget_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScraperTarget"
    ADD CONSTRAINT "NrcScraperTarget_pkey" PRIMARY KEY (id);


--
-- Name: NrcTag_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcTag"
    ADD CONSTRAINT "NrcTag_pkey" PRIMARY KEY (reportnum, tag);


--
-- Name: NrcUnits_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcUnits"
    ADD CONSTRAINT "NrcUnits_pkey" PRIMARY KEY (id);


--
-- Name: PA_DrillingPermit_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_DrillingPermit"
    ADD CONSTRAINT "PA_DrillingPermit_pkey" PRIMARY KEY (st_id);


--
-- Name: PA_Spud_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_Spud"
    ADD CONSTRAINT "PA_Spud_pkey" PRIMARY KEY (st_id);


--
-- Name: PA_Violation_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_Violation"
    ADD CONSTRAINT "PA_Violation_pkey" PRIMARY KEY (st_id);


--
-- Name: PublishedFeedItems_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PublishedFeedItems"
    ADD CONSTRAINT "PublishedFeedItems_pkey" PRIMARY KEY (id);


--
-- Name: RSSEmailSubscription_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "RSSEmailSubscription"
    ADD CONSTRAINT "RSSEmailSubscription_pkey" PRIMARY KEY (id);


--
-- Name: RssFeedItem_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "RssFeedItem"
    ADD CONSTRAINT "RssFeedItem_pkey" PRIMARY KEY (item_id);


--
-- Name: RssFeed_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "RssFeed"
    ADD CONSTRAINT "RssFeed_pkey" PRIMARY KEY (id);


SET search_path = scraper, pg_catalog;

--
-- Name: region_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: Nightfire_record_Lat_GMTCO; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "Nightfire_record_Lat_GMTCO" ON "Nightfire_record" USING btree ("Lat_GMTCO");


--
-- Name: Nightfire_record_Lon_GMTCO; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "Nightfire_record_Lon_GMTCO" ON "Nightfire_record" USING btree ("Lon_GMTCO");


--
-- Name: ViolationID; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX "ViolationID" ON "PA_Violation" USING btree ("ViolationID");


--
-- Name: api_date_row; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX api_date_row ON "FracFocusReportChemical" USING btree (api, fracture_date, "row");


--
-- Name: api_job_date; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX api_job_date ON "FracFocusScrape" USING btree (api, job_date);


--
-- Name: area_block; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX area_block ON "NrcParsedReport" USING btree (areaid, blockid);


--
-- Name: areaid_blockid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX areaid_blockid ON "LeaseBlockCentroid" USING btree (areaid, blockid);


--
-- Name: bot_status; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX bot_status ON "BotTaskStatus" USING btree (bot, status);


--
-- Name: cas_number; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX cas_number ON "FracFocusReportChemical" USING btree (cas_number);


--
-- Name: cas_type; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX cas_type ON "FracFocusReportChemical" USING btree (cas_type);


--
-- Name: description; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX description ON "NrcScrapedReport" USING btree (description);


--
-- Name: doc_num_index; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX doc_num_index ON "CogisSpill" USING btree (doc_num);


--
-- Name: id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX id ON "FeedEntryTag" USING btree (feed_entry_id);


--
-- Name: idcogisspill_UNIQUE; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX "idcogisspill_UNIQUE" ON "CogisSpill" USING btree (st_id);


--
-- Name: incident_datetime; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX incident_datetime ON "NrcScrapedReport" USING btree (incident_datetime);


--
-- Name: lat_lng; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX lat_lng ON "NrcGeocode" USING btree (lat, lng);


--
-- Name: material_name; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX material_name ON "NrcScrapedReport" USING btree (material_name);


--
-- Name: name; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX name ON "NrcScrapedMaterial" USING btree (name);


--
-- Name: pattern; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX pattern ON "AreaCodeMap" USING btree (pattern);


--
-- Name: pdf_seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX pdf_seqid ON "FracFocusReport" USING btree (pdf_seqid);


--
-- Name: report_seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX report_seqid ON "FracFocusReportChemical" USING btree (pdf_seqid);


--
-- Name: reportnum; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX reportnum ON "NrcTag" USING btree (reportnum);


--
-- Name: seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX seqid ON "NrcScrapedMaterial" USING btree (st_id);


--
-- Name: state; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX state ON "FracFocusScrape" USING btree (state);


--
-- Name: suspected_responsible_company; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX suspected_responsible_company ON "NrcScrapedReport" USING btree (suspected_responsible_company);


--
-- Name: tag; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX tag ON "FeedEntryTag" USING btree (tag);


--
-- Name: task_item; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX task_item ON "PublishedFeedItems" USING btree (task_id, feed_item_id);


--
-- Name: time_stamp; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX time_stamp ON "NrcScrapedReport" USING btree (time_stamp);


SET search_path = scraper, pg_catalog;

--
-- Name: feed_entry_source; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feed_entry_source ON feedentry USING btree (source_id, published);


--
-- Name: feedentry_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX feedentry_id ON feedentry USING btree (id);


--
-- Name: feedentry_incident_datetime; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_incident_datetime ON feedentry USING btree (incident_datetime DESC);


--
-- Name: feedentry_latlng; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_latlng ON feedentry USING btree (lat, lng);


--
-- Name: feedentry_published; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_published ON feedentry USING btree (published DESC);


--
-- Name: feedentry_regions; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_regions ON feedentry USING gin (regions);


--
-- Name: feedentry_tags; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_tags ON feedentry USING gin (tags);


--
-- Name: idx_regions_code; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX idx_regions_code ON region USING btree (code);


--
-- Name: idx_regions_the_geom; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_regions_the_geom ON region USING gist (the_geom);


--
-- Name: feedentry_insert; Type: RULE; Schema: scraper; Owner: scraper
--

CREATE RULE feedentry_insert AS ON INSERT TO feedentry WHERE (NOT (EXISTS (SELECT 1 FROM feedentry WHERE (feedentry.id = new.id)))) DO UPDATE feedentry SET regions = ARRAY(SELECT region.id FROM region WHERE public.st_contains(region.the_geom, public.st_setsrid(public.st_makepoint(feedentry.lng, feedentry.lat), (-1)))), the_geom = public.st_setsrid(public.st_makepoint(feedentry.lng, feedentry.lat), (-1)), published = (SELECT to_timestamp((GREATEST(floor(date_part('epoch'::text, now())), date_part('epoch'::text, max(feedentry.published))) + (0.001)::double precision)) AS to_timestamp FROM feedentry) WHERE (feedentry.id = new.id);
ALTER TABLE scraper.feedentry DISABLE RULE feedentry_insert;


--
-- Name: feedentry_replace; Type: RULE; Schema: scraper; Owner: scraper
--

CREATE RULE feedentry_replace AS ON INSERT TO feedentry WHERE (EXISTS (SELECT 1 FROM feedentry WHERE (feedentry.id = new.id))) DO INSTEAD UPDATE feedentry SET title = new.title, link = new.link, summary = new.summary, content = new.content, lat = new.lat, lng = new.lng, source_id = new.source_id, kml_url = new.kml_url, incident_datetime = new.incident_datetime, tags = new.tags, regions = ARRAY(SELECT region.id FROM region WHERE public.st_contains(region.the_geom, public.st_setsrid(public.st_makepoint(new.lng, new.lat), (-1)))), the_geom = public.st_setsrid(public.st_makepoint(new.lng, new.lat), (-1)) WHERE (feedentry.id = new.id);
ALTER TABLE scraper.feedentry DISABLE RULE feedentry_replace;


--
-- Name: feedentry_insert; Type: TRIGGER; Schema: scraper; Owner: scraper
--

<<<<<<< HEAD
CREATE TRIGGER feedentry_insert BEFORE INSERT ON feedentry FOR EACH ROW EXECUTE PROCEDURE feedentry_insert();
=======
--CREATE TRIGGER feedentry_insert BEFORE INSERT ON feedentry FOR EACH ROW EXECUTE PROCEDURE feedentry_insert();
>>>>>>> f611d29dd1942f0f869590b74cfdffcfdfe75a7c


--
-- Name: region; Type: ACL; Schema: scraper; Owner: scraper
--

REVOKE ALL ON TABLE region FROM PUBLIC;
REVOKE ALL ON TABLE region FROM scraper;
GRANT ALL ON TABLE region TO scraper;


--
-- Name: feedentry; Type: ACL; Schema: scraper; Owner: scraper
--

REVOKE ALL ON TABLE feedentry FROM PUBLIC;
REVOKE ALL ON TABLE feedentry FROM scraper;
GRANT ALL ON TABLE feedentry TO scraper;


--
-- PostgreSQL database dump complete
--

