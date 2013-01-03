# botmonitor.sql

LOCK TABLES `bottask` WRITE;
/*!40000 ALTER TABLE `bottask` DISABLE KEYS */;
INSERT INTO `bottask` VALUES (101,'BotMonitor','BotMonitor',3600);
/*!40000 ALTER TABLE `bottask` ENABLE KEYS */;
UNLOCK TABLES;
