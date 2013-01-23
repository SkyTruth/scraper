-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: localhost    Database: nrc_data2
-- ------------------------------------------------------
-- Server version	5.5.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `bottask`
--

LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `bottask` DISABLE KEYS */;
INSERT INTO `BotTask` VALUES
    (124,'CogisScraper','scrape_insp',0),
    (125,'CogisSpillScraper','scrape_spill',0);
/*!40000 ALTER TABLE `bottask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bottaskparams`
--

LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `bottaskparams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` VALUES 
    (124,'CogisScraper','target_url','http://cogcc.state.co.us/cogis/IncidentSearch.asp'),
    (124,'CogisScraper','table','insp'),
    (124,'CogisScraper','count','3'),
    (125,'CogisSpillScraper','target_url','http://cogcc.state.co.us/cogis/IncidentSearch.asp'),
    (125,'CogisSpillScraper','table','spill'),
    (125,'CogisSpillScraper','count','3');
/*!40000 ALTER TABLE `bottaskparams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `feedsource`
--

LOCK TABLES `FeedSource` WRITE;
/*!40000 ALTER TABLE `feedsource` DISABLE KEYS */;
INSERT INTO `FeedSource` VALUES (1001,'COGIS');
/*!40000 ALTER TABLE `feedsource` ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-11  8:11:56
