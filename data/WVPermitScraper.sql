LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `BotTask` DISABLE KEYS */;
INSERT INTO `BotTask` (`id`,`bot`,`name`,`process_interval_secs`)
VALUES
	(105,'WVPermitScraper','WV Permit Activity',3600);
	
UNLOCK TABLES;


LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `BotTaskParams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` (`task_id`,`bot`,`key`,`value`)
VALUES
	(105,'WVPermitScraper','about_url','http://www.dep.wv.gov/oil-and-gas/databaseinfo/Pages/OGD.aspx'),
	(105,'WVPermitScraper','target_url','http://apps.dep.wv.gov/oog/permitsearch_new.cfm');

	
UNLOCK TABLES;
	
