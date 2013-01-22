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
-- Table structure for table `CogisInspection`
--

DROP TABLE IF EXISTS `CogisInspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CogisInspection` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ft_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  KEY `doc_num_index` (`doc_num`),
  KEY `lat` (`site_lat`),
  KEY `lng` (`site_lng`)
) ENGINE=InnoDB AUTO_INCREMENT=2789 DEFAULT CHARSET=utf8 COMMENT='COGIS well inspection records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CogisSpill`
--

DROP TABLE IF EXISTS `CogisSpill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CogisSpill` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ft_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `idcogisspill_UNIQUE` (`st_id`),
  KEY `doc_num_index` (`doc_num`),
  KEY `lat` (`spill_lat`),
  KEY `lng` (`spill_lng`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

