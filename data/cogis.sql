delimiter $$

CREATE TABLE `cogisinspection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_num` varchar(15) NOT NULL,
  `county_code` varchar(10) DEFAULT NULL,
  `county_name` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `doc_href` varchar(120) DEFAULT NULL,
  `loc_id` varchar(15) DEFAULT NULL,
  `insp_api_num` varchar(30) DEFAULT NULL,
  `insp_status` varchar(15) DEFAULT NULL,
  `insp_overall` varchar(30) DEFAULT NULL,
  `ir_pass_fail` varchar(10) DEFAULT NULL,
  `fr_pass_fail` varchar(10) DEFAULT NULL,
  `violation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_num_index` (`doc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8 COMMENT='COGIS well inspection records'$$

delimiter $$

CREATE TABLE `cogisspill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_num` varchar(15) NOT NULL,
  `county_code` varchar(10) DEFAULT NULL,
  `county_name` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `doc_href` varchar(120) DEFAULT NULL,
  `facility_id` varchar(15) DEFAULT NULL,
  `operator_num` varchar(15) DEFAULT NULL,
  `company_name` varchar(60) DEFAULT NULL,
  `groundwater` varchar(10) DEFAULT NULL,
  `surfacewater` varchar(10) DEFAULT NULL,
  `berm_contained` varchar(10) DEFAULT NULL,
  `spill_area` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcogisspill_UNIQUE` (`id`),
  KEY `doc_num_index` (`doc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8$$

LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `bottask` DISABLE KEYS */;
INSERT INTO `BotTask` VALUES (124,'CogisScraper','scrape_insp',0),(125,'CogisScraper','scrape_spill',0);
/*!40000 ALTER TABLE `bottask` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `bottaskparams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` VALUES (124,'CogisScraper','target_url','http://cogcc.state.co.us/cogis/IncidentSearch.asp'),(125,'CogisScraper','target_url','http://cogcc.state.co.us/cogis/IncidentSearch.asp'),(124,'CogisScraper','table','insp'),(125,'CogisScraper','table','spill'),(124,'CogisScraper','count','20'),(125,'CogisScraper','count','20');
/*!40000 ALTER TABLE `bottaskparams` ENABLE KEYS */;
UNLOCK TABLES;

