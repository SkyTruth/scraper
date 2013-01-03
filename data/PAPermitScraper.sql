LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `BotTask` DISABLE KEYS */;
INSERT INTO `BotTask` (`id`,`bot`,`name`,`process_interval_secs`)
VALUES
	(102,'PAPermitScraper','PA Permit Scraper',3600);
	
UNLOCK TABLES;



LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `BotTaskParams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` (`task_id`,`bot`,`key`,`value`)
VALUES
	(102,'PAPermitScraper','target_url','http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FPermits_Issued_Detail&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_START_DATE=11%2F01%2F2012%2000%3A00%3A00&P_END_DATE=12%2F31%2F2013%2000%3A00%3A00&P_SEARCH_NAME%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x0'),
	(102,'PAPermitScraper','about_url','http://www.portal.state.pa.us/portal/server.pt/community/oil_and_gas_reports/20297');

UNLOCK TABLES;