-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: localhost    Database: nrc_data3
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
-- Dumping data for table `BotJob`
--

LOCK TABLES `BotJob` WRITE;
/*!40000 ALTER TABLE `BotJob` DISABLE KEYS */;
INSERT INTO `BotJob` VALUES
    (9,'WV_Permit_Activity','WVPermitScraper'),
    (201,'ScrapeCogisInspections','CogisScraper'),
    (202,'LocateAndFeedCogisViolations','CogisLocator'),
    (211,'ScrapeCogisSpills','CogisScraper'),
    (212,'LocateAndFeedCogisSpills','CogisLocator'),
    (301,'ScrapeVIIRSDatabase','NightfireScraper');
/*!40000 ALTER TABLE `BotJob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `BotJobParams`
--

LOCK TABLES `BotJobParams` WRITE;
/*!40000 ALTER TABLE `BotJobParams` DISABLE KEYS */;
INSERT INTO `BotJobParams` VALUES 
    (0,'botmaster_url_template','http://ewn2.skytruth.org/nrc/botmaster.php?bot={0}'),
    (0,'job_item_limit','1000'),
    (9,'about_url','http://www.dep.wv.gov/oil-and-gas/databaseinfo/Pages/OGD.aspx'),
    (9,'target_url','http://apps.dep.wv.gov/oog/permitsearch_new.cfm'),
    (201,'count','3'),
    (201,'table','insp'),
    (201,'target_url','http://cogcc.state.co.us/cogis/IncidentSearch.asp'),
    (202,'feed_source_id','1001'),
    (202,'Item','CogisInspection'),
    (202,'job_conditions','ScrapeCogisInspections:NEW'),
    (202,'loc_key_field','insp_api_num'),
    (202,'target_fields','site_lat, site_lng, operator'),
    (202,'url_template','http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid={0}&type=WELL'),
    (211,'count','3'),
    (211,'table','spill'),
    (211,'target_url','http://cogcc.state.co.us/cogis/IncidentSearch.asp'),
    (212,'feed_source_id','1001'),
    (212,'Item','CogisSpill'),
    (212,'job_conditions','ScrapeCogisSpills:NEW'),
    (212,'loc_key_field','facility_id'),
    (212,'target_fields','spill_lat, spill_lng, company_name'),
    (212,'url_template','http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid={0}&type=WELL'),
    (301,'file_count','3'),
    (301,'record_count','20'),
    (301,'target_url','http://www.ngdc.noaa.gov/dmsp/data/viirs_fire/');
/*!40000 ALTER TABLE `BotJobParams` ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-23 10:20:28
