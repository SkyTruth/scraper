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
5	UshahidiPublisher	LABB Ushahidi Update	3600
4	UshahidiPublisher	SkyTruth Ushahidi Update	3600
6	PAPermitScraper	PA Permit Scraper	3600
7	PASpudScraper	PA Spud Scraper	3600
8	BotMonitor	Bot Monitor	3600
9	WVPermitScraper	WV Permit Activity	3600
104	PAViolationScraper	PA Permit Violations	3600
34	FracFocusScraper	FracFocus Scraper OH	85000
35	FracFocusScraper	FracFocus Scraper OK	85000
47	FracFocusScraper	FracFocus Scraper WV	85000
37	FracFocusScraper	FracFocus Scraper PA	85000
49	FracFocusScraper	FracFocus Scraper WY	85000
45	FracFocusScraper	FracFocus Scraper VA	85000
43	FracFocusScraper	FracFocus Scraper UT	85000
41	FracFocusScraper	FracFocus Scraper TN	85000
48	FracFocusScraper	FracFocus Scraper WI	85000
46	FracFocusScraper	FracFocus Scraper WA	85000
44	FracFocusScraper	FracFocus Scraper VT	85000
40	FracFocusScraper	FracFocus Scraper SD	85000
39	FracFocusScraper	FracFocus Scraper SC	85000
38	FracFocusScraper	FracFocus Scraper RI	85000
36	FracFocusScraper	FracFocus Scraper OR	85000
33	FracFocusScraper	FracFocus Scraper ND	85000
32	FracFocusScraper	FracFocus Scraper NC	85000
31	FracFocusScraper	FracFocus Scraper NY	85000
30	FracFocusScraper	FracFocus Scraper NM	85000
29	FracFocusScraper	FracFocus Scraper NJ	85000
28	FracFocusScraper	FracFocus Scraper NH	85000
27	FracFocusScraper	FracFocus Scraper NV	85000
26	FracFocusScraper	FracFocus Scraper NE	85000
25	FracFocusScraper	FracFocus Scraper MT	85000
24	FracFocusScraper	FracFocus Scraper MO	85000
23	FracFocusScraper	FracFocus Scraper MS	85000
22	FracFocusScraper	FracFocus Scraper MN	85000
21	FracFocusScraper	FracFocus Scraper MI	85000
20	FracFocusScraper	FracFocus Scraper MA	85000
19	FracFocusScraper	FracFocus Scraper MD	85000
18	FracFocusScraper	FracFocus Scraper ME	85000
17	FracFocusScraper	FracFocus Scraper LA	85000
16	FracFocusScraper	FracFocus Scraper KY	85000
15	FracFocusScraper	FracFocus Scraper KS	85000
14	FracFocusScraper	FracFocus Scraper IA	85000
13	FracFocusScraper	FracFocus Scraper IN	85000
12	FracFocusScraper	FracFocus Scraper IL	85000
11	FracFocusScraper	FracFocus Scraper ID	85000
42	FracFocusScraper	FracFocus Scraper TX	85000
9	FracFocusScraper	FracFocus Scraper FL	85000
8	FracFocusScraper	FracFocus Scraper DC	85000
7	FracFocusScraper	FracFocus Scraper DE	85000
6	FracFocusScraper	FracFocus Scraper CT	85000
5	FracFocusScraper	FracFocus Scraper CO	85000
4	FracFocusScraper	FracFocus Scraper CA	85000
3	FracFocusScraper	FracFocus Scraper AR	85000
2	FracFocusScraper	FracFocus Scraper AZ	85000
1	FracFocusScraper	FracFocus Scraper AL	85000
50	FracFocusScraper	FracFocus Scraper AK	85000
124	CogisScraper	scrape_insp	0
125	CogisSpillScraper	scrape_spill	0
126	NightfireScraper	scrape	0
\.


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
4	UshahidiPublisher	last_item_updated	2013-05-16 07:41:22.001
5	UshahidiPublisher	last_item_updated	2013-05-16 07:41:22.001
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
-- Data for Name: NrcMaterials; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "NrcMaterials" (id, pattern, group_label) FROM stdin;
1	OIL: CRUDE	oil
2	CONDENSATE	oil
3	UNKNOWN OIL	oil
4	GASOLINE	fuel
5	OIL: DIESEL	fuel
6	OIL, FUEL: 	fuel
7	JET FUEL	fuel
8	FUEL OIL	fuel
9	HYDRAULIC	mechanical
10	OIL, MISC: LUBRICATING	mechanical
11	TRANSMISSION FLUID	mechanical
12	OIL, MISC: MOTOR	mechanical
13	OIL, MISC: TRANSFORMER	mechanical
\.


--
-- Data for Name: NrcUnits; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "NrcUnits" (id, unit_type, pattern, standardized_unit, conversion_factor) FROM stdin;
2	LENGTH	METER	FEET	3.28083990000000014
3	LENGTH	MILE	FEET	5280
4	VOLUME	GALLON	GALLON	1
5	VOLUME	BARREL	GALLON	42
6	VOLUME	TEASPOON	GALLON	0.00130208333000000009
7	VOLUME	CUP	GALLON	0.0625
8	VOLUME	CUBIC F[EO][EO]T	CUBIC FT	1.0
9	VOLUME	DROP	GALLON	1.71321916083000014e-05
10	VOLUME	LITER	GALLON	0.264172052358000009
11	VOLUME	QUART	GALLON	0.25
12	WEIGHT	OUNCE	POUND	0.0625
13	WEIGHT	POUND	POUND	1
14	WEIGHT	TON	POUND	2000
15	LENGTH	Y	FEET	3
16	LENGTH	INCH	FEET	0.0833333333329999981
17	OTHER	EACH	EACH	1
18	VOLUME	PINT	GALLON	0.125
19	VOLUME	TABLESPOON	GALLON	0.00390625
20	OTHER	OTHER	OTHER	1
21	OTHER	PART\\(S\\) PER MILLION	PART(S) PER MILLION	1
22	OTHER	MIL CBF	MIL CBF	1
23	OTHER	MILCURIE	MILCURIE(S)	1
24	VOLUME	CUBIC METER	GALLON	264.172052000000008
25	WEIGHT	GRAM	POUND	0.00220462261999999996
26	VOLUME	CUBIC YARD	GALLON	201.974026000000009
27	LENGTH	KILOMETER	FEET	3280.83989999999994
28	OTHER	UNK	UNKNOWN	1
29	OTHER	N/A	NONE	1
30	OTHER	CURIE	CURIE	1
31	LENGTH	F	FEET	1
32	OTHER	UKN	UNKNOWN	1
33	OTHER	NONE	NONE	1
34	LENGTH	`[\\s]*FEET	FEET	1
\.


--
-- Data for Name: RssFeed; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "RssFeed" (id, url, last_read, update_interval_secs, tag, name, source_id) FROM stdin;
1	http://skytruth-alerts.blogspot.com/feeds/posts/default	2013-05-16 15:51:07.747569	3000	SkyTruth	Skytruth Alert	2
2	http://blog.skytruth.org/feeds/posts/default/-/Alerts	2013-05-16 15:51:08.881801	3000	SkyTruth	SkyTruth Alert	2
3	http://www.incidentnews.gov/incidents.atom	2013-05-16 15:51:09.403804	3000	NOAA	NOAA Incident News	3
6	http://earthquake.usgs.gov/earthquakes/catalogs/7day-M5.xml	2013-05-16 15:51:09.786463	3000	Earthquake	USGS Earthquake Alerts	6
\.


--
-- PostgreSQL database dump complete
--

