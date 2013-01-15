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
-- Table structure for table `cogisinspection`
--

DROP TABLE IF EXISTS `cogisinspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cogisinspection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_num` varchar(15) NOT NULL,
  `county_code` varchar(10) DEFAULT NULL,
  `county_name` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `doc_href` varchar(120) DEFAULT NULL,
  `loc_id` varchar(15) DEFAULT NULL,
  `operator` varchar(60) DEFAULT NULL,
  `insp_api_num` varchar(30) DEFAULT NULL,
  `insp_status` varchar(15) DEFAULT NULL,
  `insp_overall` varchar(30) DEFAULT NULL,
  `ir_pass_fail` varchar(10) DEFAULT NULL,
  `fr_pass_fail` varchar(10) DEFAULT NULL,
  `violation` varchar(10) DEFAULT NULL,
  `site_lat` varchar(20) DEFAULT NULL,
  `site_lng` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_num_index` (`doc_num`),
  KEY `lat` (`site_lat`),
  KEY `lng` (`site_lng`)
) ENGINE=InnoDB AUTO_INCREMENT=2557 DEFAULT CHARSET=utf8 COMMENT='COGIS well inspection records';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `cogisspill`
--

DROP TABLE IF EXISTS `cogisspill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `spill_lat` varchar(20) DEFAULT NULL,
  `spill_lng` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcogisspill_UNIQUE` (`id`),
  KEY `doc_num_index` (`doc_num`),
  KEY `lat` (`spill_lat`),
  KEY `lng` (`spill_lng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-11  8:11:56
