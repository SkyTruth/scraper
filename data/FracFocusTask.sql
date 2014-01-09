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
-- Data for Name: FracFocusTask; Type: TABLE DATA; Schema: public; Owner: scraper
--

COPY "FracFocusTask" (seqid, state_code, state_name, county_code, county_name, task_flag, api_prefix, records, scraped, score) FROM stdin;
9007	00	update tracking record	\N	\N	0	00	\N	\N	\N
9008	01	Alabama	\N	\N	1	01-	\N	\N	\N
9009	02	Arizona	\N	\N	1	02-	\N	\N	\N
9010	03	Arkansas	\N	\N	0	03-	\N	\N	\N
9011	04	California	\N	\N	1	04-	\N	\N	\N
9012	05	Colorado	\N	\N	0	05-	\N	\N	\N
9013	06	Connecticut	\N	\N	1	06-	\N	\N	\N
9014	07	Delaware	\N	\N	1	07-	\N	\N	\N
9015	08	District of Columbia	\N	\N	1	08-	\N	\N	\N
9016	09	Florida	\N	\N	1	09-	\N	\N	\N
9017	10	Georgia	\N	\N	1	10-	\N	\N	\N
9018	11	Idaho	\N	\N	1	11-	\N	\N	\N
9019	12	Illinois	\N	\N	1	12-	\N	\N	\N
9020	13	Indiana	\N	\N	1	13-	\N	\N	\N
9021	14	Iowa	\N	\N	1	14-	\N	\N	\N
9022	15	Kansas	\N	\N	1	15-	\N	\N	\N
9023	16	Kentucky	\N	\N	1	16-	\N	\N	\N
9024	17	Louisiana	\N	\N	0	17-	\N	\N	\N
9025	18	Maine	\N	\N	1	18-	\N	\N	\N
9026	19	Maryland	\N	\N	1	19-	\N	\N	\N
9027	20	Massachusetts	\N	\N	1	20-	\N	\N	\N
9028	21	Michigan	\N	\N	1	21-	\N	\N	\N
9029	22	Minnesota	\N	\N	1	22-	\N	\N	\N
9030	23	Mississippi	\N	\N	1	23-	\N	\N	\N
9031	24	Missouri	\N	\N	1	24-	\N	\N	\N
9032	25	Montana	\N	\N	1	25-	\N	\N	\N
9033	26	Nebraska	\N	\N	1	26-	\N	\N	\N
9034	27	Nevada	\N	\N	1	27-	\N	\N	\N
9035	28	New Hampshire	\N	\N	1	28-	\N	\N	\N
9036	29	New Jersey	\N	\N	1	29-	\N	\N	\N
9037	30	New Mexico	\N	\N	0	30-	\N	\N	\N
9038	31	New York	\N	\N	1	31-	\N	\N	\N
9039	32	North Carolina	\N	\N	1	32-	\N	\N	\N
9040	33	North Dakota	\N	\N	0	33-	\N	\N	\N
9041	34	Ohio	\N	\N	1	34-	\N	\N	\N
9042	35	Oklahoma	\N	\N	0	35-	\N	\N	\N
9043	36	Oregon	\N	\N	1	36-	\N	\N	\N
9044	37	Pennsylvania	\N	\N	0	37-	\N	\N	\N
9045	38	Rhode Island	\N	\N	1	38-	\N	\N	\N
9046	39	South Carolina	\N	\N	1	39-	\N	\N	\N
9047	40	South Dakota	\N	\N	1	40-	\N	\N	\N
9048	41	Tennessee	\N	\N	1	41-	\N	\N	\N
9049	42	Texas	\N	\N	0	42-	\N	\N	\N
9050	43	Utah	\N	\N	0	43-	\N	\N	\N
9051	44	Vermont	\N	\N	1	44-	\N	\N	\N
9052	45	Virginia	\N	\N	1	45-	\N	\N	\N
9053	46	Washington	\N	\N	1	46-	\N	\N	\N
9054	47	West Virginia	\N	\N	1	47-	\N	\N	\N
9055	48	Wisconsin	\N	\N	1	48-	\N	\N	\N
9056	49	Wyoming	\N	\N	0	49-	\N	\N	\N
9057	50	Alaska	\N	\N	1	50-	\N	\N	\N
9058	51	Hawaii	\N	\N	1	51-	\N	\N	\N
9059	55	Alaska Offshore	\N	\N	1	55-	\N	\N	\N
9060	56	Pacific Coast Offshore	\N	\N	1	56-	\N	\N	\N
9061	60	Northern Gulf of Mexico	\N	\N	1	60-	\N	\N	\N
9062	61	Atlantic Coast Offshore	\N	\N	1	61-	\N	\N	\N
9063	01	Alabama	001	Autauga	0	01-001-	\N	\N	\N
9064	01	Alabama	003	Baldwin	0	01-003-	\N	\N	\N
9065	01	Alabama	005	Barbour	0	01-005-	\N	\N	\N
9066	01	Alabama	007	Bibb	0	01-007-	\N	\N	\N
9067	01	Alabama	009	Blount	0	01-009-	\N	\N	\N
9068	01	Alabama	011	Bullock	0	01-011-	\N	\N	\N
9069	01	Alabama	013	Butler	0	01-013-	\N	\N	\N
9070	01	Alabama	015	Calhoun	0	01-015-	\N	\N	\N
9071	01	Alabama	017	Chambers	0	01-017-	\N	\N	\N
9072	01	Alabama	019	Cherokee	0	01-019-	\N	\N	\N
9073	01	Alabama	021	Chilton	0	01-021-	\N	\N	\N
9074	01	Alabama	023	Choctaw	0	01-023-	\N	\N	\N
9075	01	Alabama	025	Clarke	0	01-025-	\N	\N	\N
9076	01	Alabama	027	Clay	0	01-027-	\N	\N	\N
9077	01	Alabama	029	Cleburne	0	01-029-	\N	\N	\N
9078	01	Alabama	031	Coffee	0	01-031-	\N	\N	\N
9079	01	Alabama	033	Colbert	0	01-033-	\N	\N	\N
9080	01	Alabama	035	Conecuh	0	01-035-	\N	\N	\N
9081	01	Alabama	037	Coosa	0	01-037-	\N	\N	\N
9082	01	Alabama	039	Covington	0	01-039-	\N	\N	\N
9083	01	Alabama	041	Crenshaw	0	01-041-	\N	\N	\N
9084	01	Alabama	043	Cullman	0	01-043-	\N	\N	\N
9085	01	Alabama	045	Dale	0	01-045-	\N	\N	\N
9086	01	Alabama	047	Dallas	0	01-047-	\N	\N	\N
9087	01	Alabama	049	De Kalb	0	01-049-	\N	\N	\N
9088	01	Alabama	051	Elmore	0	01-051-	\N	\N	\N
9089	01	Alabama	053	Escambia	0	01-053-	\N	\N	\N
9090	01	Alabama	055	Etowah	0	01-055-	\N	\N	\N
9091	01	Alabama	057	Fayette	0	01-057-	\N	\N	\N
9092	01	Alabama	059	Franklin	0	01-059-	\N	\N	\N
9093	01	Alabama	061	Geneva	0	01-061-	\N	\N	\N
9094	01	Alabama	063	Greene	0	01-063-	\N	\N	\N
9095	01	Alabama	065	Hale	0	01-065-	\N	\N	\N
9096	01	Alabama	067	Henry	0	01-067-	\N	\N	\N
9097	01	Alabama	069	Houston	0	01-069-	\N	\N	\N
9098	01	Alabama	071	Jackson	0	01-071-	\N	\N	\N
9099	01	Alabama	073	Jefferson	0	01-073-	\N	\N	\N
9100	01	Alabama	075	Lamar	0	01-075-	\N	\N	\N
9101	01	Alabama	077	Lauderdale	0	01-077-	\N	\N	\N
9102	01	Alabama	079	Lawrence	0	01-079-	\N	\N	\N
9103	01	Alabama	081	Lee	0	01-081-	\N	\N	\N
9104	01	Alabama	083	Limestone	0	01-083-	\N	\N	\N
9105	01	Alabama	085	Lowndes	0	01-085-	\N	\N	\N
9106	01	Alabama	087	Macon	0	01-087-	\N	\N	\N
9107	01	Alabama	089	Madison	0	01-089-	\N	\N	\N
9108	01	Alabama	091	Marengo	0	01-091-	\N	\N	\N
9109	01	Alabama	093	Marion	0	01-093-	\N	\N	\N
9110	01	Alabama	095	Marshall	0	01-095-	\N	\N	\N
9111	01	Alabama	097	Mobile	0	01-097-	\N	\N	\N
9112	01	Alabama	099	Monroe	0	01-099-	\N	\N	\N
9113	01	Alabama	101	Montgomery	0	01-101-	\N	\N	\N
9114	01	Alabama	103	Morgan	0	01-103-	\N	\N	\N
9115	01	Alabama	105	Perry	0	01-105-	\N	\N	\N
9116	01	Alabama	107	Pickens	0	01-107-	\N	\N	\N
9117	01	Alabama	109	Pike	0	01-109-	\N	\N	\N
9118	01	Alabama	111	Randolph	0	01-111-	\N	\N	\N
9119	01	Alabama	113	Russell	0	01-113-	\N	\N	\N
9120	01	Alabama	115	St Clair	0	01-115-	\N	\N	\N
9121	01	Alabama	117	Shelby	0	01-117-	\N	\N	\N
9122	01	Alabama	119	Sumter	0	01-119-	\N	\N	\N
9123	01	Alabama	121	Talladega	0	01-121-	\N	\N	\N
9124	01	Alabama	123	Tallapoosa	0	01-123-	\N	\N	\N
9125	01	Alabama	125	Tuscaloosa	0	01-125-	\N	\N	\N
9126	01	Alabama	127	Walker	0	01-127-	\N	\N	\N
9127	01	Alabama	129	Washington	0	01-129-	\N	\N	\N
9128	01	Alabama	131	Wilcox	0	01-131-	\N	\N	\N
9129	01	Alabama	133	Winston	0	01-133-	\N	\N	\N
9130	01	Alabama	203	Baldwin Offshore	0	01-203-	\N	\N	\N
9131	01	Alabama	297	Mobile Offshore	0	01-297-	\N	\N	\N
9132	02	Arizona	001	Apache	0	02-001-	\N	\N	\N
9133	02	Arizona	003	Cochise	0	02-003-	\N	\N	\N
9134	02	Arizona	005	Coconino	0	02-005-	\N	\N	\N
9135	02	Arizona	007	Gila	0	02-007-	\N	\N	\N
9136	02	Arizona	009	Graham	0	02-009-	\N	\N	\N
9137	02	Arizona	011	Greenlee	0	02-011-	\N	\N	\N
9138	02	Arizona	012	La Paz	0	02-012-	\N	\N	\N
9139	02	Arizona	013	Maricopa	0	02-013-	\N	\N	\N
9140	02	Arizona	015	Mohave	0	02-015-	\N	\N	\N
9141	02	Arizona	017	Navajo	0	02-017-	\N	\N	\N
9142	02	Arizona	019	Pima	0	02-019-	\N	\N	\N
9143	02	Arizona	021	Pinal	0	02-021-	\N	\N	\N
9144	02	Arizona	023	Santa Cruz	0	02-023-	\N	\N	\N
9145	02	Arizona	025	Yavapai	0	02-025-	\N	\N	\N
9146	02	Arizona	027	Yuma	0	02-027-	\N	\N	\N
9147	03	Arkansas	001	Arkansas	1	03-001-	\N	\N	\N
9148	03	Arkansas	003	Ashley	1	03-003-	\N	\N	\N
9149	03	Arkansas	005	Baxter	1	03-005-	\N	\N	\N
9150	03	Arkansas	007	Benton	1	03-007-	\N	\N	\N
9151	03	Arkansas	009	Boone	1	03-009-	\N	\N	\N
9152	03	Arkansas	011	Bradley	1	03-011-	\N	\N	\N
9153	03	Arkansas	013	Calhoun	1	03-013-	\N	\N	\N
9154	03	Arkansas	015	Carroll	1	03-015-	\N	\N	\N
9155	03	Arkansas	017	Chicot	1	03-017-	\N	\N	\N
9156	03	Arkansas	019	Clark	1	03-019-	\N	\N	\N
9157	03	Arkansas	021	Clay	1	03-021-	\N	\N	\N
9158	03	Arkansas	023	Cleburne	1	03-023-	\N	\N	\N
9159	03	Arkansas	025	Cleveland	1	03-025-	\N	\N	\N
9160	03	Arkansas	027	Columbia	1	03-027-	\N	\N	\N
9161	03	Arkansas	029	Conway	1	03-029-	\N	\N	\N
9162	03	Arkansas	031	Craighead	1	03-031-	\N	\N	\N
9163	03	Arkansas	033	Crawford	1	03-033-	\N	\N	\N
9164	03	Arkansas	035	Crittenden	1	03-035-	\N	\N	\N
9165	03	Arkansas	037	Cross	1	03-037-	\N	\N	\N
9166	03	Arkansas	039	Dallas	1	03-039-	\N	\N	\N
9167	03	Arkansas	041	Desha	1	03-041-	\N	\N	\N
9168	03	Arkansas	043	Drew	1	03-043-	\N	\N	\N
9169	03	Arkansas	045	Faulkner	1	03-045-	\N	\N	\N
9170	03	Arkansas	047	Franklin	1	03-047-	\N	\N	\N
9171	03	Arkansas	049	Fulton	1	03-049-	\N	\N	\N
9172	03	Arkansas	051	Garland	1	03-051-	\N	\N	\N
9173	03	Arkansas	053	Grant	1	03-053-	\N	\N	\N
9174	03	Arkansas	055	Greene	1	03-055-	\N	\N	\N
9175	03	Arkansas	057	Hempstead	1	03-057-	\N	\N	\N
9176	03	Arkansas	059	Hot Spring	1	03-059-	\N	\N	\N
9177	03	Arkansas	061	Howard	1	03-061-	\N	\N	\N
9178	03	Arkansas	063	Independence	1	03-063-	\N	\N	\N
9179	03	Arkansas	065	Izard	1	03-065-	\N	\N	\N
9180	03	Arkansas	067	Jackson	1	03-067-	\N	\N	\N
9181	03	Arkansas	069	Jefferson	1	03-069-	\N	\N	\N
9182	03	Arkansas	071	Johnson	1	03-071-	\N	\N	\N
9183	03	Arkansas	073	Lafayette	1	03-073-	\N	\N	\N
9184	03	Arkansas	075	Lawrence	1	03-075-	\N	\N	\N
9185	03	Arkansas	077	Lee	1	03-077-	\N	\N	\N
9186	03	Arkansas	079	Lincoln	1	03-079-	\N	\N	\N
9187	03	Arkansas	081	Little River	1	03-081-	\N	\N	\N
9188	03	Arkansas	083	Logan	1	03-083-	\N	\N	\N
9189	03	Arkansas	085	Lonoke	1	03-085-	\N	\N	\N
9190	03	Arkansas	087	Madison	1	03-087-	\N	\N	\N
9191	03	Arkansas	089	Marion	1	03-089-	\N	\N	\N
9192	03	Arkansas	091	Miller	1	03-091-	\N	\N	\N
9193	03	Arkansas	093	Mississippi	1	03-093-	\N	\N	\N
9194	03	Arkansas	095	Monroe	1	03-095-	\N	\N	\N
9195	03	Arkansas	097	Montgomery	1	03-097-	\N	\N	\N
9196	03	Arkansas	099	Nevada	1	03-099-	\N	\N	\N
9197	03	Arkansas	101	Newton	1	03-101-	\N	\N	\N
9198	03	Arkansas	103	Ouachita	1	03-103-	\N	\N	\N
9199	03	Arkansas	105	Perry	1	03-105-	\N	\N	\N
9200	03	Arkansas	107	Phillips	1	03-107-	\N	\N	\N
9201	03	Arkansas	109	Pike	1	03-109-	\N	\N	\N
9202	03	Arkansas	111	Poinsett	1	03-111-	\N	\N	\N
9203	03	Arkansas	113	Polk	1	03-113-	\N	\N	\N
9204	03	Arkansas	115	Pope	1	03-115-	\N	\N	\N
9205	03	Arkansas	117	Prairie	1	03-117-	\N	\N	\N
9206	03	Arkansas	119	Pulaski	1	03-119-	\N	\N	\N
9207	03	Arkansas	121	Randolph	1	03-121-	\N	\N	\N
9208	03	Arkansas	123	St Francis	1	03-123-	\N	\N	\N
9209	03	Arkansas	125	Saline	1	03-125-	\N	\N	\N
9210	03	Arkansas	127	Scott	1	03-127-	\N	\N	\N
9211	03	Arkansas	129	Searcy	1	03-129-	\N	\N	\N
9212	03	Arkansas	131	Sebastian	1	03-131-	\N	\N	\N
9213	03	Arkansas	133	Sevier	1	03-133-	\N	\N	\N
9214	03	Arkansas	135	Sharp	1	03-135-	\N	\N	\N
9215	03	Arkansas	137	Stone	1	03-137-	\N	\N	\N
9216	03	Arkansas	139	Union	1	03-139-	\N	\N	\N
9217	03	Arkansas	141	Van Buren	1	03-141-	\N	\N	\N
9218	03	Arkansas	143	Washington	1	03-143-	\N	\N	\N
9219	03	Arkansas	145	White	1	03-145-	\N	\N	\N
9220	03	Arkansas	147	Woodruff	1	03-147-	\N	\N	\N
9221	03	Arkansas	149	Yell	1	03-149-	\N	\N	\N
9222	04	California	001	Alameda	0	04-001-	\N	\N	\N
9223	04	California	003	Alpine	0	04-003-	\N	\N	\N
9224	04	California	005	Amador	0	04-005-	\N	\N	\N
9225	04	California	007	Butte	0	04-007-	\N	\N	\N
9226	04	California	009	Calaveras	0	04-009-	\N	\N	\N
9227	04	California	011	Colusa	0	04-011-	\N	\N	\N
9228	04	California	013	Contra Costa	0	04-013-	\N	\N	\N
9229	04	California	015	Del Norte	0	04-015-	\N	\N	\N
9230	04	California	017	El Dorado	0	04-017-	\N	\N	\N
9231	04	California	019	Fresno	0	04-019-	\N	\N	\N
9232	04	California	021	Glenn	0	04-021-	\N	\N	\N
9233	04	California	023	Humboldt	0	04-023-	\N	\N	\N
9234	04	California	025	Imperial	0	04-025-	\N	\N	\N
9235	04	California	027	Inyo	0	04-027-	\N	\N	\N
9236	04	California	029	Kern	0	04-029-	\N	\N	\N
9237	04	California	030	Kern	0	04-030-	\N	\N	\N
9238	04	California	031	Kings	0	04-031-	\N	\N	\N
9239	04	California	033	Lake	0	04-033-	\N	\N	\N
9240	04	California	035	Lassen	0	04-035-	\N	\N	\N
9241	04	California	037	Los Angeles	0	04-037-	\N	\N	\N
9242	04	California	039	Madera	0	04-039-	\N	\N	\N
9243	04	California	041	Marin	0	04-041-	\N	\N	\N
9244	04	California	043	Mariposa	0	04-043-	\N	\N	\N
9245	04	California	045	Mendocino	0	04-045-	\N	\N	\N
9246	04	California	047	Merced	0	04-047-	\N	\N	\N
9247	04	California	049	Modoc	0	04-049-	\N	\N	\N
9248	04	California	051	Mono	0	04-051-	\N	\N	\N
9249	04	California	053	Monterey	0	04-053-	\N	\N	\N
9250	04	California	055	Napa	0	04-055-	\N	\N	\N
9251	04	California	057	Nevada	0	04-057-	\N	\N	\N
9252	04	California	059	Orange	0	04-059-	\N	\N	\N
9253	04	California	061	Placer	0	04-061-	\N	\N	\N
9254	04	California	063	Plumas	0	04-063-	\N	\N	\N
9255	04	California	065	Riverside	0	04-065-	\N	\N	\N
9256	04	California	067	Sacramento	0	04-067-	\N	\N	\N
9257	04	California	069	San Benito	0	04-069-	\N	\N	\N
9258	04	California	071	San Bernardino	0	04-071-	\N	\N	\N
9259	04	California	073	San Diego	0	04-073-	\N	\N	\N
9260	04	California	075	San Francisco	0	04-075-	\N	\N	\N
9261	04	California	077	San Joaquin	0	04-077-	\N	\N	\N
9262	04	California	079	San Luis Obispo	0	04-079-	\N	\N	\N
9263	04	California	081	San Mateo	0	04-081-	\N	\N	\N
9264	04	California	083	Santa Barbara	0	04-083-	\N	\N	\N
9265	04	California	085	Santa Clara	0	04-085-	\N	\N	\N
9266	04	California	087	Santa Cruz	0	04-087-	\N	\N	\N
9267	04	California	089	Shasta	0	04-089-	\N	\N	\N
9268	04	California	091	Sierra	0	04-091-	\N	\N	\N
9269	04	California	093	Siskiyou	0	04-093-	\N	\N	\N
9270	04	California	095	Solano	0	04-095-	\N	\N	\N
9271	04	California	097	Sonoma	0	04-097-	\N	\N	\N
9272	04	California	099	Stanislaus	0	04-099-	\N	\N	\N
9273	04	California	101	Sutter	0	04-101-	\N	\N	\N
9274	04	California	103	Tehama	0	04-103-	\N	\N	\N
9275	04	California	105	Trinity	0	04-105-	\N	\N	\N
9276	04	California	107	Tulare	0	04-107-	\N	\N	\N
9277	04	California	109	Tuolumne	0	04-109-	\N	\N	\N
9278	04	California	111	Ventura	0	04-111-	\N	\N	\N
9279	04	California	113	Yolo	0	04-113-	\N	\N	\N
9280	04	California	115	Yuba	0	04-115-	\N	\N	\N
9281	04	California	116	Anacapa Island	0	04-116-	\N	\N	\N
9282	04	California	118	San Clemente Island	0	04-118-	\N	\N	\N
9283	04	California	120	San Miguel Island	0	04-120-	\N	\N	\N
9284	04	California	122	San Nicolas Island	0	04-122-	\N	\N	\N
9285	04	California	124	Santa Barbara Island	0	04-124-	\N	\N	\N
9286	04	California	126	Santa Catalina Island	0	04-126-	\N	\N	\N
9287	04	California	128	Santa Cruz Island	0	04-128-	\N	\N	\N
9288	04	California	130	Santa Rosa Island	0	04-130-	\N	\N	\N
9289	04	California	201	Alameda Offshore	0	04-201-	\N	\N	\N
9290	04	California	211	Ventura Offshore	0	04-211-	\N	\N	\N
9291	04	California	213	Contra Costa Offshore	0	04-213-	\N	\N	\N
9292	04	California	215	Del Norte Offshore	0	04-215-	\N	\N	\N
9293	04	California	216	Anacapa Island Offshore	0	04-216-	\N	\N	\N
9294	04	California	218	San Clemente Island Offshore	0	04-218-	\N	\N	\N
9295	04	California	220	San Miguel Island Offshore	0	04-220-	\N	\N	\N
9296	04	California	222	San Nicolas Island Offshore	0	04-222-	\N	\N	\N
9297	04	California	223	Humboldt Island Offshore	0	04-223-	\N	\N	\N
9298	04	California	224	Santa Barbara Island Offshore	0	04-224-	\N	\N	\N
9299	04	California	226	Santa Catalina Island Offshore	0	04-226-	\N	\N	\N
9300	04	California	228	Santa Cruz Island Offshore	0	04-228-	\N	\N	\N
9301	04	California	230	Santa Rosa Island Offshore	0	04-230-	\N	\N	\N
9302	04	California	237	Los Angeles Offshore	0	04-237-	\N	\N	\N
9303	04	California	241	Marin Offshore	0	04-241-	\N	\N	\N
9304	04	California	245	Mendocino Offshore	0	04-245-	\N	\N	\N
9305	04	California	253	Monterey Offshore	0	04-253-	\N	\N	\N
9306	04	California	255	Napa Offshore	0	04-255-	\N	\N	\N
9307	04	California	259	Orange Offshore	0	04-259-	\N	\N	\N
9308	04	California	273	San Diego Offshore	0	04-273-	\N	\N	\N
9309	04	California	275	San Francisco Offshore	0	04-275-	\N	\N	\N
9310	04	California	279	San Luis Obispo Offshore	0	04-279-	\N	\N	\N
9311	04	California	281	San Mateo Offshore	0	04-281-	\N	\N	\N
9312	04	California	283	Santa Barbara Offshore	0	04-283-	\N	\N	\N
9313	04	California	287	Santa Cruz Offshore	0	04-287-	\N	\N	\N
9314	04	California	295	Solano Offshore	0	04-295-	\N	\N	\N
9315	04	California	297	Sonoma Offshore	0	04-297-	\N	\N	\N
9316	04	California	305	Eureka Zone 1	0	04-305-	\N	\N	\N
9317	04	California	307	Point Arena Zone2	0	04-307-	\N	\N	\N
9318	04	California	308	San Francisco Zone3	0	04-308-	\N	\N	\N
9319	04	California	309	Carmel Zone 4	0	04-309-	\N	\N	\N
9320	04	California	310	Morro Bay	0	04-310-	\N	\N	\N
9321	04	California	311	Santa Cruz Area	0	04-311-	\N	\N	\N
9322	04	California	312	Santa Catalina Area	0	04-312-	\N	\N	\N
9323	04	California	313	San Nicolas Area	0	04-313-	\N	\N	\N
9324	05	Colorado	001	Adams	1	05-001-	\N	\N	\N
9325	05	Colorado	003	Alamosa	1	05-003-	\N	\N	\N
9326	05	Colorado	005	Arapahoe	1	05-005-	\N	\N	\N
9327	05	Colorado	007	Archuleta	1	05-007-	\N	\N	\N
9328	05	Colorado	009	Baca	1	05-009-	\N	\N	\N
9329	05	Colorado	011	Bent	1	05-011-	\N	\N	\N
9330	05	Colorado	013	Boulder	1	05-013-	\N	\N	\N
9331	05	Colorado	014	Broomfield	1	05-014-	\N	\N	\N
9332	05	Colorado	015	Chaffee	1	05-015-	\N	\N	\N
9333	05	Colorado	017	Cheyenne	1	05-017-	\N	\N	\N
9334	05	Colorado	019	Clear Creek	1	05-019-	\N	\N	\N
9335	05	Colorado	021	Conejos	1	05-021-	\N	\N	\N
9336	05	Colorado	023	Costilla	1	05-023-	\N	\N	\N
9337	05	Colorado	025	Crowley	1	05-025-	\N	\N	\N
9338	05	Colorado	027	Custer	1	05-027-	\N	\N	\N
9339	05	Colorado	029	Delta	1	05-029-	\N	\N	\N
9340	05	Colorado	031	Denver	1	05-031-	\N	\N	\N
9341	05	Colorado	033	Dolores	1	05-033-	\N	\N	\N
9342	05	Colorado	035	Douglas	1	05-035-	\N	\N	\N
9343	05	Colorado	037	Eagle	1	05-037-	\N	\N	\N
9344	05	Colorado	039	Elbert	1	05-039-	\N	\N	\N
9345	05	Colorado	041	El Paso	1	05-041-	\N	\N	\N
9346	05	Colorado	043	Fremont	1	05-043-	\N	\N	\N
9347	05	Colorado	045	Garfield	1	05-045-	\N	\N	\N
9348	05	Colorado	047	Gilpin	1	05-047-	\N	\N	\N
9349	05	Colorado	049	Grand	1	05-049-	\N	\N	\N
9350	05	Colorado	051	Gunnison	1	05-051-	\N	\N	\N
9351	05	Colorado	053	Hinsdale	1	05-053-	\N	\N	\N
9352	05	Colorado	055	Huerfano	1	05-055-	\N	\N	\N
9353	05	Colorado	057	Jackson	1	05-057-	\N	\N	\N
9354	05	Colorado	059	Jefferson	1	05-059-	\N	\N	\N
9355	05	Colorado	061	Kiowa	1	05-061-	\N	\N	\N
9356	05	Colorado	063	Kit Carson	1	05-063-	\N	\N	\N
9357	05	Colorado	065	Lake	1	05-065-	\N	\N	\N
9358	05	Colorado	067	La Plata	1	05-067-	\N	\N	\N
9359	05	Colorado	069	Larimer	1	05-069-	\N	\N	\N
9360	05	Colorado	071	Las Animas	1	05-071-	\N	\N	\N
9361	05	Colorado	073	Lincoln	1	05-073-	\N	\N	\N
9362	05	Colorado	075	Logan	1	05-075-	\N	\N	\N
9363	05	Colorado	077	Mesa	1	05-077-	\N	\N	\N
9364	05	Colorado	079	Mineral	1	05-079-	\N	\N	\N
9365	05	Colorado	081	Moffat	1	05-081-	\N	\N	\N
9366	05	Colorado	083	Montezuma	1	05-083-	\N	\N	\N
9367	05	Colorado	085	Montrose	1	05-085-	\N	\N	\N
9368	05	Colorado	087	Morgan	1	05-087-	\N	\N	\N
9369	05	Colorado	089	Otero	1	05-089-	\N	\N	\N
9370	05	Colorado	091	Ouray	1	05-091-	\N	\N	\N
9371	05	Colorado	093	Park	1	05-093-	\N	\N	\N
9372	05	Colorado	095	Phillips	1	05-095-	\N	\N	\N
9373	05	Colorado	097	Pitkin	1	05-097-	\N	\N	\N
9374	05	Colorado	099	Prowers	1	05-099-	\N	\N	\N
9375	05	Colorado	101	Pueblo	1	05-101-	\N	\N	\N
9376	05	Colorado	103	Rio Blanco	1	05-103-	\N	\N	\N
9377	05	Colorado	105	Rio Grande	1	05-105-	\N	\N	\N
9378	05	Colorado	107	Routt	1	05-107-	\N	\N	\N
9379	05	Colorado	109	Saguache	1	05-109-	\N	\N	\N
9380	05	Colorado	111	San Juan	1	05-111-	\N	\N	\N
9381	05	Colorado	113	San Miguel	1	05-113-	\N	\N	\N
9382	05	Colorado	115	Sedgwick	1	05-115-	\N	\N	\N
9383	05	Colorado	117	Summit	1	05-117-	\N	\N	\N
9384	05	Colorado	119	Teller	1	05-119-	\N	\N	\N
9385	05	Colorado	121	Washington	1	05-121-	\N	\N	\N
9386	05	Colorado	123	Weld	1	05-123-	\N	\N	\N
9387	05	Colorado	125	Yuma	1	05-125-	\N	\N	\N
9388	06	Connecticut	001	Fairfield	0	06-001-	\N	\N	\N
9389	06	Connecticut	003	Hartford	0	06-003-	\N	\N	\N
9390	06	Connecticut	005	Litchfield	0	06-005-	\N	\N	\N
9391	06	Connecticut	007	Middlesex	0	06-007-	\N	\N	\N
9392	06	Connecticut	009	New Haven	0	06-009-	\N	\N	\N
9393	06	Connecticut	011	New London	0	06-011-	\N	\N	\N
9394	06	Connecticut	013	Tolland	0	06-013-	\N	\N	\N
9395	06	Connecticut	015	Windham	0	06-015-	\N	\N	\N
9396	06	Connecticut	201	Fairfield Offshore	0	06-201-	\N	\N	\N
9397	06	Connecticut	207	Middlesex Offshore	0	06-207-	\N	\N	\N
9398	06	Connecticut	209	New Haven Offshore	0	06-209-	\N	\N	\N
9399	06	Connecticut	211	New London Offshore	0	06-211-	\N	\N	\N
9400	07	Delaware	001	Kent	0	07-001-	\N	\N	\N
9401	07	Delaware	003	New Castle	0	07-003-	\N	\N	\N
9402	07	Delaware	005	Sussex	0	07-005-	\N	\N	\N
9403	07	Delaware	119	Salisbury	0	07-119-	\N	\N	\N
9404	07	Delaware	126	Wilmington Canyon	0	07-126-	\N	\N	\N
9405	07	Delaware	205	Sussex Offshore	0	07-205-	\N	\N	\N
9406	08	District of Columbia	001	District Of Columbia	0	08-001-	\N	\N	\N
9407	09	Florida	001	Alachua	0	09-001-	\N	\N	\N
9408	09	Florida	002	Bahamas	0	09-002-	\N	\N	\N
9409	09	Florida	003	Baker	0	09-003-	\N	\N	\N
9410	09	Florida	005	Bay	0	09-005-	\N	\N	\N
9411	09	Florida	007	Bradford	0	09-007-	\N	\N	\N
9412	09	Florida	009	Brevard	0	09-009-	\N	\N	\N
9413	09	Florida	011	Broward	0	09-011-	\N	\N	\N
9414	09	Florida	013	Calhoun	0	09-013-	\N	\N	\N
9415	09	Florida	015	Charlotte	0	09-015-	\N	\N	\N
9416	09	Florida	017	Citrus	0	09-017-	\N	\N	\N
9417	09	Florida	019	Clay	0	09-019-	\N	\N	\N
9418	09	Florida	021	Collier	0	09-021-	\N	\N	\N
9419	09	Florida	023	Columbia	0	09-023-	\N	\N	\N
9420	09	Florida	025	Dade	0	09-025-	\N	\N	\N
9421	09	Florida	027	De Soto	0	09-027-	\N	\N	\N
9422	09	Florida	029	Dixie	0	09-029-	\N	\N	\N
9423	09	Florida	031	Duval	0	09-031-	\N	\N	\N
9424	09	Florida	033	Escambia	0	09-033-	\N	\N	\N
9425	09	Florida	035	Flagler	0	09-035-	\N	\N	\N
9426	09	Florida	037	Franklin	0	09-037-	\N	\N	\N
9427	09	Florida	038	Ft Pierce	0	09-038-	\N	\N	\N
9428	09	Florida	039	Gadsden	0	09-039-	\N	\N	\N
9429	09	Florida	041	Gilchrist	0	09-041-	\N	\N	\N
9430	09	Florida	043	Glades	0	09-043-	\N	\N	\N
9431	09	Florida	045	Gulf	0	09-045-	\N	\N	\N
9432	09	Florida	047	Hamilton	0	09-047-	\N	\N	\N
9433	09	Florida	049	Hardee	0	09-049-	\N	\N	\N
9434	09	Florida	051	Hendry	0	09-051-	\N	\N	\N
9435	09	Florida	053	Hernando	0	09-053-	\N	\N	\N
9436	09	Florida	055	Highlands	0	09-055-	\N	\N	\N
9437	09	Florida	057	Hillsborough	0	09-057-	\N	\N	\N
9438	09	Florida	059	Holmes	0	09-059-	\N	\N	\N
9439	09	Florida	061	Indian River	0	09-061-	\N	\N	\N
9440	09	Florida	063	Jackson	0	09-063-	\N	\N	\N
9441	09	Florida	065	Jefferson	0	09-065-	\N	\N	\N
9442	09	Florida	067	Lafayette	0	09-067-	\N	\N	\N
9443	09	Florida	069	Lake	0	09-069-	\N	\N	\N
9444	09	Florida	071	Lee	0	09-071-	\N	\N	\N
9445	09	Florida	073	Leon	0	09-073-	\N	\N	\N
9446	09	Florida	075	Levy	0	09-075-	\N	\N	\N
9447	09	Florida	077	Liberty	0	09-077-	\N	\N	\N
9448	09	Florida	079	Madison	0	09-079-	\N	\N	\N
9449	09	Florida	081	Manatee	0	09-081-	\N	\N	\N
9450	09	Florida	083	Marion	0	09-083-	\N	\N	\N
9451	09	Florida	085	Martin	0	09-085-	\N	\N	\N
9452	09	Florida	087	Monroe	0	09-087-	\N	\N	\N
9453	09	Florida	089	Nassau	0	09-089-	\N	\N	\N
9454	09	Florida	091	Okaloosa	0	09-091-	\N	\N	\N
9455	09	Florida	093	Okeechobee	0	09-093-	\N	\N	\N
9456	09	Florida	095	Orange	0	09-095-	\N	\N	\N
9457	09	Florida	097	Osceola	0	09-097-	\N	\N	\N
9458	09	Florida	099	Palm Beach	0	09-099-	\N	\N	\N
9459	09	Florida	101	Pasco	0	09-101-	\N	\N	\N
9460	09	Florida	103	Pinellas	0	09-103-	\N	\N	\N
9461	09	Florida	105	Polk	0	09-105-	\N	\N	\N
9462	09	Florida	107	Putnam	0	09-107-	\N	\N	\N
9463	09	Florida	109	St Johns	0	09-109-	\N	\N	\N
9464	09	Florida	111	St Lucie	0	09-111-	\N	\N	\N
9465	09	Florida	113	Santa Rosa	0	09-113-	\N	\N	\N
9466	09	Florida	115	Sarasota	0	09-115-	\N	\N	\N
9467	09	Florida	117	Seminole	0	09-117-	\N	\N	\N
9468	09	Florida	119	Sumter	0	09-119-	\N	\N	\N
9469	09	Florida	121	Suwannee	0	09-121-	\N	\N	\N
9470	09	Florida	123	Taylor	0	09-123-	\N	\N	\N
9471	09	Florida	125	Union	0	09-125-	\N	\N	\N
9472	09	Florida	127	Volusia	0	09-127-	\N	\N	\N
9473	09	Florida	129	Wakulla	0	09-129-	\N	\N	\N
9474	09	Florida	131	Walton	0	09-131-	\N	\N	\N
9475	09	Florida	133	Washington	0	09-133-	\N	\N	\N
9476	09	Florida	205	Bay Offshore	0	09-205-	\N	\N	\N
9477	09	Florida	209	Brevard Offshore	0	09-209-	\N	\N	\N
9478	09	Florida	211	Broward Offshore	0	09-211-	\N	\N	\N
9479	09	Florida	215	Charlotte Offshore	0	09-215-	\N	\N	\N
9480	09	Florida	217	Citrus Offshore	0	09-217-	\N	\N	\N
9481	09	Florida	221	Collier Offshore	0	09-221-	\N	\N	\N
9482	09	Florida	225	Dade Offshore	0	09-225-	\N	\N	\N
9483	09	Florida	229	Dixie Offshore	0	09-229-	\N	\N	\N
9484	09	Florida	231	Duval Offshore	0	09-231-	\N	\N	\N
9485	09	Florida	233	Escambia Offshore	0	09-233-	\N	\N	\N
9486	09	Florida	235	Flagler Offshore	0	09-235-	\N	\N	\N
9487	09	Florida	237	Franklin Offshore	0	09-237-	\N	\N	\N
9488	09	Florida	245	Gulf Offshore	0	09-245-	\N	\N	\N
9489	09	Florida	253	Hernando Offshore	0	09-253-	\N	\N	\N
9490	09	Florida	257	Hillsborough Offshore	0	09-257-	\N	\N	\N
9491	09	Florida	261	Indian River Offshore	0	09-261-	\N	\N	\N
9492	09	Florida	265	Jefferson Offshore	0	09-265-	\N	\N	\N
9493	09	Florida	271	Lee Offshore	0	09-271-	\N	\N	\N
9494	09	Florida	275	Levy Offshore	0	09-275-	\N	\N	\N
9495	09	Florida	281	Manatee Offshore	0	09-281-	\N	\N	\N
9496	09	Florida	285	Martin Offshore	0	09-285-	\N	\N	\N
9497	09	Florida	287	Monroe Offshore	0	09-287-	\N	\N	\N
9498	09	Florida	289	Nassau Offshore	0	09-289-	\N	\N	\N
9499	09	Florida	291	Okaloosa Offshore	0	09-291-	\N	\N	\N
9500	09	Florida	299	Palm Beach Offshore	0	09-299-	\N	\N	\N
9501	09	Florida	301	Pasco Offshore	0	09-301-	\N	\N	\N
9502	09	Florida	303	Pinellas Offshore	0	09-303-	\N	\N	\N
9503	09	Florida	309	St Johns Offshore	0	09-309-	\N	\N	\N
9504	09	Florida	311	St Lucie Offshore	0	09-311-	\N	\N	\N
9505	09	Florida	313	Santa Rosa Offshore	0	09-313-	\N	\N	\N
9506	09	Florida	315	Sarasota Offshore	0	09-315-	\N	\N	\N
9507	09	Florida	322	Orlando	0	09-322-	\N	\N	\N
9508	09	Florida	323	Taylor Offshore	0	09-323-	\N	\N	\N
9509	09	Florida	324	Walker Cay	0	09-324-	\N	\N	\N
9510	09	Florida	327	Volusia Offshore	0	09-327-	\N	\N	\N
9511	09	Florida	329	Wakulla Offshore	0	09-329-	\N	\N	\N
9512	09	Florida	330	Bimini	0	09-330-	\N	\N	\N
9513	09	Florida	331	Walton Offshore	0	09-331-	\N	\N	\N
9514	09	Florida	336	Daytona Beach	0	09-336-	\N	\N	\N
9515	09	Florida	341	Jacksonville	0	09-341-	\N	\N	\N
9516	09	Florida	344	Stetson Mesa	0	09-344-	\N	\N	\N
9517	09	Florida	346	Marquesas	0	09-346-	\N	\N	\N
9518	10	Georgia	001	Appling	0	10-001-	\N	\N	\N
9519	10	Georgia	003	Atkinson	0	10-003-	\N	\N	\N
9520	10	Georgia	005	Bacon	0	10-005-	\N	\N	\N
9521	10	Georgia	007	Baker	0	10-007-	\N	\N	\N
9522	10	Georgia	009	Baldwin	0	10-009-	\N	\N	\N
9523	10	Georgia	011	Banks	0	10-011-	\N	\N	\N
9524	10	Georgia	013	Barrow	0	10-013-	\N	\N	\N
9525	10	Georgia	015	Bartow	0	10-015-	\N	\N	\N
9526	10	Georgia	017	Ben Hill	0	10-017-	\N	\N	\N
9527	10	Georgia	019	Berrien	0	10-019-	\N	\N	\N
9528	10	Georgia	021	Bibb	0	10-021-	\N	\N	\N
9529	10	Georgia	023	Bleckley	0	10-023-	\N	\N	\N
9530	10	Georgia	025	Brantley	0	10-025-	\N	\N	\N
9531	10	Georgia	027	Brooks	0	10-027-	\N	\N	\N
9532	10	Georgia	028	Brunswick	0	10-028-	\N	\N	\N
9533	10	Georgia	029	Bryan	0	10-029-	\N	\N	\N
9534	10	Georgia	031	Bulloch	0	10-031-	\N	\N	\N
9535	10	Georgia	033	Burke	0	10-033-	\N	\N	\N
9536	10	Georgia	035	Butts	0	10-035-	\N	\N	\N
9537	10	Georgia	037	Calhoun	0	10-037-	\N	\N	\N
9538	10	Georgia	039	Camden	0	10-039-	\N	\N	\N
9539	10	Georgia	043	Candler	0	10-043-	\N	\N	\N
9540	10	Georgia	045	Carroll	0	10-045-	\N	\N	\N
9541	10	Georgia	047	Catoosa	0	10-047-	\N	\N	\N
9542	10	Georgia	049	Charlton	0	10-049-	\N	\N	\N
9543	10	Georgia	051	Chatham	0	10-051-	\N	\N	\N
9544	10	Georgia	053	Chattahoochee	0	10-053-	\N	\N	\N
9545	10	Georgia	055	Chattooga	0	10-055-	\N	\N	\N
9546	10	Georgia	057	Cherokee	0	10-057-	\N	\N	\N
9547	10	Georgia	059	Clarke	0	10-059-	\N	\N	\N
9548	10	Georgia	061	Clay	0	10-061-	\N	\N	\N
9549	10	Georgia	063	Clayton	0	10-063-	\N	\N	\N
9550	10	Georgia	065	Clinch	0	10-065-	\N	\N	\N
9551	10	Georgia	067	Cobb	0	10-067-	\N	\N	\N
9552	10	Georgia	069	Coffee	0	10-069-	\N	\N	\N
9553	10	Georgia	071	Colquitt	0	10-071-	\N	\N	\N
9554	10	Georgia	073	Columbia	0	10-073-	\N	\N	\N
9555	10	Georgia	075	Cook	0	10-075-	\N	\N	\N
9556	10	Georgia	077	Coweta	0	10-077-	\N	\N	\N
9557	10	Georgia	079	Crawford	0	10-079-	\N	\N	\N
9558	10	Georgia	081	Crisp	0	10-081-	\N	\N	\N
9559	10	Georgia	083	Dade	0	10-083-	\N	\N	\N
9560	10	Georgia	085	Dawson	0	10-085-	\N	\N	\N
9561	10	Georgia	087	Decatur	0	10-087-	\N	\N	\N
9562	10	Georgia	089	De Kalb	0	10-089-	\N	\N	\N
9563	10	Georgia	091	Dodge	0	10-091-	\N	\N	\N
9564	10	Georgia	093	Dooly	0	10-093-	\N	\N	\N
9565	10	Georgia	095	Dougherty	0	10-095-	\N	\N	\N
9566	10	Georgia	097	Douglas	0	10-097-	\N	\N	\N
9567	10	Georgia	099	Early	0	10-099-	\N	\N	\N
9568	10	Georgia	101	Echols	0	10-101-	\N	\N	\N
9569	10	Georgia	102	Savannah	0	10-102-	\N	\N	\N
9570	10	Georgia	103	Effingham	0	10-103-	\N	\N	\N
9571	10	Georgia	105	Elbert	0	10-105-	\N	\N	\N
9572	10	Georgia	107	Emanuel	0	10-107-	\N	\N	\N
9573	10	Georgia	109	Evans	0	10-109-	\N	\N	\N
9574	10	Georgia	111	Fannin	0	10-111-	\N	\N	\N
9575	10	Georgia	113	Fayette	0	10-113-	\N	\N	\N
9576	10	Georgia	115	Floyd	0	10-115-	\N	\N	\N
9577	10	Georgia	117	Forsyth	0	10-117-	\N	\N	\N
9578	10	Georgia	119	Franklin	0	10-119-	\N	\N	\N
9579	10	Georgia	121	Fulton	0	10-121-	\N	\N	\N
9580	10	Georgia	123	Gilmer	0	10-123-	\N	\N	\N
9581	10	Georgia	125	Glascock	0	10-125-	\N	\N	\N
9582	10	Georgia	127	Glynn	0	10-127-	\N	\N	\N
9583	10	Georgia	129	Gordon	0	10-129-	\N	\N	\N
9584	10	Georgia	131	Grady	0	10-131-	\N	\N	\N
9585	10	Georgia	133	Greene	0	10-133-	\N	\N	\N
9586	10	Georgia	135	Gwinnett	0	10-135-	\N	\N	\N
9587	10	Georgia	137	Habersham	0	10-137-	\N	\N	\N
9588	10	Georgia	139	Hall	0	10-139-	\N	\N	\N
9589	10	Georgia	141	Hancock	0	10-141-	\N	\N	\N
9590	10	Georgia	143	Haralson	0	10-143-	\N	\N	\N
9591	10	Georgia	145	Harris	0	10-145-	\N	\N	\N
9592	10	Georgia	147	Hart	0	10-147-	\N	\N	\N
9593	10	Georgia	149	Heard	0	10-149-	\N	\N	\N
9594	10	Georgia	151	Henry	0	10-151-	\N	\N	\N
9595	10	Georgia	153	Houston	0	10-153-	\N	\N	\N
9596	10	Georgia	155	Irwin	0	10-155-	\N	\N	\N
9597	10	Georgia	157	Jackson	0	10-157-	\N	\N	\N
9598	10	Georgia	159	Jasper	0	10-159-	\N	\N	\N
9599	10	Georgia	161	Jeff Davis	0	10-161-	\N	\N	\N
9600	10	Georgia	163	Jefferson	0	10-163-	\N	\N	\N
9601	10	Georgia	165	Jenkins	0	10-165-	\N	\N	\N
9602	10	Georgia	167	Johnson	0	10-167-	\N	\N	\N
9603	10	Georgia	169	Jones	0	10-169-	\N	\N	\N
9604	10	Georgia	171	Lamar	0	10-171-	\N	\N	\N
9605	10	Georgia	173	Lanier	0	10-173-	\N	\N	\N
9606	10	Georgia	175	Laurens	0	10-175-	\N	\N	\N
9607	10	Georgia	177	Lee	0	10-177-	\N	\N	\N
9608	10	Georgia	179	Liberty	0	10-179-	\N	\N	\N
9609	10	Georgia	181	Lincoln	0	10-181-	\N	\N	\N
9610	10	Georgia	183	Long	0	10-183-	\N	\N	\N
9611	10	Georgia	185	Lowndes	0	10-185-	\N	\N	\N
9612	10	Georgia	187	Lumpkin	0	10-187-	\N	\N	\N
9613	10	Georgia	189	Mc Duffie	0	10-189-	\N	\N	\N
9614	10	Georgia	191	Mc Intosh	0	10-191-	\N	\N	\N
9615	10	Georgia	193	Macon	0	10-193-	\N	\N	\N
9616	10	Georgia	195	Madison	0	10-195-	\N	\N	\N
9617	10	Georgia	197	Marion	0	10-197-	\N	\N	\N
9618	10	Georgia	199	Meriwether	0	10-199-	\N	\N	\N
9619	10	Georgia	201	Miller	0	10-201-	\N	\N	\N
9620	10	Georgia	205	Mitchell	0	10-205-	\N	\N	\N
9621	10	Georgia	207	Monroe	0	10-207-	\N	\N	\N
9622	10	Georgia	209	Montgomery	0	10-209-	\N	\N	\N
9623	10	Georgia	211	Morgan	0	10-211-	\N	\N	\N
9624	10	Georgia	213	Murray	0	10-213-	\N	\N	\N
9625	10	Georgia	215	Muscogee	0	10-215-	\N	\N	\N
9626	10	Georgia	217	Newton	0	10-217-	\N	\N	\N
9627	10	Georgia	219	Oconee	0	10-219-	\N	\N	\N
9628	10	Georgia	221	Oglethorpe	0	10-221-	\N	\N	\N
9629	10	Georgia	223	Paulding	0	10-223-	\N	\N	\N
9630	10	Georgia	225	Peach	0	10-225-	\N	\N	\N
9631	10	Georgia	227	Pickens	0	10-227-	\N	\N	\N
9632	10	Georgia	229	Pierce	0	10-229-	\N	\N	\N
9633	10	Georgia	231	Pike	0	10-231-	\N	\N	\N
9634	10	Georgia	233	Polk	0	10-233-	\N	\N	\N
9635	10	Georgia	235	Pulaski	0	10-235-	\N	\N	\N
9636	10	Georgia	237	Putnam	0	10-237-	\N	\N	\N
9637	10	Georgia	239	Quitman	0	10-239-	\N	\N	\N
9638	10	Georgia	241	Rabun	0	10-241-	\N	\N	\N
9639	10	Georgia	243	Randolph	0	10-243-	\N	\N	\N
9640	10	Georgia	245	Richmond	0	10-245-	\N	\N	\N
9641	10	Georgia	247	Rockdale	0	10-247-	\N	\N	\N
9642	10	Georgia	249	Schley	0	10-249-	\N	\N	\N
9643	10	Georgia	251	Screven	0	10-251-	\N	\N	\N
9644	10	Georgia	253	Seminole	0	10-253-	\N	\N	\N
9645	10	Georgia	255	Spalding	0	10-255-	\N	\N	\N
9646	10	Georgia	257	Stephens	0	10-257-	\N	\N	\N
9647	10	Georgia	259	Stewart	0	10-259-	\N	\N	\N
9648	10	Georgia	261	Sumter	0	10-261-	\N	\N	\N
9649	10	Georgia	263	Talbot	0	10-263-	\N	\N	\N
9650	10	Georgia	265	Taliaferro	0	10-265-	\N	\N	\N
9651	10	Georgia	267	Tattnall	0	10-267-	\N	\N	\N
9652	10	Georgia	269	Taylor	0	10-269-	\N	\N	\N
9653	10	Georgia	271	Telfair	0	10-271-	\N	\N	\N
9654	10	Georgia	273	Terrell	0	10-273-	\N	\N	\N
9655	10	Georgia	275	Thomas	0	10-275-	\N	\N	\N
9656	10	Georgia	277	Tift	0	10-277-	\N	\N	\N
9657	10	Georgia	279	Toombs	0	10-279-	\N	\N	\N
9658	10	Georgia	281	Towns	0	10-281-	\N	\N	\N
9659	10	Georgia	283	Treutlen	0	10-283-	\N	\N	\N
9660	10	Georgia	285	Troup	0	10-285-	\N	\N	\N
9661	10	Georgia	287	Turner	0	10-287-	\N	\N	\N
9662	10	Georgia	289	Twiggs	0	10-289-	\N	\N	\N
9663	10	Georgia	291	Union	0	10-291-	\N	\N	\N
9664	10	Georgia	293	Upson	0	10-293-	\N	\N	\N
9665	10	Georgia	295	Walker	0	10-295-	\N	\N	\N
9666	10	Georgia	297	Walton	0	10-297-	\N	\N	\N
9667	10	Georgia	299	Ware	0	10-299-	\N	\N	\N
9668	10	Georgia	301	Warren	0	10-301-	\N	\N	\N
9669	10	Georgia	303	Washington	0	10-303-	\N	\N	\N
9670	10	Georgia	305	Wayne	0	10-305-	\N	\N	\N
9671	10	Georgia	307	Webster	0	10-307-	\N	\N	\N
9672	10	Georgia	309	Wheeler	0	10-309-	\N	\N	\N
9673	10	Georgia	311	White	0	10-311-	\N	\N	\N
9674	10	Georgia	313	Whitfield	0	10-313-	\N	\N	\N
9675	10	Georgia	315	Wilcox	0	10-315-	\N	\N	\N
9676	10	Georgia	317	Wilkes	0	10-317-	\N	\N	\N
9677	10	Georgia	319	Wilkinson	0	10-319-	\N	\N	\N
9678	10	Georgia	321	Worth	0	10-321-	\N	\N	\N
9679	10	Georgia	329	Bryan Offshore	0	10-329-	\N	\N	\N
9680	10	Georgia	339	Camden Offshore	0	10-339-	\N	\N	\N
9681	10	Georgia	351	Chatham Offshore	0	10-351-	\N	\N	\N
9682	10	Georgia	427	Glynn Offshore	0	10-427-	\N	\N	\N
9683	10	Georgia	479	Liberty Offshore	0	10-479-	\N	\N	\N
9684	10	Georgia	491	Mc Intosh Offshore	0	10-491-	\N	\N	\N
9685	11	Idaho	001	Ada	0	11-001-	\N	\N	\N
9686	11	Idaho	003	Adams	0	11-003-	\N	\N	\N
9687	11	Idaho	005	Bannock	0	11-005-	\N	\N	\N
9688	11	Idaho	007	Bear Lake	0	11-007-	\N	\N	\N
9689	11	Idaho	009	Benewah	0	11-009-	\N	\N	\N
9690	11	Idaho	011	Bingham	0	11-011-	\N	\N	\N
9691	11	Idaho	013	Blaine	0	11-013-	\N	\N	\N
9692	11	Idaho	015	Boise	0	11-015-	\N	\N	\N
9693	11	Idaho	017	Bonner	0	11-017-	\N	\N	\N
9694	11	Idaho	019	Bonneville	0	11-019-	\N	\N	\N
9695	11	Idaho	021	Boundary	0	11-021-	\N	\N	\N
9696	11	Idaho	023	Butte	0	11-023-	\N	\N	\N
9697	11	Idaho	025	Camas	0	11-025-	\N	\N	\N
9698	11	Idaho	027	Canyon	0	11-027-	\N	\N	\N
9699	11	Idaho	029	Caribou	0	11-029-	\N	\N	\N
9700	11	Idaho	031	Cassia	0	11-031-	\N	\N	\N
9701	11	Idaho	033	Clark	0	11-033-	\N	\N	\N
9702	11	Idaho	035	Clearwater	0	11-035-	\N	\N	\N
9703	11	Idaho	037	Custer	0	11-037-	\N	\N	\N
9704	11	Idaho	039	Elmore	0	11-039-	\N	\N	\N
9705	11	Idaho	041	Franklin	0	11-041-	\N	\N	\N
9706	11	Idaho	043	Fremont	0	11-043-	\N	\N	\N
9707	11	Idaho	045	Gem	0	11-045-	\N	\N	\N
9708	11	Idaho	047	Gooding	0	11-047-	\N	\N	\N
9709	11	Idaho	049	Idaho	0	11-049-	\N	\N	\N
9710	11	Idaho	051	Jefferson	0	11-051-	\N	\N	\N
9711	11	Idaho	053	Jerome	0	11-053-	\N	\N	\N
9712	11	Idaho	055	Kootenai	0	11-055-	\N	\N	\N
9713	11	Idaho	057	Latah	0	11-057-	\N	\N	\N
9714	11	Idaho	059	Lemhi	0	11-059-	\N	\N	\N
9715	11	Idaho	061	Lewis	0	11-061-	\N	\N	\N
9716	11	Idaho	063	Lincoln	0	11-063-	\N	\N	\N
9717	11	Idaho	065	Madison	0	11-065-	\N	\N	\N
9718	11	Idaho	067	Minidoka	0	11-067-	\N	\N	\N
9719	11	Idaho	069	Nez Perce	0	11-069-	\N	\N	\N
9720	11	Idaho	071	Oneida	0	11-071-	\N	\N	\N
9721	11	Idaho	073	Owyhee	0	11-073-	\N	\N	\N
9722	11	Idaho	075	Payette	0	11-075-	\N	\N	\N
9723	11	Idaho	077	Power	0	11-077-	\N	\N	\N
9724	11	Idaho	079	Shoshone	0	11-079-	\N	\N	\N
9725	11	Idaho	081	Teton	0	11-081-	\N	\N	\N
9726	11	Idaho	083	Twin Falls	0	11-083-	\N	\N	\N
9727	11	Idaho	085	Valley	0	11-085-	\N	\N	\N
9728	11	Idaho	087	Washington	0	11-087-	\N	\N	\N
9729	11	Idaho	089	Yellowstone National Park	0	11-089-	\N	\N	\N
9730	12	Illinois	001	Adams	0	12-001-	\N	\N	\N
9731	12	Illinois	003	Alexander	0	12-003-	\N	\N	\N
9732	12	Illinois	005	Bond	0	12-005-	\N	\N	\N
9733	12	Illinois	007	Boone	0	12-007-	\N	\N	\N
9734	12	Illinois	009	Brown	0	12-009-	\N	\N	\N
9735	12	Illinois	011	Bureau	0	12-011-	\N	\N	\N
9736	12	Illinois	013	Calhoun	0	12-013-	\N	\N	\N
9737	12	Illinois	015	Carroll	0	12-015-	\N	\N	\N
9738	12	Illinois	017	Cass	0	12-017-	\N	\N	\N
9739	12	Illinois	019	Champaign	0	12-019-	\N	\N	\N
9740	12	Illinois	021	Christian	0	12-021-	\N	\N	\N
9741	12	Illinois	023	Clark	0	12-023-	\N	\N	\N
9742	12	Illinois	025	Clay	0	12-025-	\N	\N	\N
9743	12	Illinois	027	Clinton	0	12-027-	\N	\N	\N
9744	12	Illinois	029	Coles	0	12-029-	\N	\N	\N
9745	12	Illinois	031	Cook	0	12-031-	\N	\N	\N
9746	12	Illinois	033	Crawford	0	12-033-	\N	\N	\N
9747	12	Illinois	035	Cumberland	0	12-035-	\N	\N	\N
9748	12	Illinois	037	De Kalb	0	12-037-	\N	\N	\N
9749	12	Illinois	039	De Witt	0	12-039-	\N	\N	\N
9750	12	Illinois	041	Douglas	0	12-041-	\N	\N	\N
9751	12	Illinois	043	Du Page	0	12-043-	\N	\N	\N
9752	12	Illinois	045	Edgar	0	12-045-	\N	\N	\N
9753	12	Illinois	047	Edwards	0	12-047-	\N	\N	\N
9754	12	Illinois	049	Effingham	0	12-049-	\N	\N	\N
9755	12	Illinois	051	Fayette	0	12-051-	\N	\N	\N
9756	12	Illinois	053	Ford	0	12-053-	\N	\N	\N
9757	12	Illinois	055	Franklin	0	12-055-	\N	\N	\N
9758	12	Illinois	057	Fulton	0	12-057-	\N	\N	\N
9759	12	Illinois	059	Gallatin	0	12-059-	\N	\N	\N
9760	12	Illinois	061	Greene	0	12-061-	\N	\N	\N
9761	12	Illinois	063	Grundy	0	12-063-	\N	\N	\N
9762	12	Illinois	065	Hamilton	0	12-065-	\N	\N	\N
9763	12	Illinois	067	Hancock	0	12-067-	\N	\N	\N
9764	12	Illinois	069	Hardin	0	12-069-	\N	\N	\N
9765	12	Illinois	071	Henderson	0	12-071-	\N	\N	\N
9766	12	Illinois	073	Henry	0	12-073-	\N	\N	\N
9767	12	Illinois	075	Iroquois	0	12-075-	\N	\N	\N
9768	12	Illinois	077	Jackson	0	12-077-	\N	\N	\N
9769	12	Illinois	079	Jasper	0	12-079-	\N	\N	\N
9770	12	Illinois	081	Jefferson	0	12-081-	\N	\N	\N
9771	12	Illinois	083	Jersey	0	12-083-	\N	\N	\N
9772	12	Illinois	085	Jo Daviess	0	12-085-	\N	\N	\N
9773	12	Illinois	087	Johnson	0	12-087-	\N	\N	\N
9774	12	Illinois	089	Kane	0	12-089-	\N	\N	\N
9775	12	Illinois	091	Kankakee	0	12-091-	\N	\N	\N
9776	12	Illinois	093	Kendall	0	12-093-	\N	\N	\N
9777	12	Illinois	095	Knox	0	12-095-	\N	\N	\N
9778	12	Illinois	097	Lake	0	12-097-	\N	\N	\N
9779	12	Illinois	099	La Salle	0	12-099-	\N	\N	\N
9780	12	Illinois	101	Lawrence	0	12-101-	\N	\N	\N
9781	12	Illinois	103	Lee	0	12-103-	\N	\N	\N
9782	12	Illinois	105	Livingston	0	12-105-	\N	\N	\N
9783	12	Illinois	107	Logan	0	12-107-	\N	\N	\N
9784	12	Illinois	109	Mc Donough	0	12-109-	\N	\N	\N
9785	12	Illinois	111	Mc Henry	0	12-111-	\N	\N	\N
9786	12	Illinois	113	Mc Lean	0	12-113-	\N	\N	\N
9787	12	Illinois	115	Macon	0	12-115-	\N	\N	\N
9788	12	Illinois	117	Macoupin	0	12-117-	\N	\N	\N
9789	12	Illinois	119	Madison	0	12-119-	\N	\N	\N
9790	12	Illinois	121	Marion	0	12-121-	\N	\N	\N
9791	12	Illinois	123	Marshall	0	12-123-	\N	\N	\N
9792	12	Illinois	125	Mason	0	12-125-	\N	\N	\N
9793	12	Illinois	127	Massac	0	12-127-	\N	\N	\N
9794	12	Illinois	129	Menard	0	12-129-	\N	\N	\N
9795	12	Illinois	131	Mercer	0	12-131-	\N	\N	\N
9796	12	Illinois	133	Monroe	0	12-133-	\N	\N	\N
9797	12	Illinois	135	Montgomery	0	12-135-	\N	\N	\N
9798	12	Illinois	137	Morgan	0	12-137-	\N	\N	\N
9799	12	Illinois	139	Moultrie	0	12-139-	\N	\N	\N
9800	12	Illinois	141	Ogle	0	12-141-	\N	\N	\N
9801	12	Illinois	143	Peoria	0	12-143-	\N	\N	\N
9802	12	Illinois	145	Perry	0	12-145-	\N	\N	\N
9803	12	Illinois	147	Piatt	0	12-147-	\N	\N	\N
9804	12	Illinois	149	Pike	0	12-149-	\N	\N	\N
9805	12	Illinois	151	Pope	0	12-151-	\N	\N	\N
9806	12	Illinois	153	Pulaski	0	12-153-	\N	\N	\N
9807	12	Illinois	155	Putnam	0	12-155-	\N	\N	\N
9808	12	Illinois	157	Randolph	0	12-157-	\N	\N	\N
9809	12	Illinois	159	Richland	0	12-159-	\N	\N	\N
9810	12	Illinois	161	Rock Island	0	12-161-	\N	\N	\N
9811	12	Illinois	163	St Clair	0	12-163-	\N	\N	\N
9812	12	Illinois	165	Saline	0	12-165-	\N	\N	\N
9813	12	Illinois	167	Sangamon	0	12-167-	\N	\N	\N
9814	12	Illinois	169	Schuyler	0	12-169-	\N	\N	\N
9815	12	Illinois	171	Scott	0	12-171-	\N	\N	\N
9816	12	Illinois	173	Shelby	0	12-173-	\N	\N	\N
9817	12	Illinois	175	Stark	0	12-175-	\N	\N	\N
9818	12	Illinois	177	Stephenson	0	12-177-	\N	\N	\N
9819	12	Illinois	179	Tazewell	0	12-179-	\N	\N	\N
9820	12	Illinois	181	Union	0	12-181-	\N	\N	\N
9821	12	Illinois	183	Vermilion	0	12-183-	\N	\N	\N
9822	12	Illinois	185	Wabash	0	12-185-	\N	\N	\N
9823	12	Illinois	187	Warren	0	12-187-	\N	\N	\N
9824	12	Illinois	189	Washington	0	12-189-	\N	\N	\N
9825	12	Illinois	191	Wayne	0	12-191-	\N	\N	\N
9826	12	Illinois	193	White	0	12-193-	\N	\N	\N
9827	12	Illinois	195	Whiteside	0	12-195-	\N	\N	\N
9828	12	Illinois	197	Will	0	12-197-	\N	\N	\N
9829	12	Illinois	199	Williamson	0	12-199-	\N	\N	\N
9830	12	Illinois	201	Winnebago	0	12-201-	\N	\N	\N
9831	12	Illinois	203	Woodford	0	12-203-	\N	\N	\N
9832	12	Illinois	512	Lake Michigan	0	12-512-	\N	\N	\N
9833	13	Indiana	001	Adams	0	13-001-	\N	\N	\N
9834	13	Indiana	003	Allen	0	13-003-	\N	\N	\N
9835	13	Indiana	005	Bartholomew	0	13-005-	\N	\N	\N
9836	13	Indiana	007	Benton	0	13-007-	\N	\N	\N
9837	13	Indiana	009	Blackford	0	13-009-	\N	\N	\N
9838	13	Indiana	011	Boone	0	13-011-	\N	\N	\N
9839	13	Indiana	013	Brown	0	13-013-	\N	\N	\N
9840	13	Indiana	015	Carroll	0	13-015-	\N	\N	\N
9841	13	Indiana	017	Cass	0	13-017-	\N	\N	\N
9842	13	Indiana	019	Clark	0	13-019-	\N	\N	\N
9843	13	Indiana	021	Clay	0	13-021-	\N	\N	\N
9844	13	Indiana	023	Clinton	0	13-023-	\N	\N	\N
9845	13	Indiana	025	Crawford	0	13-025-	\N	\N	\N
9846	13	Indiana	027	Daviess	0	13-027-	\N	\N	\N
9847	13	Indiana	029	Dearborn	0	13-029-	\N	\N	\N
9848	13	Indiana	031	Decatur	0	13-031-	\N	\N	\N
9849	13	Indiana	033	De Kalb	0	13-033-	\N	\N	\N
9850	13	Indiana	035	Delaware	0	13-035-	\N	\N	\N
9851	13	Indiana	037	Dubois	0	13-037-	\N	\N	\N
9852	13	Indiana	039	Elkhart	0	13-039-	\N	\N	\N
9853	13	Indiana	041	Fayette	0	13-041-	\N	\N	\N
9854	13	Indiana	043	Floyd	0	13-043-	\N	\N	\N
9855	13	Indiana	045	Fountain	0	13-045-	\N	\N	\N
9856	13	Indiana	047	Franklin	0	13-047-	\N	\N	\N
9857	13	Indiana	049	Fulton	0	13-049-	\N	\N	\N
9858	13	Indiana	051	Gibson	0	13-051-	\N	\N	\N
9859	13	Indiana	053	Grant	0	13-053-	\N	\N	\N
9860	13	Indiana	055	Greene	0	13-055-	\N	\N	\N
9861	13	Indiana	057	Hamilton	0	13-057-	\N	\N	\N
9862	13	Indiana	059	Hancock	0	13-059-	\N	\N	\N
9863	13	Indiana	061	Harrison	0	13-061-	\N	\N	\N
9864	13	Indiana	063	Hendricks	0	13-063-	\N	\N	\N
9865	13	Indiana	065	Henry	0	13-065-	\N	\N	\N
9866	13	Indiana	067	Howard	0	13-067-	\N	\N	\N
9867	13	Indiana	069	Huntington	0	13-069-	\N	\N	\N
9868	13	Indiana	071	Jackson	0	13-071-	\N	\N	\N
9869	13	Indiana	073	Jasper	0	13-073-	\N	\N	\N
9870	13	Indiana	075	Jay	0	13-075-	\N	\N	\N
9871	13	Indiana	077	Jefferson	0	13-077-	\N	\N	\N
9872	13	Indiana	079	Jennings	0	13-079-	\N	\N	\N
9873	13	Indiana	081	Johnson	0	13-081-	\N	\N	\N
9874	13	Indiana	083	Knox	0	13-083-	\N	\N	\N
9875	13	Indiana	085	Kosciusko	0	13-085-	\N	\N	\N
9876	13	Indiana	087	Lagrange	0	13-087-	\N	\N	\N
9877	13	Indiana	089	Lake	0	13-089-	\N	\N	\N
9878	13	Indiana	091	La Porte	0	13-091-	\N	\N	\N
9879	13	Indiana	093	Lawrence	0	13-093-	\N	\N	\N
9880	13	Indiana	095	Madison	0	13-095-	\N	\N	\N
9881	13	Indiana	097	Marion	0	13-097-	\N	\N	\N
9882	13	Indiana	099	Marshall	0	13-099-	\N	\N	\N
9883	13	Indiana	101	Martin	0	13-101-	\N	\N	\N
9884	13	Indiana	103	Miami	0	13-103-	\N	\N	\N
9885	13	Indiana	105	Monroe	0	13-105-	\N	\N	\N
9886	13	Indiana	107	Montgomery	0	13-107-	\N	\N	\N
9887	13	Indiana	109	Morgan	0	13-109-	\N	\N	\N
9888	13	Indiana	111	Newton	0	13-111-	\N	\N	\N
9889	13	Indiana	113	Noble	0	13-113-	\N	\N	\N
9890	13	Indiana	115	Ohio	0	13-115-	\N	\N	\N
9891	13	Indiana	117	Orange	0	13-117-	\N	\N	\N
9892	13	Indiana	119	Owen	0	13-119-	\N	\N	\N
9893	13	Indiana	121	Parke	0	13-121-	\N	\N	\N
9894	13	Indiana	123	Perry	0	13-123-	\N	\N	\N
9895	13	Indiana	125	Pike	0	13-125-	\N	\N	\N
9896	13	Indiana	127	Porter	0	13-127-	\N	\N	\N
9897	13	Indiana	129	Posey	0	13-129-	\N	\N	\N
9898	13	Indiana	131	Pulaski	0	13-131-	\N	\N	\N
9899	13	Indiana	133	Putnam	0	13-133-	\N	\N	\N
9900	13	Indiana	135	Randolph	0	13-135-	\N	\N	\N
9901	13	Indiana	137	Ripley	0	13-137-	\N	\N	\N
9902	13	Indiana	139	Rush	0	13-139-	\N	\N	\N
9903	13	Indiana	141	St Joseph	0	13-141-	\N	\N	\N
9904	13	Indiana	143	Scott	0	13-143-	\N	\N	\N
9905	13	Indiana	145	Shelby	0	13-145-	\N	\N	\N
9906	13	Indiana	147	Spencer	0	13-147-	\N	\N	\N
9907	13	Indiana	149	Starke	0	13-149-	\N	\N	\N
9908	13	Indiana	151	Steuben	0	13-151-	\N	\N	\N
9909	13	Indiana	153	Sullivan	0	13-153-	\N	\N	\N
9910	13	Indiana	155	Switzerland	0	13-155-	\N	\N	\N
9911	13	Indiana	157	Tippecanoe	0	13-157-	\N	\N	\N
9912	13	Indiana	159	Tipton	0	13-159-	\N	\N	\N
9913	13	Indiana	161	Union	0	13-161-	\N	\N	\N
9914	13	Indiana	163	Vanderburgh	0	13-163-	\N	\N	\N
9915	13	Indiana	165	Vermillion	0	13-165-	\N	\N	\N
9916	13	Indiana	167	Vigo	0	13-167-	\N	\N	\N
9917	13	Indiana	169	Wabash	0	13-169-	\N	\N	\N
9918	13	Indiana	171	Warren	0	13-171-	\N	\N	\N
9919	13	Indiana	173	Warrick	0	13-173-	\N	\N	\N
9920	13	Indiana	175	Washington	0	13-175-	\N	\N	\N
9921	13	Indiana	177	Wayne	0	13-177-	\N	\N	\N
9922	13	Indiana	179	Wells	0	13-179-	\N	\N	\N
9923	13	Indiana	181	White	0	13-181-	\N	\N	\N
9924	13	Indiana	183	Whitley	0	13-183-	\N	\N	\N
9925	13	Indiana	513	Lake Michigan	0	13-513-	\N	\N	\N
9926	14	Iowa	001	Adair	0	14-001-	\N	\N	\N
9927	14	Iowa	003	Adams	0	14-003-	\N	\N	\N
9928	14	Iowa	005	Allamakee	0	14-005-	\N	\N	\N
9929	14	Iowa	007	Appanoose	0	14-007-	\N	\N	\N
9930	14	Iowa	009	Audubon	0	14-009-	\N	\N	\N
9931	14	Iowa	011	Benton	0	14-011-	\N	\N	\N
9932	14	Iowa	013	Black Hawk	0	14-013-	\N	\N	\N
9933	14	Iowa	015	Boone	0	14-015-	\N	\N	\N
9934	14	Iowa	017	Bremer	0	14-017-	\N	\N	\N
9935	14	Iowa	019	Buchanan	0	14-019-	\N	\N	\N
9936	14	Iowa	021	Buena Vista	0	14-021-	\N	\N	\N
9937	14	Iowa	023	Butler	0	14-023-	\N	\N	\N
9938	14	Iowa	025	Calhoun	0	14-025-	\N	\N	\N
9939	14	Iowa	027	Carroll	0	14-027-	\N	\N	\N
9940	14	Iowa	029	Cass	0	14-029-	\N	\N	\N
9941	14	Iowa	031	Cedar	0	14-031-	\N	\N	\N
9942	14	Iowa	033	Cerro Gordo	0	14-033-	\N	\N	\N
9943	14	Iowa	035	Cherokee	0	14-035-	\N	\N	\N
9944	14	Iowa	037	Chickasaw	0	14-037-	\N	\N	\N
9945	14	Iowa	039	Clarke	0	14-039-	\N	\N	\N
9946	14	Iowa	041	Clay	0	14-041-	\N	\N	\N
9947	14	Iowa	043	Clayton	0	14-043-	\N	\N	\N
9948	14	Iowa	045	Clinton	0	14-045-	\N	\N	\N
9949	14	Iowa	047	Crawford	0	14-047-	\N	\N	\N
9950	14	Iowa	049	Dallas	0	14-049-	\N	\N	\N
9951	14	Iowa	051	Davis	0	14-051-	\N	\N	\N
9952	14	Iowa	053	Decatur	0	14-053-	\N	\N	\N
9953	14	Iowa	055	Delaware	0	14-055-	\N	\N	\N
9954	14	Iowa	057	Des Moines	0	14-057-	\N	\N	\N
9955	14	Iowa	059	Dickinson	0	14-059-	\N	\N	\N
9956	14	Iowa	061	Dubuque	0	14-061-	\N	\N	\N
9957	14	Iowa	063	Emmet	0	14-063-	\N	\N	\N
9958	14	Iowa	065	Fayette	0	14-065-	\N	\N	\N
9959	14	Iowa	067	Floyd	0	14-067-	\N	\N	\N
9960	14	Iowa	069	Franklin	0	14-069-	\N	\N	\N
9961	14	Iowa	071	Fremont	0	14-071-	\N	\N	\N
9962	14	Iowa	073	Greene	0	14-073-	\N	\N	\N
9963	14	Iowa	075	Grundy	0	14-075-	\N	\N	\N
9964	14	Iowa	077	Guthrie	0	14-077-	\N	\N	\N
9965	14	Iowa	079	Hamilton	0	14-079-	\N	\N	\N
9966	14	Iowa	081	Hancock	0	14-081-	\N	\N	\N
9967	14	Iowa	083	Hardin	0	14-083-	\N	\N	\N
9968	14	Iowa	085	Harrison	0	14-085-	\N	\N	\N
9969	14	Iowa	087	Henry	0	14-087-	\N	\N	\N
9970	14	Iowa	089	Howard	0	14-089-	\N	\N	\N
9971	14	Iowa	091	Humboldt	0	14-091-	\N	\N	\N
9972	14	Iowa	093	Ida	0	14-093-	\N	\N	\N
9973	14	Iowa	095	Iowa	0	14-095-	\N	\N	\N
9974	14	Iowa	097	Jackson	0	14-097-	\N	\N	\N
9975	14	Iowa	099	Jasper	0	14-099-	\N	\N	\N
9976	14	Iowa	101	Jefferson	0	14-101-	\N	\N	\N
9977	14	Iowa	103	Johnson	0	14-103-	\N	\N	\N
9978	14	Iowa	105	Jones	0	14-105-	\N	\N	\N
9979	14	Iowa	107	Keokuk	0	14-107-	\N	\N	\N
9980	14	Iowa	109	Kossuth	0	14-109-	\N	\N	\N
9981	14	Iowa	111	Lee	0	14-111-	\N	\N	\N
9982	14	Iowa	113	Linn	0	14-113-	\N	\N	\N
9983	14	Iowa	115	Louisa	0	14-115-	\N	\N	\N
9984	14	Iowa	117	Lucas	0	14-117-	\N	\N	\N
9985	14	Iowa	119	Lyon	0	14-119-	\N	\N	\N
9986	14	Iowa	121	Madison	0	14-121-	\N	\N	\N
9987	14	Iowa	123	Mahaska	0	14-123-	\N	\N	\N
9988	14	Iowa	125	Marion	0	14-125-	\N	\N	\N
9989	14	Iowa	127	Marshall	0	14-127-	\N	\N	\N
9990	14	Iowa	129	Mills	0	14-129-	\N	\N	\N
9991	14	Iowa	131	Mitchell	0	14-131-	\N	\N	\N
9992	14	Iowa	133	Monona	0	14-133-	\N	\N	\N
9993	14	Iowa	135	Monroe	0	14-135-	\N	\N	\N
9994	14	Iowa	137	Montgomery	0	14-137-	\N	\N	\N
9995	14	Iowa	139	Muscatine	0	14-139-	\N	\N	\N
9996	14	Iowa	141	O Brien	0	14-141-	\N	\N	\N
9997	14	Iowa	143	Osceola	0	14-143-	\N	\N	\N
9998	14	Iowa	145	Page	0	14-145-	\N	\N	\N
9999	14	Iowa	147	Palo Alto	0	14-147-	\N	\N	\N
10000	14	Iowa	149	Plymouth	0	14-149-	\N	\N	\N
10001	14	Iowa	151	Pocahontas	0	14-151-	\N	\N	\N
10002	14	Iowa	153	Polk	0	14-153-	\N	\N	\N
10003	14	Iowa	155	Pottawattamie	0	14-155-	\N	\N	\N
10004	14	Iowa	157	Poweshiek	0	14-157-	\N	\N	\N
10005	14	Iowa	159	Ringgold	0	14-159-	\N	\N	\N
10006	14	Iowa	161	Sac	0	14-161-	\N	\N	\N
10007	14	Iowa	163	Scott	0	14-163-	\N	\N	\N
10008	14	Iowa	165	Shelby	0	14-165-	\N	\N	\N
10009	14	Iowa	167	Sioux	0	14-167-	\N	\N	\N
10010	14	Iowa	169	Story	0	14-169-	\N	\N	\N
10011	14	Iowa	171	Tama	0	14-171-	\N	\N	\N
10012	14	Iowa	173	Taylor	0	14-173-	\N	\N	\N
10013	14	Iowa	175	Union	0	14-175-	\N	\N	\N
10014	14	Iowa	177	Van Buren	0	14-177-	\N	\N	\N
10015	14	Iowa	179	Wapello	0	14-179-	\N	\N	\N
10016	14	Iowa	181	Warren	0	14-181-	\N	\N	\N
10017	14	Iowa	183	Washington	0	14-183-	\N	\N	\N
10018	14	Iowa	185	Wayne	0	14-185-	\N	\N	\N
10019	14	Iowa	187	Webster	0	14-187-	\N	\N	\N
10020	14	Iowa	189	Winnebago	0	14-189-	\N	\N	\N
10021	14	Iowa	191	Winneshiek	0	14-191-	\N	\N	\N
10022	14	Iowa	193	Woodbury	0	14-193-	\N	\N	\N
10023	14	Iowa	195	Worth	0	14-195-	\N	\N	\N
10024	14	Iowa	197	Wright	0	14-197-	\N	\N	\N
10025	15	Kansas	001	Allen	0	15-001-	\N	\N	\N
10026	15	Kansas	003	Anderson	0	15-003-	\N	\N	\N
10027	15	Kansas	005	Atchison	0	15-005-	\N	\N	\N
10028	15	Kansas	007	Barber	0	15-007-	\N	\N	\N
10029	15	Kansas	009	Barton	0	15-009-	\N	\N	\N
10030	15	Kansas	011	Bourbon	0	15-011-	\N	\N	\N
10031	15	Kansas	013	Brown	0	15-013-	\N	\N	\N
10032	15	Kansas	015	Butler	0	15-015-	\N	\N	\N
10033	15	Kansas	017	Chase	0	15-017-	\N	\N	\N
10034	15	Kansas	019	Chautauqua	0	15-019-	\N	\N	\N
10035	15	Kansas	021	Cherokee	0	15-021-	\N	\N	\N
10036	15	Kansas	023	Cheyenne	0	15-023-	\N	\N	\N
10037	15	Kansas	025	Clark	0	15-025-	\N	\N	\N
10038	15	Kansas	027	Clay	0	15-027-	\N	\N	\N
10039	15	Kansas	029	Cloud	0	15-029-	\N	\N	\N
10040	15	Kansas	031	Coffey	0	15-031-	\N	\N	\N
10041	15	Kansas	033	Comanche	0	15-033-	\N	\N	\N
10042	15	Kansas	035	Cowley	0	15-035-	\N	\N	\N
10043	15	Kansas	037	Crawford	0	15-037-	\N	\N	\N
10044	15	Kansas	039	Decatur	0	15-039-	\N	\N	\N
10045	15	Kansas	041	Dickinson	0	15-041-	\N	\N	\N
10046	15	Kansas	043	Doniphan	0	15-043-	\N	\N	\N
10047	15	Kansas	045	Douglas	0	15-045-	\N	\N	\N
10048	15	Kansas	047	Edwards	0	15-047-	\N	\N	\N
10049	15	Kansas	049	Elk	0	15-049-	\N	\N	\N
10050	15	Kansas	051	Ellis	0	15-051-	\N	\N	\N
10051	15	Kansas	053	Ellsworth	0	15-053-	\N	\N	\N
10052	15	Kansas	055	Finney	0	15-055-	\N	\N	\N
10053	15	Kansas	057	Ford	0	15-057-	\N	\N	\N
10054	15	Kansas	059	Franklin	0	15-059-	\N	\N	\N
10055	15	Kansas	061	Geary	0	15-061-	\N	\N	\N
10056	15	Kansas	063	Gove	0	15-063-	\N	\N	\N
10057	15	Kansas	065	Graham	0	15-065-	\N	\N	\N
10058	15	Kansas	067	Grant	0	15-067-	\N	\N	\N
10059	15	Kansas	069	Gray	0	15-069-	\N	\N	\N
10060	15	Kansas	071	Greeley	0	15-071-	\N	\N	\N
10061	15	Kansas	073	Greenwood	0	15-073-	\N	\N	\N
10062	15	Kansas	075	Hamilton	0	15-075-	\N	\N	\N
10063	15	Kansas	077	Harper	0	15-077-	\N	\N	\N
10064	15	Kansas	079	Harvey	0	15-079-	\N	\N	\N
10065	15	Kansas	081	Haskell	0	15-081-	\N	\N	\N
10066	15	Kansas	083	Hodgeman	0	15-083-	\N	\N	\N
10067	15	Kansas	085	Jackson	0	15-085-	\N	\N	\N
10068	15	Kansas	087	Jefferson	0	15-087-	\N	\N	\N
10069	15	Kansas	089	Jewell	0	15-089-	\N	\N	\N
10070	15	Kansas	091	Johnson	0	15-091-	\N	\N	\N
10071	15	Kansas	093	Kearny	0	15-093-	\N	\N	\N
10072	15	Kansas	095	Kingman	0	15-095-	\N	\N	\N
10073	15	Kansas	097	Kiowa	0	15-097-	\N	\N	\N
10074	15	Kansas	099	Labette	0	15-099-	\N	\N	\N
10075	15	Kansas	101	Lane	0	15-101-	\N	\N	\N
10076	15	Kansas	103	Leavenworth	0	15-103-	\N	\N	\N
10077	15	Kansas	105	Lincoln	0	15-105-	\N	\N	\N
10078	15	Kansas	107	Linn	0	15-107-	\N	\N	\N
10079	15	Kansas	109	Logan	0	15-109-	\N	\N	\N
10080	15	Kansas	111	Lyon	0	15-111-	\N	\N	\N
10081	15	Kansas	113	Mc Pherson	0	15-113-	\N	\N	\N
10082	15	Kansas	115	Marion	0	15-115-	\N	\N	\N
10083	15	Kansas	117	Marshall	0	15-117-	\N	\N	\N
10084	15	Kansas	119	Meade	0	15-119-	\N	\N	\N
10085	15	Kansas	121	Miami	0	15-121-	\N	\N	\N
10086	15	Kansas	123	Mitchell	0	15-123-	\N	\N	\N
10087	15	Kansas	125	Montgomery	0	15-125-	\N	\N	\N
10088	15	Kansas	127	Morris	0	15-127-	\N	\N	\N
10089	15	Kansas	129	Morton	0	15-129-	\N	\N	\N
10090	15	Kansas	131	Nemaha	0	15-131-	\N	\N	\N
10091	15	Kansas	133	Neosho	0	15-133-	\N	\N	\N
10092	15	Kansas	135	Ness	0	15-135-	\N	\N	\N
10093	15	Kansas	137	Norton	0	15-137-	\N	\N	\N
10094	15	Kansas	139	Osage	0	15-139-	\N	\N	\N
10095	15	Kansas	141	Osborne	0	15-141-	\N	\N	\N
10096	15	Kansas	143	Ottawa	0	15-143-	\N	\N	\N
10097	15	Kansas	145	Pawnee	0	15-145-	\N	\N	\N
10098	15	Kansas	147	Phillips	0	15-147-	\N	\N	\N
10099	15	Kansas	149	Pottawatomie	0	15-149-	\N	\N	\N
10100	15	Kansas	151	Pratt	0	15-151-	\N	\N	\N
10101	15	Kansas	153	Rawlins	0	15-153-	\N	\N	\N
10102	15	Kansas	155	Reno	0	15-155-	\N	\N	\N
10103	15	Kansas	157	Republic	0	15-157-	\N	\N	\N
10104	15	Kansas	159	Rice	0	15-159-	\N	\N	\N
10105	15	Kansas	161	Riley	0	15-161-	\N	\N	\N
10106	15	Kansas	163	Rooks	0	15-163-	\N	\N	\N
10107	15	Kansas	165	Rush	0	15-165-	\N	\N	\N
10108	15	Kansas	167	Russell	0	15-167-	\N	\N	\N
10109	15	Kansas	169	Saline	0	15-169-	\N	\N	\N
10110	15	Kansas	171	Scott	0	15-171-	\N	\N	\N
10111	15	Kansas	173	Sedgwick	0	15-173-	\N	\N	\N
10112	15	Kansas	175	Seward	0	15-175-	\N	\N	\N
10113	15	Kansas	177	Shawnee	0	15-177-	\N	\N	\N
10114	15	Kansas	179	Sheridan	0	15-179-	\N	\N	\N
10115	15	Kansas	181	Sherman	0	15-181-	\N	\N	\N
10116	15	Kansas	183	Smith	0	15-183-	\N	\N	\N
10117	15	Kansas	185	Stafford	0	15-185-	\N	\N	\N
10118	15	Kansas	187	Stanton	0	15-187-	\N	\N	\N
10119	15	Kansas	189	Stevens	0	15-189-	\N	\N	\N
10120	15	Kansas	191	Sumner	0	15-191-	\N	\N	\N
10121	15	Kansas	193	Thomas	0	15-193-	\N	\N	\N
10122	15	Kansas	195	Trego	0	15-195-	\N	\N	\N
10123	15	Kansas	197	Wabaunsee	0	15-197-	\N	\N	\N
10124	15	Kansas	199	Wallace	0	15-199-	\N	\N	\N
10125	15	Kansas	201	Washington	0	15-201-	\N	\N	\N
10126	15	Kansas	203	Wichita	0	15-203-	\N	\N	\N
10127	15	Kansas	205	Wilson	0	15-205-	\N	\N	\N
10128	15	Kansas	207	Woodson	0	15-207-	\N	\N	\N
10129	15	Kansas	209	Wyandotte	0	15-209-	\N	\N	\N
10130	16	Kentucky	001	Adair	0	16-001-	\N	\N	\N
10131	16	Kentucky	003	Allen	0	16-003-	\N	\N	\N
10132	16	Kentucky	005	Anderson	0	16-005-	\N	\N	\N
10133	16	Kentucky	007	Ballard	0	16-007-	\N	\N	\N
10134	16	Kentucky	009	Barren	0	16-009-	\N	\N	\N
10135	16	Kentucky	011	Bath	0	16-011-	\N	\N	\N
10136	16	Kentucky	013	Bell	0	16-013-	\N	\N	\N
10137	16	Kentucky	015	Boone	0	16-015-	\N	\N	\N
10138	16	Kentucky	017	Bourbon	0	16-017-	\N	\N	\N
10139	16	Kentucky	019	Boyd	0	16-019-	\N	\N	\N
10140	16	Kentucky	021	Boyle	0	16-021-	\N	\N	\N
10141	16	Kentucky	023	Bracken	0	16-023-	\N	\N	\N
10142	16	Kentucky	025	Breathitt	0	16-025-	\N	\N	\N
10143	16	Kentucky	027	Breckinridge	0	16-027-	\N	\N	\N
10144	16	Kentucky	029	Bullitt	0	16-029-	\N	\N	\N
10145	16	Kentucky	031	Butler	0	16-031-	\N	\N	\N
10146	16	Kentucky	033	Caldwell	0	16-033-	\N	\N	\N
10147	16	Kentucky	035	Calloway	0	16-035-	\N	\N	\N
10148	16	Kentucky	037	Campbell	0	16-037-	\N	\N	\N
10149	16	Kentucky	039	Carlisle	0	16-039-	\N	\N	\N
10150	16	Kentucky	041	Carroll	0	16-041-	\N	\N	\N
10151	16	Kentucky	043	Carter	0	16-043-	\N	\N	\N
10152	16	Kentucky	045	Casey	0	16-045-	\N	\N	\N
10153	16	Kentucky	047	Christian	0	16-047-	\N	\N	\N
10154	16	Kentucky	049	Clark	0	16-049-	\N	\N	\N
10155	16	Kentucky	051	Clay	0	16-051-	\N	\N	\N
10156	16	Kentucky	053	Clinton	0	16-053-	\N	\N	\N
10157	16	Kentucky	055	Crittenden	0	16-055-	\N	\N	\N
10158	16	Kentucky	057	Cumberland	0	16-057-	\N	\N	\N
10159	16	Kentucky	059	Daviess	0	16-059-	\N	\N	\N
10160	16	Kentucky	061	Edmonson	0	16-061-	\N	\N	\N
10161	16	Kentucky	063	Elliott	0	16-063-	\N	\N	\N
10162	16	Kentucky	065	Estill	0	16-065-	\N	\N	\N
10163	16	Kentucky	067	Fayette	0	16-067-	\N	\N	\N
10164	16	Kentucky	069	Fleming	0	16-069-	\N	\N	\N
10165	16	Kentucky	071	Floyd	0	16-071-	\N	\N	\N
10166	16	Kentucky	073	Franklin	0	16-073-	\N	\N	\N
10167	16	Kentucky	075	Fulton	0	16-075-	\N	\N	\N
10168	16	Kentucky	077	Gallatin	0	16-077-	\N	\N	\N
10169	16	Kentucky	079	Garrard	0	16-079-	\N	\N	\N
10170	16	Kentucky	081	Grant	0	16-081-	\N	\N	\N
10171	16	Kentucky	083	Graves	0	16-083-	\N	\N	\N
10172	16	Kentucky	085	Grayson	0	16-085-	\N	\N	\N
10173	16	Kentucky	087	Green	0	16-087-	\N	\N	\N
10174	16	Kentucky	089	Greenup	0	16-089-	\N	\N	\N
10175	16	Kentucky	091	Hancock	0	16-091-	\N	\N	\N
10176	16	Kentucky	093	Hardin	0	16-093-	\N	\N	\N
10177	16	Kentucky	095	Harlan	0	16-095-	\N	\N	\N
10178	16	Kentucky	097	Harrison	0	16-097-	\N	\N	\N
10179	16	Kentucky	099	Hart	0	16-099-	\N	\N	\N
10180	16	Kentucky	101	Henderson	0	16-101-	\N	\N	\N
10181	16	Kentucky	103	Henry	0	16-103-	\N	\N	\N
10182	16	Kentucky	105	Hickman	0	16-105-	\N	\N	\N
10183	16	Kentucky	107	Hopkins	0	16-107-	\N	\N	\N
10184	16	Kentucky	109	Jackson	0	16-109-	\N	\N	\N
10185	16	Kentucky	111	Jefferson	0	16-111-	\N	\N	\N
10186	16	Kentucky	113	Jessamine	0	16-113-	\N	\N	\N
10187	16	Kentucky	115	Johnson	0	16-115-	\N	\N	\N
10188	16	Kentucky	117	Kenton	0	16-117-	\N	\N	\N
10189	16	Kentucky	119	Knott	0	16-119-	\N	\N	\N
10190	16	Kentucky	121	Knox	0	16-121-	\N	\N	\N
10191	16	Kentucky	123	Larue	0	16-123-	\N	\N	\N
10192	16	Kentucky	125	Laurel	0	16-125-	\N	\N	\N
10193	16	Kentucky	127	Lawrence	0	16-127-	\N	\N	\N
10194	16	Kentucky	129	Lee	0	16-129-	\N	\N	\N
10195	16	Kentucky	131	Leslie	0	16-131-	\N	\N	\N
10196	16	Kentucky	133	Letcher	0	16-133-	\N	\N	\N
10197	16	Kentucky	135	Lewis	0	16-135-	\N	\N	\N
10198	16	Kentucky	137	Lincoln	0	16-137-	\N	\N	\N
10199	16	Kentucky	139	Livingston	0	16-139-	\N	\N	\N
10200	16	Kentucky	141	Logan	0	16-141-	\N	\N	\N
10201	16	Kentucky	143	Lyon	0	16-143-	\N	\N	\N
10202	16	Kentucky	145	Mc Cracken	0	16-145-	\N	\N	\N
10203	16	Kentucky	147	Mc Creary	0	16-147-	\N	\N	\N
10204	16	Kentucky	149	Mc Lean	0	16-149-	\N	\N	\N
10205	16	Kentucky	151	Madison	0	16-151-	\N	\N	\N
10206	16	Kentucky	153	Magoffin	0	16-153-	\N	\N	\N
10207	16	Kentucky	155	Marion	0	16-155-	\N	\N	\N
10208	16	Kentucky	157	Marshall	0	16-157-	\N	\N	\N
10209	16	Kentucky	159	Martin	0	16-159-	\N	\N	\N
10210	16	Kentucky	161	Mason	0	16-161-	\N	\N	\N
10211	16	Kentucky	163	Meade	0	16-163-	\N	\N	\N
10212	16	Kentucky	165	Menifee	0	16-165-	\N	\N	\N
10213	16	Kentucky	167	Mercer	0	16-167-	\N	\N	\N
10214	16	Kentucky	169	Metcalfe	0	16-169-	\N	\N	\N
10215	16	Kentucky	171	Monroe	0	16-171-	\N	\N	\N
10216	16	Kentucky	173	Montgomery	0	16-173-	\N	\N	\N
10217	16	Kentucky	175	Morgan	0	16-175-	\N	\N	\N
10218	16	Kentucky	177	Muhlenberg	0	16-177-	\N	\N	\N
10219	16	Kentucky	179	Nelson	0	16-179-	\N	\N	\N
10220	16	Kentucky	181	Nicholas	0	16-181-	\N	\N	\N
10221	16	Kentucky	183	Ohio	0	16-183-	\N	\N	\N
10222	16	Kentucky	185	Oldham	0	16-185-	\N	\N	\N
10223	16	Kentucky	187	Owen	0	16-187-	\N	\N	\N
10224	16	Kentucky	189	Owsley	0	16-189-	\N	\N	\N
10225	16	Kentucky	191	Pendleton	0	16-191-	\N	\N	\N
10226	16	Kentucky	193	Perry	0	16-193-	\N	\N	\N
10227	16	Kentucky	195	Pike	0	16-195-	\N	\N	\N
10228	16	Kentucky	197	Powell	0	16-197-	\N	\N	\N
10229	16	Kentucky	199	Pulaski	0	16-199-	\N	\N	\N
10230	16	Kentucky	201	Robertson	0	16-201-	\N	\N	\N
10231	16	Kentucky	203	Rockcastle	0	16-203-	\N	\N	\N
10232	16	Kentucky	205	Rowan	0	16-205-	\N	\N	\N
10233	16	Kentucky	207	Russell	0	16-207-	\N	\N	\N
10234	16	Kentucky	209	Scott	0	16-209-	\N	\N	\N
10235	16	Kentucky	211	Shelby	0	16-211-	\N	\N	\N
10236	16	Kentucky	213	Simpson	0	16-213-	\N	\N	\N
10237	16	Kentucky	215	Spencer	0	16-215-	\N	\N	\N
10238	16	Kentucky	217	Taylor	0	16-217-	\N	\N	\N
10239	16	Kentucky	219	Todd	0	16-219-	\N	\N	\N
10240	16	Kentucky	221	Trigg	0	16-221-	\N	\N	\N
10241	16	Kentucky	223	Trimble	0	16-223-	\N	\N	\N
10242	16	Kentucky	225	Union	0	16-225-	\N	\N	\N
10243	16	Kentucky	227	Warren	0	16-227-	\N	\N	\N
10244	16	Kentucky	229	Washington	0	16-229-	\N	\N	\N
10245	16	Kentucky	231	Wayne	0	16-231-	\N	\N	\N
10246	16	Kentucky	233	Webster	0	16-233-	\N	\N	\N
10247	16	Kentucky	235	Whitley	0	16-235-	\N	\N	\N
10248	16	Kentucky	237	Wolfe	0	16-237-	\N	\N	\N
10249	16	Kentucky	239	Woodford	0	16-239-	\N	\N	\N
10250	17	Louisiana	001	Acadia	1	17-001-	\N	\N	\N
10251	17	Louisiana	003	Allen	1	17-003-	\N	\N	\N
10252	17	Louisiana	005	Ascension	1	17-005-	\N	\N	\N
10253	17	Louisiana	007	Assumption	1	17-007-	\N	\N	\N
10254	17	Louisiana	009	Avoyelles	1	17-009-	\N	\N	\N
10255	17	Louisiana	011	Beauregard	1	17-011-	\N	\N	\N
10256	17	Louisiana	013	Bienville	1	17-013-	\N	\N	\N
10257	17	Louisiana	015	Bossier	1	17-015-	\N	\N	\N
10258	17	Louisiana	017	Caddo	1	17-017-	\N	\N	\N
10259	17	Louisiana	019	Calcasieu	1	17-019-	\N	\N	\N
10260	17	Louisiana	021	Caldwell	1	17-021-	\N	\N	\N
10261	17	Louisiana	023	Cameron	1	17-023-	\N	\N	\N
10262	17	Louisiana	025	Catahoula	1	17-025-	\N	\N	\N
10263	17	Louisiana	027	Claiborne	1	17-027-	\N	\N	\N
10264	17	Louisiana	029	Concordia	1	17-029-	\N	\N	\N
10265	17	Louisiana	031	De Soto	1	17-031-	\N	\N	\N
10266	17	Louisiana	033	East Baton Rouge	1	17-033-	\N	\N	\N
10267	17	Louisiana	035	East Carroll	1	17-035-	\N	\N	\N
10268	17	Louisiana	037	East Feliciana	1	17-037-	\N	\N	\N
10269	17	Louisiana	039	Evangeline	1	17-039-	\N	\N	\N
10270	17	Louisiana	041	Franklin	1	17-041-	\N	\N	\N
10271	17	Louisiana	043	Grant	1	17-043-	\N	\N	\N
10272	17	Louisiana	045	Iberia	1	17-045-	\N	\N	\N
10273	17	Louisiana	047	Iberville	1	17-047-	\N	\N	\N
10274	17	Louisiana	049	Jackson	1	17-049-	\N	\N	\N
10275	17	Louisiana	051	Jefferson	1	17-051-	\N	\N	\N
10276	17	Louisiana	053	Jefferson Davis	1	17-053-	\N	\N	\N
10277	17	Louisiana	055	Lafayette	1	17-055-	\N	\N	\N
10278	17	Louisiana	057	Lafourche	1	17-057-	\N	\N	\N
10279	17	Louisiana	059	La Salle	1	17-059-	\N	\N	\N
10280	17	Louisiana	061	Lincoln	1	17-061-	\N	\N	\N
10281	17	Louisiana	063	Livingston	1	17-063-	\N	\N	\N
10282	17	Louisiana	065	Madison	1	17-065-	\N	\N	\N
10283	17	Louisiana	067	Morehouse	1	17-067-	\N	\N	\N
10284	17	Louisiana	069	Natchitoches	1	17-069-	\N	\N	\N
10285	17	Louisiana	071	Orleans	1	17-071-	\N	\N	\N
10286	17	Louisiana	073	Ouachita	1	17-073-	\N	\N	\N
10287	17	Louisiana	075	Plaquemines	1	17-075-	\N	\N	\N
10288	17	Louisiana	077	Pointe Coupee	1	17-077-	\N	\N	\N
10289	17	Louisiana	079	Rapides	1	17-079-	\N	\N	\N
10290	17	Louisiana	081	Red River	1	17-081-	\N	\N	\N
10291	17	Louisiana	083	Richland	1	17-083-	\N	\N	\N
10292	17	Louisiana	085	Sabine	1	17-085-	\N	\N	\N
10293	17	Louisiana	087	St Bernard	1	17-087-	\N	\N	\N
10294	17	Louisiana	089	St Charles	1	17-089-	\N	\N	\N
10295	17	Louisiana	091	St Helena	1	17-091-	\N	\N	\N
10296	17	Louisiana	093	St James	1	17-093-	\N	\N	\N
10297	17	Louisiana	095	St John The Baptist	1	17-095-	\N	\N	\N
10298	17	Louisiana	097	St Landry	1	17-097-	\N	\N	\N
10299	17	Louisiana	099	St Martin	1	17-099-	\N	\N	\N
10300	17	Louisiana	101	St Mary	1	17-101-	\N	\N	\N
10301	17	Louisiana	103	St Tammany	1	17-103-	\N	\N	\N
10302	17	Louisiana	105	Tangipahoa	1	17-105-	\N	\N	\N
10303	17	Louisiana	107	Tensas	1	17-107-	\N	\N	\N
10304	17	Louisiana	109	Terrebonne	1	17-109-	\N	\N	\N
10305	17	Louisiana	111	Union	1	17-111-	\N	\N	\N
10306	17	Louisiana	113	Vermilion	1	17-113-	\N	\N	\N
10307	17	Louisiana	115	Vernon	1	17-115-	\N	\N	\N
10308	17	Louisiana	117	Washington	1	17-117-	\N	\N	\N
10309	17	Louisiana	119	Webster	1	17-119-	\N	\N	\N
10310	17	Louisiana	121	West Baton Rouge	1	17-121-	\N	\N	\N
10311	17	Louisiana	123	West Carroll	1	17-123-	\N	\N	\N
10312	17	Louisiana	125	West Feliciana	1	17-125-	\N	\N	\N
10313	17	Louisiana	127	Winn	1	17-127-	\N	\N	\N
10314	17	Louisiana	129	Various Parishes	1	17-129-	\N	\N	\N
10315	17	Louisiana	700	West Cameron	1	17-700-	\N	\N	\N
10316	17	Louisiana	701	West Cameron West	1	17-701-	\N	\N	\N
10317	17	Louisiana	702	West Cameron South	1	17-702-	\N	\N	\N
10318	17	Louisiana	703	East Cameron	1	17-703-	\N	\N	\N
10319	17	Louisiana	704	East Cameron South	1	17-704-	\N	\N	\N
10320	17	Louisiana	705	Vermilion Offshore	1	17-705-	\N	\N	\N
10321	17	Louisiana	706	Vermilion South	1	17-706-	\N	\N	\N
10322	17	Louisiana	707	South Marsh Island	1	17-707-	\N	\N	\N
10323	17	Louisiana	708	South Marsh Island South	1	17-708-	\N	\N	\N
10324	17	Louisiana	709	Eugene Island	1	17-709-	\N	\N	\N
10325	17	Louisiana	710	Eugene Island South	1	17-710-	\N	\N	\N
10326	17	Louisiana	711	Ship Shoal	1	17-711-	\N	\N	\N
10327	17	Louisiana	712	Ship Shoal South	1	17-712-	\N	\N	\N
10328	17	Louisiana	713	South Pelto	1	17-713-	\N	\N	\N
10329	17	Louisiana	714	Bay Marchand	1	17-714-	\N	\N	\N
10330	17	Louisiana	715	South Timbalier	1	17-715-	\N	\N	\N
10331	17	Louisiana	716	South Timbalier South	1	17-716-	\N	\N	\N
10332	17	Louisiana	717	Grand Isle	1	17-717-	\N	\N	\N
10333	17	Louisiana	718	Grand Isle South	1	17-718-	\N	\N	\N
10334	17	Louisiana	719	West Delta	1	17-719-	\N	\N	\N
10335	17	Louisiana	720	West Delta South	1	17-720-	\N	\N	\N
10336	17	Louisiana	721	South Pass	1	17-721-	\N	\N	\N
10337	17	Louisiana	722	South Pass South	1	17-722-	\N	\N	\N
10338	17	Louisiana	723	South Pass East	1	17-723-	\N	\N	\N
10339	17	Louisiana	724	Main Pass South & East	1	17-724-	\N	\N	\N
10340	17	Louisiana	725	Main Pass	1	17-725-	\N	\N	\N
10341	17	Louisiana	726	Breton Sound	1	17-726-	\N	\N	\N
10342	17	Louisiana	727	Chandeleur Sound	1	17-727-	\N	\N	\N
10343	17	Louisiana	728	Chandeleur	1	17-728-	\N	\N	\N
10344	17	Louisiana	729	Chandeleur East	1	17-729-	\N	\N	\N
10345	17	Louisiana	730	Chandeleur Sound Addition	1	17-730-	\N	\N	\N
10346	17	Louisiana	731	Sabine Pass	1	17-731-	\N	\N	\N
10347	18	Maine	001	Androscoggin	0	18-001-	\N	\N	\N
10348	18	Maine	003	Aroostook	0	18-003-	\N	\N	\N
10349	18	Maine	005	Cumberland	0	18-005-	\N	\N	\N
10350	18	Maine	007	Franklin	0	18-007-	\N	\N	\N
10351	18	Maine	009	Hancock	0	18-009-	\N	\N	\N
10352	18	Maine	011	Kennebec	0	18-011-	\N	\N	\N
10353	18	Maine	013	Knox	0	18-013-	\N	\N	\N
10354	18	Maine	015	Lincoln	0	18-015-	\N	\N	\N
10355	18	Maine	017	Oxford	0	18-017-	\N	\N	\N
10356	18	Maine	019	Penobscot	0	18-019-	\N	\N	\N
10357	18	Maine	021	Piscataquis	0	18-021-	\N	\N	\N
10358	18	Maine	023	Sagadahoc	0	18-023-	\N	\N	\N
10359	18	Maine	025	Somerset	0	18-025-	\N	\N	\N
10360	18	Maine	027	Waldo	0	18-027-	\N	\N	\N
10361	18	Maine	029	Washington	0	18-029-	\N	\N	\N
10362	18	Maine	031	York	0	18-031-	\N	\N	\N
10363	18	Maine	205	Cumberland Offshore	0	18-205-	\N	\N	\N
10364	18	Maine	209	Hancock Offshore	0	18-209-	\N	\N	\N
10365	18	Maine	213	Knox Offshore	0	18-213-	\N	\N	\N
10366	18	Maine	215	Lincoln Offshore	0	18-215-	\N	\N	\N
10367	18	Maine	223	Sagadahoc Offshore	0	18-223-	\N	\N	\N
10368	18	Maine	229	Washington Offshore	0	18-229-	\N	\N	\N
10369	18	Maine	231	York Offshore	0	18-231-	\N	\N	\N
10370	19	Maryland	001	Allegany	0	19-001-	\N	\N	\N
10371	19	Maryland	003	Anne Arundel	0	19-003-	\N	\N	\N
10372	19	Maryland	005	Baltimore	0	19-005-	\N	\N	\N
10373	19	Maryland	007	Baltimore City	0	19-007-	\N	\N	\N
10374	19	Maryland	009	Calvert	0	19-009-	\N	\N	\N
10375	19	Maryland	011	Caroline	0	19-011-	\N	\N	\N
10376	19	Maryland	013	Carroll	0	19-013-	\N	\N	\N
10377	19	Maryland	015	Cecil	0	19-015-	\N	\N	\N
10378	19	Maryland	017	Charles	0	19-017-	\N	\N	\N
10379	19	Maryland	019	Dorchester	0	19-019-	\N	\N	\N
10380	19	Maryland	021	Frederick	0	19-021-	\N	\N	\N
10381	19	Maryland	023	Garrett	0	19-023-	\N	\N	\N
10382	19	Maryland	025	Harford	0	19-025-	\N	\N	\N
10383	19	Maryland	027	Howard	0	19-027-	\N	\N	\N
10384	19	Maryland	029	Kent	0	19-029-	\N	\N	\N
10385	19	Maryland	031	Montgomery	0	19-031-	\N	\N	\N
10386	19	Maryland	033	Prince Georges	0	19-033-	\N	\N	\N
10387	19	Maryland	035	Queen Annes	0	19-035-	\N	\N	\N
10388	19	Maryland	037	St Marys	0	19-037-	\N	\N	\N
10389	19	Maryland	039	Somerset	0	19-039-	\N	\N	\N
10390	19	Maryland	041	Talbot	0	19-041-	\N	\N	\N
10391	19	Maryland	043	Washington	0	19-043-	\N	\N	\N
10392	19	Maryland	045	Wicomico	0	19-045-	\N	\N	\N
10393	19	Maryland	047	Worcester	0	19-047-	\N	\N	\N
10394	19	Maryland	117	Chincoteague	0	19-117-	\N	\N	\N
10395	19	Maryland	125	Baltimore Rise	0	19-125-	\N	\N	\N
10396	19	Maryland	247	Worcester Offshore	0	19-247-	\N	\N	\N
10397	20	Massachusetts	001	Barnstable	0	20-001-	\N	\N	\N
10398	20	Massachusetts	003	Berkshire	0	20-003-	\N	\N	\N
10399	20	Massachusetts	005	Bristol	0	20-005-	\N	\N	\N
10400	20	Massachusetts	007	Dukes	0	20-007-	\N	\N	\N
10401	20	Massachusetts	009	Essex	0	20-009-	\N	\N	\N
10402	20	Massachusetts	011	Franklin	0	20-011-	\N	\N	\N
10403	20	Massachusetts	013	Hampden	0	20-013-	\N	\N	\N
10404	20	Massachusetts	015	Hampshire	0	20-015-	\N	\N	\N
10405	20	Massachusetts	017	Middlesex	0	20-017-	\N	\N	\N
10406	20	Massachusetts	019	Nantucket	0	20-019-	\N	\N	\N
10407	20	Massachusetts	021	Norfolk	0	20-021-	\N	\N	\N
10408	20	Massachusetts	023	Plymouth	0	20-023-	\N	\N	\N
10409	20	Massachusetts	025	Suffolk	0	20-025-	\N	\N	\N
10410	20	Massachusetts	027	Worcester	0	20-027-	\N	\N	\N
10411	20	Massachusetts	129	Hartford	0	20-129-	\N	\N	\N
10412	20	Massachusetts	135	Providence	0	20-135-	\N	\N	\N
10413	20	Massachusetts	136	Boston	0	20-136-	\N	\N	\N
10414	20	Massachusetts	142	Cashes Ledge	0	20-142-	\N	\N	\N
10415	20	Massachusetts	147	Georges Bank	0	20-147-	\N	\N	\N
10416	20	Massachusetts	152	Fundian Rise	0	20-152-	\N	\N	\N
10417	20	Massachusetts	201	Barnstable Offshore	0	20-201-	\N	\N	\N
10418	20	Massachusetts	205	Bristol Offshore	0	20-205-	\N	\N	\N
10419	20	Massachusetts	207	Dukes Offshore	0	20-207-	\N	\N	\N
10420	20	Massachusetts	209	Essex Offshore	0	20-209-	\N	\N	\N
10421	20	Massachusetts	219	Nantucket Offshore	0	20-219-	\N	\N	\N
10422	20	Massachusetts	221	Norfolk Offshore	0	20-221-	\N	\N	\N
10423	20	Massachusetts	223	Plymouth Offshore	0	20-223-	\N	\N	\N
10424	20	Massachusetts	225	Suffolk Offshore	0	20-225-	\N	\N	\N
10425	21	Michigan	001	Alcona	0	21-001-	\N	\N	\N
10426	21	Michigan	003	Alger	0	21-003-	\N	\N	\N
10427	21	Michigan	005	Allegan	0	21-005-	\N	\N	\N
10428	21	Michigan	007	Alpena	0	21-007-	\N	\N	\N
10429	21	Michigan	009	Antrim	0	21-009-	\N	\N	\N
10430	21	Michigan	011	Arenac	0	21-011-	\N	\N	\N
10431	21	Michigan	013	Baraga	0	21-013-	\N	\N	\N
10432	21	Michigan	015	Barry	0	21-015-	\N	\N	\N
10433	21	Michigan	017	Bay	0	21-017-	\N	\N	\N
10434	21	Michigan	019	Benzie	0	21-019-	\N	\N	\N
10435	21	Michigan	021	Berrien	0	21-021-	\N	\N	\N
10436	21	Michigan	023	Branch	0	21-023-	\N	\N	\N
10437	21	Michigan	025	Calhoun	0	21-025-	\N	\N	\N
10438	21	Michigan	027	Cass	0	21-027-	\N	\N	\N
10439	21	Michigan	029	Charlevoix	0	21-029-	\N	\N	\N
10440	21	Michigan	031	Cheboygan	0	21-031-	\N	\N	\N
10441	21	Michigan	033	Chippewa	0	21-033-	\N	\N	\N
10442	21	Michigan	035	Clare	0	21-035-	\N	\N	\N
10443	21	Michigan	037	Clinton	0	21-037-	\N	\N	\N
10444	21	Michigan	039	Crawford	0	21-039-	\N	\N	\N
10445	21	Michigan	041	Delta	0	21-041-	\N	\N	\N
10446	21	Michigan	043	Dickinson	0	21-043-	\N	\N	\N
10447	21	Michigan	045	Eaton	0	21-045-	\N	\N	\N
10448	21	Michigan	047	Emmet	0	21-047-	\N	\N	\N
10449	21	Michigan	049	Genesee	0	21-049-	\N	\N	\N
10450	21	Michigan	051	Gladwin	0	21-051-	\N	\N	\N
10451	21	Michigan	053	Gogebic	0	21-053-	\N	\N	\N
10452	21	Michigan	055	Grand Traverse	0	21-055-	\N	\N	\N
10453	21	Michigan	057	Gratiot	0	21-057-	\N	\N	\N
10454	21	Michigan	059	Hillsdale	0	21-059-	\N	\N	\N
10455	21	Michigan	061	Houghton	0	21-061-	\N	\N	\N
10456	21	Michigan	063	Huron	0	21-063-	\N	\N	\N
10457	21	Michigan	065	Ingham	0	21-065-	\N	\N	\N
10458	21	Michigan	067	Ionia	0	21-067-	\N	\N	\N
10459	21	Michigan	069	Iosco	0	21-069-	\N	\N	\N
10460	21	Michigan	071	Iron	0	21-071-	\N	\N	\N
10461	21	Michigan	073	Isabella	0	21-073-	\N	\N	\N
10462	21	Michigan	075	Jackson	0	21-075-	\N	\N	\N
10463	21	Michigan	077	Kalamazoo	0	21-077-	\N	\N	\N
10464	21	Michigan	079	Kalkaska	0	21-079-	\N	\N	\N
10465	21	Michigan	081	Kent	0	21-081-	\N	\N	\N
10466	21	Michigan	083	Keweenaw	0	21-083-	\N	\N	\N
10467	21	Michigan	085	Lake	0	21-085-	\N	\N	\N
10468	21	Michigan	087	Lapeer	0	21-087-	\N	\N	\N
10469	21	Michigan	089	Leelanau	0	21-089-	\N	\N	\N
10470	21	Michigan	091	Lenawee	0	21-091-	\N	\N	\N
10471	21	Michigan	093	Livingston	0	21-093-	\N	\N	\N
10472	21	Michigan	095	Luce	0	21-095-	\N	\N	\N
10473	21	Michigan	097	Mackinac	0	21-097-	\N	\N	\N
10474	21	Michigan	099	Macomb	0	21-099-	\N	\N	\N
10475	21	Michigan	101	Manistee	0	21-101-	\N	\N	\N
10476	21	Michigan	103	Marquette	0	21-103-	\N	\N	\N
10477	21	Michigan	105	Mason	0	21-105-	\N	\N	\N
10478	21	Michigan	107	Mecosta	0	21-107-	\N	\N	\N
10479	21	Michigan	109	Menominee	0	21-109-	\N	\N	\N
10480	21	Michigan	111	Midland	0	21-111-	\N	\N	\N
10481	21	Michigan	113	Missaukee	0	21-113-	\N	\N	\N
10482	21	Michigan	115	Monroe	0	21-115-	\N	\N	\N
10483	21	Michigan	117	Montcalm	0	21-117-	\N	\N	\N
10484	21	Michigan	119	Montmorency	0	21-119-	\N	\N	\N
10485	21	Michigan	121	Muskegon	0	21-121-	\N	\N	\N
10486	21	Michigan	123	Newaygo	0	21-123-	\N	\N	\N
10487	21	Michigan	125	Oakland	0	21-125-	\N	\N	\N
10488	21	Michigan	127	Oceana	0	21-127-	\N	\N	\N
10489	21	Michigan	129	Ogemaw	0	21-129-	\N	\N	\N
10490	21	Michigan	131	Ontonagon	0	21-131-	\N	\N	\N
10491	21	Michigan	133	Osceola	0	21-133-	\N	\N	\N
10492	21	Michigan	135	Oscoda	0	21-135-	\N	\N	\N
10493	21	Michigan	137	Otsego	0	21-137-	\N	\N	\N
10494	21	Michigan	139	Ottawa	0	21-139-	\N	\N	\N
10495	21	Michigan	141	Presque Isle	0	21-141-	\N	\N	\N
10496	21	Michigan	143	Roscommon	0	21-143-	\N	\N	\N
10497	21	Michigan	145	Saginaw	0	21-145-	\N	\N	\N
10498	21	Michigan	147	St Clair	0	21-147-	\N	\N	\N
10499	21	Michigan	149	St Joseph	0	21-149-	\N	\N	\N
10500	21	Michigan	151	Sanilac	0	21-151-	\N	\N	\N
10501	21	Michigan	153	Schoolcraft	0	21-153-	\N	\N	\N
10502	21	Michigan	155	Shiawassee	0	21-155-	\N	\N	\N
10503	21	Michigan	157	Tuscola	0	21-157-	\N	\N	\N
10504	21	Michigan	159	Van Buren	0	21-159-	\N	\N	\N
10505	21	Michigan	161	Washtenaw	0	21-161-	\N	\N	\N
10506	21	Michigan	163	Wayne	0	21-163-	\N	\N	\N
10507	21	Michigan	165	Wexford	0	21-165-	\N	\N	\N
10508	21	Michigan	521	Lake Michigan	0	21-521-	\N	\N	\N
10509	21	Michigan	554	Lake Huron	0	21-554-	\N	\N	\N
10510	21	Michigan	556	Lake Erie	0	21-556-	\N	\N	\N
10511	21	Michigan	558	Lake Superior	0	21-558-	\N	\N	\N
10512	22	Minnesota	001	Aitkin	0	22-001-	\N	\N	\N
10513	22	Minnesota	003	Anoka	0	22-003-	\N	\N	\N
10514	22	Minnesota	005	Becker	0	22-005-	\N	\N	\N
10515	22	Minnesota	007	Beltrami	0	22-007-	\N	\N	\N
10516	22	Minnesota	009	Benton	0	22-009-	\N	\N	\N
10517	22	Minnesota	011	Big Stone	0	22-011-	\N	\N	\N
10518	22	Minnesota	013	Blue Earth	0	22-013-	\N	\N	\N
10519	22	Minnesota	015	Brown	0	22-015-	\N	\N	\N
10520	22	Minnesota	017	Carlton	0	22-017-	\N	\N	\N
10521	22	Minnesota	019	Carver	0	22-019-	\N	\N	\N
10522	22	Minnesota	021	Cass	0	22-021-	\N	\N	\N
10523	22	Minnesota	023	Chippewa	0	22-023-	\N	\N	\N
10524	22	Minnesota	025	Chisago	0	22-025-	\N	\N	\N
10525	22	Minnesota	027	Clay	0	22-027-	\N	\N	\N
10526	22	Minnesota	029	Clearwater	0	22-029-	\N	\N	\N
10527	22	Minnesota	031	Cook	0	22-031-	\N	\N	\N
10528	22	Minnesota	033	Cottonwood	0	22-033-	\N	\N	\N
10529	22	Minnesota	035	Crow Wing	0	22-035-	\N	\N	\N
10530	22	Minnesota	037	Dakota	0	22-037-	\N	\N	\N
10531	22	Minnesota	039	Dodge	0	22-039-	\N	\N	\N
10532	22	Minnesota	041	Douglas	0	22-041-	\N	\N	\N
10533	22	Minnesota	043	Faribault	0	22-043-	\N	\N	\N
10534	22	Minnesota	045	Fillmore	0	22-045-	\N	\N	\N
10535	22	Minnesota	047	Freeborn	0	22-047-	\N	\N	\N
10536	22	Minnesota	049	Goodhue	0	22-049-	\N	\N	\N
10537	22	Minnesota	051	Grant	0	22-051-	\N	\N	\N
10538	22	Minnesota	053	Hennepin	0	22-053-	\N	\N	\N
10539	22	Minnesota	055	Houston	0	22-055-	\N	\N	\N
10540	22	Minnesota	057	Hubbard	0	22-057-	\N	\N	\N
10541	22	Minnesota	059	Isanti	0	22-059-	\N	\N	\N
10542	22	Minnesota	061	Itasca	0	22-061-	\N	\N	\N
10543	22	Minnesota	063	Jackson	0	22-063-	\N	\N	\N
10544	22	Minnesota	065	Kanabec	0	22-065-	\N	\N	\N
10545	22	Minnesota	067	Kandiyohi	0	22-067-	\N	\N	\N
10546	22	Minnesota	069	Kittson	0	22-069-	\N	\N	\N
10547	22	Minnesota	071	Koochiching	0	22-071-	\N	\N	\N
10548	22	Minnesota	073	Lac Qui Parle	0	22-073-	\N	\N	\N
10549	22	Minnesota	075	Lake	0	22-075-	\N	\N	\N
10550	22	Minnesota	077	Lake Of The Woods	0	22-077-	\N	\N	\N
10551	22	Minnesota	079	Le Sueur	0	22-079-	\N	\N	\N
10552	22	Minnesota	081	Lincoln	0	22-081-	\N	\N	\N
10553	22	Minnesota	083	Lyon	0	22-083-	\N	\N	\N
10554	22	Minnesota	085	Mc Leod	0	22-085-	\N	\N	\N
10555	22	Minnesota	087	Mahnomen	0	22-087-	\N	\N	\N
10556	22	Minnesota	089	Marshall	0	22-089-	\N	\N	\N
10557	22	Minnesota	091	Martin	0	22-091-	\N	\N	\N
10558	22	Minnesota	093	Meeker	0	22-093-	\N	\N	\N
10559	22	Minnesota	095	Mille Lacs	0	22-095-	\N	\N	\N
10560	22	Minnesota	097	Morrison	0	22-097-	\N	\N	\N
10561	22	Minnesota	099	Mower	0	22-099-	\N	\N	\N
10562	22	Minnesota	101	Murray	0	22-101-	\N	\N	\N
10563	22	Minnesota	103	Nicollet	0	22-103-	\N	\N	\N
10564	22	Minnesota	105	Nobles	0	22-105-	\N	\N	\N
10565	22	Minnesota	107	Norman	0	22-107-	\N	\N	\N
10566	22	Minnesota	109	Olmsted	0	22-109-	\N	\N	\N
10567	22	Minnesota	111	Otter Tail	0	22-111-	\N	\N	\N
10568	22	Minnesota	113	Pennington	0	22-113-	\N	\N	\N
10569	22	Minnesota	115	Pine	0	22-115-	\N	\N	\N
10570	22	Minnesota	117	Pipestone	0	22-117-	\N	\N	\N
10571	22	Minnesota	119	Polk	0	22-119-	\N	\N	\N
10572	22	Minnesota	121	Pope	0	22-121-	\N	\N	\N
10573	22	Minnesota	123	Ramsey	0	22-123-	\N	\N	\N
10574	22	Minnesota	125	Red Lake	0	22-125-	\N	\N	\N
10575	22	Minnesota	127	Redwood	0	22-127-	\N	\N	\N
10576	22	Minnesota	129	Renville	0	22-129-	\N	\N	\N
10577	22	Minnesota	131	Rice	0	22-131-	\N	\N	\N
10578	22	Minnesota	133	Rock	0	22-133-	\N	\N	\N
10579	22	Minnesota	135	Roseau	0	22-135-	\N	\N	\N
10580	22	Minnesota	137	St Louis	0	22-137-	\N	\N	\N
10581	22	Minnesota	139	Scott	0	22-139-	\N	\N	\N
10582	22	Minnesota	141	Sherburne	0	22-141-	\N	\N	\N
10583	22	Minnesota	143	Sibley	0	22-143-	\N	\N	\N
10584	22	Minnesota	145	Stearns	0	22-145-	\N	\N	\N
10585	22	Minnesota	147	Steele	0	22-147-	\N	\N	\N
10586	22	Minnesota	149	Stevens	0	22-149-	\N	\N	\N
10587	22	Minnesota	151	Swift	0	22-151-	\N	\N	\N
10588	22	Minnesota	153	Todd	0	22-153-	\N	\N	\N
10589	22	Minnesota	155	Traverse	0	22-155-	\N	\N	\N
10590	22	Minnesota	157	Wabasha	0	22-157-	\N	\N	\N
10591	22	Minnesota	159	Wadena	0	22-159-	\N	\N	\N
10592	22	Minnesota	161	Waseca	0	22-161-	\N	\N	\N
10593	22	Minnesota	163	Washington	0	22-163-	\N	\N	\N
10594	22	Minnesota	165	Watonwan	0	22-165-	\N	\N	\N
10595	22	Minnesota	167	Wilkin	0	22-167-	\N	\N	\N
10596	22	Minnesota	169	Winona	0	22-169-	\N	\N	\N
10597	22	Minnesota	171	Wright	0	22-171-	\N	\N	\N
10598	22	Minnesota	173	Yellow Medicine	0	22-173-	\N	\N	\N
10599	22	Minnesota	522	Lake Superior	0	22-522-	\N	\N	\N
10600	23	Mississippi	001	Adams	0	23-001-	\N	\N	\N
10601	23	Mississippi	003	Alcorn	0	23-003-	\N	\N	\N
10602	23	Mississippi	005	Amite	0	23-005-	\N	\N	\N
10603	23	Mississippi	007	Attala	0	23-007-	\N	\N	\N
10604	23	Mississippi	009	Benton	0	23-009-	\N	\N	\N
10605	23	Mississippi	011	Bolivar	0	23-011-	\N	\N	\N
10606	23	Mississippi	013	Calhoun	0	23-013-	\N	\N	\N
10607	23	Mississippi	015	Carroll	0	23-015-	\N	\N	\N
10608	23	Mississippi	017	Chickasaw	0	23-017-	\N	\N	\N
10609	23	Mississippi	019	Choctaw	0	23-019-	\N	\N	\N
10610	23	Mississippi	021	Claiborne	0	23-021-	\N	\N	\N
10611	23	Mississippi	023	Clarke	0	23-023-	\N	\N	\N
10612	23	Mississippi	025	Clay	0	23-025-	\N	\N	\N
10613	23	Mississippi	027	Coahoma	0	23-027-	\N	\N	\N
10614	23	Mississippi	029	Copiah	0	23-029-	\N	\N	\N
10615	23	Mississippi	031	Covington	0	23-031-	\N	\N	\N
10616	23	Mississippi	033	De Soto	0	23-033-	\N	\N	\N
10617	23	Mississippi	035	Forrest	0	23-035-	\N	\N	\N
10618	23	Mississippi	037	Franklin	0	23-037-	\N	\N	\N
10619	23	Mississippi	039	George	0	23-039-	\N	\N	\N
10620	23	Mississippi	041	Greene	0	23-041-	\N	\N	\N
10621	23	Mississippi	043	Grenada	0	23-043-	\N	\N	\N
10622	23	Mississippi	045	Hancock	0	23-045-	\N	\N	\N
10623	23	Mississippi	047	Harrison	0	23-047-	\N	\N	\N
10624	23	Mississippi	049	Hinds	0	23-049-	\N	\N	\N
10625	23	Mississippi	051	Holmes	0	23-051-	\N	\N	\N
10626	23	Mississippi	053	Humphreys	0	23-053-	\N	\N	\N
10627	23	Mississippi	055	Issaquena	0	23-055-	\N	\N	\N
10628	23	Mississippi	057	Itawamba	0	23-057-	\N	\N	\N
10629	23	Mississippi	059	Jackson	0	23-059-	\N	\N	\N
10630	23	Mississippi	061	Jasper	0	23-061-	\N	\N	\N
10631	23	Mississippi	063	Jefferson	0	23-063-	\N	\N	\N
10632	23	Mississippi	065	Jefferson Davis	0	23-065-	\N	\N	\N
10633	23	Mississippi	067	Jones	0	23-067-	\N	\N	\N
10634	23	Mississippi	069	Kemper	0	23-069-	\N	\N	\N
10635	23	Mississippi	071	Lafayette	0	23-071-	\N	\N	\N
10636	23	Mississippi	073	Lamar	0	23-073-	\N	\N	\N
10637	23	Mississippi	075	Lauderdale	0	23-075-	\N	\N	\N
10638	23	Mississippi	077	Lawrence	0	23-077-	\N	\N	\N
10639	23	Mississippi	079	Leake	0	23-079-	\N	\N	\N
10640	23	Mississippi	081	Lee	0	23-081-	\N	\N	\N
10641	23	Mississippi	083	Leflore	0	23-083-	\N	\N	\N
10642	23	Mississippi	085	Lincoln	0	23-085-	\N	\N	\N
10643	23	Mississippi	087	Lowndes	0	23-087-	\N	\N	\N
10644	23	Mississippi	089	Madison	0	23-089-	\N	\N	\N
10645	23	Mississippi	091	Marion	0	23-091-	\N	\N	\N
10646	23	Mississippi	093	Marshall	0	23-093-	\N	\N	\N
10647	23	Mississippi	095	Monroe	0	23-095-	\N	\N	\N
10648	23	Mississippi	097	Montgomery	0	23-097-	\N	\N	\N
10649	23	Mississippi	099	Neshoba	0	23-099-	\N	\N	\N
10650	23	Mississippi	101	Newton	0	23-101-	\N	\N	\N
10651	23	Mississippi	103	Noxubee	0	23-103-	\N	\N	\N
10652	23	Mississippi	105	Oktibbeha	0	23-105-	\N	\N	\N
10653	23	Mississippi	107	Panola	0	23-107-	\N	\N	\N
10654	23	Mississippi	109	Pearl River	0	23-109-	\N	\N	\N
10655	23	Mississippi	111	Perry	0	23-111-	\N	\N	\N
10656	23	Mississippi	113	Pike	0	23-113-	\N	\N	\N
10657	23	Mississippi	115	Pontotoc	0	23-115-	\N	\N	\N
10658	23	Mississippi	117	Prentiss	0	23-117-	\N	\N	\N
10659	23	Mississippi	119	Quitman	0	23-119-	\N	\N	\N
10660	23	Mississippi	121	Rankin	0	23-121-	\N	\N	\N
10661	23	Mississippi	123	Scott	0	23-123-	\N	\N	\N
10662	23	Mississippi	125	Sharkey	0	23-125-	\N	\N	\N
10663	23	Mississippi	127	Simpson	0	23-127-	\N	\N	\N
10664	23	Mississippi	129	Smith	0	23-129-	\N	\N	\N
10665	23	Mississippi	131	Stone	0	23-131-	\N	\N	\N
10666	23	Mississippi	133	Sunflower	0	23-133-	\N	\N	\N
10667	23	Mississippi	135	Tallahatchie	0	23-135-	\N	\N	\N
10668	23	Mississippi	137	Tate	0	23-137-	\N	\N	\N
10669	23	Mississippi	139	Tippah	0	23-139-	\N	\N	\N
10670	23	Mississippi	141	Tishomingo	0	23-141-	\N	\N	\N
10671	23	Mississippi	143	Tunica	0	23-143-	\N	\N	\N
10672	23	Mississippi	145	Union	0	23-145-	\N	\N	\N
10673	23	Mississippi	147	Walthall	0	23-147-	\N	\N	\N
10674	23	Mississippi	149	Warren	0	23-149-	\N	\N	\N
10675	23	Mississippi	151	Washington	0	23-151-	\N	\N	\N
10676	23	Mississippi	153	Wayne	0	23-153-	\N	\N	\N
10677	23	Mississippi	155	Webster	0	23-155-	\N	\N	\N
10678	23	Mississippi	157	Wilkinson	0	23-157-	\N	\N	\N
10679	23	Mississippi	159	Winston	0	23-159-	\N	\N	\N
10680	23	Mississippi	161	Yalobusha	0	23-161-	\N	\N	\N
10681	23	Mississippi	163	Yazoo	0	23-163-	\N	\N	\N
10682	23	Mississippi	245	Hancock Offshore	0	23-245-	\N	\N	\N
10683	23	Mississippi	247	Harrison Offshore	0	23-247-	\N	\N	\N
10684	23	Mississippi	259	Jackson Offshore	0	23-259-	\N	\N	\N
10685	24	Missouri	001	Adair	0	24-001-	\N	\N	\N
10686	24	Missouri	003	Andrew	0	24-003-	\N	\N	\N
10687	24	Missouri	005	Atchison	0	24-005-	\N	\N	\N
10688	24	Missouri	007	Audrain	0	24-007-	\N	\N	\N
10689	24	Missouri	009	Barry	0	24-009-	\N	\N	\N
10690	24	Missouri	011	Barton	0	24-011-	\N	\N	\N
10691	24	Missouri	013	Bates	0	24-013-	\N	\N	\N
10692	24	Missouri	015	Benton	0	24-015-	\N	\N	\N
10693	24	Missouri	017	Bollinger	0	24-017-	\N	\N	\N
10694	24	Missouri	019	Boone	0	24-019-	\N	\N	\N
10695	24	Missouri	021	Buchanan	0	24-021-	\N	\N	\N
10696	24	Missouri	023	Butler	0	24-023-	\N	\N	\N
10697	24	Missouri	025	Caldwell	0	24-025-	\N	\N	\N
10698	24	Missouri	027	Callaway	0	24-027-	\N	\N	\N
10699	24	Missouri	029	Camden	0	24-029-	\N	\N	\N
10700	24	Missouri	031	Cape Girardeau	0	24-031-	\N	\N	\N
10701	24	Missouri	033	Carroll	0	24-033-	\N	\N	\N
10702	24	Missouri	035	Carter	0	24-035-	\N	\N	\N
10703	24	Missouri	037	Cass	0	24-037-	\N	\N	\N
10704	24	Missouri	039	Cedar	0	24-039-	\N	\N	\N
10705	24	Missouri	041	Chariton	0	24-041-	\N	\N	\N
10706	24	Missouri	043	Christian	0	24-043-	\N	\N	\N
10707	24	Missouri	045	Clark	0	24-045-	\N	\N	\N
10708	24	Missouri	047	Clay	0	24-047-	\N	\N	\N
10709	24	Missouri	049	Clinton	0	24-049-	\N	\N	\N
10710	24	Missouri	051	Cole	0	24-051-	\N	\N	\N
10711	24	Missouri	053	Cooper	0	24-053-	\N	\N	\N
10712	24	Missouri	055	Crawford	0	24-055-	\N	\N	\N
10713	24	Missouri	057	Dade	0	24-057-	\N	\N	\N
10714	24	Missouri	059	Dallas	0	24-059-	\N	\N	\N
10715	24	Missouri	061	Daviess	0	24-061-	\N	\N	\N
10716	24	Missouri	063	De Kalb	0	24-063-	\N	\N	\N
10717	24	Missouri	065	Dent	0	24-065-	\N	\N	\N
10718	24	Missouri	067	Douglas	0	24-067-	\N	\N	\N
10719	24	Missouri	069	Dunklin	0	24-069-	\N	\N	\N
10720	24	Missouri	071	Franklin	0	24-071-	\N	\N	\N
10721	24	Missouri	073	Gasconade	0	24-073-	\N	\N	\N
10722	24	Missouri	075	Gentry	0	24-075-	\N	\N	\N
10723	24	Missouri	077	Greene	0	24-077-	\N	\N	\N
10724	24	Missouri	079	Grundy	0	24-079-	\N	\N	\N
10725	24	Missouri	081	Harrison	0	24-081-	\N	\N	\N
10726	24	Missouri	083	Henry	0	24-083-	\N	\N	\N
10727	24	Missouri	085	Hickory	0	24-085-	\N	\N	\N
10728	24	Missouri	087	Holt	0	24-087-	\N	\N	\N
10729	24	Missouri	089	Howard	0	24-089-	\N	\N	\N
10730	24	Missouri	091	Howell	0	24-091-	\N	\N	\N
10731	24	Missouri	093	Iron	0	24-093-	\N	\N	\N
10732	24	Missouri	095	Jackson	0	24-095-	\N	\N	\N
10733	24	Missouri	097	Jasper	0	24-097-	\N	\N	\N
10734	24	Missouri	099	Jefferson	0	24-099-	\N	\N	\N
10735	24	Missouri	101	Johnson	0	24-101-	\N	\N	\N
10736	24	Missouri	103	Knox	0	24-103-	\N	\N	\N
10737	24	Missouri	105	Laclede	0	24-105-	\N	\N	\N
10738	24	Missouri	107	Lafayette	0	24-107-	\N	\N	\N
10739	24	Missouri	109	Lawrence	0	24-109-	\N	\N	\N
10740	24	Missouri	111	Lewis	0	24-111-	\N	\N	\N
10741	24	Missouri	113	Lincoln	0	24-113-	\N	\N	\N
10742	24	Missouri	115	Linn	0	24-115-	\N	\N	\N
10743	24	Missouri	117	Livingston	0	24-117-	\N	\N	\N
10744	24	Missouri	119	Mc Donald	0	24-119-	\N	\N	\N
10745	24	Missouri	121	Macon	0	24-121-	\N	\N	\N
10746	24	Missouri	123	Madison	0	24-123-	\N	\N	\N
10747	24	Missouri	125	Maries	0	24-125-	\N	\N	\N
10748	24	Missouri	127	Marion	0	24-127-	\N	\N	\N
10749	24	Missouri	129	Mercer	0	24-129-	\N	\N	\N
10750	24	Missouri	131	Miller	0	24-131-	\N	\N	\N
10751	24	Missouri	133	Mississippi	0	24-133-	\N	\N	\N
10752	24	Missouri	135	Moniteau	0	24-135-	\N	\N	\N
10753	24	Missouri	137	Monroe	0	24-137-	\N	\N	\N
10754	24	Missouri	139	Montgomery	0	24-139-	\N	\N	\N
10755	24	Missouri	141	Morgan	0	24-141-	\N	\N	\N
10756	24	Missouri	143	New Madrid	0	24-143-	\N	\N	\N
10757	24	Missouri	145	Newton	0	24-145-	\N	\N	\N
10758	24	Missouri	147	Nodaway	0	24-147-	\N	\N	\N
10759	24	Missouri	149	Oregon	0	24-149-	\N	\N	\N
10760	24	Missouri	151	Osage	0	24-151-	\N	\N	\N
10761	24	Missouri	153	Ozark	0	24-153-	\N	\N	\N
10762	24	Missouri	155	Pemiscot	0	24-155-	\N	\N	\N
10763	24	Missouri	157	Perry	0	24-157-	\N	\N	\N
10764	24	Missouri	159	Pettis	0	24-159-	\N	\N	\N
10765	24	Missouri	161	Phelps	0	24-161-	\N	\N	\N
10766	24	Missouri	163	Pike	0	24-163-	\N	\N	\N
10767	24	Missouri	165	Platte	0	24-165-	\N	\N	\N
10768	24	Missouri	167	Polk	0	24-167-	\N	\N	\N
10769	24	Missouri	169	Pulaski	0	24-169-	\N	\N	\N
10770	24	Missouri	171	Putnam	0	24-171-	\N	\N	\N
10771	24	Missouri	173	Ralls	0	24-173-	\N	\N	\N
10772	24	Missouri	175	Randolph	0	24-175-	\N	\N	\N
10773	24	Missouri	177	Ray	0	24-177-	\N	\N	\N
10774	24	Missouri	179	Reynolds	0	24-179-	\N	\N	\N
10775	24	Missouri	181	Ripley	0	24-181-	\N	\N	\N
10776	24	Missouri	183	St Charles	0	24-183-	\N	\N	\N
10777	24	Missouri	185	St Clair	0	24-185-	\N	\N	\N
10778	24	Missouri	187	St Francois	0	24-187-	\N	\N	\N
10779	24	Missouri	189	St Louis	0	24-189-	\N	\N	\N
10780	24	Missouri	191	St Louis City	0	24-191-	\N	\N	\N
10781	24	Missouri	193	Ste Genevieve	0	24-193-	\N	\N	\N
10782	24	Missouri	195	Saline	0	24-195-	\N	\N	\N
10783	24	Missouri	197	Schuyler	0	24-197-	\N	\N	\N
10784	24	Missouri	199	Scotland	0	24-199-	\N	\N	\N
10785	24	Missouri	201	Scott	0	24-201-	\N	\N	\N
10786	24	Missouri	203	Shannon	0	24-203-	\N	\N	\N
10787	24	Missouri	205	Shelby	0	24-205-	\N	\N	\N
10788	24	Missouri	207	Stoddard	0	24-207-	\N	\N	\N
10789	24	Missouri	209	Stone	0	24-209-	\N	\N	\N
10790	24	Missouri	211	Sullivan	0	24-211-	\N	\N	\N
10791	24	Missouri	213	Taney	0	24-213-	\N	\N	\N
10792	24	Missouri	215	Texas	0	24-215-	\N	\N	\N
10793	24	Missouri	217	Vernon	0	24-217-	\N	\N	\N
10794	24	Missouri	219	Warren	0	24-219-	\N	\N	\N
10795	24	Missouri	221	Washington	0	24-221-	\N	\N	\N
10796	24	Missouri	223	Wayne	0	24-223-	\N	\N	\N
10797	24	Missouri	225	Webster	0	24-225-	\N	\N	\N
10798	24	Missouri	227	Worth	0	24-227-	\N	\N	\N
10799	24	Missouri	229	Wright	0	24-229-	\N	\N	\N
10800	25	Montana	001	Beaverhead	0	25-001-	\N	\N	\N
10801	25	Montana	003	Big Horn	0	25-003-	\N	\N	\N
10802	25	Montana	005	Blaine	0	25-005-	\N	\N	\N
10803	25	Montana	007	Broadwater	0	25-007-	\N	\N	\N
10804	25	Montana	009	Carbon	0	25-009-	\N	\N	\N
10805	25	Montana	011	Carter	0	25-011-	\N	\N	\N
10806	25	Montana	013	Cascade	0	25-013-	\N	\N	\N
10807	25	Montana	015	Chouteau	0	25-015-	\N	\N	\N
10808	25	Montana	017	Custer	0	25-017-	\N	\N	\N
10809	25	Montana	019	Daniels	0	25-019-	\N	\N	\N
10810	25	Montana	021	Dawson	0	25-021-	\N	\N	\N
10811	25	Montana	023	Deer Lodge	0	25-023-	\N	\N	\N
10812	25	Montana	025	Fallon	0	25-025-	\N	\N	\N
10813	25	Montana	027	Fergus	0	25-027-	\N	\N	\N
10814	25	Montana	029	Flathead	0	25-029-	\N	\N	\N
10815	25	Montana	031	Gallatin	0	25-031-	\N	\N	\N
10816	25	Montana	033	Garfield	0	25-033-	\N	\N	\N
10817	25	Montana	035	Glacier	0	25-035-	\N	\N	\N
10818	25	Montana	037	Golden Valley	0	25-037-	\N	\N	\N
10819	25	Montana	039	Granite	0	25-039-	\N	\N	\N
10820	25	Montana	041	Hill	0	25-041-	\N	\N	\N
10821	25	Montana	043	Jefferson	0	25-043-	\N	\N	\N
10822	25	Montana	045	Judith Basin	0	25-045-	\N	\N	\N
10823	25	Montana	047	Lake	0	25-047-	\N	\N	\N
10824	25	Montana	049	Lewis And Clark	0	25-049-	\N	\N	\N
10825	25	Montana	051	Liberty	0	25-051-	\N	\N	\N
10826	25	Montana	053	Lincoln	0	25-053-	\N	\N	\N
10827	25	Montana	055	Mccone	0	25-055-	\N	\N	\N
10828	25	Montana	057	Madison	0	25-057-	\N	\N	\N
10829	25	Montana	059	Meagher	0	25-059-	\N	\N	\N
10830	25	Montana	061	Mineral	0	25-061-	\N	\N	\N
10831	25	Montana	063	Missoula	0	25-063-	\N	\N	\N
10832	25	Montana	065	Musselshell	0	25-065-	\N	\N	\N
10833	25	Montana	067	Park	0	25-067-	\N	\N	\N
10834	25	Montana	069	Petroleum	0	25-069-	\N	\N	\N
10835	25	Montana	071	Phillips	0	25-071-	\N	\N	\N
10836	25	Montana	073	Pondera	0	25-073-	\N	\N	\N
10837	25	Montana	075	Powder River	0	25-075-	\N	\N	\N
10838	25	Montana	077	Powell	0	25-077-	\N	\N	\N
10839	25	Montana	079	Prairie	0	25-079-	\N	\N	\N
10840	25	Montana	081	Ravalli	0	25-081-	\N	\N	\N
10841	25	Montana	083	Richland	0	25-083-	\N	\N	\N
10842	25	Montana	085	Roosevelt	0	25-085-	\N	\N	\N
10843	25	Montana	087	Rosebud	0	25-087-	\N	\N	\N
10844	25	Montana	089	Sanders	0	25-089-	\N	\N	\N
10845	25	Montana	091	Sheridan	0	25-091-	\N	\N	\N
10846	25	Montana	093	Silver Bow	0	25-093-	\N	\N	\N
10847	25	Montana	095	Stillwater	0	25-095-	\N	\N	\N
10848	25	Montana	097	Sweet Grass	0	25-097-	\N	\N	\N
10849	25	Montana	099	Teton	0	25-099-	\N	\N	\N
10850	25	Montana	101	Toole	0	25-101-	\N	\N	\N
10851	25	Montana	103	Treasure	0	25-103-	\N	\N	\N
10852	25	Montana	105	Valley	0	25-105-	\N	\N	\N
10853	25	Montana	107	Wheatland	0	25-107-	\N	\N	\N
10854	25	Montana	109	Wibaux	0	25-109-	\N	\N	\N
10855	25	Montana	111	Yellowstone	0	25-111-	\N	\N	\N
10856	25	Montana	113	Yellowstone National Park	0	25-113-	\N	\N	\N
10857	26	Nebraska	001	Adams	0	26-001-	\N	\N	\N
10858	26	Nebraska	003	Antelope	0	26-003-	\N	\N	\N
10859	26	Nebraska	005	Arthur	0	26-005-	\N	\N	\N
10860	26	Nebraska	007	Banner	0	26-007-	\N	\N	\N
10861	26	Nebraska	009	Blaine	0	26-009-	\N	\N	\N
10862	26	Nebraska	011	Boone	0	26-011-	\N	\N	\N
10863	26	Nebraska	013	Box Butte	0	26-013-	\N	\N	\N
10864	26	Nebraska	015	Boyd	0	26-015-	\N	\N	\N
10865	26	Nebraska	017	Brown	0	26-017-	\N	\N	\N
10866	26	Nebraska	019	Buffalo	0	26-019-	\N	\N	\N
10867	26	Nebraska	021	Burt	0	26-021-	\N	\N	\N
10868	26	Nebraska	023	Butler	0	26-023-	\N	\N	\N
10869	26	Nebraska	025	Cass	0	26-025-	\N	\N	\N
10870	26	Nebraska	027	Cedar	0	26-027-	\N	\N	\N
10871	26	Nebraska	029	Chase	0	26-029-	\N	\N	\N
10872	26	Nebraska	031	Cherry	0	26-031-	\N	\N	\N
10873	26	Nebraska	033	Cheyenne	0	26-033-	\N	\N	\N
10874	26	Nebraska	035	Clay	0	26-035-	\N	\N	\N
10875	26	Nebraska	037	Colfax	0	26-037-	\N	\N	\N
10876	26	Nebraska	039	Cuming	0	26-039-	\N	\N	\N
10877	26	Nebraska	041	Custer	0	26-041-	\N	\N	\N
10878	26	Nebraska	043	Dakota	0	26-043-	\N	\N	\N
10879	26	Nebraska	045	Dawes	0	26-045-	\N	\N	\N
10880	26	Nebraska	047	Dawson	0	26-047-	\N	\N	\N
10881	26	Nebraska	049	Deuel	0	26-049-	\N	\N	\N
10882	26	Nebraska	051	Dixon	0	26-051-	\N	\N	\N
10883	26	Nebraska	053	Dodge	0	26-053-	\N	\N	\N
10884	26	Nebraska	055	Douglas	0	26-055-	\N	\N	\N
10885	26	Nebraska	057	Dundy	0	26-057-	\N	\N	\N
10886	26	Nebraska	059	Fillmore	0	26-059-	\N	\N	\N
10887	26	Nebraska	061	Franklin	0	26-061-	\N	\N	\N
10888	26	Nebraska	063	Frontier	0	26-063-	\N	\N	\N
10889	26	Nebraska	065	Furnas	0	26-065-	\N	\N	\N
10890	26	Nebraska	067	Gage	0	26-067-	\N	\N	\N
10891	26	Nebraska	069	Garden	0	26-069-	\N	\N	\N
10892	26	Nebraska	071	Garfield	0	26-071-	\N	\N	\N
10893	26	Nebraska	073	Gosper	0	26-073-	\N	\N	\N
10894	26	Nebraska	075	Grant	0	26-075-	\N	\N	\N
10895	26	Nebraska	077	Greeley	0	26-077-	\N	\N	\N
10896	26	Nebraska	079	Hall	0	26-079-	\N	\N	\N
10897	26	Nebraska	081	Hamilton	0	26-081-	\N	\N	\N
10898	26	Nebraska	083	Harlan	0	26-083-	\N	\N	\N
10899	26	Nebraska	085	Hayes	0	26-085-	\N	\N	\N
10900	26	Nebraska	087	Hitchcock	0	26-087-	\N	\N	\N
10901	26	Nebraska	089	Holt	0	26-089-	\N	\N	\N
10902	26	Nebraska	091	Hooker	0	26-091-	\N	\N	\N
10903	26	Nebraska	093	Howard	0	26-093-	\N	\N	\N
10904	26	Nebraska	095	Jefferson	0	26-095-	\N	\N	\N
10905	26	Nebraska	097	Johnson	0	26-097-	\N	\N	\N
10906	26	Nebraska	099	Kearney	0	26-099-	\N	\N	\N
10907	26	Nebraska	101	Keith	0	26-101-	\N	\N	\N
10908	26	Nebraska	103	Keya Paha	0	26-103-	\N	\N	\N
10909	26	Nebraska	105	Kimball	0	26-105-	\N	\N	\N
10910	26	Nebraska	107	Knox	0	26-107-	\N	\N	\N
10911	26	Nebraska	109	Lancaster	0	26-109-	\N	\N	\N
10912	26	Nebraska	111	Lincoln	0	26-111-	\N	\N	\N
10913	26	Nebraska	113	Logan	0	26-113-	\N	\N	\N
10914	26	Nebraska	115	Loup	0	26-115-	\N	\N	\N
10915	26	Nebraska	117	Mc Pherson	0	26-117-	\N	\N	\N
10916	26	Nebraska	119	Madison	0	26-119-	\N	\N	\N
10917	26	Nebraska	121	Merrick	0	26-121-	\N	\N	\N
10918	26	Nebraska	123	Morrill	0	26-123-	\N	\N	\N
10919	26	Nebraska	125	Nance	0	26-125-	\N	\N	\N
10920	26	Nebraska	127	Nemaha	0	26-127-	\N	\N	\N
10921	26	Nebraska	129	Nuckolls	0	26-129-	\N	\N	\N
10922	26	Nebraska	131	Otoe	0	26-131-	\N	\N	\N
10923	26	Nebraska	133	Pawnee	0	26-133-	\N	\N	\N
10924	26	Nebraska	135	Perkins	0	26-135-	\N	\N	\N
10925	26	Nebraska	137	Phelps	0	26-137-	\N	\N	\N
10926	26	Nebraska	139	Pierce	0	26-139-	\N	\N	\N
10927	26	Nebraska	141	Platte	0	26-141-	\N	\N	\N
10928	26	Nebraska	143	Polk	0	26-143-	\N	\N	\N
10929	26	Nebraska	145	Red Willow	0	26-145-	\N	\N	\N
10930	26	Nebraska	147	Richardson	0	26-147-	\N	\N	\N
10931	26	Nebraska	149	Rock	0	26-149-	\N	\N	\N
10932	26	Nebraska	151	Saline	0	26-151-	\N	\N	\N
10933	26	Nebraska	153	Sarpy	0	26-153-	\N	\N	\N
10934	26	Nebraska	155	Saunders	0	26-155-	\N	\N	\N
10935	26	Nebraska	157	Scotts Bluff	0	26-157-	\N	\N	\N
10936	26	Nebraska	159	Seward	0	26-159-	\N	\N	\N
10937	26	Nebraska	161	Sheridan	0	26-161-	\N	\N	\N
10938	26	Nebraska	163	Sherman	0	26-163-	\N	\N	\N
10939	26	Nebraska	165	Sioux	0	26-165-	\N	\N	\N
10940	26	Nebraska	167	Stanton	0	26-167-	\N	\N	\N
10941	26	Nebraska	169	Thayer	0	26-169-	\N	\N	\N
10942	26	Nebraska	171	Thomas	0	26-171-	\N	\N	\N
10943	26	Nebraska	173	Thurston	0	26-173-	\N	\N	\N
10944	26	Nebraska	175	Valley	0	26-175-	\N	\N	\N
10945	26	Nebraska	177	Washington	0	26-177-	\N	\N	\N
10946	26	Nebraska	179	Wayne	0	26-179-	\N	\N	\N
10947	26	Nebraska	181	Webster	0	26-181-	\N	\N	\N
10948	26	Nebraska	183	Wheeler	0	26-183-	\N	\N	\N
10949	26	Nebraska	185	York	0	26-185-	\N	\N	\N
10950	27	Nevada	001	Churchill	0	27-001-	\N	\N	\N
10951	27	Nevada	003	Clark	0	27-003-	\N	\N	\N
10952	27	Nevada	005	Douglas	0	27-005-	\N	\N	\N
10953	27	Nevada	007	Elko	0	27-007-	\N	\N	\N
10954	27	Nevada	009	Esmeralda	0	27-009-	\N	\N	\N
10955	27	Nevada	011	Eureka	0	27-011-	\N	\N	\N
10956	27	Nevada	013	Humboldt	0	27-013-	\N	\N	\N
10957	27	Nevada	015	Lander	0	27-015-	\N	\N	\N
10958	27	Nevada	017	Lincoln	0	27-017-	\N	\N	\N
10959	27	Nevada	019	Lyon	0	27-019-	\N	\N	\N
10960	27	Nevada	021	Mineral	0	27-021-	\N	\N	\N
10961	27	Nevada	023	Nye	0	27-023-	\N	\N	\N
10962	27	Nevada	025	Carson City	0	27-025-	\N	\N	\N
10963	27	Nevada	027	Pershing	0	27-027-	\N	\N	\N
10964	27	Nevada	029	Storey	0	27-029-	\N	\N	\N
10965	27	Nevada	031	Washoe	0	27-031-	\N	\N	\N
10966	27	Nevada	033	White Pine	0	27-033-	\N	\N	\N
10967	28	New Hampshire	001	Belknap	0	28-001-	\N	\N	\N
10968	28	New Hampshire	003	Carroll	0	28-003-	\N	\N	\N
10969	28	New Hampshire	005	Cheshire	0	28-005-	\N	\N	\N
10970	28	New Hampshire	007	Coos	0	28-007-	\N	\N	\N
10971	28	New Hampshire	009	Grafton	0	28-009-	\N	\N	\N
10972	28	New Hampshire	011	Hillsborough	0	28-011-	\N	\N	\N
10973	28	New Hampshire	013	Merrimack	0	28-013-	\N	\N	\N
10974	28	New Hampshire	015	Rockingham	0	28-015-	\N	\N	\N
10975	28	New Hampshire	017	Strafford	0	28-017-	\N	\N	\N
10976	28	New Hampshire	019	Sullivan	0	28-019-	\N	\N	\N
10977	28	New Hampshire	215	Rockingham Offshore	0	28-215-	\N	\N	\N
10978	29	New Jersey	001	Atlantic	0	29-001-	\N	\N	\N
10979	29	New Jersey	003	Bergen	0	29-003-	\N	\N	\N
10980	29	New Jersey	005	Burlington	0	29-005-	\N	\N	\N
10981	29	New Jersey	007	Camden	0	29-007-	\N	\N	\N
10982	29	New Jersey	009	Cape May	0	29-009-	\N	\N	\N
10983	29	New Jersey	011	Cumberland	0	29-011-	\N	\N	\N
10984	29	New Jersey	013	Essex	0	29-013-	\N	\N	\N
10985	29	New Jersey	015	Gloucester	0	29-015-	\N	\N	\N
10986	29	New Jersey	017	Hudson	0	29-017-	\N	\N	\N
10987	29	New Jersey	019	Hunterdon	0	29-019-	\N	\N	\N
10988	29	New Jersey	021	Mercer	0	29-021-	\N	\N	\N
10989	29	New Jersey	023	Middlesex	0	29-023-	\N	\N	\N
10990	29	New Jersey	025	Monmouth	0	29-025-	\N	\N	\N
10991	29	New Jersey	027	Morris	0	29-027-	\N	\N	\N
10992	29	New Jersey	029	Ocean	0	29-029-	\N	\N	\N
10993	29	New Jersey	031	Passaic	0	29-031-	\N	\N	\N
10994	29	New Jersey	033	Salem	0	29-033-	\N	\N	\N
10995	29	New Jersey	035	Somerset	0	29-035-	\N	\N	\N
10996	29	New Jersey	037	Sussex	0	29-037-	\N	\N	\N
10997	29	New Jersey	039	Union	0	29-039-	\N	\N	\N
10998	29	New Jersey	041	Warren	0	29-041-	\N	\N	\N
10999	29	New Jersey	118	Wilmington	0	29-118-	\N	\N	\N
11000	29	New Jersey	127	Hudson Canyon	0	29-127-	\N	\N	\N
11001	29	New Jersey	133	Block Canyon	0	29-133-	\N	\N	\N
11002	29	New Jersey	139	Veach Canyon	0	29-139-	\N	\N	\N
11003	29	New Jersey	201	Atlantic Offshore	0	29-201-	\N	\N	\N
11004	29	New Jersey	209	Cape May Offshore	0	29-209-	\N	\N	\N
11005	29	New Jersey	225	Monmouth Offshore	0	29-225-	\N	\N	\N
11006	29	New Jersey	229	Ocean Offshore	0	29-229-	\N	\N	\N
11007	30	New Mexico	001	Bernalillo	1	30-001-	\N	\N	\N
11008	30	New Mexico	003	Catron	1	30-003-	\N	\N	\N
11009	30	New Mexico	005	Chaves	1	30-005-	\N	\N	\N
11010	30	New Mexico	006	Cibola	1	30-006-	\N	\N	\N
11011	30	New Mexico	007	Colfax	1	30-007-	\N	\N	\N
11012	30	New Mexico	009	Curry	1	30-009-	\N	\N	\N
11013	30	New Mexico	011	De Baca	1	30-011-	\N	\N	\N
11014	30	New Mexico	013	Dona Ana	1	30-013-	\N	\N	\N
11015	30	New Mexico	015	Eddy	1	30-015-	\N	\N	\N
11016	30	New Mexico	017	Grant	1	30-017-	\N	\N	\N
11017	30	New Mexico	019	Guadalupe	1	30-019-	\N	\N	\N
11018	30	New Mexico	021	Harding	1	30-021-	\N	\N	\N
11019	30	New Mexico	023	Hidalgo	1	30-023-	\N	\N	\N
11020	30	New Mexico	025	Lea	1	30-025-	\N	\N	\N
11021	30	New Mexico	027	Lincoln	1	30-027-	\N	\N	\N
11022	30	New Mexico	028	Los Alamos	1	30-028-	\N	\N	\N
11023	30	New Mexico	029	Luna	1	30-029-	\N	\N	\N
11024	30	New Mexico	031	Mckinley	1	30-031-	\N	\N	\N
11025	30	New Mexico	033	Mora	1	30-033-	\N	\N	\N
11026	30	New Mexico	035	Otero	1	30-035-	\N	\N	\N
11027	30	New Mexico	037	Quay	1	30-037-	\N	\N	\N
11028	30	New Mexico	039	Rio Arriba	1	30-039-	\N	\N	\N
11029	30	New Mexico	041	Roosevelt	1	30-041-	\N	\N	\N
11030	30	New Mexico	043	Sandoval	1	30-043-	\N	\N	\N
11031	30	New Mexico	045	San Juan	1	30-045-	\N	\N	\N
11032	30	New Mexico	047	San Miguel	1	30-047-	\N	\N	\N
11033	30	New Mexico	049	Santa Fe	1	30-049-	\N	\N	\N
11034	30	New Mexico	051	Sierra	1	30-051-	\N	\N	\N
11035	30	New Mexico	053	Socorro	1	30-053-	\N	\N	\N
11036	30	New Mexico	055	Taos	1	30-055-	\N	\N	\N
11037	30	New Mexico	057	Torrance	1	30-057-	\N	\N	\N
11038	30	New Mexico	059	Union	1	30-059-	\N	\N	\N
11039	30	New Mexico	061	Valencia	1	30-061-	\N	\N	\N
11040	31	New York	001	Albany	0	31-001-	\N	\N	\N
11041	31	New York	003	Allegany	0	31-003-	\N	\N	\N
11042	31	New York	005	Bronx	0	31-005-	\N	\N	\N
11043	31	New York	007	Broome	0	31-007-	\N	\N	\N
11044	31	New York	009	Cattaraugus	0	31-009-	\N	\N	\N
11045	31	New York	011	Cayuga	0	31-011-	\N	\N	\N
11046	31	New York	013	Chautauqua	0	31-013-	\N	\N	\N
11047	31	New York	015	Chemung	0	31-015-	\N	\N	\N
11048	31	New York	017	Chenango	0	31-017-	\N	\N	\N
11049	31	New York	019	Clinton	0	31-019-	\N	\N	\N
11050	31	New York	021	Columbia	0	31-021-	\N	\N	\N
11051	31	New York	023	Cortland	0	31-023-	\N	\N	\N
11052	31	New York	025	Delaware	0	31-025-	\N	\N	\N
11053	31	New York	027	Dutchess	0	31-027-	\N	\N	\N
11054	31	New York	029	Erie	0	31-029-	\N	\N	\N
11055	31	New York	031	Essex	0	31-031-	\N	\N	\N
11056	31	New York	033	Franklin	0	31-033-	\N	\N	\N
11057	31	New York	035	Fulton	0	31-035-	\N	\N	\N
11058	31	New York	037	Genesee	0	31-037-	\N	\N	\N
11059	31	New York	039	Greene	0	31-039-	\N	\N	\N
11060	31	New York	041	Hamilton	0	31-041-	\N	\N	\N
11061	31	New York	043	Herkimer	0	31-043-	\N	\N	\N
11062	31	New York	045	Jefferson	0	31-045-	\N	\N	\N
11063	31	New York	047	Kings	0	31-047-	\N	\N	\N
11064	31	New York	049	Lewis	0	31-049-	\N	\N	\N
11065	31	New York	051	Livingston	0	31-051-	\N	\N	\N
11066	31	New York	053	Madison	0	31-053-	\N	\N	\N
11067	31	New York	055	Monroe	0	31-055-	\N	\N	\N
11068	31	New York	057	Montgomery	0	31-057-	\N	\N	\N
11069	31	New York	059	Nassau	0	31-059-	\N	\N	\N
11070	31	New York	061	New York	0	31-061-	\N	\N	\N
11071	31	New York	063	Niagara	0	31-063-	\N	\N	\N
11072	31	New York	065	Oneida	0	31-065-	\N	\N	\N
11073	31	New York	067	Onondaga	0	31-067-	\N	\N	\N
11074	31	New York	069	Ontario	0	31-069-	\N	\N	\N
11075	31	New York	071	Orange	0	31-071-	\N	\N	\N
11076	31	New York	073	Orleans	0	31-073-	\N	\N	\N
11077	31	New York	075	Oswego	0	31-075-	\N	\N	\N
11078	31	New York	077	Otsego	0	31-077-	\N	\N	\N
11079	31	New York	079	Putnam	0	31-079-	\N	\N	\N
11080	31	New York	081	Queens	0	31-081-	\N	\N	\N
11081	31	New York	083	Rensselaer	0	31-083-	\N	\N	\N
11082	31	New York	085	Richmond	0	31-085-	\N	\N	\N
11083	31	New York	087	Rockland	0	31-087-	\N	\N	\N
11084	31	New York	089	St Lawrence	0	31-089-	\N	\N	\N
11085	31	New York	091	Saratoga	0	31-091-	\N	\N	\N
11086	31	New York	093	Schenectady	0	31-093-	\N	\N	\N
11087	31	New York	095	Schoharie	0	31-095-	\N	\N	\N
11088	31	New York	097	Schuyler	0	31-097-	\N	\N	\N
11089	31	New York	099	Seneca	0	31-099-	\N	\N	\N
11090	31	New York	101	Steuben	0	31-101-	\N	\N	\N
11091	31	New York	103	Suffolk	0	31-103-	\N	\N	\N
11092	31	New York	105	Sullivan	0	31-105-	\N	\N	\N
11093	31	New York	107	Tioga	0	31-107-	\N	\N	\N
11094	31	New York	109	Tompkins	0	31-109-	\N	\N	\N
11095	31	New York	111	Ulster	0	31-111-	\N	\N	\N
11096	31	New York	113	Warren	0	31-113-	\N	\N	\N
11097	31	New York	115	Washington	0	31-115-	\N	\N	\N
11098	31	New York	117	Wayne	0	31-117-	\N	\N	\N
11099	31	New York	119	Westchester	0	31-119-	\N	\N	\N
11100	31	New York	121	Wyoming	0	31-121-	\N	\N	\N
11101	31	New York	123	Yates	0	31-123-	\N	\N	\N
11102	31	New York	134	Block Island Shelf	0	31-134-	\N	\N	\N
11103	31	New York	140	Hydrographer Canyon	0	31-140-	\N	\N	\N
11104	31	New York	141	Chatham	0	31-141-	\N	\N	\N
11105	31	New York	144	Lydonia Canyon	0	31-144-	\N	\N	\N
11106	31	New York	247	Kings Offshore	0	31-247-	\N	\N	\N
11107	31	New York	259	Nassau Offshore	0	31-259-	\N	\N	\N
11108	31	New York	281	Queens Offshore	0	31-281-	\N	\N	\N
11109	31	New York	285	Richmond Offshore	0	31-285-	\N	\N	\N
11110	31	New York	303	Suffolk Offshore	0	31-303-	\N	\N	\N
11111	31	New York	531	Lake Erie	0	31-531-	\N	\N	\N
11112	31	New York	560	Lake Ontario	0	31-560-	\N	\N	\N
11113	32	North Carolina	001	Alamance	0	32-001-	\N	\N	\N
11114	32	North Carolina	003	Alexander	0	32-003-	\N	\N	\N
11115	32	North Carolina	005	Alleghany	0	32-005-	\N	\N	\N
11116	32	North Carolina	007	Anson	0	32-007-	\N	\N	\N
11117	32	North Carolina	009	Ashe	0	32-009-	\N	\N	\N
11118	32	North Carolina	011	Avery	0	32-011-	\N	\N	\N
11119	32	North Carolina	013	Beaufort	0	32-013-	\N	\N	\N
11120	32	North Carolina	015	Bertie	0	32-015-	\N	\N	\N
11121	32	North Carolina	017	Bladen	0	32-017-	\N	\N	\N
11122	32	North Carolina	019	Brunswick	0	32-019-	\N	\N	\N
11123	32	North Carolina	021	Buncombe	0	32-021-	\N	\N	\N
11124	32	North Carolina	023	Burke	0	32-023-	\N	\N	\N
11125	32	North Carolina	025	Cabarrus	0	32-025-	\N	\N	\N
11126	32	North Carolina	027	Caldwell	0	32-027-	\N	\N	\N
11127	32	North Carolina	029	Camden	0	32-029-	\N	\N	\N
11128	32	North Carolina	030	Cape Fear	0	32-030-	\N	\N	\N
11129	32	North Carolina	031	Carteret	0	32-031-	\N	\N	\N
11130	32	North Carolina	033	Caswell	0	32-033-	\N	\N	\N
11131	32	North Carolina	035	Catawba	0	32-035-	\N	\N	\N
11132	32	North Carolina	037	Chatham	0	32-037-	\N	\N	\N
11133	32	North Carolina	039	Cherokee	0	32-039-	\N	\N	\N
11134	32	North Carolina	041	Chowan	0	32-041-	\N	\N	\N
11135	32	North Carolina	043	Clay	0	32-043-	\N	\N	\N
11136	32	North Carolina	045	Cleveland	0	32-045-	\N	\N	\N
11137	32	North Carolina	047	Columbus	0	32-047-	\N	\N	\N
11138	32	North Carolina	049	Craven	0	32-049-	\N	\N	\N
11139	32	North Carolina	051	Cumberland	0	32-051-	\N	\N	\N
11140	32	North Carolina	053	Currituck	0	32-053-	\N	\N	\N
11141	32	North Carolina	055	Dare	0	32-055-	\N	\N	\N
11142	32	North Carolina	057	Davidson	0	32-057-	\N	\N	\N
11143	32	North Carolina	059	Davie	0	32-059-	\N	\N	\N
11144	32	North Carolina	061	Duplin	0	32-061-	\N	\N	\N
11145	32	North Carolina	063	Durham	0	32-063-	\N	\N	\N
11146	32	North Carolina	065	Edgecombe	0	32-065-	\N	\N	\N
11147	32	North Carolina	067	Forsyth	0	32-067-	\N	\N	\N
11148	32	North Carolina	069	Franklin	0	32-069-	\N	\N	\N
11149	32	North Carolina	071	Gaston	0	32-071-	\N	\N	\N
11150	32	North Carolina	073	Gates	0	32-073-	\N	\N	\N
11151	32	North Carolina	075	Graham	0	32-075-	\N	\N	\N
11152	32	North Carolina	077	Granville	0	32-077-	\N	\N	\N
11153	32	North Carolina	079	Greene	0	32-079-	\N	\N	\N
11154	32	North Carolina	081	Guilford	0	32-081-	\N	\N	\N
11155	32	North Carolina	083	Halifax	0	32-083-	\N	\N	\N
11156	32	North Carolina	085	Harnett	0	32-085-	\N	\N	\N
11157	32	North Carolina	087	Haywood	0	32-087-	\N	\N	\N
11158	32	North Carolina	089	Henderson	0	32-089-	\N	\N	\N
11159	32	North Carolina	091	Hertford	0	32-091-	\N	\N	\N
11160	32	North Carolina	093	Hoke	0	32-093-	\N	\N	\N
11161	32	North Carolina	095	Hyde	0	32-095-	\N	\N	\N
11162	32	North Carolina	097	Iredell	0	32-097-	\N	\N	\N
11163	32	North Carolina	099	Jackson	0	32-099-	\N	\N	\N
11164	32	North Carolina	101	Johnston	0	32-101-	\N	\N	\N
11165	32	North Carolina	103	Jones	0	32-103-	\N	\N	\N
11166	32	North Carolina	105	Lee	0	32-105-	\N	\N	\N
11167	32	North Carolina	107	Lenoir	0	32-107-	\N	\N	\N
11168	32	North Carolina	109	Lincoln	0	32-109-	\N	\N	\N
11169	32	North Carolina	111	Mc Dowell	0	32-111-	\N	\N	\N
11170	32	North Carolina	113	Macon	0	32-113-	\N	\N	\N
11171	32	North Carolina	115	Madison	0	32-115-	\N	\N	\N
11172	32	North Carolina	116	Manteo	0	32-116-	\N	\N	\N
11173	32	North Carolina	117	Martin	0	32-117-	\N	\N	\N
11174	32	North Carolina	119	Mecklenburg	0	32-119-	\N	\N	\N
11175	32	North Carolina	121	Mitchell	0	32-121-	\N	\N	\N
11176	32	North Carolina	123	Montgomery	0	32-123-	\N	\N	\N
11177	32	North Carolina	125	Moore	0	32-125-	\N	\N	\N
11178	32	North Carolina	127	Nash	0	32-127-	\N	\N	\N
11179	32	North Carolina	129	New Hanover	0	32-129-	\N	\N	\N
11180	32	North Carolina	131	Northampton	0	32-131-	\N	\N	\N
11181	32	North Carolina	133	Onslow	0	32-133-	\N	\N	\N
11182	32	North Carolina	135	Orange	0	32-135-	\N	\N	\N
11183	32	North Carolina	137	Pamlico	0	32-137-	\N	\N	\N
11184	32	North Carolina	139	Pasquotank	0	32-139-	\N	\N	\N
11185	32	North Carolina	141	Pender	0	32-141-	\N	\N	\N
11186	32	North Carolina	143	Perquimans	0	32-143-	\N	\N	\N
11187	32	North Carolina	145	Person	0	32-145-	\N	\N	\N
11188	32	North Carolina	147	Pitt	0	32-147-	\N	\N	\N
11189	32	North Carolina	149	Polk	0	32-149-	\N	\N	\N
11190	32	North Carolina	151	Randolph	0	32-151-	\N	\N	\N
11191	32	North Carolina	153	Richmond	0	32-153-	\N	\N	\N
11192	32	North Carolina	155	Robeson	0	32-155-	\N	\N	\N
11193	32	North Carolina	157	Rockingham	0	32-157-	\N	\N	\N
11194	32	North Carolina	159	Rowan	0	32-159-	\N	\N	\N
11195	32	North Carolina	160	Russell	0	32-160-	\N	\N	\N
11196	32	North Carolina	161	Rutherford	0	32-161-	\N	\N	\N
11197	32	North Carolina	163	Sampson	0	32-163-	\N	\N	\N
11198	32	North Carolina	165	Scotland	0	32-165-	\N	\N	\N
11199	32	North Carolina	167	Stanly	0	32-167-	\N	\N	\N
11200	32	North Carolina	169	Stokes	0	32-169-	\N	\N	\N
11201	32	North Carolina	171	Surry	0	32-171-	\N	\N	\N
11202	32	North Carolina	173	Swain	0	32-173-	\N	\N	\N
11203	32	North Carolina	175	Transylvania	0	32-175-	\N	\N	\N
11204	32	North Carolina	177	Tyrrell	0	32-177-	\N	\N	\N
11205	32	North Carolina	179	Union	0	32-179-	\N	\N	\N
11206	32	North Carolina	181	Vance	0	32-181-	\N	\N	\N
11207	32	North Carolina	183	Wake	0	32-183-	\N	\N	\N
11208	32	North Carolina	185	Warren	0	32-185-	\N	\N	\N
11209	32	North Carolina	187	Washington	0	32-187-	\N	\N	\N
11210	32	North Carolina	189	Watauga	0	32-189-	\N	\N	\N
11211	32	North Carolina	191	Wayne	0	32-191-	\N	\N	\N
11212	32	North Carolina	193	Wilkes	0	32-193-	\N	\N	\N
11213	32	North Carolina	195	Wilson	0	32-195-	\N	\N	\N
11214	32	North Carolina	197	Yadkin	0	32-197-	\N	\N	\N
11215	32	North Carolina	199	Yancey	0	32-199-	\N	\N	\N
11216	32	North Carolina	219	Brunswick Offshore	0	32-219-	\N	\N	\N
11217	32	North Carolina	231	Carteret Offshore	0	32-231-	\N	\N	\N
11218	32	North Carolina	253	Currituck Offshore	0	32-253-	\N	\N	\N
11219	32	North Carolina	255	Dare Offshore	0	32-255-	\N	\N	\N
11220	32	North Carolina	295	Hyde Offshore	0	32-295-	\N	\N	\N
11221	32	North Carolina	329	New Hanover Offshore	0	32-329-	\N	\N	\N
11222	32	North Carolina	333	Onslow Offshore	0	32-333-	\N	\N	\N
11223	32	North Carolina	341	Pender Offshore	0	32-341-	\N	\N	\N
11224	33	North Dakota	001	Adams	1	33-001-	\N	\N	\N
11225	33	North Dakota	003	Barnes	1	33-003-	\N	\N	\N
11226	33	North Dakota	005	Benson	1	33-005-	\N	\N	\N
11227	33	North Dakota	007	Billings	1	33-007-	\N	\N	\N
11228	33	North Dakota	009	Bottineau	1	33-009-	\N	\N	\N
11229	33	North Dakota	011	Bowman	1	33-011-	\N	\N	\N
11230	33	North Dakota	013	Burke	1	33-013-	\N	\N	\N
11231	33	North Dakota	015	Burleigh	1	33-015-	\N	\N	\N
11232	33	North Dakota	017	Cass	1	33-017-	\N	\N	\N
11233	33	North Dakota	019	Cavalier	1	33-019-	\N	\N	\N
11234	33	North Dakota	021	Dickey	1	33-021-	\N	\N	\N
11235	33	North Dakota	023	Divide	1	33-023-	\N	\N	\N
11236	33	North Dakota	025	Dunn	1	33-025-	\N	\N	\N
11237	33	North Dakota	027	Eddy	1	33-027-	\N	\N	\N
11238	33	North Dakota	029	Emmons	1	33-029-	\N	\N	\N
11239	33	North Dakota	031	Foster	1	33-031-	\N	\N	\N
11240	33	North Dakota	033	Golden Valley	1	33-033-	\N	\N	\N
11241	33	North Dakota	035	Grand Forks	1	33-035-	\N	\N	\N
11242	33	North Dakota	037	Grant	1	33-037-	\N	\N	\N
11243	33	North Dakota	039	Griggs	1	33-039-	\N	\N	\N
11244	33	North Dakota	041	Hettinger	1	33-041-	\N	\N	\N
11245	33	North Dakota	043	Kidder	1	33-043-	\N	\N	\N
11246	33	North Dakota	045	La Moure	1	33-045-	\N	\N	\N
11247	33	North Dakota	047	Logan	1	33-047-	\N	\N	\N
11248	33	North Dakota	049	Mc Henry	1	33-049-	\N	\N	\N
11249	33	North Dakota	051	Mc Intosh	1	33-051-	\N	\N	\N
11250	33	North Dakota	053	Mc Kenzie	1	33-053-	\N	\N	\N
11251	33	North Dakota	055	Mclean	1	33-055-	\N	\N	\N
11252	33	North Dakota	057	Mercer	1	33-057-	\N	\N	\N
11253	33	North Dakota	059	Morton	1	33-059-	\N	\N	\N
11254	33	North Dakota	061	Mountrail	1	33-061-	\N	\N	\N
11255	33	North Dakota	063	Nelson	1	33-063-	\N	\N	\N
11256	33	North Dakota	065	Oliver	1	33-065-	\N	\N	\N
11257	33	North Dakota	067	Pembina	1	33-067-	\N	\N	\N
11258	33	North Dakota	069	Pierce	1	33-069-	\N	\N	\N
11259	33	North Dakota	071	Ramsey	1	33-071-	\N	\N	\N
11260	33	North Dakota	073	Ransom	1	33-073-	\N	\N	\N
11261	33	North Dakota	075	Renville	1	33-075-	\N	\N	\N
11262	33	North Dakota	077	Richland	1	33-077-	\N	\N	\N
11263	33	North Dakota	079	Rolette	1	33-079-	\N	\N	\N
11264	33	North Dakota	081	Sargent	1	33-081-	\N	\N	\N
11265	33	North Dakota	083	Sheridan	1	33-083-	\N	\N	\N
11266	33	North Dakota	085	Sioux	1	33-085-	\N	\N	\N
11267	33	North Dakota	087	Slope	1	33-087-	\N	\N	\N
11268	33	North Dakota	089	Stark	1	33-089-	\N	\N	\N
11269	33	North Dakota	091	Steele	1	33-091-	\N	\N	\N
11270	33	North Dakota	093	Stutsman	1	33-093-	\N	\N	\N
11271	33	North Dakota	095	Towner	1	33-095-	\N	\N	\N
11272	33	North Dakota	097	Traill	1	33-097-	\N	\N	\N
11273	33	North Dakota	099	Walsh	1	33-099-	\N	\N	\N
11274	33	North Dakota	101	Ward	1	33-101-	\N	\N	\N
11275	33	North Dakota	103	Wells	1	33-103-	\N	\N	\N
11276	33	North Dakota	105	Williams	1	33-105-	\N	\N	\N
11277	34	Ohio	001	Adams	0	34-001-	\N	\N	\N
11278	34	Ohio	003	Allen	0	34-003-	\N	\N	\N
11279	34	Ohio	005	Ashland	0	34-005-	\N	\N	\N
11280	34	Ohio	007	Ashtabula	0	34-007-	\N	\N	\N
11281	34	Ohio	009	Athens	0	34-009-	\N	\N	\N
11282	34	Ohio	011	Auglaize	0	34-011-	\N	\N	\N
11283	34	Ohio	013	Belmont	0	34-013-	\N	\N	\N
11284	34	Ohio	015	Brown	0	34-015-	\N	\N	\N
11285	34	Ohio	017	Butler	0	34-017-	\N	\N	\N
11286	34	Ohio	019	Carroll	0	34-019-	\N	\N	\N
11287	34	Ohio	021	Champaign	0	34-021-	\N	\N	\N
11288	34	Ohio	023	Clark	0	34-023-	\N	\N	\N
11289	34	Ohio	025	Clermont	0	34-025-	\N	\N	\N
11290	34	Ohio	027	Clinton	0	34-027-	\N	\N	\N
11291	34	Ohio	029	Columbiana	0	34-029-	\N	\N	\N
11292	34	Ohio	031	Coshocton	0	34-031-	\N	\N	\N
11293	34	Ohio	033	Crawford	0	34-033-	\N	\N	\N
11294	34	Ohio	035	Cuyahoga	0	34-035-	\N	\N	\N
11295	34	Ohio	037	Darke	0	34-037-	\N	\N	\N
11296	34	Ohio	039	Defiance	0	34-039-	\N	\N	\N
11297	34	Ohio	041	Delaware	0	34-041-	\N	\N	\N
11298	34	Ohio	043	Erie	0	34-043-	\N	\N	\N
11299	34	Ohio	045	Fairfield	0	34-045-	\N	\N	\N
11300	34	Ohio	047	Fayette	0	34-047-	\N	\N	\N
11301	34	Ohio	049	Franklin	0	34-049-	\N	\N	\N
11302	34	Ohio	051	Fulton	0	34-051-	\N	\N	\N
11303	34	Ohio	053	Gallia	0	34-053-	\N	\N	\N
11304	34	Ohio	055	Geauga	0	34-055-	\N	\N	\N
11305	34	Ohio	057	Greene	0	34-057-	\N	\N	\N
11306	34	Ohio	059	Guernsey	0	34-059-	\N	\N	\N
11307	34	Ohio	061	Hamilton	0	34-061-	\N	\N	\N
11308	34	Ohio	063	Hancock	0	34-063-	\N	\N	\N
11309	34	Ohio	065	Hardin	0	34-065-	\N	\N	\N
11310	34	Ohio	067	Harrison	0	34-067-	\N	\N	\N
11311	34	Ohio	069	Henry	0	34-069-	\N	\N	\N
11312	34	Ohio	071	Highland	0	34-071-	\N	\N	\N
11313	34	Ohio	073	Hocking	0	34-073-	\N	\N	\N
11314	34	Ohio	075	Holmes	0	34-075-	\N	\N	\N
11315	34	Ohio	077	Huron	0	34-077-	\N	\N	\N
11316	34	Ohio	079	Jackson	0	34-079-	\N	\N	\N
11317	34	Ohio	081	Jefferson	0	34-081-	\N	\N	\N
11318	34	Ohio	083	Knox	0	34-083-	\N	\N	\N
11319	34	Ohio	085	Lake	0	34-085-	\N	\N	\N
11320	34	Ohio	087	Lawrence	0	34-087-	\N	\N	\N
11321	34	Ohio	089	Licking	0	34-089-	\N	\N	\N
11322	34	Ohio	091	Logan	0	34-091-	\N	\N	\N
11323	34	Ohio	093	Lorain	0	34-093-	\N	\N	\N
11324	34	Ohio	095	Lucas	0	34-095-	\N	\N	\N
11325	34	Ohio	097	Madison	0	34-097-	\N	\N	\N
11326	34	Ohio	099	Mahoning	0	34-099-	\N	\N	\N
11327	34	Ohio	101	Marion	0	34-101-	\N	\N	\N
11328	34	Ohio	103	Medina	0	34-103-	\N	\N	\N
11329	34	Ohio	105	Meigs	0	34-105-	\N	\N	\N
11330	34	Ohio	107	Mercer	0	34-107-	\N	\N	\N
11331	34	Ohio	109	Miami	0	34-109-	\N	\N	\N
11332	34	Ohio	111	Monroe	0	34-111-	\N	\N	\N
11333	34	Ohio	113	Montgomery	0	34-113-	\N	\N	\N
11334	34	Ohio	115	Morgan	0	34-115-	\N	\N	\N
11335	34	Ohio	117	Morrow	0	34-117-	\N	\N	\N
11336	34	Ohio	119	Muskingum	0	34-119-	\N	\N	\N
11337	34	Ohio	121	Noble	0	34-121-	\N	\N	\N
11338	34	Ohio	123	Ottawa	0	34-123-	\N	\N	\N
11339	34	Ohio	125	Paulding	0	34-125-	\N	\N	\N
11340	34	Ohio	127	Perry	0	34-127-	\N	\N	\N
11341	34	Ohio	129	Pickaway	0	34-129-	\N	\N	\N
11342	34	Ohio	131	Pike	0	34-131-	\N	\N	\N
11343	34	Ohio	133	Portage	0	34-133-	\N	\N	\N
11344	34	Ohio	135	Preble	0	34-135-	\N	\N	\N
11345	34	Ohio	137	Putnam	0	34-137-	\N	\N	\N
11346	34	Ohio	139	Richland	0	34-139-	\N	\N	\N
11347	34	Ohio	141	Ross	0	34-141-	\N	\N	\N
11348	34	Ohio	143	Sandusky	0	34-143-	\N	\N	\N
11349	34	Ohio	145	Scioto	0	34-145-	\N	\N	\N
11350	34	Ohio	147	Seneca	0	34-147-	\N	\N	\N
11351	34	Ohio	149	Shelby	0	34-149-	\N	\N	\N
11352	34	Ohio	151	Stark	0	34-151-	\N	\N	\N
11353	34	Ohio	153	Summit	0	34-153-	\N	\N	\N
11354	34	Ohio	155	Trumbull	0	34-155-	\N	\N	\N
11355	34	Ohio	157	Tuscarawas	0	34-157-	\N	\N	\N
11356	34	Ohio	159	Union	0	34-159-	\N	\N	\N
11357	34	Ohio	161	Van Wert	0	34-161-	\N	\N	\N
11358	34	Ohio	163	Vinton	0	34-163-	\N	\N	\N
11359	34	Ohio	165	Warren	0	34-165-	\N	\N	\N
11360	34	Ohio	167	Washington	0	34-167-	\N	\N	\N
11361	34	Ohio	169	Wayne	0	34-169-	\N	\N	\N
11362	34	Ohio	171	Williams	0	34-171-	\N	\N	\N
11363	34	Ohio	173	Wood	0	34-173-	\N	\N	\N
11364	34	Ohio	175	Wyandot	0	34-175-	\N	\N	\N
11365	34	Ohio	534	Lake Erie	0	34-534-	\N	\N	\N
11366	35	Oklahoma	001	Adair	1	35-001-	\N	\N	\N
11367	35	Oklahoma	003	Alfalfa	1	35-003-	\N	\N	\N
11368	35	Oklahoma	005	Atoka	1	35-005-	\N	\N	\N
11369	35	Oklahoma	007	Beaver	1	35-007-	\N	\N	\N
11370	35	Oklahoma	009	Beckham	1	35-009-	\N	\N	\N
11371	35	Oklahoma	011	Blaine	1	35-011-	\N	\N	\N
11372	35	Oklahoma	013	Bryan	1	35-013-	\N	\N	\N
11373	35	Oklahoma	015	Caddo	1	35-015-	\N	\N	\N
11374	35	Oklahoma	017	Canadian	1	35-017-	\N	\N	\N
11375	35	Oklahoma	019	Carter	1	35-019-	\N	\N	\N
11376	35	Oklahoma	021	Cherokee	1	35-021-	\N	\N	\N
11377	35	Oklahoma	023	Choctaw	1	35-023-	\N	\N	\N
11378	35	Oklahoma	025	Cimarron	1	35-025-	\N	\N	\N
11379	35	Oklahoma	027	Cleveland	1	35-027-	\N	\N	\N
11380	35	Oklahoma	029	Coal	1	35-029-	\N	\N	\N
11381	35	Oklahoma	031	Comanche	1	35-031-	\N	\N	\N
11382	35	Oklahoma	033	Cotton	1	35-033-	\N	\N	\N
11383	35	Oklahoma	035	Craig	1	35-035-	\N	\N	\N
11384	35	Oklahoma	037	Creek	1	35-037-	\N	\N	\N
11385	35	Oklahoma	039	Custer	1	35-039-	\N	\N	\N
11386	35	Oklahoma	041	Delaware	1	35-041-	\N	\N	\N
11387	35	Oklahoma	043	Dewey	1	35-043-	\N	\N	\N
11388	35	Oklahoma	045	Ellis	1	35-045-	\N	\N	\N
11389	35	Oklahoma	047	Garfield	1	35-047-	\N	\N	\N
11390	35	Oklahoma	049	Garvin	1	35-049-	\N	\N	\N
11391	35	Oklahoma	051	Grady	1	35-051-	\N	\N	\N
11392	35	Oklahoma	053	Grant	1	35-053-	\N	\N	\N
11393	35	Oklahoma	055	Greer	1	35-055-	\N	\N	\N
11394	35	Oklahoma	057	Harmon	1	35-057-	\N	\N	\N
11395	35	Oklahoma	059	Harper	1	35-059-	\N	\N	\N
11396	35	Oklahoma	061	Haskell	1	35-061-	\N	\N	\N
11397	35	Oklahoma	063	Hughes	1	35-063-	\N	\N	\N
11398	35	Oklahoma	065	Jackson	1	35-065-	\N	\N	\N
11399	35	Oklahoma	067	Jefferson	1	35-067-	\N	\N	\N
11400	35	Oklahoma	069	Johnston	1	35-069-	\N	\N	\N
11401	35	Oklahoma	071	Kay	1	35-071-	\N	\N	\N
11402	35	Oklahoma	073	Kingfisher	1	35-073-	\N	\N	\N
11403	35	Oklahoma	075	Kiowa	1	35-075-	\N	\N	\N
11404	35	Oklahoma	077	Latimer	1	35-077-	\N	\N	\N
11405	35	Oklahoma	079	Le Flore	1	35-079-	\N	\N	\N
11406	35	Oklahoma	081	Lincoln	1	35-081-	\N	\N	\N
11407	35	Oklahoma	083	Logan	1	35-083-	\N	\N	\N
11408	35	Oklahoma	085	Love	1	35-085-	\N	\N	\N
11409	35	Oklahoma	087	Mc Clain	1	35-087-	\N	\N	\N
11410	35	Oklahoma	089	Mc Curtain	1	35-089-	\N	\N	\N
11411	35	Oklahoma	091	Mc Intosh	1	35-091-	\N	\N	\N
11412	35	Oklahoma	093	Major	1	35-093-	\N	\N	\N
11413	35	Oklahoma	095	Marshall	1	35-095-	\N	\N	\N
11414	35	Oklahoma	097	Mayes	1	35-097-	\N	\N	\N
11415	35	Oklahoma	099	Murray	1	35-099-	\N	\N	\N
11416	35	Oklahoma	101	Muskogee	1	35-101-	\N	\N	\N
11417	35	Oklahoma	103	Noble	1	35-103-	\N	\N	\N
11418	35	Oklahoma	105	Nowata	1	35-105-	\N	\N	\N
11419	35	Oklahoma	107	Okfuskee	1	35-107-	\N	\N	\N
11420	35	Oklahoma	109	Oklahoma	1	35-109-	\N	\N	\N
11421	35	Oklahoma	111	Okmulgee	1	35-111-	\N	\N	\N
11422	35	Oklahoma	113	Osage	1	35-113-	\N	\N	\N
11423	35	Oklahoma	115	Ottawa	1	35-115-	\N	\N	\N
11424	35	Oklahoma	117	Pawnee	1	35-117-	\N	\N	\N
11425	35	Oklahoma	119	Payne	1	35-119-	\N	\N	\N
11426	35	Oklahoma	121	Pittsburg	1	35-121-	\N	\N	\N
11427	35	Oklahoma	123	Pontotoc	1	35-123-	\N	\N	\N
11428	35	Oklahoma	125	Pottawatomie	1	35-125-	\N	\N	\N
11429	35	Oklahoma	127	Pushmataha	1	35-127-	\N	\N	\N
11430	35	Oklahoma	129	Roger Mills	1	35-129-	\N	\N	\N
11431	35	Oklahoma	131	Rogers	1	35-131-	\N	\N	\N
11432	35	Oklahoma	133	Seminole	1	35-133-	\N	\N	\N
11433	35	Oklahoma	135	Sequoyah	1	35-135-	\N	\N	\N
11434	35	Oklahoma	137	Stephens	1	35-137-	\N	\N	\N
11435	35	Oklahoma	139	Texas	1	35-139-	\N	\N	\N
11436	35	Oklahoma	141	Tillman	1	35-141-	\N	\N	\N
11437	35	Oklahoma	143	Tulsa	1	35-143-	\N	\N	\N
11438	35	Oklahoma	145	Wagoner	1	35-145-	\N	\N	\N
11439	35	Oklahoma	147	Washington	1	35-147-	\N	\N	\N
11440	35	Oklahoma	149	Washita	1	35-149-	\N	\N	\N
11441	35	Oklahoma	151	Woods	1	35-151-	\N	\N	\N
11442	35	Oklahoma	153	Woodward	1	35-153-	\N	\N	\N
11443	36	Oregon	001	Baker	0	36-001-	\N	\N	\N
11444	36	Oregon	003	Benton	0	36-003-	\N	\N	\N
11445	36	Oregon	005	Clackamas	0	36-005-	\N	\N	\N
11446	36	Oregon	007	Clatsop	0	36-007-	\N	\N	\N
11447	36	Oregon	009	Columbia	0	36-009-	\N	\N	\N
11448	36	Oregon	011	Coos	0	36-011-	\N	\N	\N
11449	36	Oregon	013	Crook	0	36-013-	\N	\N	\N
11450	36	Oregon	015	Curry	0	36-015-	\N	\N	\N
11451	36	Oregon	017	Deschutes	0	36-017-	\N	\N	\N
11452	36	Oregon	019	Douglas	0	36-019-	\N	\N	\N
11453	36	Oregon	021	Gilliam	0	36-021-	\N	\N	\N
11454	36	Oregon	023	Grant	0	36-023-	\N	\N	\N
11455	36	Oregon	025	Harney	0	36-025-	\N	\N	\N
11456	36	Oregon	027	Hood River	0	36-027-	\N	\N	\N
11457	36	Oregon	029	Jackson	0	36-029-	\N	\N	\N
11458	36	Oregon	031	Jefferson	0	36-031-	\N	\N	\N
11459	36	Oregon	033	Josephine	0	36-033-	\N	\N	\N
11460	36	Oregon	035	Klamath	0	36-035-	\N	\N	\N
11461	36	Oregon	037	Lake	0	36-037-	\N	\N	\N
11462	36	Oregon	039	Lane	0	36-039-	\N	\N	\N
11463	36	Oregon	041	Lincoln	0	36-041-	\N	\N	\N
11464	36	Oregon	043	Linn	0	36-043-	\N	\N	\N
11465	36	Oregon	045	Malheur	0	36-045-	\N	\N	\N
11466	36	Oregon	047	Marion	0	36-047-	\N	\N	\N
11467	36	Oregon	049	Morrow	0	36-049-	\N	\N	\N
11468	36	Oregon	051	Multnomah	0	36-051-	\N	\N	\N
11469	36	Oregon	053	Polk	0	36-053-	\N	\N	\N
11470	36	Oregon	055	Sherman	0	36-055-	\N	\N	\N
11471	36	Oregon	057	Tillamook	0	36-057-	\N	\N	\N
11472	36	Oregon	059	Umatilla	0	36-059-	\N	\N	\N
11473	36	Oregon	061	Union	0	36-061-	\N	\N	\N
11474	36	Oregon	063	Wallowa	0	36-063-	\N	\N	\N
11475	36	Oregon	065	Wasco	0	36-065-	\N	\N	\N
11476	36	Oregon	067	Washington	0	36-067-	\N	\N	\N
11477	36	Oregon	069	Wheeler	0	36-069-	\N	\N	\N
11478	36	Oregon	071	Yamhill	0	36-071-	\N	\N	\N
11479	36	Oregon	207	Clatsop Offshore	0	36-207-	\N	\N	\N
11480	36	Oregon	211	Coos Offshore	0	36-211-	\N	\N	\N
11481	36	Oregon	215	Curry Offshore	0	36-215-	\N	\N	\N
11482	36	Oregon	219	Douglas Offshore	0	36-219-	\N	\N	\N
11483	36	Oregon	239	Lane Offshore	0	36-239-	\N	\N	\N
11484	36	Oregon	241	Lincoln Offshore	0	36-241-	\N	\N	\N
11485	36	Oregon	257	Tillamook Offshore	0	36-257-	\N	\N	\N
11486	37	Pennsylvania	001	Adams	1	37-001-	\N	\N	\N
11487	37	Pennsylvania	003	Allegheny	1	37-003-	\N	\N	\N
11488	37	Pennsylvania	005	Armstrong	1	37-005-	\N	\N	\N
11489	37	Pennsylvania	007	Beaver	1	37-007-	\N	\N	\N
11490	37	Pennsylvania	009	Bedford	1	37-009-	\N	\N	\N
11491	37	Pennsylvania	011	Berks	1	37-011-	\N	\N	\N
11492	37	Pennsylvania	013	Blair	1	37-013-	\N	\N	\N
11493	37	Pennsylvania	015	Bradford	1	37-015-	\N	\N	\N
11494	37	Pennsylvania	017	Bucks	1	37-017-	\N	\N	\N
11495	37	Pennsylvania	019	Butler	1	37-019-	\N	\N	\N
11496	37	Pennsylvania	021	Cambria	1	37-021-	\N	\N	\N
11497	37	Pennsylvania	023	Cameron	1	37-023-	\N	\N	\N
11498	37	Pennsylvania	025	Carbon	1	37-025-	\N	\N	\N
11499	37	Pennsylvania	027	Centre	1	37-027-	\N	\N	\N
11500	37	Pennsylvania	029	Chester	1	37-029-	\N	\N	\N
11501	37	Pennsylvania	031	Clarion	1	37-031-	\N	\N	\N
11502	37	Pennsylvania	033	Clearfield	1	37-033-	\N	\N	\N
11503	37	Pennsylvania	035	Clinton	1	37-035-	\N	\N	\N
11504	37	Pennsylvania	037	Columbia	1	37-037-	\N	\N	\N
11505	37	Pennsylvania	039	Crawford	1	37-039-	\N	\N	\N
11506	37	Pennsylvania	041	Cumberland	1	37-041-	\N	\N	\N
11507	37	Pennsylvania	043	Dauphin	1	37-043-	\N	\N	\N
11508	37	Pennsylvania	045	Delaware	1	37-045-	\N	\N	\N
11509	37	Pennsylvania	047	Elk	1	37-047-	\N	\N	\N
11510	37	Pennsylvania	049	Erie	1	37-049-	\N	\N	\N
11511	37	Pennsylvania	051	Fayette	1	37-051-	\N	\N	\N
11512	37	Pennsylvania	053	Forest	1	37-053-	\N	\N	\N
11513	37	Pennsylvania	055	Franklin	1	37-055-	\N	\N	\N
11514	37	Pennsylvania	057	Fulton	1	37-057-	\N	\N	\N
11515	37	Pennsylvania	059	Greene	1	37-059-	\N	\N	\N
11516	37	Pennsylvania	061	Huntingdon	1	37-061-	\N	\N	\N
11517	37	Pennsylvania	063	Indiana	1	37-063-	\N	\N	\N
11518	37	Pennsylvania	065	Jefferson	1	37-065-	\N	\N	\N
11519	37	Pennsylvania	067	Juniata	1	37-067-	\N	\N	\N
11520	37	Pennsylvania	069	Lackawanna	1	37-069-	\N	\N	\N
11521	37	Pennsylvania	071	Lancaster	1	37-071-	\N	\N	\N
11522	37	Pennsylvania	073	Lawrence	1	37-073-	\N	\N	\N
11523	37	Pennsylvania	075	Lebanon	1	37-075-	\N	\N	\N
11524	37	Pennsylvania	077	Lehigh	1	37-077-	\N	\N	\N
11525	37	Pennsylvania	079	Luzerne	1	37-079-	\N	\N	\N
11526	37	Pennsylvania	081	Lycoming	1	37-081-	\N	\N	\N
11527	37	Pennsylvania	083	Mc Kean	1	37-083-	\N	\N	\N
11528	37	Pennsylvania	085	Mercer	1	37-085-	\N	\N	\N
11529	37	Pennsylvania	087	Mifflin	1	37-087-	\N	\N	\N
11530	37	Pennsylvania	089	Monroe	1	37-089-	\N	\N	\N
11531	37	Pennsylvania	091	Montgomery	1	37-091-	\N	\N	\N
11532	37	Pennsylvania	093	Montour	1	37-093-	\N	\N	\N
11533	37	Pennsylvania	095	Northampton	1	37-095-	\N	\N	\N
11534	37	Pennsylvania	097	Northumberland	1	37-097-	\N	\N	\N
11535	37	Pennsylvania	099	Perry	1	37-099-	\N	\N	\N
11536	37	Pennsylvania	101	Philadelphia	1	37-101-	\N	\N	\N
11537	37	Pennsylvania	103	Pike	1	37-103-	\N	\N	\N
11538	37	Pennsylvania	105	Potter	1	37-105-	\N	\N	\N
11539	37	Pennsylvania	107	Schuylkill	1	37-107-	\N	\N	\N
11540	37	Pennsylvania	109	Snyder	1	37-109-	\N	\N	\N
11541	37	Pennsylvania	111	Somerset	1	37-111-	\N	\N	\N
11542	37	Pennsylvania	113	Sullivan	1	37-113-	\N	\N	\N
11543	37	Pennsylvania	115	Susquehanna	1	37-115-	\N	\N	\N
11544	37	Pennsylvania	117	Tioga	1	37-117-	\N	\N	\N
11545	37	Pennsylvania	119	Union	1	37-119-	\N	\N	\N
11546	37	Pennsylvania	121	Venango	1	37-121-	\N	\N	\N
11547	37	Pennsylvania	123	Warren	1	37-123-	\N	\N	\N
11548	37	Pennsylvania	125	Washington	1	37-125-	\N	\N	\N
11549	37	Pennsylvania	127	Wayne	1	37-127-	\N	\N	\N
11550	37	Pennsylvania	129	Westmoreland	1	37-129-	\N	\N	\N
11551	37	Pennsylvania	131	Wyoming	1	37-131-	\N	\N	\N
11552	37	Pennsylvania	133	York	1	37-133-	\N	\N	\N
11553	37	Pennsylvania	537	Lake Erie	1	37-537-	\N	\N	\N
11554	38	Rhode Island	001	Bristol	0	38-001-	\N	\N	\N
11555	38	Rhode Island	003	Kent	0	38-003-	\N	\N	\N
11556	38	Rhode Island	005	Newport	0	38-005-	\N	\N	\N
11557	38	Rhode Island	007	Providence	0	38-007-	\N	\N	\N
11558	38	Rhode Island	009	Washington	0	38-009-	\N	\N	\N
11559	38	Rhode Island	205	Newport Offshore	0	38-205-	\N	\N	\N
11560	38	Rhode Island	209	Washington Offshore	0	38-209-	\N	\N	\N
11561	39	South Carolina	001	Abbeville	0	39-001-	\N	\N	\N
11562	39	South Carolina	003	Aiken	0	39-003-	\N	\N	\N
11563	39	South Carolina	005	Allendale	0	39-005-	\N	\N	\N
11564	39	South Carolina	007	Anderson	0	39-007-	\N	\N	\N
11565	39	South Carolina	009	Bamberg	0	39-009-	\N	\N	\N
11566	39	South Carolina	011	Barnwell	0	39-011-	\N	\N	\N
11567	39	South Carolina	013	Beaufort	0	39-013-	\N	\N	\N
11568	39	South Carolina	015	Berkeley	0	39-015-	\N	\N	\N
11569	39	South Carolina	017	Calhoun	0	39-017-	\N	\N	\N
11570	39	South Carolina	019	Charleston	0	39-019-	\N	\N	\N
11571	39	South Carolina	021	Cherokee	0	39-021-	\N	\N	\N
11572	39	South Carolina	023	Chester	0	39-023-	\N	\N	\N
11573	39	South Carolina	025	Chesterfield	0	39-025-	\N	\N	\N
11574	39	South Carolina	027	Clarendon	0	39-027-	\N	\N	\N
11575	39	South Carolina	029	Colleton	0	39-029-	\N	\N	\N
11576	39	South Carolina	031	Darlington	0	39-031-	\N	\N	\N
11577	39	South Carolina	033	Dillon	0	39-033-	\N	\N	\N
11578	39	South Carolina	035	Dorchester	0	39-035-	\N	\N	\N
11579	39	South Carolina	037	Edgefield	0	39-037-	\N	\N	\N
11580	39	South Carolina	039	Fairfield	0	39-039-	\N	\N	\N
11581	39	South Carolina	041	Florence	0	39-041-	\N	\N	\N
11582	39	South Carolina	043	Georgetown	0	39-043-	\N	\N	\N
11583	39	South Carolina	045	Greenville	0	39-045-	\N	\N	\N
11584	39	South Carolina	047	Greenwood	0	39-047-	\N	\N	\N
11585	39	South Carolina	049	Hampton	0	39-049-	\N	\N	\N
11586	39	South Carolina	051	Horry	0	39-051-	\N	\N	\N
11587	39	South Carolina	053	Jasper	0	39-053-	\N	\N	\N
11588	39	South Carolina	055	Kershaw	0	39-055-	\N	\N	\N
11589	39	South Carolina	057	Lancaster	0	39-057-	\N	\N	\N
11590	39	South Carolina	059	Laurens	0	39-059-	\N	\N	\N
11591	39	South Carolina	061	Lee	0	39-061-	\N	\N	\N
11592	39	South Carolina	063	Lexington	0	39-063-	\N	\N	\N
11593	39	South Carolina	065	Mc Cormick	0	39-065-	\N	\N	\N
11594	39	South Carolina	067	Marion	0	39-067-	\N	\N	\N
11595	39	South Carolina	069	Marlboro	0	39-069-	\N	\N	\N
11596	39	South Carolina	071	Newberry	0	39-071-	\N	\N	\N
11597	39	South Carolina	073	Oconee	0	39-073-	\N	\N	\N
11598	39	South Carolina	075	Orangeburg	0	39-075-	\N	\N	\N
11599	39	South Carolina	077	Pickens	0	39-077-	\N	\N	\N
11600	39	South Carolina	079	Richland	0	39-079-	\N	\N	\N
11601	39	South Carolina	081	Saluda	0	39-081-	\N	\N	\N
11602	39	South Carolina	083	Spartanburg	0	39-083-	\N	\N	\N
11603	39	South Carolina	085	Sumter	0	39-085-	\N	\N	\N
11604	39	South Carolina	087	Union	0	39-087-	\N	\N	\N
11605	39	South Carolina	089	Williamsburg	0	39-089-	\N	\N	\N
11606	39	South Carolina	091	York	0	39-091-	\N	\N	\N
11607	39	South Carolina	104	James Island	0	39-104-	\N	\N	\N
11608	39	South Carolina	213	Beaufort Offshore	0	39-213-	\N	\N	\N
11609	39	South Carolina	219	Charleston Offshore	0	39-219-	\N	\N	\N
11610	39	South Carolina	229	Colleton Offshore	0	39-229-	\N	\N	\N
11611	39	South Carolina	243	Georgetown Offshore	0	39-243-	\N	\N	\N
11612	39	South Carolina	251	Horry Offshore	0	39-251-	\N	\N	\N
11613	40	South Dakota	003	Aurora	0	40-003-	\N	\N	\N
11614	40	South Dakota	005	Beadle	0	40-005-	\N	\N	\N
11615	40	South Dakota	007	Bennett	0	40-007-	\N	\N	\N
11616	40	South Dakota	009	Bon Homme	0	40-009-	\N	\N	\N
11617	40	South Dakota	011	Brookings	0	40-011-	\N	\N	\N
11618	40	South Dakota	013	Brown	0	40-013-	\N	\N	\N
11619	40	South Dakota	015	Brule	0	40-015-	\N	\N	\N
11620	40	South Dakota	017	Buffalo	0	40-017-	\N	\N	\N
11621	40	South Dakota	019	Butte	0	40-019-	\N	\N	\N
11622	40	South Dakota	021	Campbell	0	40-021-	\N	\N	\N
11623	40	South Dakota	023	Charles Mix	0	40-023-	\N	\N	\N
11624	40	South Dakota	025	Clark	0	40-025-	\N	\N	\N
11625	40	South Dakota	027	Clay	0	40-027-	\N	\N	\N
11626	40	South Dakota	029	Codington	0	40-029-	\N	\N	\N
11627	40	South Dakota	031	Corson	0	40-031-	\N	\N	\N
11628	40	South Dakota	033	Custer	0	40-033-	\N	\N	\N
11629	40	South Dakota	035	Davison	0	40-035-	\N	\N	\N
11630	40	South Dakota	037	Day	0	40-037-	\N	\N	\N
11631	40	South Dakota	039	Deuel	0	40-039-	\N	\N	\N
11632	40	South Dakota	041	Dewey	0	40-041-	\N	\N	\N
11633	40	South Dakota	043	Douglas	0	40-043-	\N	\N	\N
11634	40	South Dakota	045	Edmunds	0	40-045-	\N	\N	\N
11635	40	South Dakota	047	Fall River	0	40-047-	\N	\N	\N
11636	40	South Dakota	049	Faulk	0	40-049-	\N	\N	\N
11637	40	South Dakota	051	Grant	0	40-051-	\N	\N	\N
11638	40	South Dakota	053	Gregory	0	40-053-	\N	\N	\N
11639	40	South Dakota	055	Haakon	0	40-055-	\N	\N	\N
11640	40	South Dakota	057	Hamlin	0	40-057-	\N	\N	\N
11641	40	South Dakota	059	Hand	0	40-059-	\N	\N	\N
11642	40	South Dakota	061	Hanson	0	40-061-	\N	\N	\N
11643	40	South Dakota	063	Harding	0	40-063-	\N	\N	\N
11644	40	South Dakota	065	Hughes	0	40-065-	\N	\N	\N
11645	40	South Dakota	067	Hutchinson	0	40-067-	\N	\N	\N
11646	40	South Dakota	069	Hyde	0	40-069-	\N	\N	\N
11647	40	South Dakota	071	Jackson	0	40-071-	\N	\N	\N
11648	40	South Dakota	073	Jerauld	0	40-073-	\N	\N	\N
11649	40	South Dakota	075	Jones	0	40-075-	\N	\N	\N
11650	40	South Dakota	077	Kingsbury	0	40-077-	\N	\N	\N
11651	40	South Dakota	079	Lake	0	40-079-	\N	\N	\N
11652	40	South Dakota	081	Lawrence	0	40-081-	\N	\N	\N
11653	40	South Dakota	083	Lincoln	0	40-083-	\N	\N	\N
11654	40	South Dakota	085	Lyman	0	40-085-	\N	\N	\N
11655	40	South Dakota	087	Mc Cook	0	40-087-	\N	\N	\N
11656	40	South Dakota	089	Mc Pherson	0	40-089-	\N	\N	\N
11657	40	South Dakota	091	Marshall	0	40-091-	\N	\N	\N
11658	40	South Dakota	093	Meade	0	40-093-	\N	\N	\N
11659	40	South Dakota	095	Mellette	0	40-095-	\N	\N	\N
11660	40	South Dakota	097	Miner	0	40-097-	\N	\N	\N
11661	40	South Dakota	099	Minnehaha	0	40-099-	\N	\N	\N
11662	40	South Dakota	101	Moody	0	40-101-	\N	\N	\N
11663	40	South Dakota	103	Pennington	0	40-103-	\N	\N	\N
11664	40	South Dakota	105	Perkins	0	40-105-	\N	\N	\N
11665	40	South Dakota	107	Potter	0	40-107-	\N	\N	\N
11666	40	South Dakota	109	Roberts	0	40-109-	\N	\N	\N
11667	40	South Dakota	111	Sanborn	0	40-111-	\N	\N	\N
11668	40	South Dakota	113	Shannon	0	40-113-	\N	\N	\N
11669	40	South Dakota	115	Spink	0	40-115-	\N	\N	\N
11670	40	South Dakota	117	Stanley	0	40-117-	\N	\N	\N
11671	40	South Dakota	119	Sully	0	40-119-	\N	\N	\N
11672	40	South Dakota	121	Todd	0	40-121-	\N	\N	\N
11673	40	South Dakota	123	Tripp	0	40-123-	\N	\N	\N
11674	40	South Dakota	125	Turner	0	40-125-	\N	\N	\N
11675	40	South Dakota	127	Union	0	40-127-	\N	\N	\N
11676	40	South Dakota	129	Walworth	0	40-129-	\N	\N	\N
11677	40	South Dakota	131	Washabaugh	0	40-131-	\N	\N	\N
11678	40	South Dakota	135	Yankton	0	40-135-	\N	\N	\N
11679	40	South Dakota	137	Ziebach	0	40-137-	\N	\N	\N
11680	41	Tennessee	001	Anderson	0	41-001-	\N	\N	\N
11681	41	Tennessee	003	Bedford	0	41-003-	\N	\N	\N
11682	41	Tennessee	005	Benton	0	41-005-	\N	\N	\N
11683	41	Tennessee	007	Bledsoe	0	41-007-	\N	\N	\N
11684	41	Tennessee	009	Blount	0	41-009-	\N	\N	\N
11685	41	Tennessee	011	Bradley	0	41-011-	\N	\N	\N
11686	41	Tennessee	013	Campbell	0	41-013-	\N	\N	\N
11687	41	Tennessee	015	Cannon	0	41-015-	\N	\N	\N
11688	41	Tennessee	017	Carroll	0	41-017-	\N	\N	\N
11689	41	Tennessee	019	Carter	0	41-019-	\N	\N	\N
11690	41	Tennessee	021	Cheatham	0	41-021-	\N	\N	\N
11691	41	Tennessee	023	Chester	0	41-023-	\N	\N	\N
11692	41	Tennessee	025	Claiborne	0	41-025-	\N	\N	\N
11693	41	Tennessee	027	Clay	0	41-027-	\N	\N	\N
11694	41	Tennessee	029	Cocke	0	41-029-	\N	\N	\N
11695	41	Tennessee	031	Coffee	0	41-031-	\N	\N	\N
11696	41	Tennessee	033	Crockett	0	41-033-	\N	\N	\N
11697	41	Tennessee	035	Cumberland	0	41-035-	\N	\N	\N
11698	41	Tennessee	037	Davidson	0	41-037-	\N	\N	\N
11699	41	Tennessee	039	Decatur	0	41-039-	\N	\N	\N
11700	41	Tennessee	041	De Kalb	0	41-041-	\N	\N	\N
11701	41	Tennessee	043	Dickson	0	41-043-	\N	\N	\N
11702	41	Tennessee	045	Dyer	0	41-045-	\N	\N	\N
11703	41	Tennessee	047	Fayette	0	41-047-	\N	\N	\N
11704	41	Tennessee	049	Fentress	0	41-049-	\N	\N	\N
11705	41	Tennessee	051	Franklin	0	41-051-	\N	\N	\N
11706	41	Tennessee	053	Gibson	0	41-053-	\N	\N	\N
11707	41	Tennessee	055	Giles	0	41-055-	\N	\N	\N
11708	41	Tennessee	057	Grainger	0	41-057-	\N	\N	\N
11709	41	Tennessee	059	Greene	0	41-059-	\N	\N	\N
11710	41	Tennessee	061	Grundy	0	41-061-	\N	\N	\N
11711	41	Tennessee	063	Hamblen	0	41-063-	\N	\N	\N
11712	41	Tennessee	065	Hamilton	0	41-065-	\N	\N	\N
11713	41	Tennessee	067	Hancock	0	41-067-	\N	\N	\N
11714	41	Tennessee	069	Hardeman	0	41-069-	\N	\N	\N
11715	41	Tennessee	071	Hardin	0	41-071-	\N	\N	\N
11716	41	Tennessee	073	Hawkins	0	41-073-	\N	\N	\N
11717	41	Tennessee	075	Haywood	0	41-075-	\N	\N	\N
11718	41	Tennessee	077	Henderson	0	41-077-	\N	\N	\N
11719	41	Tennessee	079	Henry	0	41-079-	\N	\N	\N
11720	41	Tennessee	081	Hickman	0	41-081-	\N	\N	\N
11721	41	Tennessee	083	Houston	0	41-083-	\N	\N	\N
11722	41	Tennessee	085	Humphreys	0	41-085-	\N	\N	\N
11723	41	Tennessee	087	Jackson	0	41-087-	\N	\N	\N
11724	41	Tennessee	089	Jefferson	0	41-089-	\N	\N	\N
11725	41	Tennessee	091	Johnson	0	41-091-	\N	\N	\N
11726	41	Tennessee	093	Knox	0	41-093-	\N	\N	\N
11727	41	Tennessee	095	Lake	0	41-095-	\N	\N	\N
11728	41	Tennessee	097	Lauderdale	0	41-097-	\N	\N	\N
11729	41	Tennessee	099	Lawrence	0	41-099-	\N	\N	\N
11730	41	Tennessee	101	Lewis	0	41-101-	\N	\N	\N
11731	41	Tennessee	103	Lincoln	0	41-103-	\N	\N	\N
11732	41	Tennessee	105	Loudon	0	41-105-	\N	\N	\N
11733	41	Tennessee	107	Mc Minn	0	41-107-	\N	\N	\N
11734	41	Tennessee	109	Mc Nairy	0	41-109-	\N	\N	\N
11735	41	Tennessee	111	Macon	0	41-111-	\N	\N	\N
11736	41	Tennessee	113	Madison	0	41-113-	\N	\N	\N
11737	41	Tennessee	115	Marion	0	41-115-	\N	\N	\N
11738	41	Tennessee	117	Marshall	0	41-117-	\N	\N	\N
11739	41	Tennessee	119	Maury	0	41-119-	\N	\N	\N
11740	41	Tennessee	121	Meigs	0	41-121-	\N	\N	\N
11741	41	Tennessee	123	Monroe	0	41-123-	\N	\N	\N
11742	41	Tennessee	125	Montgomery	0	41-125-	\N	\N	\N
11743	41	Tennessee	127	Moore	0	41-127-	\N	\N	\N
11744	41	Tennessee	129	Morgan	0	41-129-	\N	\N	\N
11745	41	Tennessee	131	Obion	0	41-131-	\N	\N	\N
11746	41	Tennessee	133	Overton	0	41-133-	\N	\N	\N
11747	41	Tennessee	135	Perry	0	41-135-	\N	\N	\N
11748	41	Tennessee	137	Pickett	0	41-137-	\N	\N	\N
11749	41	Tennessee	139	Polk	0	41-139-	\N	\N	\N
11750	41	Tennessee	141	Putnam	0	41-141-	\N	\N	\N
11751	41	Tennessee	143	Rhea	0	41-143-	\N	\N	\N
11752	41	Tennessee	145	Roane	0	41-145-	\N	\N	\N
11753	41	Tennessee	147	Robertson	0	41-147-	\N	\N	\N
11754	41	Tennessee	149	Rutherford	0	41-149-	\N	\N	\N
11755	41	Tennessee	151	Scott	0	41-151-	\N	\N	\N
11756	41	Tennessee	153	Sequatchie	0	41-153-	\N	\N	\N
11757	41	Tennessee	155	Sevier	0	41-155-	\N	\N	\N
11758	41	Tennessee	157	Shelby	0	41-157-	\N	\N	\N
11759	41	Tennessee	159	Smith	0	41-159-	\N	\N	\N
11760	41	Tennessee	161	Stewart	0	41-161-	\N	\N	\N
11761	41	Tennessee	163	Sullivan	0	41-163-	\N	\N	\N
11762	41	Tennessee	165	Sumner	0	41-165-	\N	\N	\N
11763	41	Tennessee	167	Tipton	0	41-167-	\N	\N	\N
11764	41	Tennessee	169	Trousdale	0	41-169-	\N	\N	\N
11765	41	Tennessee	171	Unicoi	0	41-171-	\N	\N	\N
11766	41	Tennessee	173	Union	0	41-173-	\N	\N	\N
11767	41	Tennessee	175	Van Buren	0	41-175-	\N	\N	\N
11768	41	Tennessee	177	Warren	0	41-177-	\N	\N	\N
11769	41	Tennessee	179	Washington	0	41-179-	\N	\N	\N
11770	41	Tennessee	181	Wayne	0	41-181-	\N	\N	\N
11771	41	Tennessee	183	Weakley	0	41-183-	\N	\N	\N
11772	41	Tennessee	185	White	0	41-185-	\N	\N	\N
11773	41	Tennessee	187	Williamson	0	41-187-	\N	\N	\N
11774	41	Tennessee	189	Wilson	0	41-189-	\N	\N	\N
11775	42	Texas	001	Anderson	1	42-001-	\N	\N	\N
11776	42	Texas	003	Andrews	1	42-003-	\N	\N	\N
11777	42	Texas	005	Angelina	1	42-005-	\N	\N	\N
11778	42	Texas	007	Aransas	1	42-007-	\N	\N	\N
11779	42	Texas	009	Archer	1	42-009-	\N	\N	\N
11780	42	Texas	011	Armstrong	1	42-011-	\N	\N	\N
11781	42	Texas	013	Atascosa	1	42-013-	\N	\N	\N
11782	42	Texas	015	Austin	1	42-015-	\N	\N	\N
11783	42	Texas	017	Bailey	1	42-017-	\N	\N	\N
11784	42	Texas	019	Bandera	1	42-019-	\N	\N	\N
11785	42	Texas	021	Bastrop	1	42-021-	\N	\N	\N
11786	42	Texas	023	Baylor	1	42-023-	\N	\N	\N
11787	42	Texas	025	Bee	1	42-025-	\N	\N	\N
11788	42	Texas	027	Bell	1	42-027-	\N	\N	\N
11789	42	Texas	029	Bexar	1	42-029-	\N	\N	\N
11790	42	Texas	031	Blanco	1	42-031-	\N	\N	\N
11791	42	Texas	033	Borden	1	42-033-	\N	\N	\N
11792	42	Texas	035	Bosque	1	42-035-	\N	\N	\N
11793	42	Texas	037	Bowie	1	42-037-	\N	\N	\N
11794	42	Texas	039	Brazoria	1	42-039-	\N	\N	\N
11795	42	Texas	041	Brazos	1	42-041-	\N	\N	\N
11796	42	Texas	043	Brewster	1	42-043-	\N	\N	\N
11797	42	Texas	045	Briscoe	1	42-045-	\N	\N	\N
11798	42	Texas	047	Brooks	1	42-047-	\N	\N	\N
11799	42	Texas	049	Brown	1	42-049-	\N	\N	\N
11800	42	Texas	051	Burleson	1	42-051-	\N	\N	\N
11801	42	Texas	053	Burnet	1	42-053-	\N	\N	\N
11802	42	Texas	055	Caldwell	1	42-055-	\N	\N	\N
11803	42	Texas	057	Calhoun	1	42-057-	\N	\N	\N
11804	42	Texas	059	Callahan	1	42-059-	\N	\N	\N
11805	42	Texas	061	Cameron	1	42-061-	\N	\N	\N
11806	42	Texas	063	Camp	1	42-063-	\N	\N	\N
11807	42	Texas	065	Carson	1	42-065-	\N	\N	\N
11808	42	Texas	067	Cass	1	42-067-	\N	\N	\N
11809	42	Texas	069	Castro	1	42-069-	\N	\N	\N
11810	42	Texas	071	Chambers	1	42-071-	\N	\N	\N
11811	42	Texas	073	Cherokee	1	42-073-	\N	\N	\N
11812	42	Texas	075	Childress	1	42-075-	\N	\N	\N
11813	42	Texas	077	Clay	1	42-077-	\N	\N	\N
11814	42	Texas	079	Cochran	1	42-079-	\N	\N	\N
11815	42	Texas	081	Coke	1	42-081-	\N	\N	\N
11816	42	Texas	083	Coleman	1	42-083-	\N	\N	\N
11817	42	Texas	085	Collin	1	42-085-	\N	\N	\N
11818	42	Texas	087	Collingsworth	1	42-087-	\N	\N	\N
11819	42	Texas	089	Colorado	1	42-089-	\N	\N	\N
11820	42	Texas	091	Comal	1	42-091-	\N	\N	\N
11821	42	Texas	093	Comanche	1	42-093-	\N	\N	\N
11822	42	Texas	095	Concho	1	42-095-	\N	\N	\N
11823	42	Texas	097	Cooke	1	42-097-	\N	\N	\N
11824	42	Texas	099	Coryell	1	42-099-	\N	\N	\N
11825	42	Texas	101	Cottle	1	42-101-	\N	\N	\N
11826	42	Texas	103	Crane	1	42-103-	\N	\N	\N
11827	42	Texas	105	Crockett	1	42-105-	\N	\N	\N
11828	42	Texas	107	Crosby	1	42-107-	\N	\N	\N
11829	42	Texas	109	Culberson	1	42-109-	\N	\N	\N
11830	42	Texas	111	Dallam	1	42-111-	\N	\N	\N
11831	42	Texas	113	Dallas	1	42-113-	\N	\N	\N
11832	42	Texas	115	Dawson	1	42-115-	\N	\N	\N
11833	42	Texas	117	Deaf Smith	1	42-117-	\N	\N	\N
11834	42	Texas	119	Delta	1	42-119-	\N	\N	\N
11835	42	Texas	121	Denton	1	42-121-	\N	\N	\N
11836	42	Texas	123	De Witt	1	42-123-	\N	\N	\N
11837	42	Texas	125	Dickens	1	42-125-	\N	\N	\N
11838	42	Texas	127	Dimmit	1	42-127-	\N	\N	\N
11839	42	Texas	129	Donley	1	42-129-	\N	\N	\N
11840	42	Texas	131	Duval	1	42-131-	\N	\N	\N
11841	42	Texas	133	Eastland	1	42-133-	\N	\N	\N
11842	42	Texas	135	Ector	1	42-135-	\N	\N	\N
11843	42	Texas	137	Edwards	1	42-137-	\N	\N	\N
11844	42	Texas	139	Ellis	1	42-139-	\N	\N	\N
11845	42	Texas	141	El Paso	1	42-141-	\N	\N	\N
11846	42	Texas	143	Erath	1	42-143-	\N	\N	\N
11847	42	Texas	145	Falls	1	42-145-	\N	\N	\N
11848	42	Texas	147	Fannin	1	42-147-	\N	\N	\N
11849	42	Texas	149	Fayette	1	42-149-	\N	\N	\N
11850	42	Texas	151	Fisher	1	42-151-	\N	\N	\N
11851	42	Texas	153	Floyd	1	42-153-	\N	\N	\N
11852	42	Texas	155	Foard	1	42-155-	\N	\N	\N
11853	42	Texas	157	Fort Bend	1	42-157-	\N	\N	\N
11854	42	Texas	159	Franklin	1	42-159-	\N	\N	\N
11855	42	Texas	161	Freestone	1	42-161-	\N	\N	\N
11856	42	Texas	163	Frio	1	42-163-	\N	\N	\N
11857	42	Texas	165	Gaines	1	42-165-	\N	\N	\N
11858	42	Texas	167	Galveston	1	42-167-	\N	\N	\N
11859	42	Texas	169	Garza	1	42-169-	\N	\N	\N
11860	42	Texas	171	Gillespie	1	42-171-	\N	\N	\N
11861	42	Texas	173	Glasscock	1	42-173-	\N	\N	\N
11862	42	Texas	175	Goliad	1	42-175-	\N	\N	\N
11863	42	Texas	177	Gonzales	1	42-177-	\N	\N	\N
11864	42	Texas	179	Gray	1	42-179-	\N	\N	\N
11865	42	Texas	181	Grayson	1	42-181-	\N	\N	\N
11866	42	Texas	183	Gregg	1	42-183-	\N	\N	\N
11867	42	Texas	185	Grimes	1	42-185-	\N	\N	\N
11868	42	Texas	187	Guadalupe	1	42-187-	\N	\N	\N
11869	42	Texas	189	Hale	1	42-189-	\N	\N	\N
11870	42	Texas	191	Hall	1	42-191-	\N	\N	\N
11871	42	Texas	193	Hamilton	1	42-193-	\N	\N	\N
11872	42	Texas	195	Hansford	1	42-195-	\N	\N	\N
11873	42	Texas	197	Hardeman	1	42-197-	\N	\N	\N
11874	42	Texas	199	Hardin	1	42-199-	\N	\N	\N
11875	42	Texas	201	Harris	1	42-201-	\N	\N	\N
11876	42	Texas	203	Harrison	1	42-203-	\N	\N	\N
11877	42	Texas	205	Hartley	1	42-205-	\N	\N	\N
11878	42	Texas	207	Haskell	1	42-207-	\N	\N	\N
11879	42	Texas	209	Hays	1	42-209-	\N	\N	\N
11880	42	Texas	211	Hemphill	1	42-211-	\N	\N	\N
11881	42	Texas	213	Henderson	1	42-213-	\N	\N	\N
11882	42	Texas	215	Hidalgo	1	42-215-	\N	\N	\N
11883	42	Texas	217	Hill	1	42-217-	\N	\N	\N
11884	42	Texas	219	Hockley	1	42-219-	\N	\N	\N
11885	42	Texas	221	Hood	1	42-221-	\N	\N	\N
11886	42	Texas	223	Hopkins	1	42-223-	\N	\N	\N
11887	42	Texas	225	Houston	1	42-225-	\N	\N	\N
11888	42	Texas	227	Howard	1	42-227-	\N	\N	\N
11889	42	Texas	229	Hudspeth	1	42-229-	\N	\N	\N
11890	42	Texas	231	Hunt	1	42-231-	\N	\N	\N
11891	42	Texas	233	Hutchinson	1	42-233-	\N	\N	\N
11892	42	Texas	235	Irion	1	42-235-	\N	\N	\N
11893	42	Texas	237	Jack	1	42-237-	\N	\N	\N
11894	42	Texas	239	Jackson	1	42-239-	\N	\N	\N
11895	42	Texas	241	Jasper	1	42-241-	\N	\N	\N
11896	42	Texas	243	Jeff Davis	1	42-243-	\N	\N	\N
11897	42	Texas	245	Jefferson	1	42-245-	\N	\N	\N
11898	42	Texas	247	Jim Hogg	1	42-247-	\N	\N	\N
11899	42	Texas	249	Jim Wells	1	42-249-	\N	\N	\N
11900	42	Texas	251	Johnson	1	42-251-	\N	\N	\N
11901	42	Texas	253	Jones	1	42-253-	\N	\N	\N
11902	42	Texas	255	Karnes	1	42-255-	\N	\N	\N
11903	42	Texas	257	Kaufman	1	42-257-	\N	\N	\N
11904	42	Texas	259	Kendall	1	42-259-	\N	\N	\N
11905	42	Texas	261	Kenedy	1	42-261-	\N	\N	\N
11906	42	Texas	263	Kent	1	42-263-	\N	\N	\N
11907	42	Texas	265	Kerr	1	42-265-	\N	\N	\N
11908	42	Texas	267	Kimble	1	42-267-	\N	\N	\N
11909	42	Texas	269	King	1	42-269-	\N	\N	\N
11910	42	Texas	271	Kinney	1	42-271-	\N	\N	\N
11911	42	Texas	273	Kleberg	1	42-273-	\N	\N	\N
11912	42	Texas	275	Knox	1	42-275-	\N	\N	\N
11913	42	Texas	277	Lamar	1	42-277-	\N	\N	\N
11914	42	Texas	279	Lamb	1	42-279-	\N	\N	\N
11915	42	Texas	281	Lampasas	1	42-281-	\N	\N	\N
11916	42	Texas	283	La Salle	1	42-283-	\N	\N	\N
11917	42	Texas	285	Lavaca	1	42-285-	\N	\N	\N
11918	42	Texas	287	Lee	1	42-287-	\N	\N	\N
11919	42	Texas	289	Leon	1	42-289-	\N	\N	\N
11920	42	Texas	291	Liberty	1	42-291-	\N	\N	\N
11921	42	Texas	293	Limestone	1	42-293-	\N	\N	\N
11922	42	Texas	295	Lipscomb	1	42-295-	\N	\N	\N
11923	42	Texas	297	Live Oak	1	42-297-	\N	\N	\N
11924	42	Texas	299	Llano	1	42-299-	\N	\N	\N
11925	42	Texas	301	Loving	1	42-301-	\N	\N	\N
11926	42	Texas	303	Lubbock	1	42-303-	\N	\N	\N
11927	42	Texas	305	Lynn	1	42-305-	\N	\N	\N
11928	42	Texas	307	Mc Culloch	1	42-307-	\N	\N	\N
11929	42	Texas	309	Mc Lennan	1	42-309-	\N	\N	\N
11930	42	Texas	311	Mc Mullen	1	42-311-	\N	\N	\N
11931	42	Texas	313	Madison	1	42-313-	\N	\N	\N
11932	42	Texas	315	Marion	1	42-315-	\N	\N	\N
11933	42	Texas	317	Martin	1	42-317-	\N	\N	\N
11934	42	Texas	319	Mason	1	42-319-	\N	\N	\N
11935	42	Texas	321	Matagorda	1	42-321-	\N	\N	\N
11936	42	Texas	323	Maverick	1	42-323-	\N	\N	\N
11937	42	Texas	325	Medina	1	42-325-	\N	\N	\N
11938	42	Texas	327	Menard	1	42-327-	\N	\N	\N
11939	42	Texas	329	Midland	1	42-329-	\N	\N	\N
11940	42	Texas	331	Milam	1	42-331-	\N	\N	\N
11941	42	Texas	333	Mills	1	42-333-	\N	\N	\N
11942	42	Texas	335	Mitchell	1	42-335-	\N	\N	\N
11943	42	Texas	337	Montague	1	42-337-	\N	\N	\N
11944	42	Texas	339	Montgomery	1	42-339-	\N	\N	\N
11945	42	Texas	341	Moore	1	42-341-	\N	\N	\N
11946	42	Texas	343	Morris	1	42-343-	\N	\N	\N
11947	42	Texas	345	Motley	1	42-345-	\N	\N	\N
11948	42	Texas	347	Nacogdoches	1	42-347-	\N	\N	\N
11949	42	Texas	349	Navarro	1	42-349-	\N	\N	\N
11950	42	Texas	351	Newton	1	42-351-	\N	\N	\N
11951	42	Texas	353	Nolan	1	42-353-	\N	\N	\N
11952	42	Texas	355	Nueces	1	42-355-	\N	\N	\N
11953	42	Texas	357	Ochiltree	1	42-357-	\N	\N	\N
11954	42	Texas	359	Oldham	1	42-359-	\N	\N	\N
11955	42	Texas	361	Orange	1	42-361-	\N	\N	\N
11956	42	Texas	363	Palo Pinto	1	42-363-	\N	\N	\N
11957	42	Texas	365	Panola	1	42-365-	\N	\N	\N
11958	42	Texas	367	Parker	1	42-367-	\N	\N	\N
11959	42	Texas	369	Parmer	1	42-369-	\N	\N	\N
11960	42	Texas	371	Pecos	1	42-371-	\N	\N	\N
11961	42	Texas	373	Polk	1	42-373-	\N	\N	\N
11962	42	Texas	375	Potter	1	42-375-	\N	\N	\N
11963	42	Texas	377	Presidio	1	42-377-	\N	\N	\N
11964	42	Texas	379	Rains	1	42-379-	\N	\N	\N
11965	42	Texas	381	Randall	1	42-381-	\N	\N	\N
11966	42	Texas	383	Reagan	1	42-383-	\N	\N	\N
11967	42	Texas	385	Real	1	42-385-	\N	\N	\N
11968	42	Texas	387	Red River	1	42-387-	\N	\N	\N
11969	42	Texas	389	Reeves	1	42-389-	\N	\N	\N
11970	42	Texas	391	Refugio	1	42-391-	\N	\N	\N
11971	42	Texas	393	Roberts	1	42-393-	\N	\N	\N
11972	42	Texas	395	Robertson	1	42-395-	\N	\N	\N
11973	42	Texas	397	Rockwall	1	42-397-	\N	\N	\N
11974	42	Texas	399	Runnels	1	42-399-	\N	\N	\N
11975	42	Texas	401	Rusk	1	42-401-	\N	\N	\N
11976	42	Texas	403	Sabine	1	42-403-	\N	\N	\N
11977	42	Texas	405	San Augustine	1	42-405-	\N	\N	\N
11978	42	Texas	407	San Jacinto	1	42-407-	\N	\N	\N
11979	42	Texas	409	San Patricio	1	42-409-	\N	\N	\N
11980	42	Texas	411	San Saba	1	42-411-	\N	\N	\N
11981	42	Texas	413	Schleicher	1	42-413-	\N	\N	\N
11982	42	Texas	415	Scurry	1	42-415-	\N	\N	\N
11983	42	Texas	417	Shackelford	1	42-417-	\N	\N	\N
11984	42	Texas	419	Shelby	1	42-419-	\N	\N	\N
11985	42	Texas	421	Sherman	1	42-421-	\N	\N	\N
11986	42	Texas	423	Smith	1	42-423-	\N	\N	\N
11987	42	Texas	425	Somervell	1	42-425-	\N	\N	\N
11988	42	Texas	427	Starr	1	42-427-	\N	\N	\N
11989	42	Texas	429	Stephens	1	42-429-	\N	\N	\N
11990	42	Texas	431	Sterling	1	42-431-	\N	\N	\N
11991	42	Texas	433	Stonewall	1	42-433-	\N	\N	\N
11992	42	Texas	435	Sutton	1	42-435-	\N	\N	\N
11993	42	Texas	437	Swisher	1	42-437-	\N	\N	\N
11994	42	Texas	439	Tarrant	1	42-439-	\N	\N	\N
11995	42	Texas	441	Taylor	1	42-441-	\N	\N	\N
11996	42	Texas	443	Terrell	1	42-443-	\N	\N	\N
11997	42	Texas	445	Terry	1	42-445-	\N	\N	\N
11998	42	Texas	447	Throckmorton	1	42-447-	\N	\N	\N
11999	42	Texas	449	Titus	1	42-449-	\N	\N	\N
12000	42	Texas	451	Tom Green	1	42-451-	\N	\N	\N
12001	42	Texas	453	Travis	1	42-453-	\N	\N	\N
12002	42	Texas	455	Trinity	1	42-455-	\N	\N	\N
12003	42	Texas	457	Tyler	1	42-457-	\N	\N	\N
12004	42	Texas	459	Upshur	1	42-459-	\N	\N	\N
12005	42	Texas	461	Upton	1	42-461-	\N	\N	\N
12006	42	Texas	463	Uvalde	1	42-463-	\N	\N	\N
12007	42	Texas	465	Val Verde	1	42-465-	\N	\N	\N
12008	42	Texas	467	Van Zandt	1	42-467-	\N	\N	\N
12009	42	Texas	469	Victoria	1	42-469-	\N	\N	\N
12010	42	Texas	471	Walker	1	42-471-	\N	\N	\N
12011	42	Texas	473	Waller	1	42-473-	\N	\N	\N
12012	42	Texas	475	Ward	1	42-475-	\N	\N	\N
12013	42	Texas	477	Washington	1	42-477-	\N	\N	\N
12014	42	Texas	479	Webb	1	42-479-	\N	\N	\N
12015	42	Texas	481	Wharton	1	42-481-	\N	\N	\N
12016	42	Texas	483	Wheeler	1	42-483-	\N	\N	\N
12017	42	Texas	485	Wichita	1	42-485-	\N	\N	\N
12018	42	Texas	487	Wilbarger	1	42-487-	\N	\N	\N
12019	42	Texas	489	Willacy	1	42-489-	\N	\N	\N
12020	42	Texas	491	Williamson	1	42-491-	\N	\N	\N
12021	42	Texas	493	Wilson	1	42-493-	\N	\N	\N
12022	42	Texas	495	Winkler	1	42-495-	\N	\N	\N
12023	42	Texas	497	Wise	1	42-497-	\N	\N	\N
12024	42	Texas	499	Wood	1	42-499-	\N	\N	\N
12025	42	Texas	501	Yoakum	1	42-501-	\N	\N	\N
12026	42	Texas	503	Young	1	42-503-	\N	\N	\N
12027	42	Texas	505	Zapata	1	42-505-	\N	\N	\N
12028	42	Texas	507	Zavala	1	42-507-	\N	\N	\N
12029	42	Texas	600	South Padre Island Small Block	1	42-600-	\N	\N	\N
12030	42	Texas	601	North Padre Island Small Block	1	42-601-	\N	\N	\N
12031	42	Texas	602	Mustang Island Small Block	1	42-602-	\N	\N	\N
12032	42	Texas	603	Matagorda Island Small Block	1	42-603-	\N	\N	\N
12033	42	Texas	604	Brazos Small Block	1	42-604-	\N	\N	\N
12034	42	Texas	605	Galveston Small Block	1	42-605-	\N	\N	\N
12035	42	Texas	606	High Island Small Block	1	42-606-	\N	\N	\N
12036	42	Texas	700	South Padre Island Large Block	1	42-700-	\N	\N	\N
12037	42	Texas	701	North Padre Island Large Block	1	42-701-	\N	\N	\N
12038	42	Texas	702	Mustang Island Large Block	1	42-702-	\N	\N	\N
12039	42	Texas	703	Matagorda Island Large Block	1	42-703-	\N	\N	\N
12040	42	Texas	704	Brazos Large Block	1	42-704-	\N	\N	\N
12041	42	Texas	705	Brazos South	1	42-705-	\N	\N	\N
12042	42	Texas	706	Galveston Large Block	1	42-706-	\N	\N	\N
12043	42	Texas	707	Galveston South	1	42-707-	\N	\N	\N
12044	42	Texas	708	High Island Large Block	1	42-708-	\N	\N	\N
12045	42	Texas	709	High Island South	1	42-709-	\N	\N	\N
12046	42	Texas	710	High Island East	1	42-710-	\N	\N	\N
12047	42	Texas	711	High Island East & South	1	42-711-	\N	\N	\N
12048	42	Texas	712	Mustang Island East	1	42-712-	\N	\N	\N
12049	42	Texas	713	North Padre Island East	1	42-713-	\N	\N	\N
12050	42	Texas	714	South Padre Island East	1	42-714-	\N	\N	\N
12051	42	Texas	715	Sabine Pass	1	42-715-	\N	\N	\N
12052	43	Utah	001	Beaver	1	43-001-	\N	\N	\N
12053	43	Utah	003	Box Elder	1	43-003-	\N	\N	\N
12054	43	Utah	005	Cache	1	43-005-	\N	\N	\N
12055	43	Utah	007	Carbon	1	43-007-	\N	\N	\N
12056	43	Utah	009	Daggett	1	43-009-	\N	\N	\N
12057	43	Utah	011	Davis	1	43-011-	\N	\N	\N
12058	43	Utah	013	Duchesne	1	43-013-	\N	\N	\N
12059	43	Utah	015	Emery	1	43-015-	\N	\N	\N
12060	43	Utah	017	Garfield	1	43-017-	\N	\N	\N
12061	43	Utah	019	Grand	1	43-019-	\N	\N	\N
12062	43	Utah	021	Iron	1	43-021-	\N	\N	\N
12063	43	Utah	023	Juab	1	43-023-	\N	\N	\N
12064	43	Utah	025	Kane	1	43-025-	\N	\N	\N
12065	43	Utah	027	Millard	1	43-027-	\N	\N	\N
12066	43	Utah	029	Morgan	1	43-029-	\N	\N	\N
12067	43	Utah	031	Piute	1	43-031-	\N	\N	\N
12068	43	Utah	033	Rich	1	43-033-	\N	\N	\N
12069	43	Utah	035	Salt Lake	1	43-035-	\N	\N	\N
12070	43	Utah	037	San Juan	1	43-037-	\N	\N	\N
12071	43	Utah	039	Sanpete	1	43-039-	\N	\N	\N
12072	43	Utah	041	Sevier	1	43-041-	\N	\N	\N
12073	43	Utah	043	Summit	1	43-043-	\N	\N	\N
12074	43	Utah	045	Tooele	1	43-045-	\N	\N	\N
12075	43	Utah	047	Uintah	1	43-047-	\N	\N	\N
12076	43	Utah	049	Utah	1	43-049-	\N	\N	\N
12077	43	Utah	051	Wasatch	1	43-051-	\N	\N	\N
12078	43	Utah	053	Washington	1	43-053-	\N	\N	\N
12079	43	Utah	055	Wayne	1	43-055-	\N	\N	\N
12080	43	Utah	057	Weber	1	43-057-	\N	\N	\N
12081	44	Vermont	001	Addison	0	44-001-	\N	\N	\N
12082	44	Vermont	003	Bennington	0	44-003-	\N	\N	\N
12083	44	Vermont	005	Caledonia	0	44-005-	\N	\N	\N
12084	44	Vermont	007	Chittenden	0	44-007-	\N	\N	\N
12085	44	Vermont	009	Essex	0	44-009-	\N	\N	\N
12086	44	Vermont	011	Franklin	0	44-011-	\N	\N	\N
12087	44	Vermont	013	Grand Isle	0	44-013-	\N	\N	\N
12088	44	Vermont	015	Lamoille	0	44-015-	\N	\N	\N
12089	44	Vermont	017	Orange	0	44-017-	\N	\N	\N
12090	44	Vermont	019	Orleans	0	44-019-	\N	\N	\N
12091	44	Vermont	021	Rutland	0	44-021-	\N	\N	\N
12092	44	Vermont	023	Washington	0	44-023-	\N	\N	\N
12093	44	Vermont	025	Windham	0	44-025-	\N	\N	\N
12094	44	Vermont	027	Windsor	0	44-027-	\N	\N	\N
12095	45	Virginia	001	Accomack	0	45-001-	\N	\N	\N
12096	45	Virginia	003	Albemarle	0	45-003-	\N	\N	\N
12097	45	Virginia	005	Alleghany	0	45-005-	\N	\N	\N
12098	45	Virginia	007	Amelia	0	45-007-	\N	\N	\N
12099	45	Virginia	009	Amherst	0	45-009-	\N	\N	\N
12100	45	Virginia	011	Appomattox	0	45-011-	\N	\N	\N
12101	45	Virginia	013	Arlington	0	45-013-	\N	\N	\N
12102	45	Virginia	015	Augusta	0	45-015-	\N	\N	\N
12103	45	Virginia	017	Bath	0	45-017-	\N	\N	\N
12104	45	Virginia	019	Bedford	0	45-019-	\N	\N	\N
12105	45	Virginia	021	Bland	0	45-021-	\N	\N	\N
12106	45	Virginia	023	Botetourt	0	45-023-	\N	\N	\N
12107	45	Virginia	025	Brunswick	0	45-025-	\N	\N	\N
12108	45	Virginia	027	Buchanan	0	45-027-	\N	\N	\N
12109	45	Virginia	029	Buckingham	0	45-029-	\N	\N	\N
12110	45	Virginia	031	Campbell	0	45-031-	\N	\N	\N
12111	45	Virginia	033	Caroline	0	45-033-	\N	\N	\N
12112	45	Virginia	035	Carroll	0	45-035-	\N	\N	\N
12113	45	Virginia	037	Charles City	0	45-037-	\N	\N	\N
12114	45	Virginia	039	Charlotte	0	45-039-	\N	\N	\N
12115	45	Virginia	041	Chesterfield	0	45-041-	\N	\N	\N
12116	45	Virginia	043	Clarke	0	45-043-	\N	\N	\N
12117	45	Virginia	045	Craig	0	45-045-	\N	\N	\N
12118	45	Virginia	047	Culpeper	0	45-047-	\N	\N	\N
12119	45	Virginia	049	Cumberland	0	45-049-	\N	\N	\N
12120	45	Virginia	051	Dickenson	0	45-051-	\N	\N	\N
12121	45	Virginia	053	Dinwiddie	0	45-053-	\N	\N	\N
12122	45	Virginia	057	Essex	0	45-057-	\N	\N	\N
12123	45	Virginia	059	Fairfax	0	45-059-	\N	\N	\N
12124	45	Virginia	061	Fauquier	0	45-061-	\N	\N	\N
12125	45	Virginia	063	Floyd	0	45-063-	\N	\N	\N
12126	45	Virginia	065	Fluvanna	0	45-065-	\N	\N	\N
12127	45	Virginia	067	Franklin	0	45-067-	\N	\N	\N
12128	45	Virginia	069	Frederick	0	45-069-	\N	\N	\N
12129	45	Virginia	071	Giles	0	45-071-	\N	\N	\N
12130	45	Virginia	073	Gloucester	0	45-073-	\N	\N	\N
12131	45	Virginia	075	Goochland	0	45-075-	\N	\N	\N
12132	45	Virginia	077	Grayson	0	45-077-	\N	\N	\N
12133	45	Virginia	079	Greene	0	45-079-	\N	\N	\N
12134	45	Virginia	081	Greensville	0	45-081-	\N	\N	\N
12135	45	Virginia	083	Halifax	0	45-083-	\N	\N	\N
12136	45	Virginia	085	Hanover	0	45-085-	\N	\N	\N
12137	45	Virginia	087	Henrico	0	45-087-	\N	\N	\N
12138	45	Virginia	089	Henry	0	45-089-	\N	\N	\N
12139	45	Virginia	091	Highland	0	45-091-	\N	\N	\N
12140	45	Virginia	093	Isle Of Wight	0	45-093-	\N	\N	\N
12141	45	Virginia	095	James City	0	45-095-	\N	\N	\N
12142	45	Virginia	097	King And Queen	0	45-097-	\N	\N	\N
12143	45	Virginia	099	King George	0	45-099-	\N	\N	\N
12144	45	Virginia	101	King William	0	45-101-	\N	\N	\N
12145	45	Virginia	103	Lancaster	0	45-103-	\N	\N	\N
12146	45	Virginia	105	Lee	0	45-105-	\N	\N	\N
12147	45	Virginia	107	Loudoun	0	45-107-	\N	\N	\N
12148	45	Virginia	109	Louisa	0	45-109-	\N	\N	\N
12149	45	Virginia	110	Currituck Sound	0	45-110-	\N	\N	\N
12150	45	Virginia	111	Lunenburg	0	45-111-	\N	\N	\N
12151	45	Virginia	113	Madison	0	45-113-	\N	\N	\N
12152	45	Virginia	115	Mathews	0	45-115-	\N	\N	\N
12153	45	Virginia	117	Mecklenburg	0	45-117-	\N	\N	\N
12154	45	Virginia	119	Middlesex	0	45-119-	\N	\N	\N
12155	45	Virginia	121	Montgomery	0	45-121-	\N	\N	\N
12156	45	Virginia	123	Nansemond	0	45-123-	\N	\N	\N
12157	45	Virginia	125	Nelson	0	45-125-	\N	\N	\N
12158	45	Virginia	127	New Kent	0	45-127-	\N	\N	\N
12159	45	Virginia	129	Norfolk	0	45-129-	\N	\N	\N
12160	45	Virginia	131	Northampton	0	45-131-	\N	\N	\N
12161	45	Virginia	133	Northumberland	0	45-133-	\N	\N	\N
12162	45	Virginia	135	Nottoway	0	45-135-	\N	\N	\N
12163	45	Virginia	137	Orange	0	45-137-	\N	\N	\N
12164	45	Virginia	139	Page	0	45-139-	\N	\N	\N
12165	45	Virginia	141	Patrick	0	45-141-	\N	\N	\N
12166	45	Virginia	143	Pittsylvania	0	45-143-	\N	\N	\N
12167	45	Virginia	145	Powhatan	0	45-145-	\N	\N	\N
12168	45	Virginia	147	Prince Edward	0	45-147-	\N	\N	\N
12169	45	Virginia	149	Prince George	0	45-149-	\N	\N	\N
12170	45	Virginia	151	Virginia Beach	0	45-151-	\N	\N	\N
12171	45	Virginia	153	Prince William	0	45-153-	\N	\N	\N
12172	45	Virginia	155	Pulaski	0	45-155-	\N	\N	\N
12173	45	Virginia	157	Rappahannock	0	45-157-	\N	\N	\N
12174	45	Virginia	159	Richmond	0	45-159-	\N	\N	\N
12175	45	Virginia	161	Roanoke	0	45-161-	\N	\N	\N
12176	45	Virginia	163	Rockbridge	0	45-163-	\N	\N	\N
12177	45	Virginia	165	Rockingham	0	45-165-	\N	\N	\N
12178	45	Virginia	167	Russell	0	45-167-	\N	\N	\N
12179	45	Virginia	169	Scott	0	45-169-	\N	\N	\N
12180	45	Virginia	171	Shenandoah	0	45-171-	\N	\N	\N
12181	45	Virginia	173	Smyth	0	45-173-	\N	\N	\N
12182	45	Virginia	175	Southampton	0	45-175-	\N	\N	\N
12183	45	Virginia	177	Spotsylvania	0	45-177-	\N	\N	\N
12184	45	Virginia	179	Stafford	0	45-179-	\N	\N	\N
12185	45	Virginia	181	Surry	0	45-181-	\N	\N	\N
12186	45	Virginia	183	Sussex	0	45-183-	\N	\N	\N
12187	45	Virginia	185	Tazewell	0	45-185-	\N	\N	\N
12188	45	Virginia	187	Warren	0	45-187-	\N	\N	\N
12189	45	Virginia	191	Washington	0	45-191-	\N	\N	\N
12190	45	Virginia	193	Westmoreland	0	45-193-	\N	\N	\N
12191	45	Virginia	195	Wise	0	45-195-	\N	\N	\N
12192	45	Virginia	197	Wythe	0	45-197-	\N	\N	\N
12193	45	Virginia	199	York	0	45-199-	\N	\N	\N
12194	45	Virginia	201	Accomack Offshore	0	45-201-	\N	\N	\N
12195	45	Virginia	331	Northampton Offshore	0	45-331-	\N	\N	\N
12196	45	Virginia	351	Virginia Beach Offshore	0	45-351-	\N	\N	\N
12197	45	Virginia	399	York Offshore	0	45-399-	\N	\N	\N
12198	45	Virginia	510	Alexandria City	0	45-510-	\N	\N	\N
12199	45	Virginia	515	Bedford City	0	45-515-	\N	\N	\N
12200	45	Virginia	520	Bristol City	0	45-520-	\N	\N	\N
12201	45	Virginia	530	Buena Vista City	0	45-530-	\N	\N	\N
12202	45	Virginia	540	Charlottesville City	0	45-540-	\N	\N	\N
12203	45	Virginia	550	Chesapeake City	0	45-550-	\N	\N	\N
12204	45	Virginia	560	Clifton Forge City	0	45-560-	\N	\N	\N
12205	45	Virginia	570	Colonial Heights City	0	45-570-	\N	\N	\N
12206	45	Virginia	580	Covington City	0	45-580-	\N	\N	\N
12207	45	Virginia	590	Danville City	0	45-590-	\N	\N	\N
12208	45	Virginia	595	Emporia City	0	45-595-	\N	\N	\N
12209	45	Virginia	600	Fairfax City	0	45-600-	\N	\N	\N
12210	45	Virginia	610	Falls Church City	0	45-610-	\N	\N	\N
12211	45	Virginia	620	Franklin City	0	45-620-	\N	\N	\N
12212	45	Virginia	630	Fredericksburg City	0	45-630-	\N	\N	\N
12213	45	Virginia	640	Galax City	0	45-640-	\N	\N	\N
12214	45	Virginia	650	Hampton City	0	45-650-	\N	\N	\N
12215	45	Virginia	660	Harrisonburg City	0	45-660-	\N	\N	\N
12216	45	Virginia	670	Hopewell City	0	45-670-	\N	\N	\N
12217	45	Virginia	678	Lexington City	0	45-678-	\N	\N	\N
12218	45	Virginia	680	Lynchburg City	0	45-680-	\N	\N	\N
12219	45	Virginia	683	Manassas City	0	45-683-	\N	\N	\N
12220	45	Virginia	685	Manassas Park City	0	45-685-	\N	\N	\N
12221	45	Virginia	690	Martinsville City	0	45-690-	\N	\N	\N
12222	45	Virginia	700	Newport News City	0	45-700-	\N	\N	\N
12223	45	Virginia	710	Norfolk City	0	45-710-	\N	\N	\N
12224	45	Virginia	720	Norton City	0	45-720-	\N	\N	\N
12225	45	Virginia	730	Petersburg City	0	45-730-	\N	\N	\N
12226	45	Virginia	735	Poquoson City	0	45-735-	\N	\N	\N
12227	45	Virginia	740	Portsmouth City	0	45-740-	\N	\N	\N
12228	45	Virginia	750	Radford City	0	45-750-	\N	\N	\N
12229	45	Virginia	760	Richmond City	0	45-760-	\N	\N	\N
12230	45	Virginia	770	Roanoke City	0	45-770-	\N	\N	\N
12231	45	Virginia	775	Salem City	0	45-775-	\N	\N	\N
12232	45	Virginia	780	South Boston City	0	45-780-	\N	\N	\N
12233	45	Virginia	790	Staunton City	0	45-790-	\N	\N	\N
12234	45	Virginia	800	Suffolk City	0	45-800-	\N	\N	\N
12235	45	Virginia	810	Virginia Beach City	0	45-810-	\N	\N	\N
12236	45	Virginia	820	Waynesboro City	0	45-820-	\N	\N	\N
12237	45	Virginia	830	Williamsburg City	0	45-830-	\N	\N	\N
12238	45	Virginia	840	Winchester City	0	45-840-	\N	\N	\N
12239	45	Virginia	900	Charlottesville (City)	0	45-900-	\N	\N	\N
12240	45	Virginia	901	Clovington (City)	0	45-901-	\N	\N	\N
12241	45	Virginia	902	Clifton Forge (City)	0	45-902-	\N	\N	\N
12242	45	Virginia	903	Alexandria (City)	0	45-903-	\N	\N	\N
12243	45	Virginia	904	Staunton (City)	0	45-904-	\N	\N	\N
12244	45	Virginia	905	Waynesboro (City)	0	45-905-	\N	\N	\N
12245	45	Virginia	906	Bedford (City)	0	45-906-	\N	\N	\N
12246	45	Virginia	907	Lynchburg (City)	0	45-907-	\N	\N	\N
12247	45	Virginia	908	Galax (City)	0	45-908-	\N	\N	\N
12248	45	Virginia	909	Colonial Heights (City)	0	45-909-	\N	\N	\N
12249	45	Virginia	910	Petersburg (City)	0	45-910-	\N	\N	\N
12250	45	Virginia	911	Fairfax (City)	0	45-911-	\N	\N	\N
12251	45	Virginia	912	Falls Church (City)	0	45-912-	\N	\N	\N
12252	45	Virginia	913	Winchester (City)	0	45-913-	\N	\N	\N
12253	45	Virginia	914	Emporia (City)	0	45-914-	\N	\N	\N
12254	45	Virginia	915	South Boston (City)	0	45-915-	\N	\N	\N
12255	45	Virginia	916	Richmond (City)	0	45-916-	\N	\N	\N
12256	45	Virginia	917	Martinsville (City)	0	45-917-	\N	\N	\N
12257	45	Virginia	918	Williamsburg (City)	0	45-918-	\N	\N	\N
12258	45	Virginia	919	Radford (City)	0	45-919-	\N	\N	\N
12259	45	Virginia	920	Suffolk (City)	0	45-920-	\N	\N	\N
12260	45	Virginia	921	Chesapeake (City)	0	45-921-	\N	\N	\N
12261	45	Virginia	922	Norfolk (City)	0	45-922-	\N	\N	\N
12262	45	Virginia	923	Portsmouth (City)	0	45-923-	\N	\N	\N
12263	45	Virginia	924	Danville (City)	0	45-924-	\N	\N	\N
12264	45	Virginia	925	Hopewell (City)	0	45-925-	\N	\N	\N
12265	45	Virginia	926	Virginia Beach (City)	0	45-926-	\N	\N	\N
12266	45	Virginia	927	Roanoke (City)	0	45-927-	\N	\N	\N
12267	45	Virginia	928	Salem (City)	0	45-928-	\N	\N	\N
12268	45	Virginia	929	Buena Vista (City)	0	45-929-	\N	\N	\N
12269	45	Virginia	930	Lexington (City)	0	45-930-	\N	\N	\N
12270	45	Virginia	931	Harrisonburg (City)	0	45-931-	\N	\N	\N
12271	45	Virginia	932	Franklin (City)	0	45-932-	\N	\N	\N
12272	45	Virginia	933	Fredericksburg (City)	0	45-933-	\N	\N	\N
12273	45	Virginia	934	Bristol (City)	0	45-934-	\N	\N	\N
12274	45	Virginia	935	Norton (City)	0	45-935-	\N	\N	\N
12275	45	Virginia	936	Hampton (City)	0	45-936-	\N	\N	\N
12276	45	Virginia	937	Newport News (City)	0	45-937-	\N	\N	\N
12277	46	Washington	001	Adams	0	46-001-	\N	\N	\N
12278	46	Washington	003	Asotin	0	46-003-	\N	\N	\N
12279	46	Washington	005	Benton	0	46-005-	\N	\N	\N
12280	46	Washington	007	Chelan	0	46-007-	\N	\N	\N
12281	46	Washington	009	Clallam	0	46-009-	\N	\N	\N
12282	46	Washington	011	Clark	0	46-011-	\N	\N	\N
12283	46	Washington	013	Columbia	0	46-013-	\N	\N	\N
12284	46	Washington	015	Cowlitz	0	46-015-	\N	\N	\N
12285	46	Washington	017	Douglas	0	46-017-	\N	\N	\N
12286	46	Washington	019	Ferry	0	46-019-	\N	\N	\N
12287	46	Washington	021	Franklin	0	46-021-	\N	\N	\N
12288	46	Washington	023	Garfield	0	46-023-	\N	\N	\N
12289	46	Washington	025	Grant	0	46-025-	\N	\N	\N
12290	46	Washington	027	Grays Harbor	0	46-027-	\N	\N	\N
12291	46	Washington	029	Island	0	46-029-	\N	\N	\N
12292	46	Washington	031	Jefferson	0	46-031-	\N	\N	\N
12293	46	Washington	033	King	0	46-033-	\N	\N	\N
12294	46	Washington	035	Kitsap	0	46-035-	\N	\N	\N
12295	46	Washington	037	Kittitas	0	46-037-	\N	\N	\N
12296	46	Washington	039	Klickitat	0	46-039-	\N	\N	\N
12297	46	Washington	041	Lewis	0	46-041-	\N	\N	\N
12298	46	Washington	043	Lincoln	0	46-043-	\N	\N	\N
12299	46	Washington	045	Mason	0	46-045-	\N	\N	\N
12300	46	Washington	047	Okanogan	0	46-047-	\N	\N	\N
12301	46	Washington	049	Pacific	0	46-049-	\N	\N	\N
12302	46	Washington	051	Pend Oreille	0	46-051-	\N	\N	\N
12303	46	Washington	053	Pierce	0	46-053-	\N	\N	\N
12304	46	Washington	055	San Juan	0	46-055-	\N	\N	\N
12305	46	Washington	057	Skagit	0	46-057-	\N	\N	\N
12306	46	Washington	059	Skamania	0	46-059-	\N	\N	\N
12307	46	Washington	061	Snohomish	0	46-061-	\N	\N	\N
12308	46	Washington	063	Spokane	0	46-063-	\N	\N	\N
12309	46	Washington	065	Stevens	0	46-065-	\N	\N	\N
12310	46	Washington	067	Thurston	0	46-067-	\N	\N	\N
12311	46	Washington	069	Wahkiakum	0	46-069-	\N	\N	\N
12312	46	Washington	071	Walla Walla	0	46-071-	\N	\N	\N
12313	46	Washington	073	Whatcom	0	46-073-	\N	\N	\N
12314	46	Washington	075	Whitman	0	46-075-	\N	\N	\N
12315	46	Washington	077	Yakima	0	46-077-	\N	\N	\N
12316	46	Washington	209	Clallam Offshore	0	46-209-	\N	\N	\N
12317	46	Washington	227	Grays Harbor Offshore	0	46-227-	\N	\N	\N
12318	46	Washington	231	Jefferson Offshore	0	46-231-	\N	\N	\N
12319	46	Washington	249	Pacific Offshore	0	46-249-	\N	\N	\N
12320	46	Washington	269	Wahkiakum Offshore	0	46-269-	\N	\N	\N
12321	47	West Virginia	001	Barbour	0	47-001-	\N	\N	\N
12322	47	West Virginia	003	Berkeley	0	47-003-	\N	\N	\N
12323	47	West Virginia	005	Boone	0	47-005-	\N	\N	\N
12324	47	West Virginia	007	Braxton	0	47-007-	\N	\N	\N
12325	47	West Virginia	009	Brooke	0	47-009-	\N	\N	\N
12326	47	West Virginia	011	Cabell	0	47-011-	\N	\N	\N
12327	47	West Virginia	013	Calhoun	0	47-013-	\N	\N	\N
12328	47	West Virginia	015	Clay	0	47-015-	\N	\N	\N
12329	47	West Virginia	017	Doddridge	0	47-017-	\N	\N	\N
12330	47	West Virginia	019	Fayette	0	47-019-	\N	\N	\N
12331	47	West Virginia	021	Gilmer	0	47-021-	\N	\N	\N
12332	47	West Virginia	023	Grant	0	47-023-	\N	\N	\N
12333	47	West Virginia	025	Greenbrier	0	47-025-	\N	\N	\N
12334	47	West Virginia	027	Hampshire	0	47-027-	\N	\N	\N
12335	47	West Virginia	029	Hancock	0	47-029-	\N	\N	\N
12336	47	West Virginia	031	Hardy	0	47-031-	\N	\N	\N
12337	47	West Virginia	033	Harrison	0	47-033-	\N	\N	\N
12338	47	West Virginia	035	Jackson	0	47-035-	\N	\N	\N
12339	47	West Virginia	037	Jefferson	0	47-037-	\N	\N	\N
12340	47	West Virginia	039	Kanawha	0	47-039-	\N	\N	\N
12341	47	West Virginia	041	Lewis	0	47-041-	\N	\N	\N
12342	47	West Virginia	043	Lincoln	0	47-043-	\N	\N	\N
12343	47	West Virginia	045	Logan	0	47-045-	\N	\N	\N
12344	47	West Virginia	047	Mc Dowell	0	47-047-	\N	\N	\N
12345	47	West Virginia	049	Marion	0	47-049-	\N	\N	\N
12346	47	West Virginia	051	Marshall	0	47-051-	\N	\N	\N
12347	47	West Virginia	053	Mason	0	47-053-	\N	\N	\N
12348	47	West Virginia	055	Mercer	0	47-055-	\N	\N	\N
12349	47	West Virginia	057	Mineral	0	47-057-	\N	\N	\N
12350	47	West Virginia	059	Mingo	0	47-059-	\N	\N	\N
12351	47	West Virginia	061	Monongalia	0	47-061-	\N	\N	\N
12352	47	West Virginia	063	Monroe	0	47-063-	\N	\N	\N
12353	47	West Virginia	065	Morgan	0	47-065-	\N	\N	\N
12354	47	West Virginia	067	Nicholas	0	47-067-	\N	\N	\N
12355	47	West Virginia	069	Ohio	0	47-069-	\N	\N	\N
12356	47	West Virginia	071	Pendleton	0	47-071-	\N	\N	\N
12357	47	West Virginia	073	Pleasants	0	47-073-	\N	\N	\N
12358	47	West Virginia	075	Pocahontas	0	47-075-	\N	\N	\N
12359	47	West Virginia	077	Preston	0	47-077-	\N	\N	\N
12360	47	West Virginia	079	Putnam	0	47-079-	\N	\N	\N
12361	47	West Virginia	081	Raleigh	0	47-081-	\N	\N	\N
12362	47	West Virginia	083	Randolph	0	47-083-	\N	\N	\N
12363	47	West Virginia	085	Ritchie	0	47-085-	\N	\N	\N
12364	47	West Virginia	087	Roane	0	47-087-	\N	\N	\N
12365	47	West Virginia	089	Summers	0	47-089-	\N	\N	\N
12366	47	West Virginia	091	Taylor	0	47-091-	\N	\N	\N
12367	47	West Virginia	093	Tucker	0	47-093-	\N	\N	\N
12368	47	West Virginia	095	Tyler	0	47-095-	\N	\N	\N
12369	47	West Virginia	097	Upshur	0	47-097-	\N	\N	\N
12370	47	West Virginia	099	Wayne	0	47-099-	\N	\N	\N
12371	47	West Virginia	101	Webster	0	47-101-	\N	\N	\N
12372	47	West Virginia	103	Wetzel	0	47-103-	\N	\N	\N
12373	47	West Virginia	105	Wirt	0	47-105-	\N	\N	\N
12374	47	West Virginia	107	Wood	0	47-107-	\N	\N	\N
12375	47	West Virginia	109	Wyoming	0	47-109-	\N	\N	\N
12376	48	Wisconsin	001	Adams	0	48-001-	\N	\N	\N
12377	48	Wisconsin	003	Ashland	0	48-003-	\N	\N	\N
12378	48	Wisconsin	005	Barron	0	48-005-	\N	\N	\N
12379	48	Wisconsin	007	Bayfield	0	48-007-	\N	\N	\N
12380	48	Wisconsin	009	Brown	0	48-009-	\N	\N	\N
12381	48	Wisconsin	011	Buffalo	0	48-011-	\N	\N	\N
12382	48	Wisconsin	013	Burnett	0	48-013-	\N	\N	\N
12383	48	Wisconsin	015	Calumet	0	48-015-	\N	\N	\N
12384	48	Wisconsin	017	Chippewa	0	48-017-	\N	\N	\N
12385	48	Wisconsin	019	Clark	0	48-019-	\N	\N	\N
12386	48	Wisconsin	021	Columbia	0	48-021-	\N	\N	\N
12387	48	Wisconsin	023	Crawford	0	48-023-	\N	\N	\N
12388	48	Wisconsin	025	Dane	0	48-025-	\N	\N	\N
12389	48	Wisconsin	027	Dodge	0	48-027-	\N	\N	\N
12390	48	Wisconsin	029	Door	0	48-029-	\N	\N	\N
12391	48	Wisconsin	031	Douglas	0	48-031-	\N	\N	\N
12392	48	Wisconsin	033	Dunn	0	48-033-	\N	\N	\N
12393	48	Wisconsin	035	Eau Claire	0	48-035-	\N	\N	\N
12394	48	Wisconsin	037	Florence	0	48-037-	\N	\N	\N
12395	48	Wisconsin	039	Fond Du Lac	0	48-039-	\N	\N	\N
12396	48	Wisconsin	041	Forest	0	48-041-	\N	\N	\N
12397	48	Wisconsin	043	Grant	0	48-043-	\N	\N	\N
12398	48	Wisconsin	045	Green	0	48-045-	\N	\N	\N
12399	48	Wisconsin	047	Green Lake	0	48-047-	\N	\N	\N
12400	48	Wisconsin	049	Iowa	0	48-049-	\N	\N	\N
12401	48	Wisconsin	051	Iron	0	48-051-	\N	\N	\N
12402	48	Wisconsin	053	Jackson	0	48-053-	\N	\N	\N
12403	48	Wisconsin	055	Jefferson	0	48-055-	\N	\N	\N
12404	48	Wisconsin	057	Juneau	0	48-057-	\N	\N	\N
12405	48	Wisconsin	059	Kenosha	0	48-059-	\N	\N	\N
12406	48	Wisconsin	061	Kewaunee	0	48-061-	\N	\N	\N
12407	48	Wisconsin	063	La Crosse	0	48-063-	\N	\N	\N
12408	48	Wisconsin	065	Lafayette	0	48-065-	\N	\N	\N
12409	48	Wisconsin	067	Langlade	0	48-067-	\N	\N	\N
12410	48	Wisconsin	069	Lincoln	0	48-069-	\N	\N	\N
12411	48	Wisconsin	071	Manitowoc	0	48-071-	\N	\N	\N
12412	48	Wisconsin	073	Marathon	0	48-073-	\N	\N	\N
12413	48	Wisconsin	075	Marinette	0	48-075-	\N	\N	\N
12414	48	Wisconsin	077	Marquette	0	48-077-	\N	\N	\N
12415	48	Wisconsin	078	Menominee	0	48-078-	\N	\N	\N
12416	48	Wisconsin	079	Milwaukee	0	48-079-	\N	\N	\N
12417	48	Wisconsin	081	Monroe	0	48-081-	\N	\N	\N
12418	48	Wisconsin	083	Oconto	0	48-083-	\N	\N	\N
12419	48	Wisconsin	085	Oneida	0	48-085-	\N	\N	\N
12420	48	Wisconsin	087	Outagamie	0	48-087-	\N	\N	\N
12421	48	Wisconsin	089	Ozaukee	0	48-089-	\N	\N	\N
12422	48	Wisconsin	091	Pepin	0	48-091-	\N	\N	\N
12423	48	Wisconsin	093	Pierce	0	48-093-	\N	\N	\N
12424	48	Wisconsin	095	Polk	0	48-095-	\N	\N	\N
12425	48	Wisconsin	097	Portage	0	48-097-	\N	\N	\N
12426	48	Wisconsin	099	Price	0	48-099-	\N	\N	\N
12427	48	Wisconsin	101	Racine	0	48-101-	\N	\N	\N
12428	48	Wisconsin	103	Richland	0	48-103-	\N	\N	\N
12429	48	Wisconsin	105	Rock	0	48-105-	\N	\N	\N
12430	48	Wisconsin	107	Rusk	0	48-107-	\N	\N	\N
12431	48	Wisconsin	109	St Croix	0	48-109-	\N	\N	\N
12432	48	Wisconsin	111	Sauk	0	48-111-	\N	\N	\N
12433	48	Wisconsin	113	Sawyer	0	48-113-	\N	\N	\N
12434	48	Wisconsin	115	Shawano	0	48-115-	\N	\N	\N
12435	48	Wisconsin	117	Sheboygan	0	48-117-	\N	\N	\N
12436	48	Wisconsin	119	Taylor	0	48-119-	\N	\N	\N
12437	48	Wisconsin	121	Trempealeau	0	48-121-	\N	\N	\N
12438	48	Wisconsin	123	Vernon	0	48-123-	\N	\N	\N
12439	48	Wisconsin	125	Vilas	0	48-125-	\N	\N	\N
12440	48	Wisconsin	127	Walworth	0	48-127-	\N	\N	\N
12441	48	Wisconsin	129	Washburn	0	48-129-	\N	\N	\N
12442	48	Wisconsin	131	Washington	0	48-131-	\N	\N	\N
12443	48	Wisconsin	133	Waukesha	0	48-133-	\N	\N	\N
12444	48	Wisconsin	135	Waupaca	0	48-135-	\N	\N	\N
12445	48	Wisconsin	137	Waushara	0	48-137-	\N	\N	\N
12446	48	Wisconsin	139	Winnebago	0	48-139-	\N	\N	\N
12447	48	Wisconsin	141	Wood	0	48-141-	\N	\N	\N
12448	48	Wisconsin	548	Lake Michigan	0	48-548-	\N	\N	\N
12449	48	Wisconsin	570	Lake Superior	0	48-570-	\N	\N	\N
12450	49	Wyoming	001	Albany	1	49-001-	\N	\N	\N
12451	49	Wyoming	003	Big Horn	1	49-003-	\N	\N	\N
12452	49	Wyoming	005	Campbell	1	49-005-	\N	\N	\N
12453	49	Wyoming	007	Carbon	1	49-007-	\N	\N	\N
12454	49	Wyoming	009	Converse	1	49-009-	\N	\N	\N
12455	49	Wyoming	011	Crook	1	49-011-	\N	\N	\N
12456	49	Wyoming	013	Fremont	1	49-013-	\N	\N	\N
12457	49	Wyoming	015	Goshen	1	49-015-	\N	\N	\N
12458	49	Wyoming	017	Hot Springs	1	49-017-	\N	\N	\N
12459	49	Wyoming	019	Johnson	1	49-019-	\N	\N	\N
12460	49	Wyoming	021	Laramie	1	49-021-	\N	\N	\N
12461	49	Wyoming	023	Lincoln	1	49-023-	\N	\N	\N
12462	49	Wyoming	025	Natrona	1	49-025-	\N	\N	\N
12463	49	Wyoming	027	Niobrara	1	49-027-	\N	\N	\N
12464	49	Wyoming	029	Park	1	49-029-	\N	\N	\N
12465	49	Wyoming	031	Platte	1	49-031-	\N	\N	\N
12466	49	Wyoming	033	Sheridan	1	49-033-	\N	\N	\N
12467	49	Wyoming	035	Sublette	1	49-035-	\N	\N	\N
12468	49	Wyoming	037	Sweetwater	1	49-037-	\N	\N	\N
12469	49	Wyoming	039	Teton	1	49-039-	\N	\N	\N
12470	49	Wyoming	041	Uinta	1	49-041-	\N	\N	\N
12471	49	Wyoming	043	Washakie	1	49-043-	\N	\N	\N
12472	49	Wyoming	045	Weston	1	49-045-	\N	\N	\N
12473	49	Wyoming	047	Yellowstone National Park	1	49-047-	\N	\N	\N
12474	50	Alaska	001	Adak	0	50-001-	\N	\N	\N
12475	50	Alaska	003	Afognak	0	50-003-	\N	\N	\N
12476	50	Alaska	004	Alsek Valley	0	50-004-	\N	\N	\N
12477	50	Alaska	005	Ambler River	0	50-005-	\N	\N	\N
12478	50	Alaska	007	Amukta	0	50-007-	\N	\N	\N
12479	50	Alaska	009	Anchorage	0	50-009-	\N	\N	\N
12480	50	Alaska	011	Arctic	0	50-011-	\N	\N	\N
12481	50	Alaska	013	Atka	0	50-013-	\N	\N	\N
12482	50	Alaska	015	Atlin	0	50-015-	\N	\N	\N
12483	50	Alaska	017	Attu	0	50-017-	\N	\N	\N
12484	50	Alaska	019	Baird Inlet	0	50-019-	\N	\N	\N
12485	50	Alaska	021	Baird Mountains	0	50-021-	\N	\N	\N
12486	50	Alaska	023	Barrow	0	50-023-	\N	\N	\N
12487	50	Alaska	025	Barter Island	0	50-025-	\N	\N	\N
12488	50	Alaska	027	Beaver	0	50-027-	\N	\N	\N
12489	50	Alaska	029	Beechey Point	0	50-029-	\N	\N	\N
12490	50	Alaska	031	Bendeleben	0	50-031-	\N	\N	\N
12491	50	Alaska	033	Bering Glacier	0	50-033-	\N	\N	\N
12492	50	Alaska	035	Bethel	0	50-035-	\N	\N	\N
12493	50	Alaska	037	Bettles	0	50-037-	\N	\N	\N
12494	50	Alaska	039	Big Delta	0	50-039-	\N	\N	\N
12495	50	Alaska	041	Black	0	50-041-	\N	\N	\N
12496	50	Alaska	043	Black River	0	50-043-	\N	\N	\N
12497	50	Alaska	045	Blying Sound	0	50-045-	\N	\N	\N
12498	50	Alaska	047	Bradfield Canal	0	50-047-	\N	\N	\N
12499	50	Alaska	049	Bristol Bay	0	50-049-	\N	\N	\N
12500	50	Alaska	051	Candle	0	50-051-	\N	\N	\N
12501	50	Alaska	053	Cape Mendenhall	0	50-053-	\N	\N	\N
12502	50	Alaska	055	Chandalar	0	50-055-	\N	\N	\N
12503	50	Alaska	057	Chandler Lake	0	50-057-	\N	\N	\N
12504	50	Alaska	059	Charley River	0	50-059-	\N	\N	\N
12505	50	Alaska	061	Chignik	0	50-061-	\N	\N	\N
12506	50	Alaska	063	Christian	0	50-063-	\N	\N	\N
12507	50	Alaska	065	Circle	0	50-065-	\N	\N	\N
12508	50	Alaska	067	Coleen	0	50-067-	\N	\N	\N
12509	50	Alaska	069	Cordova	0	50-069-	\N	\N	\N
12510	50	Alaska	071	Craig	0	50-071-	\N	\N	\N
12511	50	Alaska	072	Dall Seamount	0	50-072-	\N	\N	\N
12512	50	Alaska	073	De Long Mountains	0	50-073-	\N	\N	\N
12513	50	Alaska	075	Demarcation Point	0	50-075-	\N	\N	\N
12514	50	Alaska	077	Dillingham	0	50-077-	\N	\N	\N
12515	50	Alaska	079	Dixon Entrance	0	50-079-	\N	\N	\N
12516	50	Alaska	081	Eagle	0	50-081-	\N	\N	\N
12517	50	Alaska	083	Fairbanks	0	50-083-	\N	\N	\N
12518	50	Alaska	085	Fairweather	0	50-085-	\N	\N	\N
12519	50	Alaska	087	False Pass	0	50-087-	\N	\N	\N
12520	50	Alaska	089	Flaxman Island	0	50-089-	\N	\N	\N
12521	50	Alaska	091	Fort Yukon	0	50-091-	\N	\N	\N
12522	50	Alaska	093	Cold Bay	0	50-093-	\N	\N	\N
12523	50	Alaska	095	Gareloi Island	0	50-095-	\N	\N	\N
12524	50	Alaska	097	Goodnews Bay	0	50-097-	\N	\N	\N
12525	50	Alaska	099	Gulkana	0	50-099-	\N	\N	\N
12526	50	Alaska	101	Hagemeister Island	0	50-101-	\N	\N	\N
12527	50	Alaska	103	Harrison Bay	0	50-103-	\N	\N	\N
12528	50	Alaska	105	Healy	0	50-105-	\N	\N	\N
12529	50	Alaska	107	Holy Cross	0	50-107-	\N	\N	\N
12530	50	Alaska	109	Hooper Bay	0	50-109-	\N	\N	\N
12531	50	Alaska	111	Howard Pass	0	50-111-	\N	\N	\N
12532	50	Alaska	113	Hughes	0	50-113-	\N	\N	\N
12533	50	Alaska	115	Icy Bay	0	50-115-	\N	\N	\N
12534	50	Alaska	117	Iditarod	0	50-117-	\N	\N	\N
12535	50	Alaska	119	Ikpikpuk River	0	50-119-	\N	\N	\N
12536	50	Alaska	121	Iliamna	0	50-121-	\N	\N	\N
12537	50	Alaska	123	Juneau	0	50-123-	\N	\N	\N
12538	50	Alaska	125	Kaguyak	0	50-125-	\N	\N	\N
12539	50	Alaska	127	Kantishna River	0	50-127-	\N	\N	\N
12540	50	Alaska	129	Karluk	0	50-129-	\N	\N	\N
12541	50	Alaska	131	Kateel River	0	50-131-	\N	\N	\N
12542	50	Alaska	133	Kenai	0	50-133-	\N	\N	\N
12543	50	Alaska	135	Ketchikan	0	50-135-	\N	\N	\N
12544	50	Alaska	137	Killik River	0	50-137-	\N	\N	\N
12545	50	Alaska	139	Kiska	0	50-139-	\N	\N	\N
12546	50	Alaska	141	Kodiak	0	50-141-	\N	\N	\N
12547	50	Alaska	143	Kotzebue	0	50-143-	\N	\N	\N
12548	50	Alaska	145	Kuskokwim Bay	0	50-145-	\N	\N	\N
12549	50	Alaska	147	Kwiguk	0	50-147-	\N	\N	\N
12550	50	Alaska	149	Lake Clark	0	50-149-	\N	\N	\N
12551	50	Alaska	151	Lime Hills	0	50-151-	\N	\N	\N
12552	50	Alaska	153	Livengood	0	50-153-	\N	\N	\N
12553	50	Alaska	155	Lookout Ridge	0	50-155-	\N	\N	\N
12554	50	Alaska	157	Marshall	0	50-157-	\N	\N	\N
12555	50	Alaska	159	Mccarthy	0	50-159-	\N	\N	\N
12556	50	Alaska	161	Mcgrath	0	50-161-	\N	\N	\N
12557	50	Alaska	163	Meade River	0	50-163-	\N	\N	\N
12558	50	Alaska	165	Medfra	0	50-165-	\N	\N	\N
12559	50	Alaska	167	Melozitna	0	50-167-	\N	\N	\N
12560	50	Alaska	169	Middleton Island	0	50-169-	\N	\N	\N
12561	50	Alaska	171	Misheguk Mountain	0	50-171-	\N	\N	\N
12562	50	Alaska	173	Mt Hayes	0	50-173-	\N	\N	\N
12563	50	Alaska	175	Mt Katmai	0	50-175-	\N	\N	\N
12564	50	Alaska	177	Mt Mckinley	0	50-177-	\N	\N	\N
12565	50	Alaska	179	Mt Michelson	0	50-179-	\N	\N	\N
12566	50	Alaska	181	Mt St Elias	0	50-181-	\N	\N	\N
12567	50	Alaska	183	Nabesna	0	50-183-	\N	\N	\N
12568	50	Alaska	185	Naknek	0	50-185-	\N	\N	\N
12569	50	Alaska	187	Noatak	0	50-187-	\N	\N	\N
12570	50	Alaska	189	Nome	0	50-189-	\N	\N	\N
12571	50	Alaska	191	Norton Bay	0	50-191-	\N	\N	\N
12572	50	Alaska	193	Nulato	0	50-193-	\N	\N	\N
12573	50	Alaska	195	Nunivak Island	0	50-195-	\N	\N	\N
12574	50	Alaska	197	Nushagak Bay	0	50-197-	\N	\N	\N
12575	50	Alaska	199	Ophir	0	50-199-	\N	\N	\N
12576	50	Alaska	201	Petersburg	0	50-201-	\N	\N	\N
12577	50	Alaska	203	Phillip Smith Mountains	0	50-203-	\N	\N	\N
12578	50	Alaska	205	Point Hope	0	50-205-	\N	\N	\N
12579	50	Alaska	207	Point Lay	0	50-207-	\N	\N	\N
12580	50	Alaska	209	Port Alexander	0	50-209-	\N	\N	\N
12581	50	Alaska	211	Port Moller	0	50-211-	\N	\N	\N
12582	50	Alaska	213	Pribilof Islands	0	50-213-	\N	\N	\N
12583	50	Alaska	215	Prince Rupert	0	50-215-	\N	\N	\N
12584	50	Alaska	217	Rat Islands	0	50-217-	\N	\N	\N
12585	50	Alaska	219	Ruby	0	50-219-	\N	\N	\N
12586	50	Alaska	221	Russian Mission	0	50-221-	\N	\N	\N
12587	50	Alaska	223	Sagavanirktok	0	50-223-	\N	\N	\N
12588	50	Alaska	225	Samalga Island	0	50-225-	\N	\N	\N
12589	50	Alaska	227	Seguam	0	50-227-	\N	\N	\N
12590	50	Alaska	229	Selawik	0	50-229-	\N	\N	\N
12591	50	Alaska	231	Seldovia	0	50-231-	\N	\N	\N
12592	50	Alaska	233	Seward	0	50-233-	\N	\N	\N
12593	50	Alaska	235	Shishmaref	0	50-235-	\N	\N	\N
12594	50	Alaska	237	Shungnak	0	50-237-	\N	\N	\N
12595	50	Alaska	239	Simeonof Island	0	50-239-	\N	\N	\N
12596	50	Alaska	241	Sitka	0	50-241-	\N	\N	\N
12597	50	Alaska	243	Skagway	0	50-243-	\N	\N	\N
12598	50	Alaska	245	Sleetmute	0	50-245-	\N	\N	\N
12599	50	Alaska	247	Solomon	0	50-247-	\N	\N	\N
12600	50	Alaska	249	St Matthew	0	50-249-	\N	\N	\N
12601	50	Alaska	251	Stepovak Bay	0	50-251-	\N	\N	\N
12602	50	Alaska	253	St Lawrence	0	50-253-	\N	\N	\N
12603	50	Alaska	255	St Michael	0	50-255-	\N	\N	\N
12604	50	Alaska	257	Sumdum	0	50-257-	\N	\N	\N
12605	50	Alaska	259	Survey Pass	0	50-259-	\N	\N	\N
12606	50	Alaska	261	Sutwik Island	0	50-261-	\N	\N	\N
12607	50	Alaska	262	Dease Inlet	0	50-262-	\N	\N	\N
12608	50	Alaska	263	Table Mountain	0	50-263-	\N	\N	\N
12609	50	Alaska	265	Taku River	0	50-265-	\N	\N	\N
12610	50	Alaska	267	Talkeetna	0	50-267-	\N	\N	\N
12611	50	Alaska	269	Talkeetna Mountains	0	50-269-	\N	\N	\N
12612	50	Alaska	271	Tanacross	0	50-271-	\N	\N	\N
12613	50	Alaska	273	Tanana	0	50-273-	\N	\N	\N
12614	50	Alaska	275	Taylor Mountains	0	50-275-	\N	\N	\N
12615	50	Alaska	277	Teller	0	50-277-	\N	\N	\N
12616	50	Alaska	279	Teshekpuk	0	50-279-	\N	\N	\N
12617	50	Alaska	281	Trinity Islands	0	50-281-	\N	\N	\N
12618	50	Alaska	283	Tyonek	0	50-283-	\N	\N	\N
12619	50	Alaska	285	Ugashik	0	50-285-	\N	\N	\N
12620	50	Alaska	287	Umiat	0	50-287-	\N	\N	\N
12621	50	Alaska	289	Umnak	0	50-289-	\N	\N	\N
12622	50	Alaska	291	Unalakleet	0	50-291-	\N	\N	\N
12623	50	Alaska	293	Unalaska	0	50-293-	\N	\N	\N
12624	50	Alaska	295	Unimak	0	50-295-	\N	\N	\N
12625	50	Alaska	297	Utukok River	0	50-297-	\N	\N	\N
12626	50	Alaska	299	Valdez	0	50-299-	\N	\N	\N
12627	50	Alaska	301	Wainwright	0	50-301-	\N	\N	\N
12628	50	Alaska	303	Wiseman	0	50-303-	\N	\N	\N
12629	50	Alaska	305	Yakutat	0	50-305-	\N	\N	\N
12630	50	Alaska	366	Davidson Bank	0	50-366-	\N	\N	\N
12631	50	Alaska	367	St George East	0	50-367-	\N	\N	\N
12632	50	Alaska	397	Saint George Island	0	50-397-	\N	\N	\N
12633	50	Alaska	601	Adak Offshore	0	50-601-	\N	\N	\N
12634	50	Alaska	603	Afognak Offshore	0	50-603-	\N	\N	\N
12635	50	Alaska	607	Amukta Offshore	0	50-607-	\N	\N	\N
12636	50	Alaska	609	Anchorage Offshore	0	50-609-	\N	\N	\N
12637	50	Alaska	613	Atka Offshore	0	50-613-	\N	\N	\N
12638	50	Alaska	617	Attu Offshore	0	50-617-	\N	\N	\N
12639	50	Alaska	619	Baird Inlet Offshore	0	50-619-	\N	\N	\N
12640	50	Alaska	623	Barrow Offshore	0	50-623-	\N	\N	\N
12641	50	Alaska	625	Barter Island Offshore	0	50-625-	\N	\N	\N
12642	50	Alaska	629	Beechey Point Offshore	0	50-629-	\N	\N	\N
12643	50	Alaska	633	Bering Glacier Offshore	0	50-633-	\N	\N	\N
12644	50	Alaska	641	Black Offshore	0	50-641-	\N	\N	\N
12645	50	Alaska	645	Blying Sound Offshore	0	50-645-	\N	\N	\N
12646	50	Alaska	647	Bradfield Canal Offshore	0	50-647-	\N	\N	\N
12647	50	Alaska	649	Bristol Bay Offshore	0	50-649-	\N	\N	\N
12648	50	Alaska	653	Cape Mendenhall Offshore	0	50-653-	\N	\N	\N
12649	50	Alaska	661	Chignik Offshore	0	50-661-	\N	\N	\N
12650	50	Alaska	669	Cordova Offshore	0	50-669-	\N	\N	\N
12651	50	Alaska	671	Craig Offshore	0	50-671-	\N	\N	\N
12652	50	Alaska	673	De Long Mountains Offshore	0	50-673-	\N	\N	\N
12653	50	Alaska	675	Demarcation Point Offshore	0	50-675-	\N	\N	\N
12654	50	Alaska	679	Dixon Entrance Offshore	0	50-679-	\N	\N	\N
12655	50	Alaska	685	Fairweather Offshore	0	50-685-	\N	\N	\N
12656	50	Alaska	687	False Pass Offshore	0	50-687-	\N	\N	\N
12657	50	Alaska	689	Flaxman Island Offshore	0	50-689-	\N	\N	\N
12658	50	Alaska	693	Cold Bay Offshore	0	50-693-	\N	\N	\N
12659	50	Alaska	695	Gareloi Island Offshore	0	50-695-	\N	\N	\N
12660	50	Alaska	697	Goodnews Bay Offshore	0	50-697-	\N	\N	\N
12661	50	Alaska	701	Hagemeister Island Offshore	0	50-701-	\N	\N	\N
12662	50	Alaska	703	Harrison Bay Offshore	0	50-703-	\N	\N	\N
12663	50	Alaska	709	Hooper Bay Offshore	0	50-709-	\N	\N	\N
12664	50	Alaska	715	Icy Bay Offshore	0	50-715-	\N	\N	\N
12665	50	Alaska	721	Iliamna Offshore	0	50-721-	\N	\N	\N
12666	50	Alaska	723	Juneau Offshore	0	50-723-	\N	\N	\N
12667	50	Alaska	725	Kaguyak Offshore	0	50-725-	\N	\N	\N
12668	50	Alaska	729	Karluk Offshore	0	50-729-	\N	\N	\N
12669	50	Alaska	733	Kenai Offshore	0	50-733-	\N	\N	\N
12670	50	Alaska	735	Ketchikan Offshore	0	50-735-	\N	\N	\N
12671	50	Alaska	737	Killik River Offshore	0	50-737-	\N	\N	\N
12672	50	Alaska	739	Kiska Offshore	0	50-739-	\N	\N	\N
12673	50	Alaska	741	Kodiak Offshore	0	50-741-	\N	\N	\N
12674	50	Alaska	743	Kotzebue Offshore	0	50-743-	\N	\N	\N
12675	50	Alaska	745	Kuskokwim Bay Offshore	0	50-745-	\N	\N	\N
12676	50	Alaska	747	Kwiguk Offshore	0	50-747-	\N	\N	\N
12677	50	Alaska	763	Meade River Offshore	0	50-763-	\N	\N	\N
12678	50	Alaska	769	Middleton Island Offshore	0	50-769-	\N	\N	\N
12679	50	Alaska	775	Mt Katmai Offshore	0	50-775-	\N	\N	\N
12680	50	Alaska	779	Mt Michelson Offshore	0	50-779-	\N	\N	\N
12681	50	Alaska	781	Mt St Elias Offshore	0	50-781-	\N	\N	\N
12682	50	Alaska	785	Naknek Offshore	0	50-785-	\N	\N	\N
12683	50	Alaska	787	Noatak Offshore	0	50-787-	\N	\N	\N
12684	50	Alaska	789	Nome Offshore	0	50-789-	\N	\N	\N
12685	50	Alaska	791	Norton Bay Offshore	0	50-791-	\N	\N	\N
12686	50	Alaska	795	Nunivak Island Offshore	0	50-795-	\N	\N	\N
12687	50	Alaska	797	Nushagak Bay Offshore	0	50-797-	\N	\N	\N
12688	50	Alaska	801	Petersburg Offshore	0	50-801-	\N	\N	\N
12689	50	Alaska	805	Point Hope Offshore	0	50-805-	\N	\N	\N
12690	50	Alaska	807	Point Lay Offshore	0	50-807-	\N	\N	\N
12691	50	Alaska	809	Port Alexander Offshore	0	50-809-	\N	\N	\N
12692	50	Alaska	811	Port Moller Offshore	0	50-811-	\N	\N	\N
12693	50	Alaska	813	Pribilof Islands Offshore	0	50-813-	\N	\N	\N
12694	50	Alaska	815	Prince Rupert Offshore	0	50-815-	\N	\N	\N
12695	50	Alaska	817	Rat Islands Offshore	0	50-817-	\N	\N	\N
12696	50	Alaska	825	Samalga Island Offshore	0	50-825-	\N	\N	\N
12697	50	Alaska	827	Seguam Offshore	0	50-827-	\N	\N	\N
12698	50	Alaska	829	Selawik Offshore	0	50-829-	\N	\N	\N
12699	50	Alaska	831	Seldovia Offshore	0	50-831-	\N	\N	\N
12700	50	Alaska	833	Seward Offshore	0	50-833-	\N	\N	\N
12701	50	Alaska	835	Shishmaref Offshore	0	50-835-	\N	\N	\N
12702	50	Alaska	839	Simeonof Island Offshore	0	50-839-	\N	\N	\N
12703	50	Alaska	841	Sitka Offshore	0	50-841-	\N	\N	\N
12704	50	Alaska	843	Skagway Offshore	0	50-843-	\N	\N	\N
12705	50	Alaska	847	Solomon Offshore	0	50-847-	\N	\N	\N
12706	50	Alaska	849	St Matthew Offshore	0	50-849-	\N	\N	\N
12707	50	Alaska	851	Stepovak Bay Offshore	0	50-851-	\N	\N	\N
12708	50	Alaska	853	St Lawrence Offshore	0	50-853-	\N	\N	\N
12709	50	Alaska	855	St Michael Offshore	0	50-855-	\N	\N	\N
12710	50	Alaska	857	Sumdum Offshore	0	50-857-	\N	\N	\N
12711	50	Alaska	859	Survey Pass Offshore	0	50-859-	\N	\N	\N
12712	50	Alaska	861	Sutwik Island Offshore	0	50-861-	\N	\N	\N
12713	50	Alaska	865	Taku River Offshore	0	50-865-	\N	\N	\N
12714	50	Alaska	877	Teller Offshore	0	50-877-	\N	\N	\N
12715	50	Alaska	879	Teshekpuk Offshore	0	50-879-	\N	\N	\N
12716	50	Alaska	881	Trinity Islands Offshore	0	50-881-	\N	\N	\N
12717	50	Alaska	883	Tyonek Offshore	0	50-883-	\N	\N	\N
12718	50	Alaska	885	Ugashik Offshore	0	50-885-	\N	\N	\N
12719	50	Alaska	887	Umiat Offshore	0	50-887-	\N	\N	\N
12720	50	Alaska	889	Umnak Offshore	0	50-889-	\N	\N	\N
12721	50	Alaska	891	Unalakleet Offshore	0	50-891-	\N	\N	\N
12722	50	Alaska	893	Unalaska Offshore	0	50-893-	\N	\N	\N
12723	50	Alaska	895	Unimak Offshore	0	50-895-	\N	\N	\N
12724	50	Alaska	899	Valdez Offshore	0	50-899-	\N	\N	\N
12725	50	Alaska	901	Wainwright Offshore	0	50-901-	\N	\N	\N
12726	50	Alaska	905	Yakutat Offshore	0	50-905-	\N	\N	\N
12727	51	Hawaii	010	Hawaii	0	51-010-	\N	\N	\N
12728	51	Hawaii	015	Honolulu	0	51-015-	\N	\N	\N
12729	51	Hawaii	020	Kalawao	0	51-020-	\N	\N	\N
12730	51	Hawaii	025	Kauai	0	51-025-	\N	\N	\N
12731	51	Hawaii	035	Maui	0	51-035-	\N	\N	\N
12732	55	Alaska Offshore	001	Nm 9-3	0	55-001-	\N	\N	\N
12733	55	Alaska Offshore	002	Nm 9-1	0	55-002-	\N	\N	\N
12734	55	Alaska Offshore	003	Nn 9-7	0	55-003-	\N	\N	\N
12735	55	Alaska Offshore	004	Nn 9-5	0	55-004-	\N	\N	\N
12736	55	Alaska Offshore	005	Prince Rupert	0	55-005-	\N	\N	\N
12737	55	Alaska Offshore	006	Ketchican	0	55-006-	\N	\N	\N
12738	55	Alaska Offshore	007	No 9-7	0	55-007-	\N	\N	\N
12739	55	Alaska Offshore	020	Nr 9-5	0	55-020-	\N	\N	\N
12740	55	Alaska Offshore	021	Nr 9-3	0	55-021-	\N	\N	\N
12741	55	Alaska Offshore	022	Nr 9-1	0	55-022-	\N	\N	\N
12742	55	Alaska Offshore	023	Ns 9-7	0	55-023-	\N	\N	\N
12743	55	Alaska Offshore	024	Ns 9-5	0	55-024-	\N	\N	\N
12744	55	Alaska Offshore	025	Ns 9-3	0	55-025-	\N	\N	\N
12745	55	Alaska Offshore	026	Ns 9-1	0	55-026-	\N	\N	\N
12746	55	Alaska Offshore	027	Nt 9-7	0	55-027-	\N	\N	\N
12747	55	Alaska Offshore	028	Nt 9-5	0	55-028-	\N	\N	\N
12748	55	Alaska Offshore	029	Nt 9-3	0	55-029-	\N	\N	\N
12749	55	Alaska Offshore	030	Nt 9-1	0	55-030-	\N	\N	\N
12750	55	Alaska Offshore	031	Nm 8-4	0	55-031-	\N	\N	\N
12751	55	Alaska Offshore	032	Nm 8-2	0	55-032-	\N	\N	\N
12752	55	Alaska Offshore	033	Nn 8-8	0	55-033-	\N	\N	\N
12753	55	Alaska Offshore	034	Nn 8-6	0	55-034-	\N	\N	\N
12754	55	Alaska Offshore	035	Dixon Entrance	0	55-035-	\N	\N	\N
12755	55	Alaska Offshore	036	Craig	0	55-036-	\N	\N	\N
12756	55	Alaska Offshore	037	Port Alexander	0	55-037-	\N	\N	\N
12757	55	Alaska Offshore	038	Sumdum	0	55-038-	\N	\N	\N
12758	55	Alaska Offshore	039	Juneau	0	55-039-	\N	\N	\N
12759	55	Alaska Offshore	049	Nr 8-8	0	55-049-	\N	\N	\N
12760	55	Alaska Offshore	050	Nr 8-6	0	55-050-	\N	\N	\N
12761	55	Alaska Offshore	051	Nr 8-4	0	55-051-	\N	\N	\N
12762	55	Alaska Offshore	052	Nr 8-2	0	55-052-	\N	\N	\N
12763	55	Alaska Offshore	053	Ns 8-8	0	55-053-	\N	\N	\N
12764	55	Alaska Offshore	054	Ns 8-6	0	55-054-	\N	\N	\N
12765	55	Alaska Offshore	055	Ns 8-4	0	55-055-	\N	\N	\N
12766	55	Alaska Offshore	056	Ns 8-2	0	55-056-	\N	\N	\N
12767	55	Alaska Offshore	057	Nt 8-8	0	55-057-	\N	\N	\N
12768	55	Alaska Offshore	058	Nt 8-6	0	55-058-	\N	\N	\N
12769	55	Alaska Offshore	059	Nt 8-4	0	55-059-	\N	\N	\N
12770	55	Alaska Offshore	060	Nt 8-2	0	55-060-	\N	\N	\N
12771	55	Alaska Offshore	061	Nm 8-3	0	55-061-	\N	\N	\N
12772	55	Alaska Offshore	062	Nm 8-1	0	55-062-	\N	\N	\N
12773	55	Alaska Offshore	063	Nn 8-7	0	55-063-	\N	\N	\N
12774	55	Alaska Offshore	064	Nn 8-5	0	55-064-	\N	\N	\N
12775	55	Alaska Offshore	065	Nn 8-3	0	55-065-	\N	\N	\N
12776	55	Alaska Offshore	066	Baker Fan	0	55-066-	\N	\N	\N
12777	55	Alaska Offshore	067	Goddard	0	55-067-	\N	\N	\N
12778	55	Alaska Offshore	068	Sitka	0	55-068-	\N	\N	\N
12779	55	Alaska Offshore	069	Mt Fairweather	0	55-069-	\N	\N	\N
12780	55	Alaska Offshore	079	Nr 8-7	0	55-079-	\N	\N	\N
12781	55	Alaska Offshore	080	Nr 8-5	0	55-080-	\N	\N	\N
12782	55	Alaska Offshore	081	Nr 8-3	0	55-081-	\N	\N	\N
12783	55	Alaska Offshore	082	Nr 8-1	0	55-082-	\N	\N	\N
12784	55	Alaska Offshore	083	Ns 8-7	0	55-083-	\N	\N	\N
12785	55	Alaska Offshore	084	Ns 8-5	0	55-084-	\N	\N	\N
12786	55	Alaska Offshore	085	Ns 8-3	0	55-085-	\N	\N	\N
12787	55	Alaska Offshore	086	Ns 8-1	0	55-086-	\N	\N	\N
12788	55	Alaska Offshore	087	Nt 8-7	0	55-087-	\N	\N	\N
12789	55	Alaska Offshore	088	Nt 8-5	0	55-088-	\N	\N	\N
12790	55	Alaska Offshore	089	Nt 8-3	0	55-089-	\N	\N	\N
12791	55	Alaska Offshore	090	Nt 8-1	0	55-090-	\N	\N	\N
12792	55	Alaska Offshore	091	Nm 7-4	0	55-091-	\N	\N	\N
12793	55	Alaska Offshore	092	Nm 7-2	0	55-092-	\N	\N	\N
12794	55	Alaska Offshore	093	Nn 7-8	0	55-093-	\N	\N	\N
12795	55	Alaska Offshore	094	Nn 7-6	0	55-094-	\N	\N	\N
12796	55	Alaska Offshore	095	Nn 7-4	0	55-095-	\N	\N	\N
12797	55	Alaska Offshore	096	Nn 7-2	0	55-096-	\N	\N	\N
12798	55	Alaska Offshore	097	No 7-8	0	55-097-	\N	\N	\N
12799	55	Alaska Offshore	098	No 7-6	0	55-098-	\N	\N	\N
12800	55	Alaska Offshore	099	Alsek Valley	0	55-099-	\N	\N	\N
12801	55	Alaska Offshore	100	Yakutat	0	55-100-	\N	\N	\N
12802	55	Alaska Offshore	110	Nr 7-6	0	55-110-	\N	\N	\N
12803	55	Alaska Offshore	111	Nr 7-4	0	55-111-	\N	\N	\N
12804	55	Alaska Offshore	112	Nr 7-2	0	55-112-	\N	\N	\N
12805	55	Alaska Offshore	113	Ns 7-8	0	55-113-	\N	\N	\N
12806	55	Alaska Offshore	114	Ns 7-6	0	55-114-	\N	\N	\N
12807	55	Alaska Offshore	115	Ns 7-4	0	55-115-	\N	\N	\N
12808	55	Alaska Offshore	116	Ns 7-2	0	55-116-	\N	\N	\N
12809	55	Alaska Offshore	117	Nt 7-8	0	55-117-	\N	\N	\N
12810	55	Alaska Offshore	118	Nt 7-6	0	55-118-	\N	\N	\N
12811	55	Alaska Offshore	119	Nt 7-4	0	55-119-	\N	\N	\N
12812	55	Alaska Offshore	120	Nt 7-2	0	55-120-	\N	\N	\N
12813	55	Alaska Offshore	121	Nm 7-3	0	55-121-	\N	\N	\N
12814	55	Alaska Offshore	122	Nm 7-1	0	55-122-	\N	\N	\N
12815	55	Alaska Offshore	123	Nn 7-7	0	55-123-	\N	\N	\N
12816	55	Alaska Offshore	124	Nn 7-5	0	55-124-	\N	\N	\N
12817	55	Alaska Offshore	125	Nn 7-3	0	55-125-	\N	\N	\N
12818	55	Alaska Offshore	126	Nn 7-1	0	55-126-	\N	\N	\N
12819	55	Alaska Offshore	127	Pratt Seamount	0	55-127-	\N	\N	\N
12820	55	Alaska Offshore	128	No 7-5	0	55-128-	\N	\N	\N
12821	55	Alaska Offshore	129	No 7-3	0	55-129-	\N	\N	\N
12822	55	Alaska Offshore	130	Icy Bay	0	55-130-	\N	\N	\N
12823	55	Alaska Offshore	131	Np 7-7	0	55-131-	\N	\N	\N
12824	55	Alaska Offshore	140	Demarcation Point	0	55-140-	\N	\N	\N
12825	55	Alaska Offshore	141	Barter Island	0	55-141-	\N	\N	\N
12826	55	Alaska Offshore	142	Nr 7-1	0	55-142-	\N	\N	\N
12827	55	Alaska Offshore	143	Beaufort Terrace	0	55-143-	\N	\N	\N
12828	55	Alaska Offshore	144	Ns 7-5	0	55-144-	\N	\N	\N
12829	55	Alaska Offshore	145	Ns 7-3	0	55-145-	\N	\N	\N
12830	55	Alaska Offshore	146	Ns 7-1	0	55-146-	\N	\N	\N
12831	55	Alaska Offshore	147	Nt 7-7	0	55-147-	\N	\N	\N
12832	55	Alaska Offshore	148	Nt 7-5	0	55-148-	\N	\N	\N
12833	55	Alaska Offshore	149	Nt 7-3	0	55-149-	\N	\N	\N
12834	55	Alaska Offshore	150	Nt 7-1	0	55-150-	\N	\N	\N
12835	55	Alaska Offshore	151	Nm 6-4	0	55-151-	\N	\N	\N
12836	55	Alaska Offshore	152	Nm 6-2	0	55-152-	\N	\N	\N
12837	55	Alaska Offshore	153	Nn 6-8	0	55-153-	\N	\N	\N
12838	55	Alaska Offshore	154	Nn 6-6	0	55-154-	\N	\N	\N
12839	55	Alaska Offshore	155	Nn 6-4	0	55-155-	\N	\N	\N
12840	55	Alaska Offshore	156	Nn 6-2	0	55-156-	\N	\N	\N
12841	55	Alaska Offshore	157	Ely Seamount	0	55-157-	\N	\N	\N
12842	55	Alaska Offshore	158	No 6-6	0	55-158-	\N	\N	\N
12843	55	Alaska Offshore	159	Dall Seamount	0	55-159-	\N	\N	\N
12844	55	Alaska Offshore	160	Middleton Island	0	55-160-	\N	\N	\N
12845	55	Alaska Offshore	161	Cordova	0	55-161-	\N	\N	\N
12846	55	Alaska Offshore	171	Flaxman Island	0	55-171-	\N	\N	\N
12847	55	Alaska Offshore	172	Nr 6-2	0	55-172-	\N	\N	\N
12848	55	Alaska Offshore	173	Ns 6-8	0	55-173-	\N	\N	\N
12849	55	Alaska Offshore	174	Ns 6-6	0	55-174-	\N	\N	\N
12850	55	Alaska Offshore	175	Ns 6-4	0	55-175-	\N	\N	\N
12851	55	Alaska Offshore	176	Ns 6-2	0	55-176-	\N	\N	\N
12852	55	Alaska Offshore	177	Nt 6-8	0	55-177-	\N	\N	\N
12853	55	Alaska Offshore	178	Nt 6-6	0	55-178-	\N	\N	\N
12854	55	Alaska Offshore	179	Nt 6-4	0	55-179-	\N	\N	\N
12855	55	Alaska Offshore	180	Nt 6-2	0	55-180-	\N	\N	\N
12856	55	Alaska Offshore	181	Nm 6-3	0	55-181-	\N	\N	\N
12857	55	Alaska Offshore	182	Nm 6-1	0	55-182-	\N	\N	\N
12858	55	Alaska Offshore	183	Nn 6-7	0	55-183-	\N	\N	\N
12859	55	Alaska Offshore	184	Nn 6-5	0	55-184-	\N	\N	\N
12860	55	Alaska Offshore	185	Nn 6-3	0	55-185-	\N	\N	\N
12861	55	Alaska Offshore	186	Nn 6-1	0	55-186-	\N	\N	\N
12862	55	Alaska Offshore	187	Surveyor Seachannel	0	55-187-	\N	\N	\N
12863	55	Alaska Offshore	188	Kodiak Seamount	0	55-188-	\N	\N	\N
12864	55	Alaska Offshore	189	Portlock Bank	0	55-189-	\N	\N	\N
12865	55	Alaska Offshore	190	Blying Sound	0	55-190-	\N	\N	\N
12866	55	Alaska Offshore	191	Np 6-7	0	55-191-	\N	\N	\N
12867	55	Alaska Offshore	192	Np 6-5	0	55-192-	\N	\N	\N
12868	55	Alaska Offshore	201	Beechey Point	0	55-201-	\N	\N	\N
12869	55	Alaska Offshore	202	Nr 6-1	0	55-202-	\N	\N	\N
12870	55	Alaska Offshore	203	Canada Basin	0	55-203-	\N	\N	\N
12871	55	Alaska Offshore	204	Ns 6-5	0	55-204-	\N	\N	\N
12872	55	Alaska Offshore	205	Ns 6-3	0	55-205-	\N	\N	\N
12873	55	Alaska Offshore	206	Ns 6-1	0	55-206-	\N	\N	\N
12874	55	Alaska Offshore	207	Nt 6-7	0	55-207-	\N	\N	\N
12875	55	Alaska Offshore	208	Nt 6-5	0	55-208-	\N	\N	\N
12876	55	Alaska Offshore	209	Nt 6-3	0	55-209-	\N	\N	\N
12877	55	Alaska Offshore	210	Nt 6-1	0	55-210-	\N	\N	\N
12878	55	Alaska Offshore	211	Nm 5-4	0	55-211-	\N	\N	\N
12879	55	Alaska Offshore	212	Nm 5-2	0	55-212-	\N	\N	\N
12880	55	Alaska Offshore	213	Nn 5-8	0	55-213-	\N	\N	\N
12881	55	Alaska Offshore	214	Nn 5-6	0	55-214-	\N	\N	\N
12882	55	Alaska Offshore	215	Nn 5-4	0	55-215-	\N	\N	\N
12883	55	Alaska Offshore	216	Nn 5-2	0	55-216-	\N	\N	\N
12884	55	Alaska Offshore	217	Albatross Bank	0	55-217-	\N	\N	\N
12885	55	Alaska Offshore	218	Kodiak	0	55-218-	\N	\N	\N
12886	55	Alaska Offshore	219	Afognak	0	55-219-	\N	\N	\N
12887	55	Alaska Offshore	220	Seldovia	0	55-220-	\N	\N	\N
12888	55	Alaska Offshore	221	Kenai	0	55-221-	\N	\N	\N
12889	55	Alaska Offshore	222	Np 5-6	0	55-222-	\N	\N	\N
12890	55	Alaska Offshore	231	Harrison Bay	0	55-231-	\N	\N	\N
12891	55	Alaska Offshore	232	Nr 5-2	0	55-232-	\N	\N	\N
12892	55	Alaska Offshore	233	Ns 5-8	0	55-233-	\N	\N	\N
12893	55	Alaska Offshore	234	Ns 5-6	0	55-234-	\N	\N	\N
12894	55	Alaska Offshore	235	Ns 5-4	0	55-235-	\N	\N	\N
12895	55	Alaska Offshore	236	Ns 5-2	0	55-236-	\N	\N	\N
12896	55	Alaska Offshore	237	Nt 5-8	0	55-237-	\N	\N	\N
12897	55	Alaska Offshore	238	Nt 5-6	0	55-238-	\N	\N	\N
12898	55	Alaska Offshore	239	Nt 5-4	0	55-239-	\N	\N	\N
12899	55	Alaska Offshore	240	Nt 5-2	0	55-240-	\N	\N	\N
12900	55	Alaska Offshore	241	Nm 5-3	0	55-241-	\N	\N	\N
12901	55	Alaska Offshore	242	Nm 5-1	0	55-242-	\N	\N	\N
12902	55	Alaska Offshore	243	Nn 5-7	0	55-243-	\N	\N	\N
12903	55	Alaska Offshore	244	Nn 5-5	0	55-244-	\N	\N	\N
12904	55	Alaska Offshore	245	Chirikof Seamount	0	55-245-	\N	\N	\N
12905	55	Alaska Offshore	246	Chirikof Island	0	55-246-	\N	\N	\N
12906	55	Alaska Offshore	247	Trinity Islands	0	55-247-	\N	\N	\N
12907	55	Alaska Offshore	248	Karluk	0	55-248-	\N	\N	\N
12908	55	Alaska Offshore	249	Mt Katmai	0	55-249-	\N	\N	\N
12909	55	Alaska Offshore	250	Iliamna	0	55-250-	\N	\N	\N
12910	55	Alaska Offshore	261	Teshekpuk	0	55-261-	\N	\N	\N
12911	55	Alaska Offshore	262	Dease Inlet	0	55-262-	\N	\N	\N
12912	55	Alaska Offshore	263	Barrow Canyon	0	55-263-	\N	\N	\N
12913	55	Alaska Offshore	264	Ns 5-5	0	55-264-	\N	\N	\N
12914	55	Alaska Offshore	265	Ns 5-3	0	55-265-	\N	\N	\N
12915	55	Alaska Offshore	266	Ns 5-1	0	55-266-	\N	\N	\N
12916	55	Alaska Offshore	267	Nt 5-7	0	55-267-	\N	\N	\N
12917	55	Alaska Offshore	268	Nt 5-5	0	55-268-	\N	\N	\N
12918	55	Alaska Offshore	269	Nt 5-3	0	55-269-	\N	\N	\N
12919	55	Alaska Offshore	270	Nt 5-1	0	55-270-	\N	\N	\N
12920	55	Alaska Offshore	271	Nm 4-4	0	55-271-	\N	\N	\N
12921	55	Alaska Offshore	272	Nm 4-2	0	55-272-	\N	\N	\N
12922	55	Alaska Offshore	273	Nn 4-8	0	55-273-	\N	\N	\N
12923	55	Alaska Offshore	274	Walls Knoll	0	55-274-	\N	\N	\N
12924	55	Alaska Offshore	275	Shumagin Bank	0	55-275-	\N	\N	\N
12925	55	Alaska Offshore	276	Mitrofania Island	0	55-276-	\N	\N	\N
12926	55	Alaska Offshore	277	Sutwik Island	0	55-277-	\N	\N	\N
12927	55	Alaska Offshore	278	Ugashik	0	55-278-	\N	\N	\N
12928	55	Alaska Offshore	279	Naknek	0	55-279-	\N	\N	\N
12929	55	Alaska Offshore	291	Meade River	0	55-291-	\N	\N	\N
12930	55	Alaska Offshore	292	Barrow	0	55-292-	\N	\N	\N
12931	55	Alaska Offshore	293	Ns 4-8	0	55-293-	\N	\N	\N
12932	55	Alaska Offshore	294	Ns 4-6	0	55-294-	\N	\N	\N
12933	55	Alaska Offshore	295	Ns 4-4	0	55-295-	\N	\N	\N
12934	55	Alaska Offshore	296	Ns 4-2	0	55-296-	\N	\N	\N
12935	55	Alaska Offshore	297	Nt 4-8	0	55-297-	\N	\N	\N
12936	55	Alaska Offshore	298	Nt 4-6	0	55-298-	\N	\N	\N
12937	55	Alaska Offshore	299	Nt 4-4	0	55-299-	\N	\N	\N
12938	55	Alaska Offshore	300	Nt 4-2	0	55-300-	\N	\N	\N
12939	55	Alaska Offshore	301	Nm 4-3	0	55-301-	\N	\N	\N
12940	55	Alaska Offshore	302	Nm 4-1	0	55-302-	\N	\N	\N
12941	55	Alaska Offshore	303	Sirius Seamount	0	55-303-	\N	\N	\N
12942	55	Alaska Offshore	304	Derikson Seamount	0	55-304-	\N	\N	\N
12943	55	Alaska Offshore	305	Simeonof Island	0	55-305-	\N	\N	\N
12944	55	Alaska Offshore	306	Stepovak Bay	0	55-306-	\N	\N	\N
12945	55	Alaska Offshore	307	Chignik	0	55-307-	\N	\N	\N
12946	55	Alaska Offshore	308	No 4-5	0	55-308-	\N	\N	\N
12947	55	Alaska Offshore	309	Hagemeister Island	0	55-309-	\N	\N	\N
12948	55	Alaska Offshore	310	Goodnews	0	55-310-	\N	\N	\N
12949	55	Alaska Offshore	311	Np 4-7	0	55-311-	\N	\N	\N
12950	55	Alaska Offshore	314	Unalakleet	0	55-314-	\N	\N	\N
12951	55	Alaska Offshore	315	Cape Denbigh	0	55-315-	\N	\N	\N
12952	55	Alaska Offshore	316	Nq 4-5	0	55-316-	\N	\N	\N
12953	55	Alaska Offshore	317	Nq 4-3	0	55-317-	\N	\N	\N
12954	55	Alaska Offshore	318	Nq 4-1	0	55-318-	\N	\N	\N
12955	55	Alaska Offshore	321	Wainwright	0	55-321-	\N	\N	\N
12956	55	Alaska Offshore	322	Hanna Shoal	0	55-322-	\N	\N	\N
12957	55	Alaska Offshore	323	Ns 4-7	0	55-323-	\N	\N	\N
12958	55	Alaska Offshore	324	Ns 4-5	0	55-324-	\N	\N	\N
12959	55	Alaska Offshore	325	Ns 4-3	0	55-325-	\N	\N	\N
12960	55	Alaska Offshore	326	Ns 4-1	0	55-326-	\N	\N	\N
12961	55	Alaska Offshore	327	Nt 4-7	0	55-327-	\N	\N	\N
12962	55	Alaska Offshore	328	Nt 4-5	0	55-328-	\N	\N	\N
12963	55	Alaska Offshore	329	Nt 4-3	0	55-329-	\N	\N	\N
12964	55	Alaska Offshore	330	Nt 4-1	0	55-330-	\N	\N	\N
12965	55	Alaska Offshore	331	Nm 3-4	0	55-331-	\N	\N	\N
12966	55	Alaska Offshore	332	Nm 3-2	0	55-332-	\N	\N	\N
12967	55	Alaska Offshore	333	Aleutian Trench	0	55-333-	\N	\N	\N
12968	55	Alaska Offshore	334	Unimak Seamount	0	55-334-	\N	\N	\N
12969	55	Alaska Offshore	335	False Pass	0	55-335-	\N	\N	\N
12970	55	Alaska Offshore	336	Cold Bay	0	55-336-	\N	\N	\N
12971	55	Alaska Offshore	337	Bristol Bay	0	55-337-	\N	\N	\N
12972	55	Alaska Offshore	338	Bristol Bay North	0	55-338-	\N	\N	\N
12973	55	Alaska Offshore	339	Cape Newenham	0	55-339-	\N	\N	\N
12974	55	Alaska Offshore	340	Kuskokwim Bay	0	55-340-	\N	\N	\N
12975	55	Alaska Offshore	341	Baird Inlet	0	55-341-	\N	\N	\N
12976	55	Alaska Offshore	343	Kwiguk	0	55-343-	\N	\N	\N
12977	55	Alaska Offshore	344	St Michael	0	55-344-	\N	\N	\N
12978	55	Alaska Offshore	345	Solomon	0	55-345-	\N	\N	\N
12979	55	Alaska Offshore	347	Kotzebue	0	55-347-	\N	\N	\N
12980	55	Alaska Offshore	348	Noatak	0	55-348-	\N	\N	\N
12981	55	Alaska Offshore	349	De Long Mountains	0	55-349-	\N	\N	\N
12982	55	Alaska Offshore	350	Point Lay	0	55-350-	\N	\N	\N
12983	55	Alaska Offshore	351	Solivik Island	0	55-351-	\N	\N	\N
12984	55	Alaska Offshore	352	Nr 3-2	0	55-352-	\N	\N	\N
12985	55	Alaska Offshore	353	Ns 3-8	0	55-353-	\N	\N	\N
12986	55	Alaska Offshore	354	Ns 3-6	0	55-354-	\N	\N	\N
12987	55	Alaska Offshore	355	Ns 3-4	0	55-355-	\N	\N	\N
12988	55	Alaska Offshore	356	Ns 3-2	0	55-356-	\N	\N	\N
12989	55	Alaska Offshore	357	Nt 3-8	0	55-357-	\N	\N	\N
12990	55	Alaska Offshore	358	Nt 3-6	0	55-358-	\N	\N	\N
12991	55	Alaska Offshore	359	Nt 3-4	0	55-359-	\N	\N	\N
12992	55	Alaska Offshore	360	Nt 3-2	0	55-360-	\N	\N	\N
12993	55	Alaska Offshore	361	Nm 3-3	0	55-361-	\N	\N	\N
12994	55	Alaska Offshore	362	Nm 3-1	0	55-362-	\N	\N	\N
12995	55	Alaska Offshore	363	Nn 3-7	0	55-363-	\N	\N	\N
12996	55	Alaska Offshore	364	Unalaska	0	55-364-	\N	\N	\N
12997	55	Alaska Offshore	365	Akutan	0	55-365-	\N	\N	\N
12998	55	Alaska Offshore	366	Akutan North	0	55-366-	\N	\N	\N
12999	55	Alaska Offshore	367	St George East	0	55-367-	\N	\N	\N
13000	55	Alaska Offshore	368	St Paul East	0	55-368-	\N	\N	\N
13001	55	Alaska Offshore	369	Cape Newenham West	0	55-369-	\N	\N	\N
13002	55	Alaska Offshore	370	Cape Mendenhall	0	55-370-	\N	\N	\N
13003	55	Alaska Offshore	371	Nunivak Island	0	55-371-	\N	\N	\N
13004	55	Alaska Offshore	372	Hooper Bay	0	55-372-	\N	\N	\N
13005	55	Alaska Offshore	373	Black	0	55-373-	\N	\N	\N
13006	55	Alaska Offshore	374	Norton Sound	0	55-374-	\N	\N	\N
13007	55	Alaska Offshore	375	Nome	0	55-375-	\N	\N	\N
13008	55	Alaska Offshore	376	Teller	0	55-376-	\N	\N	\N
13009	55	Alaska Offshore	377	Shishmaref	0	55-377-	\N	\N	\N
13010	55	Alaska Offshore	378	Cape Seppings	0	55-378-	\N	\N	\N
13011	55	Alaska Offshore	379	Point Hope	0	55-379-	\N	\N	\N
13012	55	Alaska Offshore	380	Point Lay West	0	55-380-	\N	\N	\N
13013	55	Alaska Offshore	381	Nr 3-3	0	55-381-	\N	\N	\N
13014	55	Alaska Offshore	382	Karo	0	55-382-	\N	\N	\N
13015	55	Alaska Offshore	383	Ns 3-7	0	55-383-	\N	\N	\N
13016	55	Alaska Offshore	384	Ns 3-5	0	55-384-	\N	\N	\N
13017	55	Alaska Offshore	385	Ns 3-3	0	55-385-	\N	\N	\N
13018	55	Alaska Offshore	386	Ns 3-1	0	55-386-	\N	\N	\N
13019	55	Alaska Offshore	387	Nt 3-7	0	55-387-	\N	\N	\N
13020	55	Alaska Offshore	388	Nt 3-5	0	55-388-	\N	\N	\N
13021	55	Alaska Offshore	389	Nt 3-3	0	55-389-	\N	\N	\N
13022	55	Alaska Offshore	390	Nt 3-1	0	55-390-	\N	\N	\N
13023	55	Alaska Offshore	391	Nm 2-4	0	55-391-	\N	\N	\N
13024	55	Alaska Offshore	392	Maury Deep	0	55-392-	\N	\N	\N
13025	55	Alaska Offshore	393	Samalga Island	0	55-393-	\N	\N	\N
13026	55	Alaska Offshore	394	Umnak	0	55-394-	\N	\N	\N
13027	55	Alaska Offshore	395	Okmuk Canyon	0	55-395-	\N	\N	\N
13028	55	Alaska Offshore	396	Pribilof Canyon	0	55-396-	\N	\N	\N
13029	55	Alaska Offshore	397	St George Island	0	55-397-	\N	\N	\N
13030	55	Alaska Offshore	398	St Paul Island	0	55-398-	\N	\N	\N
13031	55	Alaska Offshore	399	St Paul North	0	55-399-	\N	\N	\N
13032	55	Alaska Offshore	400	No 2-2	0	55-400-	\N	\N	\N
13033	55	Alaska Offshore	401	Np 2-8	0	55-401-	\N	\N	\N
13034	55	Alaska Offshore	402	Np 2-6	0	55-402-	\N	\N	\N
13035	55	Alaska Offshore	403	Southeast Cape	0	55-403-	\N	\N	\N
13036	55	Alaska Offshore	404	St Lawrence	0	55-404-	\N	\N	\N
13037	55	Alaska Offshore	405	Ukivok	0	55-405-	\N	\N	\N
13038	55	Alaska Offshore	406	Little Diomede Island	0	55-406-	\N	\N	\N
13039	55	Alaska Offshore	407	Bering Strait	0	55-407-	\N	\N	\N
13040	55	Alaska Offshore	408	Cape Seppings West	0	55-408-	\N	\N	\N
13041	55	Alaska Offshore	409	Point Hope West	0	55-409-	\N	\N	\N
13042	55	Alaska Offshore	410	Chukchi Sea	0	55-410-	\N	\N	\N
13043	55	Alaska Offshore	411	Studds	0	55-411-	\N	\N	\N
13044	55	Alaska Offshore	412	Tison	0	55-412-	\N	\N	\N
13045	55	Alaska Offshore	413	Ns 2-8	0	55-413-	\N	\N	\N
13046	55	Alaska Offshore	414	Ns 2-6	0	55-414-	\N	\N	\N
13047	55	Alaska Offshore	415	Ns 2-4	0	55-415-	\N	\N	\N
13048	55	Alaska Offshore	416	Ns 2-2	0	55-416-	\N	\N	\N
13049	55	Alaska Offshore	417	Nt 2-8	0	55-417-	\N	\N	\N
13050	55	Alaska Offshore	418	Nt 2-6	0	55-418-	\N	\N	\N
13051	55	Alaska Offshore	419	Nt 2-4	0	55-419-	\N	\N	\N
13052	55	Alaska Offshore	420	Nt 2-2	0	55-420-	\N	\N	\N
13053	55	Alaska Offshore	421	Nm 2-3	0	55-421-	\N	\N	\N
13054	55	Alaska Offshore	422	Amukta Pass	0	55-422-	\N	\N	\N
13055	55	Alaska Offshore	423	Seguam	0	55-423-	\N	\N	\N
13056	55	Alaska Offshore	424	Amlia Knoll	0	55-424-	\N	\N	\N
13057	55	Alaska Offshore	425	Chagulak Canyon	0	55-425-	\N	\N	\N
13058	55	Alaska Offshore	426	Nn 2-1	0	55-426-	\N	\N	\N
13059	55	Alaska Offshore	427	St George Canyon	0	55-427-	\N	\N	\N
13060	55	Alaska Offshore	428	St Paul Spur	0	55-428-	\N	\N	\N
13061	55	Alaska Offshore	429	Zhemchug Gully	0	55-429-	\N	\N	\N
13062	55	Alaska Offshore	430	No 2-1	0	55-430-	\N	\N	\N
13063	55	Alaska Offshore	431	St Matthew	0	55-431-	\N	\N	\N
13064	55	Alaska Offshore	432	Np 2-5	0	55-432-	\N	\N	\N
13065	55	Alaska Offshore	433	Np 2-3	0	55-433-	\N	\N	\N
13066	55	Alaska Offshore	434	Gambell	0	55-434-	\N	\N	\N
13067	55	Alaska Offshore	435	Nq 2-7	0	55-435-	\N	\N	\N
13068	55	Alaska Offshore	451	Nm 1-4	0	55-451-	\N	\N	\N
13069	55	Alaska Offshore	452	Adak	0	55-452-	\N	\N	\N
13070	55	Alaska Offshore	453	Atka	0	55-453-	\N	\N	\N
13071	55	Alaska Offshore	454	Korovin Canyon	0	55-454-	\N	\N	\N
13072	55	Alaska Offshore	455	Bowers Seamount	0	55-455-	\N	\N	\N
13073	55	Alaska Offshore	456	Nn 1-2	0	55-456-	\N	\N	\N
13074	55	Alaska Offshore	457	No 1-8	0	55-457-	\N	\N	\N
13075	55	Alaska Offshore	458	Zhemchug Canyon	0	55-458-	\N	\N	\N
13076	55	Alaska Offshore	459	Zhemchug Spur	0	55-459-	\N	\N	\N
13077	55	Alaska Offshore	460	Pervenets Canyon East	0	55-460-	\N	\N	\N
13078	55	Alaska Offshore	461	Np 1-8	0	55-461-	\N	\N	\N
13079	55	Alaska Offshore	462	Np 1-6	0	55-462-	\N	\N	\N
13080	55	Alaska Offshore	463	Np 1-4	0	55-463-	\N	\N	\N
13081	55	Alaska Offshore	464	Np 1-2	0	55-464-	\N	\N	\N
13082	55	Alaska Offshore	481	Kanaga Basin	0	55-481-	\N	\N	\N
13083	55	Alaska Offshore	482	Gariloi Island	0	55-482-	\N	\N	\N
13084	55	Alaska Offshore	483	Amchitka Pass	0	55-483-	\N	\N	\N
13085	55	Alaska Offshore	484	Pochnoi Trough	0	55-484-	\N	\N	\N
13086	55	Alaska Offshore	485	Bowers Ridge	0	55-485-	\N	\N	\N
13087	55	Alaska Offshore	486	Nn 1-1	0	55-486-	\N	\N	\N
13088	55	Alaska Offshore	487	No 1-7	0	55-487-	\N	\N	\N
13089	55	Alaska Offshore	488	No 1-5	0	55-488-	\N	\N	\N
13090	55	Alaska Offshore	489	St Matthew Canyon	0	55-489-	\N	\N	\N
13091	55	Alaska Offshore	490	Pervenets Canyon	0	55-490-	\N	\N	\N
13092	55	Alaska Offshore	491	Np 1-7	0	55-491-	\N	\N	\N
13093	55	Alaska Offshore	492	Np 1-5	0	55-492-	\N	\N	\N
13094	55	Alaska Offshore	511	Nm 60-4	0	55-511-	\N	\N	\N
13095	55	Alaska Offshore	512	Rat Islands	0	55-512-	\N	\N	\N
13096	55	Alaska Offshore	513	Kiska Volcano	0	55-513-	\N	\N	\N
13097	55	Alaska Offshore	514	Rude Canyon	0	55-514-	\N	\N	\N
13098	55	Alaska Offshore	515	Bowers Bank	0	55-515-	\N	\N	\N
13099	55	Alaska Offshore	516	Nn 60-2	0	55-516-	\N	\N	\N
13100	55	Alaska Offshore	517	No 60-8	0	55-517-	\N	\N	\N
13101	55	Alaska Offshore	518	No 60-6	0	55-518-	\N	\N	\N
13102	55	Alaska Offshore	519	No 60-4	0	55-519-	\N	\N	\N
13103	55	Alaska Offshore	520	No 60-2	0	55-520-	\N	\N	\N
13104	55	Alaska Offshore	541	Nm 60-3	0	55-541-	\N	\N	\N
13105	55	Alaska Offshore	542	Murray Canyon	0	55-542-	\N	\N	\N
13106	55	Alaska Offshore	543	Shemya Island	0	55-543-	\N	\N	\N
13107	55	Alaska Offshore	544	Nn 60-5	0	55-544-	\N	\N	\N
13108	55	Alaska Offshore	545	Ulm Plateau	0	55-545-	\N	\N	\N
13109	55	Alaska Offshore	546	Nn 60-1	0	55-546-	\N	\N	\N
13110	55	Alaska Offshore	547	No 60-7	0	55-547-	\N	\N	\N
13111	55	Alaska Offshore	548	No 60-5	0	55-548-	\N	\N	\N
13112	55	Alaska Offshore	571	Nm 59-4	0	55-571-	\N	\N	\N
13113	55	Alaska Offshore	572	Nm 59-2	0	55-572-	\N	\N	\N
13114	55	Alaska Offshore	573	Attu	0	55-573-	\N	\N	\N
13115	55	Alaska Offshore	574	Kresta Point	0	55-574-	\N	\N	\N
13116	55	Alaska Offshore	575	Nn 59-4	0	55-575-	\N	\N	\N
13117	55	Alaska Offshore	576	Nn 59-2	0	55-576-	\N	\N	\N
13118	55	Alaska Offshore	577	No 59-8	0	55-577-	\N	\N	\N
13119	55	Alaska Offshore	601	Nm 59-3	0	55-601-	\N	\N	\N
13120	55	Alaska Offshore	602	Nm 59-1	0	55-602-	\N	\N	\N
13121	55	Alaska Offshore	603	Nm 59-7	0	55-603-	\N	\N	\N
13122	55	Alaska Offshore	604	Nm 59-5	0	55-604-	\N	\N	\N
13123	55	Alaska Offshore	631	Nm 58-4	0	55-631-	\N	\N	\N
13124	55	Alaska Offshore	632	Nm 58-2	0	55-632-	\N	\N	\N
13125	56	Pacific Coast Offshore	001	Nh 11-5	0	56-001-	\N	\N	\N
13126	56	Pacific Coast Offshore	002	Nh 11-2	0	56-002-	\N	\N	\N
13127	56	Pacific Coast Offshore	021	The Rampart	0	56-021-	\N	\N	\N
13128	56	Pacific Coast Offshore	022	Bushnell Knoll	0	56-022-	\N	\N	\N
13129	56	Pacific Coast Offshore	023	San Clemente	0	56-023-	\N	\N	\N
13130	56	Pacific Coast Offshore	041	Westfall Seamount	0	56-041-	\N	\N	\N
13131	56	Pacific Coast Offshore	042	Velero Basin	0	56-042-	\N	\N	\N
13132	56	Pacific Coast Offshore	043	Patton Ridge	0	56-043-	\N	\N	\N
13133	56	Pacific Coast Offshore	044	Santa Rosa Island	0	56-044-	\N	\N	\N
13134	56	Pacific Coast Offshore	045	Santa Maria	0	56-045-	\N	\N	\N
13135	56	Pacific Coast Offshore	046	San Luis Obispo	0	56-046-	\N	\N	\N
13136	56	Pacific Coast Offshore	047	Monterey Bay	0	56-047-	\N	\N	\N
13137	56	Pacific Coast Offshore	061	Jasper Seamount	0	56-061-	\N	\N	\N
13138	56	Pacific Coast Offshore	062	Nh 10-2	0	56-062-	\N	\N	\N
13139	56	Pacific Coast Offshore	063	Ni 10-11	0	56-063-	\N	\N	\N
13140	56	Pacific Coast Offshore	064	Ni 10-8	0	56-064-	\N	\N	\N
13141	56	Pacific Coast Offshore	065	Arguello Fan	0	56-065-	\N	\N	\N
13142	56	Pacific Coast Offshore	066	Sur Canyon	0	56-066-	\N	\N	\N
13143	56	Pacific Coast Offshore	067	Santa Cruz	0	56-067-	\N	\N	\N
13144	56	Pacific Coast Offshore	068	San Francisco	0	56-068-	\N	\N	\N
13145	56	Pacific Coast Offshore	069	Santa Rosa	0	56-069-	\N	\N	\N
13146	56	Pacific Coast Offshore	070	Ukiah	0	56-070-	\N	\N	\N
13147	56	Pacific Coast Offshore	081	Nh 10-4	0	56-081-	\N	\N	\N
13148	56	Pacific Coast Offshore	082	Nh 10-1	0	56-082-	\N	\N	\N
13149	56	Pacific Coast Offshore	083	Ni 10-10	0	56-083-	\N	\N	\N
13150	56	Pacific Coast Offshore	084	Ni 10-7	0	56-084-	\N	\N	\N
13151	56	Pacific Coast Offshore	085	Ni 10-4	0	56-085-	\N	\N	\N
13152	56	Pacific Coast Offshore	086	Monterey Fan	0	56-086-	\N	\N	\N
13153	56	Pacific Coast Offshore	087	Taney Seamount	0	56-087-	\N	\N	\N
13154	56	Pacific Coast Offshore	088	Bodega Canyon	0	56-088-	\N	\N	\N
13155	56	Pacific Coast Offshore	089	Arena Canyon	0	56-089-	\N	\N	\N
13156	56	Pacific Coast Offshore	090	Noyo Canyon	0	56-090-	\N	\N	\N
13157	56	Pacific Coast Offshore	091	Eureka	0	56-091-	\N	\N	\N
13158	56	Pacific Coast Offshore	092	Crescent City	0	56-092-	\N	\N	\N
13159	56	Pacific Coast Offshore	093	Cape Blanco	0	56-093-	\N	\N	\N
13160	56	Pacific Coast Offshore	094	Coos Bay	0	56-094-	\N	\N	\N
13161	56	Pacific Coast Offshore	095	Newport	0	56-095-	\N	\N	\N
13162	56	Pacific Coast Offshore	096	Tillamook Bay	0	56-096-	\N	\N	\N
13163	56	Pacific Coast Offshore	097	Cape Disappointment	0	56-097-	\N	\N	\N
13164	56	Pacific Coast Offshore	098	Copalis Beach	0	56-098-	\N	\N	\N
13165	56	Pacific Coast Offshore	099	Cape Flattery	0	56-099-	\N	\N	\N
13166	56	Pacific Coast Offshore	100	Nm 10-7	0	56-100-	\N	\N	\N
13167	56	Pacific Coast Offshore	101	Nh 9-6	0	56-101-	\N	\N	\N
13168	56	Pacific Coast Offshore	102	Nh 9-3	0	56-102-	\N	\N	\N
13169	56	Pacific Coast Offshore	103	Ni 9-12	0	56-103-	\N	\N	\N
13170	56	Pacific Coast Offshore	104	Ni 9-9	0	56-104-	\N	\N	\N
13171	56	Pacific Coast Offshore	105	Ni 9-6	0	56-105-	\N	\N	\N
13172	56	Pacific Coast Offshore	106	Ni 9-3	0	56-106-	\N	\N	\N
13173	56	Pacific Coast Offshore	107	Nj 9-12	0	56-107-	\N	\N	\N
13174	56	Pacific Coast Offshore	108	Nj 9-9	0	56-108-	\N	\N	\N
13175	56	Pacific Coast Offshore	109	Nj 9-6	0	56-109-	\N	\N	\N
13176	56	Pacific Coast Offshore	110	Delgada Fan	0	56-110-	\N	\N	\N
13177	56	Pacific Coast Offshore	111	Escanaba Trough	0	56-111-	\N	\N	\N
13178	56	Pacific Coast Offshore	112	Escanaba Ridge	0	56-112-	\N	\N	\N
13179	56	Pacific Coast Offshore	113	Blanco Saddle	0	56-113-	\N	\N	\N
13180	56	Pacific Coast Offshore	114	Heceta Bank	0	56-114-	\N	\N	\N
13181	56	Pacific Coast Offshore	115	Daisy Banks	0	56-115-	\N	\N	\N
13182	56	Pacific Coast Offshore	116	Astoria Fan	0	56-116-	\N	\N	\N
13183	56	Pacific Coast Offshore	117	Astoria Canyon	0	56-117-	\N	\N	\N
13184	56	Pacific Coast Offshore	118	Cascadia Basin	0	56-118-	\N	\N	\N
13185	56	Pacific Coast Offshore	119	Barcley Canyon	0	56-119-	\N	\N	\N
13186	56	Pacific Coast Offshore	120	Nm 9-9	0	56-120-	\N	\N	\N
13187	56	Pacific Coast Offshore	121	Nh 9-5	0	56-121-	\N	\N	\N
13188	56	Pacific Coast Offshore	122	Nh 9-2	0	56-122-	\N	\N	\N
13189	56	Pacific Coast Offshore	123	Ni 9-11	0	56-123-	\N	\N	\N
13190	56	Pacific Coast Offshore	124	Ni 9-8	0	56-124-	\N	\N	\N
13191	56	Pacific Coast Offshore	125	Ni 9-5	0	56-125-	\N	\N	\N
13192	56	Pacific Coast Offshore	126	Ni 9-2	0	56-126-	\N	\N	\N
13193	56	Pacific Coast Offshore	127	Nj 9-11	0	56-127-	\N	\N	\N
13194	56	Pacific Coast Offshore	128	Nj 9-8	0	56-128-	\N	\N	\N
13195	56	Pacific Coast Offshore	129	Pioneer Escarpment	0	56-129-	\N	\N	\N
13196	56	Pacific Coast Offshore	130	Nj 9-2	0	56-130-	\N	\N	\N
13197	56	Pacific Coast Offshore	131	Nk 9-11	0	56-131-	\N	\N	\N
13198	56	Pacific Coast Offshore	132	Klamath Ridge	0	56-132-	\N	\N	\N
13199	56	Pacific Coast Offshore	133	President Jackson Seamount	0	56-133-	\N	\N	\N
13200	56	Pacific Coast Offshore	134	Nk 9-2	0	56-134-	\N	\N	\N
13201	56	Pacific Coast Offshore	135	Parks Seamount	0	56-135-	\N	\N	\N
13202	56	Pacific Coast Offshore	136	Vance Seamount	0	56-136-	\N	\N	\N
13203	56	Pacific Coast Offshore	137	Thompson Seamount	0	56-137-	\N	\N	\N
13204	56	Pacific Coast Offshore	138	Nitinat Fan	0	56-138-	\N	\N	\N
13205	56	Pacific Coast Offshore	139	Vancouver Gap	0	56-139-	\N	\N	\N
13206	56	Pacific Coast Offshore	140	Nm 9-8	0	56-140-	\N	\N	\N
13207	56	Pacific Coast Offshore	141	Nh 9-4	0	56-141-	\N	\N	\N
13208	56	Pacific Coast Offshore	142	Nh 9-1	0	56-142-	\N	\N	\N
13209	56	Pacific Coast Offshore	143	Ni 9-10	0	56-143-	\N	\N	\N
13210	56	Pacific Coast Offshore	144	Ni 9-7	0	56-144-	\N	\N	\N
13211	56	Pacific Coast Offshore	145	Ni 9-4	0	56-145-	\N	\N	\N
13212	56	Pacific Coast Offshore	146	Ni 9-1	0	56-146-	\N	\N	\N
13213	56	Pacific Coast Offshore	147	Nj 9-10	0	56-147-	\N	\N	\N
13214	56	Pacific Coast Offshore	148	Nj 9-7	0	56-148-	\N	\N	\N
13215	56	Pacific Coast Offshore	149	Nj 9-4	0	56-149-	\N	\N	\N
13216	56	Pacific Coast Offshore	150	Nj 9-1	0	56-150-	\N	\N	\N
13217	56	Pacific Coast Offshore	151	Nk 9-10	0	56-151-	\N	\N	\N
13218	56	Pacific Coast Offshore	152	Nk 9-7	0	56-152-	\N	\N	\N
13219	56	Pacific Coast Offshore	153	Nk 9-4	0	56-153-	\N	\N	\N
13220	56	Pacific Coast Offshore	154	Nk 9-1	0	56-154-	\N	\N	\N
13221	56	Pacific Coast Offshore	155	Nl 9-10	0	56-155-	\N	\N	\N
13222	56	Pacific Coast Offshore	156	Nl 9-7	0	56-156-	\N	\N	\N
13223	56	Pacific Coast Offshore	157	Nl 9-4	0	56-157-	\N	\N	\N
13224	56	Pacific Coast Offshore	158	Nl 9-1	0	56-158-	\N	\N	\N
13225	56	Pacific Coast Offshore	159	Nm 9-10	0	56-159-	\N	\N	\N
13226	56	Pacific Coast Offshore	160	Nm 9-7	0	56-160-	\N	\N	\N
13227	56	Pacific Coast Offshore	161	Nh 8-6	0	56-161-	\N	\N	\N
13228	56	Pacific Coast Offshore	162	Nh 8-3	0	56-162-	\N	\N	\N
13229	56	Pacific Coast Offshore	163	Ni 8-12	0	56-163-	\N	\N	\N
13230	56	Pacific Coast Offshore	164	Ni 8-9	0	56-164-	\N	\N	\N
13231	56	Pacific Coast Offshore	165	Ni 8-6	0	56-165-	\N	\N	\N
13232	56	Pacific Coast Offshore	166	Ni 8-3	0	56-166-	\N	\N	\N
13233	56	Pacific Coast Offshore	167	Nj 8-12	0	56-167-	\N	\N	\N
13234	56	Pacific Coast Offshore	168	Nj 8-9	0	56-168-	\N	\N	\N
13235	56	Pacific Coast Offshore	169	Nj 8-6	0	56-169-	\N	\N	\N
13236	56	Pacific Coast Offshore	170	Nj 8-3	0	56-170-	\N	\N	\N
13237	56	Pacific Coast Offshore	171	Nk 8-12	0	56-171-	\N	\N	\N
13238	56	Pacific Coast Offshore	172	Nk 8-9	0	56-172-	\N	\N	\N
13239	56	Pacific Coast Offshore	173	Nk 8-6	0	56-173-	\N	\N	\N
13240	56	Pacific Coast Offshore	174	Nk 8-3	0	56-174-	\N	\N	\N
13241	56	Pacific Coast Offshore	175	Nl 8-12	0	56-175-	\N	\N	\N
13242	56	Pacific Coast Offshore	176	Nl 8-9	0	56-176-	\N	\N	\N
13243	56	Pacific Coast Offshore	177	Nl 8-6	0	56-177-	\N	\N	\N
13244	56	Pacific Coast Offshore	178	Nl 8-3	0	56-178-	\N	\N	\N
13245	56	Pacific Coast Offshore	179	Nm 8-12	0	56-179-	\N	\N	\N
13246	56	Pacific Coast Offshore	180	Nm 8-9	0	56-180-	\N	\N	\N
13247	56	Pacific Coast Offshore	181	Nh 8-5	0	56-181-	\N	\N	\N
13248	56	Pacific Coast Offshore	182	Nh 8-2	0	56-182-	\N	\N	\N
13249	56	Pacific Coast Offshore	183	Ni 8-11	0	56-183-	\N	\N	\N
13250	56	Pacific Coast Offshore	184	Ni 8-8	0	56-184-	\N	\N	\N
13251	56	Pacific Coast Offshore	185	Ni 8-5	0	56-185-	\N	\N	\N
13252	56	Pacific Coast Offshore	186	Ni 8-2	0	56-186-	\N	\N	\N
13253	56	Pacific Coast Offshore	187	Nj 8-11	0	56-187-	\N	\N	\N
13254	56	Pacific Coast Offshore	188	Nj 8-8	0	56-188-	\N	\N	\N
13255	56	Pacific Coast Offshore	189	Nj 8-5	0	56-189-	\N	\N	\N
13256	56	Pacific Coast Offshore	190	Nj 8-2	0	56-190-	\N	\N	\N
13257	56	Pacific Coast Offshore	191	Nk 8-11	0	56-191-	\N	\N	\N
13258	56	Pacific Coast Offshore	192	Nk 8-8	0	56-192-	\N	\N	\N
13259	56	Pacific Coast Offshore	193	Nk 8-5	0	56-193-	\N	\N	\N
13260	56	Pacific Coast Offshore	194	Nk 8-2	0	56-194-	\N	\N	\N
13261	56	Pacific Coast Offshore	195	Nl 8-11	0	56-195-	\N	\N	\N
13262	56	Pacific Coast Offshore	196	Nl 8-8	0	56-196-	\N	\N	\N
13263	56	Pacific Coast Offshore	197	Nl 8-5	0	56-197-	\N	\N	\N
13264	56	Pacific Coast Offshore	198	Nl 8-2	0	56-198-	\N	\N	\N
13265	56	Pacific Coast Offshore	199	Nm 8-11	0	56-199-	\N	\N	\N
13266	56	Pacific Coast Offshore	200	Nm 8-8	0	56-200-	\N	\N	\N
13267	56	Pacific Coast Offshore	311	Santa Cruz Area	0	56-311-	\N	\N	\N
13268	56	Pacific Coast Offshore	312	Santa Catalina Area	0	56-312-	\N	\N	\N
13269	56	Pacific Coast Offshore	313	San Nicolas Area	0	56-313-	\N	\N	\N
13270	60	Northern Gulf of Mexico	716	S Timbalier Area Sout	0	60-716-	\N	\N	\N
13271	60	Northern Gulf of Mexico	717	Grand Isle Area	0	60-717-	\N	\N	\N
13272	60	Northern Gulf of Mexico	718	Grand Isle Area S	0	60-718-	\N	\N	\N
13273	60	Northern Gulf of Mexico	719	West Delta Area	0	60-719-	\N	\N	\N
13274	60	Northern Gulf of Mexico	720	West Delta Area South Add	0	60-720-	\N	\N	\N
13275	60	Northern Gulf of Mexico	721	South Pass Area	0	60-721-	\N	\N	\N
13276	60	Northern Gulf of Mexico	722	South Pass Area South Add	0	60-722-	\N	\N	\N
13277	60	Northern Gulf of Mexico	723	South Pass Area East Addn	0	60-723-	\N	\N	\N
13278	60	Northern Gulf of Mexico	724	Main Pass Area South And	0	60-724-	\N	\N	\N
13279	60	Northern Gulf of Mexico	725	Main Pass Area	0	60-725-	\N	\N	\N
13280	60	Northern Gulf of Mexico	726	Breton Sound Area	0	60-726-	\N	\N	\N
13281	60	Northern Gulf of Mexico	727	Chandeleur Sound Area	0	60-727-	\N	\N	\N
13282	60	Northern Gulf of Mexico	728	Chandeleur Area	0	60-728-	\N	\N	\N
13283	60	Northern Gulf of Mexico	729	Chandeleur Area East Addn	0	60-729-	\N	\N	\N
13284	60	Northern Gulf of Mexico	730	Chandeleur Sound Area Add	0	60-730-	\N	\N	\N
13285	60	Northern Gulf of Mexico	731	Sabine Pass Area	0	60-731-	\N	\N	\N
13286	60	Northern Gulf of Mexico	801	Corpus Christi	0	60-801-	\N	\N	\N
13287	60	Northern Gulf of Mexico	802	Port Isabel	0	60-802-	\N	\N	\N
13288	60	Northern Gulf of Mexico	803	Brownsville	0	60-803-	\N	\N	\N
13289	60	Northern Gulf of Mexico	804	East Breaks	0	60-804-	\N	\N	\N
13290	60	Northern Gulf of Mexico	805	Alaminos Canyon	0	60-805-	\N	\N	\N
13291	60	Northern Gulf of Mexico	806	Ng 15-7	0	60-806-	\N	\N	\N
13292	60	Northern Gulf of Mexico	807	Garden Banks	0	60-807-	\N	\N	\N
13293	60	Northern Gulf of Mexico	808	Keathley Canyon	0	60-808-	\N	\N	\N
13294	60	Northern Gulf of Mexico	809	Ng 15-8	0	60-809-	\N	\N	\N
13295	60	Northern Gulf of Mexico	810	Ewing Bank	0	60-810-	\N	\N	\N
13296	60	Northern Gulf of Mexico	811	Green Canyon	0	60-811-	\N	\N	\N
13297	60	Northern Gulf of Mexico	812	Walker Ridge	0	60-812-	\N	\N	\N
13298	60	Northern Gulf of Mexico	813	Ng 15-9	0	60-813-	\N	\N	\N
13299	60	Northern Gulf of Mexico	815	Mobile	0	60-815-	\N	\N	\N
13300	60	Northern Gulf of Mexico	816	Viosca Knoll	0	60-816-	\N	\N	\N
13301	60	Northern Gulf of Mexico	817	Mississippi Canyon	0	60-817-	\N	\N	\N
13302	60	Northern Gulf of Mexico	818	Atwater Valley	0	60-818-	\N	\N	\N
13303	60	Northern Gulf of Mexico	819	Lund	0	60-819-	\N	\N	\N
13304	60	Northern Gulf of Mexico	820	Lund South	0	60-820-	\N	\N	\N
13305	60	Northern Gulf of Mexico	821	Pensacola	0	60-821-	\N	\N	\N
13306	60	Northern Gulf of Mexico	822	Destin Dome	0	60-822-	\N	\N	\N
13307	60	Northern Gulf of Mexico	823	De Soto Canyon	0	60-823-	\N	\N	\N
13308	60	Northern Gulf of Mexico	824	Lloyd Ridge	0	60-824-	\N	\N	\N
13309	60	Northern Gulf of Mexico	825	Henderson	0	60-825-	\N	\N	\N
13310	60	Northern Gulf of Mexico	826	Florida Plains	0	60-826-	\N	\N	\N
13311	60	Northern Gulf of Mexico	827	Apalachicola	0	60-827-	\N	\N	\N
13312	60	Northern Gulf of Mexico	828	Florida Middle Ground	0	60-828-	\N	\N	\N
13313	60	Northern Gulf of Mexico	829	The Elbow	0	60-829-	\N	\N	\N
13314	60	Northern Gulf of Mexico	830	Vernon Basin	0	60-830-	\N	\N	\N
13315	60	Northern Gulf of Mexico	831	Howell Hook	0	60-831-	\N	\N	\N
13316	60	Northern Gulf of Mexico	832	Rankin	0	60-832-	\N	\N	\N
13317	60	Northern Gulf of Mexico	833	Gainesville	0	60-833-	\N	\N	\N
13318	60	Northern Gulf of Mexico	834	Tarpon Springs	0	60-834-	\N	\N	\N
13319	60	Northern Gulf of Mexico	835	Saint Petersburg	0	60-835-	\N	\N	\N
13320	60	Northern Gulf of Mexico	836	Charlotte Harbor	0	60-836-	\N	\N	\N
13321	60	Northern Gulf of Mexico	837	Pulley Ridge	0	60-837-	\N	\N	\N
13322	60	Northern Gulf of Mexico	838	Dry Tortugas	0	60-838-	\N	\N	\N
13323	60	Northern Gulf of Mexico	839	Tortugas Valley	0	60-839-	\N	\N	\N
13324	60	Northern Gulf of Mexico	841	West Palm Beach	0	60-841-	\N	\N	\N
13325	60	Northern Gulf of Mexico	842	Miami	0	60-842-	\N	\N	\N
13326	60	Northern Gulf of Mexico	843	Key West	0	60-843-	\N	\N	\N
13327	61	Atlantic Coast Offshore	001	Nf 20-1	0	61-001-	\N	\N	\N
13328	61	Atlantic Coast Offshore	002	Ng 20-10	0	61-002-	\N	\N	\N
13329	61	Atlantic Coast Offshore	003	Ng 20-7	0	61-003-	\N	\N	\N
13330	61	Atlantic Coast Offshore	004	Ng 20-4	0	61-004-	\N	\N	\N
13331	61	Atlantic Coast Offshore	005	Ng 20-1	0	61-005-	\N	\N	\N
13332	61	Atlantic Coast Offshore	006	Nh 20-10	0	61-006-	\N	\N	\N
13333	61	Atlantic Coast Offshore	007	Nh 20-7	0	61-007-	\N	\N	\N
13334	61	Atlantic Coast Offshore	008	Nh 20-4	0	61-008-	\N	\N	\N
13335	61	Atlantic Coast Offshore	009	Nh 20-1	0	61-009-	\N	\N	\N
13336	61	Atlantic Coast Offshore	010	Ni 20-10	0	61-010-	\N	\N	\N
13337	61	Atlantic Coast Offshore	011	Ni 20-7	0	61-011-	\N	\N	\N
13338	61	Atlantic Coast Offshore	012	Ni 20-4	0	61-012-	\N	\N	\N
13339	61	Atlantic Coast Offshore	013	Ni 20-1	0	61-013-	\N	\N	\N
13340	61	Atlantic Coast Offshore	014	Nj 20-10	0	61-014-	\N	\N	\N
13341	61	Atlantic Coast Offshore	015	Nj 20-7	0	61-015-	\N	\N	\N
13342	61	Atlantic Coast Offshore	016	Nj 20-4	0	61-016-	\N	\N	\N
13343	61	Atlantic Coast Offshore	017	Balanus Seamount	0	61-017-	\N	\N	\N
13344	61	Atlantic Coast Offshore	018	Stewart	0	61-018-	\N	\N	\N
13345	61	Atlantic Coast Offshore	019	Fundian Rise	0	61-019-	\N	\N	\N
13346	61	Atlantic Coast Offshore	020	Nk 20-4	0	61-020-	\N	\N	\N
13347	61	Atlantic Coast Offshore	021	Nk 20-1	0	61-021-	\N	\N	\N
13348	61	Atlantic Coast Offshore	022	Nl 20-10	0	61-022-	\N	\N	\N
13349	61	Atlantic Coast Offshore	023	Nf 19-3	0	61-023-	\N	\N	\N
13350	61	Atlantic Coast Offshore	024	Ng 19-12	0	61-024-	\N	\N	\N
13351	61	Atlantic Coast Offshore	025	Ng 19-9	0	61-025-	\N	\N	\N
13352	61	Atlantic Coast Offshore	026	Ng 19-6	0	61-026-	\N	\N	\N
13353	61	Atlantic Coast Offshore	027	Ng 19-3	0	61-027-	\N	\N	\N
13354	61	Atlantic Coast Offshore	028	Nh 19-12	0	61-028-	\N	\N	\N
13355	61	Atlantic Coast Offshore	029	Nh 19-9	0	61-029-	\N	\N	\N
13356	61	Atlantic Coast Offshore	030	Nh 19-6	0	61-030-	\N	\N	\N
13357	61	Atlantic Coast Offshore	031	Nh 19-3	0	61-031-	\N	\N	\N
13358	61	Atlantic Coast Offshore	032	Ni 19-12	0	61-032-	\N	\N	\N
13359	61	Atlantic Coast Offshore	033	Ni 19-9	0	61-033-	\N	\N	\N
13360	61	Atlantic Coast Offshore	034	Ni 19-6	0	61-034-	\N	\N	\N
13361	61	Atlantic Coast Offshore	035	Ni 19-3	0	61-035-	\N	\N	\N
13362	61	Atlantic Coast Offshore	036	Nj 19-12	0	61-036-	\N	\N	\N
13363	61	Atlantic Coast Offshore	037	Nj 19-9	0	61-037-	\N	\N	\N
13364	61	Atlantic Coast Offshore	038	Muller	0	61-038-	\N	\N	\N
13365	61	Atlantic Coast Offshore	039	Bear Seamount	0	61-039-	\N	\N	\N
13366	61	Atlantic Coast Offshore	040	Lydonia Canyon	0	61-040-	\N	\N	\N
13367	61	Atlantic Coast Offshore	041	Corsair Canyon	0	61-041-	\N	\N	\N
13368	61	Atlantic Coast Offshore	042	Browns Bank	0	61-042-	\N	\N	\N
13369	61	Atlantic Coast Offshore	043	Jordan Basin	0	61-043-	\N	\N	\N
13370	61	Atlantic Coast Offshore	044	Eastport	0	61-044-	\N	\N	\N
13371	61	Atlantic Coast Offshore	045	Nf 19-2	0	61-045-	\N	\N	\N
13372	61	Atlantic Coast Offshore	046	Ng 19-11	0	61-046-	\N	\N	\N
13373	61	Atlantic Coast Offshore	047	Ng 19-8	0	61-047-	\N	\N	\N
13374	61	Atlantic Coast Offshore	048	Ng 19-5	0	61-048-	\N	\N	\N
13375	61	Atlantic Coast Offshore	049	Ng 19-2	0	61-049-	\N	\N	\N
13376	61	Atlantic Coast Offshore	050	Nh 19-11	0	61-050-	\N	\N	\N
13377	61	Atlantic Coast Offshore	051	Nh 19-8	0	61-051-	\N	\N	\N
13378	61	Atlantic Coast Offshore	052	Nh 19-5	0	61-052-	\N	\N	\N
13379	61	Atlantic Coast Offshore	053	Nh 19-2	0	61-053-	\N	\N	\N
13380	61	Atlantic Coast Offshore	054	Ni 19-11	0	61-054-	\N	\N	\N
13381	61	Atlantic Coast Offshore	055	Ni 19-8	0	61-055-	\N	\N	\N
13382	61	Atlantic Coast Offshore	056	Ni 19-5	0	61-056-	\N	\N	\N
13383	61	Atlantic Coast Offshore	057	Ni 19-2	0	61-057-	\N	\N	\N
13384	61	Atlantic Coast Offshore	058	Nj 19-11	0	61-058-	\N	\N	\N
13385	61	Atlantic Coast Offshore	059	Uchupi	0	61-059-	\N	\N	\N
13386	61	Atlantic Coast Offshore	060	Powell	0	61-060-	\N	\N	\N
13387	61	Atlantic Coast Offshore	061	Veach Canyon	0	61-061-	\N	\N	\N
13388	61	Atlantic Coast Offshore	062	Hydrographer Canyon	0	61-062-	\N	\N	\N
13389	61	Atlantic Coast Offshore	063	Chatham	0	61-063-	\N	\N	\N
13390	61	Atlantic Coast Offshore	064	Cashes Ledge	0	61-064-	\N	\N	\N
13391	61	Atlantic Coast Offshore	065	Bath	0	61-065-	\N	\N	\N
13392	61	Atlantic Coast Offshore	066	Bangor	0	61-066-	\N	\N	\N
13393	61	Atlantic Coast Offshore	067	Nf 19-1	0	61-067-	\N	\N	\N
13394	61	Atlantic Coast Offshore	068	Ng 19-10	0	61-068-	\N	\N	\N
13395	61	Atlantic Coast Offshore	069	Ng 19-7	0	61-069-	\N	\N	\N
13396	61	Atlantic Coast Offshore	070	Ng 19-4	0	61-070-	\N	\N	\N
13397	61	Atlantic Coast Offshore	071	Ng 19-1	0	61-071-	\N	\N	\N
13398	61	Atlantic Coast Offshore	072	Nh 19-10	0	61-072-	\N	\N	\N
13399	61	Atlantic Coast Offshore	073	Nh 19-7	0	61-073-	\N	\N	\N
13400	61	Atlantic Coast Offshore	074	Nh 19-4	0	61-074-	\N	\N	\N
13401	61	Atlantic Coast Offshore	075	Nh 19-1	0	61-075-	\N	\N	\N
13402	61	Atlantic Coast Offshore	076	Ni 19-10	0	61-076-	\N	\N	\N
13403	61	Atlantic Coast Offshore	077	Ni 19-7	0	61-077-	\N	\N	\N
13404	61	Atlantic Coast Offshore	078	Evans	0	61-078-	\N	\N	\N
13405	61	Atlantic Coast Offshore	079	Lippold	0	61-079-	\N	\N	\N
13406	61	Atlantic Coast Offshore	080	Wilmington Valley	0	61-080-	\N	\N	\N
13407	61	Atlantic Coast Offshore	081	Jones	0	61-081-	\N	\N	\N
13408	61	Atlantic Coast Offshore	082	Heezen Plateau	0	61-082-	\N	\N	\N
13409	61	Atlantic Coast Offshore	083	Block Canyon	0	61-083-	\N	\N	\N
13410	61	Atlantic Coast Offshore	084	Block Island Shelf	0	61-084-	\N	\N	\N
13411	61	Atlantic Coast Offshore	085	Providence	0	61-085-	\N	\N	\N
13412	61	Atlantic Coast Offshore	086	Boston	0	61-086-	\N	\N	\N
13413	61	Atlantic Coast Offshore	087	Portland	0	61-087-	\N	\N	\N
13414	61	Atlantic Coast Offshore	089	Nf 18-3	0	61-089-	\N	\N	\N
13415	61	Atlantic Coast Offshore	090	Ng 18-12	0	61-090-	\N	\N	\N
13416	61	Atlantic Coast Offshore	091	Ng 18-9	0	61-091-	\N	\N	\N
13417	61	Atlantic Coast Offshore	092	Ng 18-6	0	61-092-	\N	\N	\N
13418	61	Atlantic Coast Offshore	093	Ng 18-3	0	61-093-	\N	\N	\N
13419	61	Atlantic Coast Offshore	094	Nh 18-12	0	61-094-	\N	\N	\N
13420	61	Atlantic Coast Offshore	095	Nh 18-9	0	61-095-	\N	\N	\N
13421	61	Atlantic Coast Offshore	096	Nh 18-6	0	61-096-	\N	\N	\N
13422	61	Atlantic Coast Offshore	097	Nh 18-3	0	61-097-	\N	\N	\N
13423	61	Atlantic Coast Offshore	098	Tibbet	0	61-098-	\N	\N	\N
13424	61	Atlantic Coast Offshore	099	Lanier	0	61-099-	\N	\N	\N
13425	61	Atlantic Coast Offshore	100	Hatteras Ridge	0	61-100-	\N	\N	\N
13426	61	Atlantic Coast Offshore	101	Wraight	0	61-101-	\N	\N	\N
13427	61	Atlantic Coast Offshore	102	Hyman	0	61-102-	\N	\N	\N
13428	61	Atlantic Coast Offshore	103	Baltimore Rise	0	61-103-	\N	\N	\N
13429	61	Atlantic Coast Offshore	104	Wilmington Canyon	0	61-104-	\N	\N	\N
13430	61	Atlantic Coast Offshore	105	Hudson Canyon	0	61-105-	\N	\N	\N
13431	61	Atlantic Coast Offshore	106	New York	0	61-106-	\N	\N	\N
13432	61	Atlantic Coast Offshore	107	Hartford	0	61-107-	\N	\N	\N
13433	61	Atlantic Coast Offshore	111	Nf 18-2	0	61-111-	\N	\N	\N
13434	61	Atlantic Coast Offshore	112	Ng 18-11	0	61-112-	\N	\N	\N
13435	61	Atlantic Coast Offshore	113	Ng 18-8	0	61-113-	\N	\N	\N
13436	61	Atlantic Coast Offshore	114	Ng 18-5	0	61-114-	\N	\N	\N
13437	61	Atlantic Coast Offshore	115	Ng 18-2	0	61-115-	\N	\N	\N
13438	61	Atlantic Coast Offshore	116	Nh 18-11	0	61-116-	\N	\N	\N
13439	61	Atlantic Coast Offshore	117	Nh 18-8	0	61-117-	\N	\N	\N
13440	61	Atlantic Coast Offshore	118	Nh 18-5	0	61-118-	\N	\N	\N
13441	61	Atlantic Coast Offshore	119	Taylor	0	61-119-	\N	\N	\N
13442	61	Atlantic Coast Offshore	120	Wittman	0	61-120-	\N	\N	\N
13443	61	Atlantic Coast Offshore	121	Marmer	0	61-121-	\N	\N	\N
13444	61	Atlantic Coast Offshore	122	Russell	0	61-122-	\N	\N	\N
13445	61	Atlantic Coast Offshore	123	Manteo	0	61-123-	\N	\N	\N
13446	61	Atlantic Coast Offshore	124	Currituck Sound	0	61-124-	\N	\N	\N
13447	61	Atlantic Coast Offshore	125	Chincoteague	0	61-125-	\N	\N	\N
13448	61	Atlantic Coast Offshore	126	Salisbury	0	61-126-	\N	\N	\N
13449	61	Atlantic Coast Offshore	127	Wilmington	0	61-127-	\N	\N	\N
13450	61	Atlantic Coast Offshore	133	Nf 18-1	0	61-133-	\N	\N	\N
13451	61	Atlantic Coast Offshore	134	Ng 18-10	0	61-134-	\N	\N	\N
13452	61	Atlantic Coast Offshore	135	Ng 18-7	0	61-135-	\N	\N	\N
13453	61	Atlantic Coast Offshore	136	Ng 18-4	0	61-136-	\N	\N	\N
13454	61	Atlantic Coast Offshore	137	Ng 18-1	0	61-137-	\N	\N	\N
13455	61	Atlantic Coast Offshore	138	Nh 18-10	0	61-138-	\N	\N	\N
13456	61	Atlantic Coast Offshore	139	Mcalinden Spur	0	61-139-	\N	\N	\N
13457	61	Atlantic Coast Offshore	140	Blake Spur	0	61-140-	\N	\N	\N
13458	61	Atlantic Coast Offshore	141	Harrington Hill	0	61-141-	\N	\N	\N
13459	61	Atlantic Coast Offshore	142	Richardson Hills	0	61-142-	\N	\N	\N
13460	61	Atlantic Coast Offshore	143	Cape Fear	0	61-143-	\N	\N	\N
13461	61	Atlantic Coast Offshore	144	Beaufort	0	61-144-	\N	\N	\N
13462	61	Atlantic Coast Offshore	155	Nf 17-3	0	61-155-	\N	\N	\N
13463	61	Atlantic Coast Offshore	156	Ng 17-12	0	61-156-	\N	\N	\N
13464	61	Atlantic Coast Offshore	157	Bimini	0	61-157-	\N	\N	\N
13465	61	Atlantic Coast Offshore	158	Bahamas	0	61-158-	\N	\N	\N
13466	61	Atlantic Coast Offshore	159	Walker Cay	0	61-159-	\N	\N	\N
13467	61	Atlantic Coast Offshore	160	Pillsbury	0	61-160-	\N	\N	\N
13468	61	Atlantic Coast Offshore	161	Adams	0	61-161-	\N	\N	\N
13469	61	Atlantic Coast Offshore	162	Stetson Mesa	0	61-162-	\N	\N	\N
13470	61	Atlantic Coast Offshore	163	Hoyt Hills	0	61-163-	\N	\N	\N
13471	61	Atlantic Coast Offshore	164	James Island	0	61-164-	\N	\N	\N
13472	61	Atlantic Coast Offshore	165	Georgetown	0	61-165-	\N	\N	\N
13473	61	Atlantic Coast Offshore	177	Nf 17-2	0	61-177-	\N	\N	\N
13474	61	Atlantic Coast Offshore	178	Key West	0	61-178-	\N	\N	\N
13475	61	Atlantic Coast Offshore	179	Miami	0	61-179-	\N	\N	\N
13476	61	Atlantic Coast Offshore	180	West Palm Beach	0	61-180-	\N	\N	\N
13477	61	Atlantic Coast Offshore	181	Ft Pierce	0	61-181-	\N	\N	\N
13478	61	Atlantic Coast Offshore	182	Orlando	0	61-182-	\N	\N	\N
13479	61	Atlantic Coast Offshore	183	Daytona Beach	0	61-183-	\N	\N	\N
13480	61	Atlantic Coast Offshore	184	Jacksonville	0	61-184-	\N	\N	\N
13481	61	Atlantic Coast Offshore	185	Brunswick	0	61-185-	\N	\N	\N
13482	61	Atlantic Coast Offshore	186	Savannah	0	61-186-	\N	\N	\N
13483	61	Atlantic Coast Offshore	199	Nf 17-1	0	61-199-	\N	\N	\N
13484	61	Atlantic Coast Offshore	200	Dry Tortugas	0	61-200-	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

