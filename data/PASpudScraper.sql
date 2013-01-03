LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `BotTask` DISABLE KEYS */;
INSERT INTO `BotTask` (`id`,`bot`,`name`,`process_interval_secs`)
VALUES
	(103,'PASpudScraper','PA Spud Scraper',3600);
	
UNLOCK TABLES;



LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `BotTaskParams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` (`task_id`,`bot`,`key`,`value`)
VALUES
	(103,'PASpudScraper','about_url','http://www.portal.state.pa.us/portal/server.pt/community/oil_and_gas_reports/20297'),
	(103,'PASpudScraper','target_url','http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FSpud_External_Data&P_SPUD_START_DATE=10%2F01%2F2012%2000%3A00%3A00&P_SPUD_END_DATE=12%2F31%2F2013%2000%3A00%3A00&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_REGION%3Aisnull=True&P_OPERATOR%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x0');



UNLOCK TABLES;





