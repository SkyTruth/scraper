LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `BotTask` DISABLE KEYS */;
INSERT INTO `BotTask` (`id`,`bot`,`name`,`process_interval_secs`)
VALUES
	(104,'PAViolationScraper','PA Permit Violations',3600);
	
UNLOCK TABLES;


LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `BotTaskParams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` (`task_id`,`bot`,`key`,`value`)
VALUES
	(104,'PAViolationScraper','target_url','http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FOG_Compliance&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_ORG_NAME%3Aisnull=True&P_SEARCH_NAME%3Aisnull=True&P_INSPECTIONS=Y&P_RESOLVED_VIOLATIONS=N&P_CATEGORY_TYPE%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x3'),
	(104,'PAViolationScraper','about_url','http://www.depweb.state.pa.us/portal/server.pt/community/oil_and_gas_compliance_report/20299'),
	(104,'PAViolationScraper','date_offset','14');
	
UNLOCK TABLES;
	
