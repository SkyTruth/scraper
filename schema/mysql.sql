# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.1.39-log)
# Database: NRC_Data
# Generation Time: 2012-10-30 16:14:05 -0400
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AreaCodeMap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AreaCodeMap`;

CREATE TABLE `AreaCodeMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(64) NOT NULL,
  `area_code` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pattern` (`pattern`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;



# Dump of table BotTask
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BotTask`;

CREATE TABLE `BotTask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `process_interval_secs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;



# Dump of table BotTaskError
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BotTaskError`;

CREATE TABLE `BotTaskError` (
  `task_id` int(11) NOT NULL,
  `bot` varchar(32) NOT NULL,
  `code` varchar(16) NOT NULL,
  `message` varchar(1023) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`,`bot`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table BotTaskParams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BotTaskParams`;

CREATE TABLE `BotTaskParams` (
  `task_id` int(11) NOT NULL,
  `bot` varchar(32) NOT NULL,
  `key` varchar(20) NOT NULL,
  `value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`bot`,`task_id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table BotTaskStatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BotTaskStatus`;

CREATE TABLE `BotTaskStatus` (
  `task_id` int(11) NOT NULL,
  `bot` varchar(32) CHARACTER SET latin1 NOT NULL,
  `status` varchar(16) CHARACTER SET latin1 NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`,`bot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table CO_Permits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CO_Permits`;

CREATE TABLE `CO_Permits` (
  `seqid` char(23) NOT NULL,
  `ft_id` int(11) NOT NULL,
  `county_name` varchar(20) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `operator_name` varchar(50) DEFAULT NULL,
  `operator_number` varchar(20) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `api` varchar(20) DEFAULT NULL,
  `type_of_permit` varchar(8) DEFAULT NULL,
  `well_name` varchar(50) DEFAULT NULL,
  `well_number` varchar(20) DEFAULT NULL,
  `proposed_td` double DEFAULT NULL,
  `well_location` varchar(50) DEFAULT NULL,
  `footage_call` varchar(50) DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `elevation` varchar(20) DEFAULT NULL,
  `federal_state_lease` varchar(20) DEFAULT NULL,
  `record_url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FT_Sync_Test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FT_Sync_Test`;

CREATE TABLE `FT_Sync_Test` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(30) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `ft_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`seqid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



# Dump of table FeedEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FeedEntry`;

CREATE TABLE `FeedEntry` (
  `id` char(36) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `summary` text CHARACTER SET latin1,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `content` text,
  `source_id` int(11) DEFAULT '0',
  `kml_url` varchar(255) DEFAULT NULL,
  `incident_datetime` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published_seq` int(11) NOT NULL AUTO_INCREMENT,
  `source_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `published` (`published`,`published_seq`),
  KEY `lat_lng` (`lat`,`lng`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`),
  KEY `incident_datetime` (`incident_datetime`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM AUTO_INCREMENT=7477 DEFAULT CHARSET=utf8;



# Dump of table FeedEntryTag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FeedEntryTag`;

CREATE TABLE `FeedEntryTag` (
  `feed_entry_id` char(36) NOT NULL,
  `tag` varchar(64) NOT NULL,
  `comment` text,
  PRIMARY KEY (`feed_entry_id`,`tag`),
  KEY `id` (`feed_entry_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table FeedSource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FeedSource`;

CREATE TABLE `FeedSource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;



# Dump of table FracFocusNormalization
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusNormalization`;

CREATE TABLE `FracFocusNormalization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(20) NOT NULL,
  `pattern` varchar(100) NOT NULL,
  `canonical_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



# Dump of table FracFocusPDF
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusPDF`;

CREATE TABLE `FracFocusPDF` (
  `seqid` int(11) NOT NULL,
  `downloaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pdf` longblob,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seqid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FracFocusParse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusParse`;

CREATE TABLE `FracFocusParse` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `api` varchar(20) NOT NULL,
  `fracture_date` date NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `well_name` varchar(50) DEFAULT NULL,
  `production_type` varchar(10) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `datum` varchar(8) DEFAULT NULL,
  `true_vertical_depth` double DEFAULT NULL,
  `total_water_volume` double DEFAULT NULL,
  `extracted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `api_job_date` (`api`,`fracture_date`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=latin1;



# Dump of table FracFocusParseChemical
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusParseChemical`;

CREATE TABLE `FracFocusParseChemical` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `report_seqid` int(11) NOT NULL,
  `api` varchar(20) NOT NULL,
  `fracture_date` date NOT NULL,
  `row` int(11) NOT NULL,
  `trade_name` varchar(200) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `ingredients` varchar(100) DEFAULT NULL,
  `cas_number` varchar(50) DEFAULT NULL,
  `additive_concentration` double DEFAULT NULL,
  `hf_fluid_concentration` double DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `api_date_row` (`api`,`fracture_date`,`row`),
  UNIQUE KEY `ft_id` (`ft_id`),
  KEY `report_seqid` (`report_seqid`),
  KEY `cas_number` (`cas_number`)
) ENGINE=MyISAM AUTO_INCREMENT=9410 DEFAULT CHARSET=latin1;



# Dump of table FracFocusReport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusReport`;

CREATE TABLE `FracFocusReport` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `pdf_seqid` int(11) NOT NULL,
  `api` varchar(20) NOT NULL,
  `fracture_date` date NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `well_name` varchar(50) DEFAULT NULL,
  `production_type` varchar(10) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `datum` varchar(8) DEFAULT NULL,
  `true_vertical_depth` double DEFAULT NULL,
  `total_water_volume` double DEFAULT NULL,
  `published` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_water_weight` double DEFAULT NULL,
  `total_pct_in_fluid` double DEFAULT NULL,
  `water_pct_in_fluid` double DEFAULT NULL,
  `total_hf_weight` double DEFAULT NULL,
  `err_code` varchar(20) DEFAULT NULL,
  `err_field` varchar(20) DEFAULT NULL,
  `err_comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `api_job_date` (`api`,`fracture_date`)
) ENGINE=MyISAM AUTO_INCREMENT=485 DEFAULT CHARSET=latin1;



# Dump of table FracFocusReportChemical
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusReportChemical`;

CREATE TABLE `FracFocusReportChemical` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `pdf_seqid` int(11) NOT NULL,
  `api` varchar(20) NOT NULL,
  `fracture_date` date NOT NULL,
  `row` int(11) NOT NULL,
  `trade_name` varchar(200) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `ingredients` varchar(100) DEFAULT NULL,
  `cas_number` varchar(50) DEFAULT NULL,
  `additive_concentration` double DEFAULT NULL,
  `hf_fluid_concentration` double DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `cas_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `api_date_row` (`api`,`fracture_date`,`row`),
  UNIQUE KEY `ft_id` (`ft_id`),
  KEY `report_seqid` (`pdf_seqid`),
  KEY `cas_number` (`cas_number`)
) ENGINE=MyISAM AUTO_INCREMENT=9410 DEFAULT CHARSET=latin1;



# Dump of table FracFocusScrape
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FracFocusScrape`;

CREATE TABLE `FracFocusScrape` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `scraped` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ft_id` int(11) DEFAULT NULL,
  `api` varchar(20) DEFAULT NULL,
  `job_date` date DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `well_name` varchar(50) DEFAULT NULL,
  `well_type` varchar(10) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `datum` varchar(8) DEFAULT NULL,
  `pdf_download_attempts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `api_job_date` (`api`,`job_date`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=latin1;



# Dump of table GeocodeCache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GeocodeCache`;

CREATE TABLE `GeocodeCache` (
  `_key` varchar(50) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table INCIDENT_COMMONS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `INCIDENT_COMMONS`;

CREATE TABLE `INCIDENT_COMMONS` (
  `SEQNOS` int(11) NOT NULL,
  `DESCRIPTION_OF_INCIDENT` varchar(240) DEFAULT NULL,
  `TYPE_OF_INCIDENT` varchar(40) DEFAULT NULL,
  `INCIDENT_CAUSE` varchar(40) DEFAULT NULL,
  `INCIDENT_DATE_TIME` datetime DEFAULT NULL,
  `INCIDENT_DTG` varchar(10) DEFAULT NULL,
  `INCIDENT_LOCATION` varchar(80) DEFAULT NULL,
  `LOCATION_ADDRESS` varchar(40) DEFAULT NULL,
  `LOCATION_STREET1` varchar(40) DEFAULT NULL,
  `LOCATION_STREET2` varchar(40) DEFAULT NULL,
  `LOCATION_NEAREST_CITY` varchar(30) DEFAULT NULL,
  `LOCATION_STATE` varchar(2) DEFAULT NULL,
  `LOCATION_COUNTY` varchar(30) DEFAULT NULL,
  `LOCATION_ZIP` varchar(9) DEFAULT NULL,
  `DISTANCE_FROM_CITY` decimal(4,1) DEFAULT NULL,
  `DISTANCE_UNITS` varchar(40) DEFAULT NULL,
  `DIRECTION_FROM_CITY` varchar(3) DEFAULT NULL,
  `LAT_DEG` decimal(2,0) DEFAULT NULL,
  `LAT_MIN` decimal(2,0) DEFAULT NULL,
  `LAT_SEC` decimal(2,0) DEFAULT NULL,
  `LAT_QUAD` varchar(1) DEFAULT NULL,
  `LONG_DEG` decimal(3,0) DEFAULT NULL,
  `LONG_MIN` decimal(2,0) DEFAULT NULL,
  `LONG_SEC` decimal(2,0) DEFAULT NULL,
  `LONG_QUAD` varchar(1) DEFAULT NULL,
  `LOCATION_SECTION` varchar(30) DEFAULT NULL,
  `LOCATION_TOWNSHIP` varchar(30) DEFAULT NULL,
  `LOCATION_RANGE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SEQNOS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table INCIDENT_DETAILS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `INCIDENT_DETAILS`;

CREATE TABLE `INCIDENT_DETAILS` (
  `SEQNOS` int(11) NOT NULL,
  `FIRE_INVOLVED` varchar(1) DEFAULT NULL,
  `FIRE_EXTINGUISHED` varchar(1) DEFAULT NULL,
  `ANY_EVACUATIONS` varchar(1) DEFAULT NULL,
  `NUMBER_EVACUATED` decimal(5,0) DEFAULT NULL,
  `WHO_EVACUATED` varchar(40) DEFAULT NULL,
  `RADIUS_OF_EVACUATION` decimal(7,2) DEFAULT NULL,
  `ANY_INJURIES` varchar(1) DEFAULT NULL,
  `NUMBER_INJURED` decimal(4,0) DEFAULT NULL,
  `NUMBER_HOSPITALIZED` decimal(4,0) DEFAULT NULL,
  `ANY_FATALITIES` varchar(1) DEFAULT NULL,
  `NUMBER_FATALITIES` decimal(4,0) DEFAULT NULL,
  `ANY_DAMAGES` varchar(1) DEFAULT NULL,
  `DAMAGE_AMOUNT` decimal(9,0) DEFAULT NULL,
  `AIR_CORRIDOR_CLOSED` varchar(1) DEFAULT NULL,
  `AIR_CORRIDOR_DESC` varchar(80) DEFAULT NULL,
  `AIR_CLOSURE_TIME` decimal(4,1) DEFAULT NULL,
  `WATERWAY_CLOSED` varchar(1) DEFAULT NULL,
  `WATERWAY_DESC` varchar(80) DEFAULT NULL,
  `WATERWAY_CLOSURE_TIME` decimal(4,1) DEFAULT NULL,
  `ROAD_CLOSED` varchar(1) DEFAULT NULL,
  `ROAD_DESC` varchar(80) DEFAULT NULL,
  `ROAD_CLOSURE_TIME` decimal(4,1) DEFAULT NULL,
  `CLOSURE_DIRECTION` varchar(40) DEFAULT NULL,
  `MAJOR_ARTERY` varchar(1) DEFAULT NULL,
  `TRACK_CLOSED` varchar(1) DEFAULT NULL,
  `TRACK_DESC` varchar(80) DEFAULT NULL,
  `TRACK_CLOSURE_TIME` decimal(4,1) DEFAULT NULL,
  `MEDIA_INTEREST` varchar(14) DEFAULT NULL,
  `MEDIUM_DESC` varchar(40) DEFAULT NULL,
  `ADDITIONAL_MEDIUM_INFO` varchar(80) DEFAULT NULL,
  `BODY_OF_WATER` varchar(40) DEFAULT NULL,
  `TRIBUTARY_OF` varchar(40) DEFAULT NULL,
  `NEAREST_RIVER_MILE_MAKER` decimal(6,2) DEFAULT NULL,
  `RELEASE_SECURED` varchar(1) DEFAULT NULL,
  `ESTIMATED_DURATION_OF_RELEASE` varchar(12) DEFAULT NULL,
  `RELEASE_RATE` varchar(20) DEFAULT NULL,
  `DESC_REMEDIAL_ACTION` varchar(240) DEFAULT NULL,
  `STATE_AGENCY_ON_SCENE` varchar(40) DEFAULT NULL,
  `STATE_AGENCY_REPORT_NUM` varchar(15) DEFAULT NULL,
  `OTHER_AGENCY_NOTIFIED` varchar(40) DEFAULT NULL,
  `WEATHER_CONDITIONS` varchar(40) DEFAULT NULL,
  `AIR_TEMPERATURE` decimal(3,0) DEFAULT NULL,
  `WIND_SPEED` decimal(3,0) DEFAULT NULL,
  `WIND_DIRECTION` varchar(40) DEFAULT NULL,
  `WATER_SUPPLY_CONTAMINATED` varchar(1) DEFAULT NULL,
  `SHEEN_SIZE` varchar(20) DEFAULT NULL,
  `SHEEN_COLOR` varchar(40) DEFAULT NULL,
  `DIRECTION_OF_SHEEN_TRAVEL` varchar(40) DEFAULT NULL,
  `SHEEN_ODOR_DESCRIPTION` varchar(40) DEFAULT NULL,
  `WAVE_CONDITION` varchar(40) DEFAULT NULL,
  `CURRENT_SPEED` decimal(3,0) DEFAULT NULL,
  `CURRENT_DIRECTION` varchar(40) DEFAULT NULL,
  `WATER_TEMPERATURE` decimal(2,0) DEFAULT NULL,
  `TRACK_CLOSE_DIR` varchar(40) DEFAULT NULL,
  `EMPL_FATALITY` decimal(3,0) DEFAULT NULL,
  `PASS_FATALITY` decimal(3,0) DEFAULT NULL,
  `COMMUNITY_IMPACT` varchar(1) DEFAULT NULL,
  `WIND_SPEED_UNIT` varchar(40) DEFAULT NULL,
  `EMPLOYEE_INJURIES` decimal(3,0) DEFAULT NULL,
  `PASSENGER_INJURIES` decimal(3,0) DEFAULT NULL,
  `OCCUPANT_FATALITY` decimal(3,0) DEFAULT NULL,
  `CURRENT_SPEED_UNIT` varchar(40) DEFAULT NULL,
  `ROAD_CLOSURE_UNITS` varchar(40) DEFAULT NULL,
  `TRACK_CLOSURE_UNITS` varchar(40) DEFAULT NULL,
  `SHEEN_SIZE_UNITS` varchar(40) DEFAULT NULL,
  `ADDITIONAL_INFO` varchar(2000) DEFAULT NULL,
  `STATE_AGENCY_NOTIFIED` varchar(40) DEFAULT NULL,
  `FEDERAL_AGENCY_NOTIFIED` varchar(40) DEFAULT NULL,
  `NEAREST_RIVER_MILE_MARKER` varchar(10) DEFAULT NULL,
  `SHEEN_SIZE_LENGTH` varchar(5) DEFAULT NULL,
  `SHEEN_SIZE_LENGTH_UNITS` varchar(40) DEFAULT NULL,
  `SHEEN_SIZE_WIDTH` varchar(5) DEFAULT NULL,
  `SHEEN_SIZE_WIDTH_UNITS` varchar(40) DEFAULT NULL,
  `OFFSHORE` varchar(1) DEFAULT NULL,
  `DURATION_UNIT` varchar(40) DEFAULT NULL,
  `RELEASE_RATE_UNIT` varchar(40) DEFAULT NULL,
  `RELEASE_RATE_RATE` varchar(40) DEFAULT NULL,
  `PASSENGERS_TRANSFERRED` varchar(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table LeaseBlockCentroid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LeaseBlockCentroid`;

CREATE TABLE `LeaseBlockCentroid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(8) NOT NULL,
  `blockid` varchar(8) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `state` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `areaid_blockid` (`areaid`,`blockid`)
) ENGINE=MyISAM AUTO_INCREMENT=30895 DEFAULT CHARSET=utf8;



# Dump of table NrcAnalysis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcAnalysis`;

CREATE TABLE `NrcAnalysis` (
  `reportnum` int(11) NOT NULL,
  `sheen_length` double DEFAULT NULL,
  `sheen_width` double DEFAULT NULL,
  `reported_spill_volume` double DEFAULT NULL,
  `min_spill_volume` double DEFAULT NULL,
  `calltype` varchar(20) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `release_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcGeocode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcGeocode`;

CREATE TABLE `NrcGeocode` (
  `reportnum` int(11) NOT NULL DEFAULT '0',
  `source` char(16) CHARACTER SET latin1 NOT NULL,
  `lat` double NOT NULL DEFAULT '0',
  `lng` double NOT NULL DEFAULT '0',
  `precision` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportnum`,`source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcMaterials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcMaterials`;

CREATE TABLE `NrcMaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(32) NOT NULL,
  `group_label` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;



# Dump of table NrcParsedReport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcParsedReport`;

CREATE TABLE `NrcParsedReport` (
  `reportnum` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `areaid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `blockid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `zip` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `platform_letter` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `sheen_size_length` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `sheen_size_width` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `affected_area` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcParsedReport_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcParsedReport_copy`;

CREATE TABLE `NrcParsedReport_copy` (
  `reportnum` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `areaid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `blockid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `zip` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `platform_letter` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `sheen_size_length` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `sheen_size_width` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `affected_area` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcParsedReport_copy2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcParsedReport_copy2`;

CREATE TABLE `NrcParsedReport_copy2` (
  `reportnum` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `areaid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `blockid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `zip` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `platform_letter` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `sheen_size_length` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `sheen_size_width` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `affected_area` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcScrapedFullReport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcScrapedFullReport`;

CREATE TABLE `NrcScrapedFullReport` (
  `reportnum` int(11) NOT NULL,
  `full_report_body` text CHARACTER SET latin1,
  `full_report_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `parsed_blockid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `parsed_areaid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `parsed_latitude` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `parsed_longitude` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcScrapedMaterial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcScrapedMaterial`;

CREATE TABLE `NrcScrapedMaterial` (
  `reportnum` int(11) NOT NULL,
  `chris_code` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `amount` double DEFAULT NULL,
  `unit` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `reached_water` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `amt_in_water` double DEFAULT NULL,
  `amt_in_water_unit` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`reportnum`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcScrapedMaterial_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcScrapedMaterial_copy`;

CREATE TABLE `NrcScrapedMaterial_copy` (
  `reportnum` int(11) NOT NULL,
  `chris_code` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `amount` int(11) DEFAULT NULL,
  `unit` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `reached_water` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `amt_in_water` int(11) DEFAULT NULL,
  `amt_in_water_unit` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`reportnum`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcScrapedReport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcScrapedReport`;

CREATE TABLE `NrcScrapedReport` (
  `reportnum` int(11) NOT NULL,
  `calltype` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `recieved_datetime` datetime DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `incident_datetime` datetime DEFAULT NULL,
  `incidenttype` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `cause` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `location` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `state` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nearestcity` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `county` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `suspected_responsible_company` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `medium_affected` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `material_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `full_report_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `full_report_body` text CHARACTER SET latin1,
  `areaid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `blockid` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `latitude` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `longitude` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `materials_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcScraperTarget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcScraperTarget`;

CREATE TABLE `NrcScraperTarget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `execute_order` int(11) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



# Dump of table NrcTag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcTag`;

CREATE TABLE `NrcTag` (
  `reportnum` int(11) NOT NULL,
  `tag` varchar(64) NOT NULL,
  `comment` text,
  PRIMARY KEY (`reportnum`,`tag`),
  KEY `reportnum` (`reportnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table NrcUnits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NrcUnits`;

CREATE TABLE `NrcUnits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type` varchar(16) NOT NULL,
  `pattern` varchar(32) NOT NULL,
  `standardized_unit` varchar(32) NOT NULL,
  `conversion_factor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;



# Dump of table PA_DrillingPermit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PA_DrillingPermit`;

CREATE TABLE `PA_DrillingPermit` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `County_Name` varchar(20) NOT NULL,
  `Municipality_Name` varchar(20) DEFAULT NULL,
  `Auth_Id` int(11) DEFAULT NULL,
  `Date_Disposed` date NOT NULL,
  `Disposition_Code` varchar(20) DEFAULT NULL,
  `Appl_Type_Code` varchar(20) DEFAULT NULL,
  `Auth_Type_Description` varchar(60) DEFAULT NULL,
  `Complete_API_` varchar(20) NOT NULL,
  `Other_Id` varchar(20) NOT NULL,
  `Marcellus_Shale_Well` varchar(4) DEFAULT NULL,
  `Horizontal_Well` varchar(4) DEFAULT NULL,
  `Well_Type` varchar(20) DEFAULT NULL,
  `Site_Name` varchar(50) DEFAULT NULL,
  `Total_Depth` int(11) DEFAULT NULL,
  `Lat_Deg` double DEFAULT NULL,
  `Lat_Min` double DEFAULT NULL,
  `Lat_Sec` double DEFAULT NULL,
  `Long_Deg` double DEFAULT NULL,
  `Long_Min` double DEFAULT NULL,
  `Long_Sec` double DEFAULT NULL,
  `GIS_Datum` varchar(50) DEFAULT NULL,
  `Latitude_Decimal` double DEFAULT NULL,
  `Longitude_Decimal` double DEFAULT NULL,
  `Client_Id` int(11) DEFAULT NULL,
  `Operator` varchar(100) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State_Code` varchar(20) DEFAULT NULL,
  `Zip_Code` varchar(20) DEFAULT NULL,
  `Unconventional` varchar(4) DEFAULT NULL,
  `OGO_Num` varchar(20) DEFAULT NULL,
  `Facility_Id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `API_DATE` (`Complete_API_`,`Date_Disposed`),
  UNIQUE KEY `ft_id` (`ft_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6057 DEFAULT CHARSET=latin1;



# Dump of table PA_Spud
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PA_Spud`;

CREATE TABLE `PA_Spud` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `Well_API__` varchar(20) NOT NULL,
  `OGO__` varchar(20) NOT NULL,
  `SPUD_Date` date NOT NULL,
  `County` varchar(20) DEFAULT NULL,
  `Municipality` varchar(20) DEFAULT NULL,
  `Operator_s_Name` varchar(100) DEFAULT NULL,
  `Farm_Name` varchar(50) DEFAULT NULL,
  `Well_Number` varchar(20) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Marcellus_Ind_` varchar(4) DEFAULT NULL,
  `Horizontal_Ind_` varchar(4) DEFAULT NULL,
  `Creation_Date` datetime DEFAULT NULL,
  `Created_By` varchar(20) DEFAULT NULL,
  `Modification_Date` datetime DEFAULT NULL,
  `Modified_By` varchar(20) DEFAULT NULL,
  `Well_Type` varchar(20) DEFAULT NULL,
  `Unconventional` varchar(4) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `API_DATE` (`Well_API__`,`SPUD_Date`),
  UNIQUE KEY `ft_id` (`ft_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26393 DEFAULT CHARSET=latin1;



# Dump of table PA_Spud_New
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PA_Spud_New`;

CREATE TABLE `PA_Spud_New` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `Well_API__` varchar(20) NOT NULL,
  `OGO__` varchar(20) NOT NULL,
  `SPUD_Date` date NOT NULL,
  `County` varchar(20) DEFAULT NULL,
  `Municipality` varchar(20) DEFAULT NULL,
  `Operator_s_Name` varchar(100) DEFAULT NULL,
  `Farm_Name` varchar(50) DEFAULT NULL,
  `Well_Number` varchar(20) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Marcellus_Ind_` varchar(4) DEFAULT NULL,
  `Horizontal_Ind_` varchar(4) DEFAULT NULL,
  `Creation_Date` datetime DEFAULT NULL,
  `Created_By` varchar(20) DEFAULT NULL,
  `Modification_Date` datetime DEFAULT NULL,
  `Modified_By` varchar(20) DEFAULT NULL,
  `Well_Type` varchar(20) DEFAULT NULL,
  `Unconventional` varchar(4) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `API_DATE` (`Well_API__`,`SPUD_Date`),
  UNIQUE KEY `ft_id` (`ft_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26393 DEFAULT CHARSET=latin1;



# Dump of table PA_Violation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PA_Violation`;

CREATE TABLE `PA_Violation` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `InspectionID` int(11) NOT NULL,
  `ViolationID` int(11) NOT NULL,
  `EnforcementID` int(11) DEFAULT NULL,
  `Operator` varchar(100) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `InspectionDate` date DEFAULT NULL,
  `InspectionType` varchar(50) DEFAULT NULL,
  `Permit_API` varchar(20) DEFAULT NULL,
  `IsMarcellus` varchar(8) DEFAULT NULL,
  `InspectionCategory` varchar(50) DEFAULT NULL,
  `County` varchar(20) DEFAULT NULL,
  `Municipality` varchar(20) DEFAULT NULL,
  `InspectionResult` varchar(255) DEFAULT NULL,
  `InspectionComment` text,
  `ViolationDate` date DEFAULT NULL,
  `ViolationCode` varchar(255) DEFAULT NULL,
  `ViolationType` varchar(100) DEFAULT NULL,
  `ViolationComment` varchar(255) DEFAULT NULL,
  `ResolvedDate` date DEFAULT NULL,
  `EnforcementCode` varchar(100) DEFAULT NULL,
  `PenaltyFinalStatus` varchar(100) DEFAULT NULL,
  `PenaltyDateFinal` date DEFAULT NULL,
  `EnforcementDateFinal` date DEFAULT NULL,
  `PenaltyAmount` double DEFAULT NULL,
  `TotalAmountCollected` double DEFAULT NULL,
  `Unconventional` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `ViolationID` (`ViolationID`),
  UNIQUE KEY `ft_id` (`ft_id`)
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;



# Dump of table PublishedFeedItems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PublishedFeedItems`;

CREATE TABLE `PublishedFeedItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `feed_item_id` char(36) NOT NULL,
  `published` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `task_item` (`task_id`,`feed_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;



# Dump of table RSSEmailSubscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RSSEmailSubscription`;

CREATE TABLE `RSSEmailSubscription` (
  `id` char(36) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `rss_url` varchar(255) NOT NULL,
  `interval_hours` int(11) NOT NULL DEFAULT '24',
  `last_email_sent` timestamp NULL DEFAULT NULL,
  `last_item_updated` timestamp NULL DEFAULT NULL,
  `lat1` double DEFAULT NULL,
  `lat2` double DEFAULT NULL,
  `lng1` double DEFAULT NULL,
  `lng2` double DEFAULT NULL,
  `last_update_sent` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RssFeed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RssFeed`;

CREATE TABLE `RssFeed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `last_read` datetime NOT NULL,
  `update_interval_secs` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



# Dump of table RssFeedItem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RssFeedItem`;

CREATE TABLE `RssFeedItem` (
  `item_id` varchar(255) NOT NULL,
  `content` blob,
  `feed_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SatelliteImage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SatelliteImage`;

CREATE TABLE `SatelliteImage` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `size_bytes` int(11) DEFAULT NULL,
  `acquisition_datetime` datetime DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `type` char(20) DEFAULT NULL,
  `status` char(20) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table WV_DrillingPermit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WV_DrillingPermit`;

CREATE TABLE `WV_DrillingPermit` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `ft_id` int(11) DEFAULT NULL,
  `API` varchar(12) NOT NULL,
  `permit_number` int(11) DEFAULT NULL,
  `permit_type` varchar(20) DEFAULT NULL,
  `current_operator` varchar(100) DEFAULT NULL,
  `farm_name` varchar(100) DEFAULT NULL,
  `well_number` varchar(50) DEFAULT NULL,
  `permit_activity_type` varchar(50) DEFAULT NULL,
  `permit_activity_date` date DEFAULT NULL,
  `utm_north` double DEFAULT NULL,
  `utm_east` double DEFAULT NULL,
  `datum` int(11) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `api_type_date` (`API`,`permit_activity_type`,`permit_activity_date`),
  KEY `permit_type` (`permit_type`),
  KEY `utm` (`utm_north`,`utm_east`),
  KEY `well_number` (`well_number`)
) ENGINE=MyISAM AUTO_INCREMENT=255835 DEFAULT CHARSET=latin1;



# Dump of table ft_nrc_incident_reports
# ------------------------------------------------------------

DROP VIEW IF EXISTS `ft_nrc_incident_reports`;

CREATE TABLE `ft_nrc_incident_reports` (
   `time_stamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `reportnum` INT(11) NOT NULL,
   `calltype` VARCHAR(16) DEFAULT NULL,
   `recieved_datetime` DATETIME DEFAULT NULL,
   `description` TEXT DEFAULT NULL,
   `incident_datetime` DATETIME DEFAULT NULL,
   `incidenttype` VARCHAR(32) DEFAULT NULL,
   `cause` VARCHAR(32) DEFAULT NULL,
   `location` VARCHAR(255) DEFAULT NULL,
   `affected_area` VARCHAR(32) DEFAULT NULL,
   `state` VARCHAR(255) DEFAULT NULL,
   `county` VARCHAR(32) DEFAULT NULL,
   `nearestcity` VARCHAR(255) DEFAULT NULL,
   `zip` VARCHAR(16) DEFAULT NULL,
   `latitude` DOUBLE DEFAULT NULL,
   `longitude` DOUBLE DEFAULT NULL,
   `areaid` VARCHAR(32) DEFAULT NULL,
   `blockid` VARCHAR(32) DEFAULT NULL,
   `platform_letter` VARCHAR(16) DEFAULT NULL,
   `suspected_responsible_company` VARCHAR(255) DEFAULT NULL,
   `medium_affected` VARCHAR(255) DEFAULT NULL,
   `material_name` VARCHAR(255) DEFAULT NULL,
   `full_report_url` VARCHAR(255) DEFAULT NULL,
   `full_report_body` TEXT DEFAULT NULL,
   `materials_url` VARCHAR(255) DEFAULT NULL,
   `sheen_size_length` VARCHAR(16) DEFAULT NULL,
   `sheen_size_width` VARCHAR(16) DEFAULT NULL
) ENGINE=MyISAM;;





#DROP TABLE `ft_nrc_incident_reports`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ft_nrc_incident_reports`
AS select
   if((`r`.`time_stamp` > `p`.`time_stamp`),`r`.`time_stamp`,
   `p`.`time_stamp`) AS `time_stamp`,
   `r`.`reportnum` AS `reportnum`,
   `r`.`calltype` AS `calltype`,
   `r`.`recieved_datetime` AS `recieved_datetime`,
   `r`.`description` AS `description`,
   `r`.`incident_datetime` AS `incident_datetime`,
   `r`.`incidenttype` AS `incidenttype`,
   `r`.`cause` AS `cause`,
   `r`.`location` AS `location`,
   `p`.`affected_area` AS `affected_area`,
   `r`.`state` AS `state`,
   `p`.`county` AS `county`,
   `r`.`nearestcity` AS `nearestcity`,
   `p`.`zip` AS `zip`,
   `p`.`latitude` AS `latitude`,
   `p`.`longitude` AS `longitude`,
   `p`.`areaid` AS `areaid`,
   `p`.`blockid` AS `blockid`,
   `p`.`platform_letter` AS `platform_letter`,
   `r`.`suspected_responsible_company` AS `suspected_responsible_company`,
   `r`.`medium_affected` AS `medium_affected`,
   `r`.`material_name` AS `material_name`,
   `r`.`full_report_url` AS `full_report_url`,
   `r`.`full_report_body` AS `full_report_body`,
   `r`.`materials_url` AS `materials_url`,
   `p`.`sheen_size_length` AS `sheen_size_length`,
   `p`.`sheen_size_width` AS `sheen_size_width`
from (`nrcscrapedreport` `r` join `nrcparsedreport` `p` on((`r`.`reportnum` = `p`.`reportnum`)));



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
