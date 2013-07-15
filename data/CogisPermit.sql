--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: BotTask; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "BotTask" (id, bot, name, process_interval_secs) FROM stdin;
128	CogisApprovedPermits	CogisApprovedPermitScraper	3600
127	CogisPendingPermits	CogisPendingPermitScraper	3600
\.


--
-- Data for Name: BotTaskParams; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "BotTaskParams" (task_id, bot, key, value) FROM stdin;
127	CogisPendingPermits	target_url	http://cogcc.state.co.us/COGIS/DrillingPermits.asp
127	CogisPendingPermits	feedsource_id	1002
127	CogisPendingPermits	permit_link_tmpl	http://ogccweblink.state.co.us/results.aspx?id=%s
127	CogisPendingPermits	county	All
128	CogisApprovedPermits	target_url	http://cogcc.state.co.us/COGIS/DrillingPermits.asp
128	CogisApprovedPermits	feedsource_id	1002
\.
128	CogisApprovedPermits	county	All

