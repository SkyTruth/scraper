LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `BotTask` DISABLE KEYS */;
INSERT INTO `BotTask` (`id`,`bot`,`name`,`process_interval_secs`)
VALUES
	(106,'UshahidiPublisher','SkyTruth Ushahidi Update',3600);

/*!40000 ALTER TABLE `BotTask` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table BotTaskParams
# ------------------------------------------------------------

LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `BotTaskParams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` (`task_id`,`bot`,`key`,`value`)
VALUES
	(106,'UshahidiPublisher','feed_url','http://alerts.skytruth.org/json?tag=BigSpill,SkyTruth&region=GOM&channel=gost'),
	(106,'UshahidiPublisher','api_url','http://oilspill.skytruth.org/api'),
	(106,'UshahidiPublisher','last_item_updated','2013-01-01 07:41:18.006'),
	(106,'UshahidiPublisher','ushahidi_category','19');
	
/*!40000 ALTER TABLE `BotTaskParams` ENABLE KEYS */;
UNLOCK TABLES;
