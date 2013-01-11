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
-- Table structure for table `bottask`
--

--
-- Dumping data for table `bottask`
--

LOCK TABLES `bottask` WRITE;
/*!40000 ALTER TABLE `bottask` DISABLE KEYS */;
INSERT INTO `bottask` VALUES (126,'NightfireScraper','scrape',0);
/*!40000 ALTER TABLE `bottask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bottaskparams`
--

LOCK TABLES `bottaskparams` WRITE;
/*!40000 ALTER TABLE `bottaskparams` DISABLE KEYS */;
INSERT INTO `bottaskparams` VALUES (126,'NightfireScraper','target_url','http://www.ngdc.noaa.gov/dmsp/data/viirs_fire/'),(126,'NightfireScraper','file_count','3'),(126,'NightfireScraper','record_count','20');
/*!40000 ALTER TABLE `bottaskparams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nightfire_file`
--

DROP TABLE IF EXISTS `nightfire_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nightfire_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename_UNIQUE` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nightfire_file`
--

LOCK TABLES `nightfire_file` WRITE;
/*!40000 ALTER TABLE `nightfire_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `nightfire_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nightfire_record`
--

DROP TABLE IF EXISTS `nightfire_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nightfire_record` (
  `file_num` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Lat_GMTCO` double DEFAULT NULL,
  `Lon_GMTCO` double DEFAULT NULL,
  `CM_IICMO` int(11) DEFAULT NULL,
  `COT_IVCOP` double DEFAULT NULL,
  `EPS_IVCOP` double DEFAULT NULL,
  `QF1_IVCOP` int(11) DEFAULT NULL,
  `QF2_IVCOP` int(11) DEFAULT NULL,
  `QF3_IVCOP` int(11) DEFAULT NULL,
  `Total_Rad` double DEFAULT NULL,
  `BB_Temp` int(11) DEFAULT NULL,
  `M07_Rad` double DEFAULT NULL,
  `M08_Rad` double DEFAULT NULL,
  `M10_Rad` double DEFAULT NULL,
  `M12_Rad` double DEFAULT NULL,
  `M13_Rad` double DEFAULT NULL,
  `M14_Rad` double DEFAULT NULL,
  `M15_Rad` double DEFAULT NULL,
  `M16_Rad` double DEFAULT NULL,
  `SOLZ_GMTCO` double DEFAULT NULL,
  `SOLA_GMTCO` double DEFAULT NULL,
  `SATZ_GMTCO` double DEFAULT NULL,
  `SATA_GMTCO` double DEFAULT NULL,
  `SCVX_GMTCO` double DEFAULT NULL,
  `SCVY_GMTCO` double DEFAULT NULL,
  `SCVZ_GMTCO` double DEFAULT NULL,
  `SCPX_GMTCO` double DEFAULT NULL,
  `SCPY_GMTCO` double DEFAULT NULL,
  `SCPZ_GMTCO` double DEFAULT NULL,
  `SCAX_GMTCO` double DEFAULT NULL,
  `SCAY_GMTCO` double DEFAULT NULL,
  `SCAZ_GMTCO` double DEFAULT NULL,
  `QF1_GMTCO` int(11) DEFAULT NULL,
  `QF2_GMTCO` int(11) DEFAULT NULL,
  `QF1_IICMO` int(11) DEFAULT NULL,
  `QF2_IICMO` int(11) DEFAULT NULL,
  `QF3_IICMO` int(11) DEFAULT NULL,
  `QF4_IICMO` int(11) DEFAULT NULL,
  `QF5_IICMO` int(11) DEFAULT NULL,
  `QF6_IICMO` int(11) DEFAULT NULL,
  `Date_Mscan` datetime DEFAULT NULL,
  `M10_Center` int(11) DEFAULT NULL,
  `M10_Avg` double DEFAULT NULL,
  `M10_Std` double DEFAULT NULL,
  `M10_Nsigma` int(11) DEFAULT NULL,
  `M10_DN` int(11) DEFAULT NULL,
  `M10_Sample` int(11) DEFAULT NULL,
  `M10_Line` int(11) DEFAULT NULL,
  `M10_File` varchar(120) DEFAULT NULL,
  `Proc_Date` datetime DEFAULT NULL,
  `DNB_Sample` int(11) DEFAULT NULL,
  `DNB_Line` int(11) DEFAULT NULL,
  `DNB_Lat` double DEFAULT NULL,
  `DNB_Lon` double DEFAULT NULL,
  `DNB_Rad` int(11) DEFAULT NULL,
  `DNB_Dist` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_num`,`ID`),
  KEY `lat` (`Lat_GMTCO`),
  KEY `lng` (`Lon_GMTCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nightfire_record`
--

LOCK TABLES `nightfire_record` WRITE;
/*!40000 ALTER TABLE `nightfire_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `nightfire_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-11  8:08:16
