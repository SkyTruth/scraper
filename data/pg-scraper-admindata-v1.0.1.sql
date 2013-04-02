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
-- Data for Name: BotTaskParams; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "BotTaskParams" (task_id, bot, key, value) FROM stdin;
4	UshahidiPublisher	feed_url	http://alerts.skytruth.org/json?tag=BigSpill,SkyTruth&region=GOM&channel=gost
4	UshahidiPublisher	api_url	http://oilspill.skytruth.org/api
4	UshahidiPublisher	ushahidi_category	19
5	UshahidiPublisher	feed_url	http://alerts.skytruth.org/json?tag=LABB&channel=LABB
5	UshahidiPublisher	api_url	http://map.labucketbrigade.org/api
5	UshahidiPublisher	ushahidi_category	LABB
6	PAPermitScraper	target_url	http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FPermits_Issued_Detail&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_START_DATE=11%2F01%2F2012%2000%3A00%3A00&P_END_DATE=12%2F31%2F2013%2000%3A00%3A00&P_SEARCH_NAME%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x0
9	WVPermitScraper	about_url	http://www.dep.wv.gov/oil-and-gas/databaseinfo/Pages/OGD.aspx
6	PAPermitScraper	sheet	0
6	PAPermitScraper	header_row	0
9	WVPermitScraper	target_url	http://apps.dep.wv.gov/oog/permitsearch_new.cfm
6	PAPermitScraper	about_url	http://www.portal.state.pa.us/portal/server.pt/community/oil_and_gas_reports/20297
7	PASpudScraper	sheet	0
7	PASpudScraper	header_row	0
7	PASpudScraper	about_url	http://www.portal.state.pa.us/portal/server.pt/community/oil_and_gas_reports/20297
7	PASpudScraper	target_url	http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FSpud_External_Data&P_SPUD_START_DATE=10%2F01%2F2012%2000%3A00%3A00&P_SPUD_END_DATE=12%2F31%2F2013%2000%3A00%3A00&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_REGION%3Aisnull=True&P_OPERATOR%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x0
104	PAViolationScraper	about_url	http://www.depweb.state.pa.us/portal/server.pt/community/oil_and_gas_compliance_report/20299
0	ColoradoFeedGenerato	last_seqid	2012-07-16
0	FracFocusFeedGenerat	last_seqid	2012-07-16
34	FracFocusScraper	state	34
35	FracFocusScraper	state	35
47	FracFocusScraper	state	47
37	FracFocusScraper	state	37
49	FracFocusScraper	state	49
45	FracFocusScraper	state	45
43	FracFocusScraper	state	43
41	FracFocusScraper	state	41
48	FracFocusScraper	state	48
46	FracFocusScraper	state	46
44	FracFocusScraper	state	44
40	FracFocusScraper	state	40
39	FracFocusScraper	state	39
38	FracFocusScraper	state	38
36	FracFocusScraper	state	36
33	FracFocusScraper	state	33
32	FracFocusScraper	state	32
31	FracFocusScraper	state	31
30	FracFocusScraper	state	30
29	FracFocusScraper	state	29
28	FracFocusScraper	state	28
27	FracFocusScraper	state	27
26	FracFocusScraper	state	26
25	FracFocusScraper	state	25
24	FracFocusScraper	state	24
23	FracFocusScraper	state	23
22	FracFocusScraper	state	22
21	FracFocusScraper	state	21
20	FracFocusScraper	state	20
19	FracFocusScraper	state	19
18	FracFocusScraper	state	18
17	FracFocusScraper	state	17
16	FracFocusScraper	state	16
15	FracFocusScraper	state	15
14	FracFocusScraper	state	14
13	FracFocusScraper	state	13
12	FracFocusScraper	state	12
11	FracFocusScraper	state	11
104	PAViolationScraper	target_url	http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FOG_Compliance&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_ORG_NAME%3Aisnull=True&P_SEARCH_NAME%3Aisnull=True&P_INSPECTIONS=Y&P_RESOLVED_VIOLATIONS=N&P_CATEGORY_TYPE%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x3
9	FracFocusScraper	state	9
8	FracFocusScraper	state	8
7	FracFocusScraper	state	7
6	FracFocusScraper	state	6
5	FracFocusScraper	state	5
4	FracFocusScraper	state	4
3	FracFocusScraper	state	3
2	FracFocusScraper	state	2
1	FracFocusScraper	state	1
42	FracFocusScraper	state	42
50	FracFocusScraper	state	50
125	CogisSpillScraper	target_url	http://cogcc.state.co.us/cogis/IncidentSearch.asp
124	CogisScraper	table	insp
124	CogisScraper	count	25
124	CogisScraper	target_url	http://cogcc.state.co.us/cogis/IncidentSearch.asp
5	UshahidiPublisher	http_user	nrcreports
5	UshahidiPublisher	http_password	c2xdTkyKySUA2PXr0Khb
125	CogisSpillScraper	table	spill
125	CogisSpillScraper	count	25
126	NightfireScraper	target_url	http://www.ngdc.noaa.gov/dmsp/data/viirs_fire/
104	PAViolationScraper	date_offset	14
126	NightfireScraper	record_count	0
126	NightfireScraper	file_count	1000000
5	UshahidiPublisher	api_version	LABB
4	UshahidiPublisher	last_item_updated	2013-03-13 07:41:13.006
5	UshahidiPublisher	last_item_updated	2013-03-13 07:41:15.017
\.


--
-- Data for Name: FeedSource; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "FeedSource" (id, name) FROM stdin;
1	NRC
2	SkyTruth
3	NOAA
4	PA DEP Permit
5	PA DEP SPUD
6	USGS Earthquakes
7	WV DEP Permit
8	WV DEP Permit Activity
9	PA DEP Violation
10	FracFocus
1001	COGIS
\.


--
-- Data for Name: RssFeed; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "RssFeed" (id, url, last_read, update_interval_secs, tag, name, source_id) FROM stdin;
1	http://skytruth-alerts.blogspot.com/feeds/posts/default	2013-03-13 15:51:12.148513	3000	SkyTruth	Skytruth Alert	2
2	http://blog.skytruth.org/feeds/posts/default/-/Alerts	2013-03-13 15:51:13.588275	3000	SkyTruth	SkyTruth Alert	2
3	http://www.incidentnews.gov/incidents.atom	2013-03-13 15:51:13.712115	3000	NOAA	NOAA Incident News	3
6	http://earthquake.usgs.gov/earthquakes/catalogs/7day-M5.xml	2013-03-13 15:51:13.835466	3000	Earthquake	USGS Earthquake Alerts	6
\.


--
-- PostgreSQL database dump complete
--

