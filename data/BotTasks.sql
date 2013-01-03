# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: ewn2.skytruth.org (MySQL 5.1.41-3ubuntu12.10)
# Database: NRC_Data
# Generation Time: 2013-01-02 15:53:17 -0500
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table BotTask
# ------------------------------------------------------------

LOCK TABLES `BotTask` WRITE;
/*!40000 ALTER TABLE `BotTask` DISABLE KEYS */;
INSERT INTO `BotTask` (`id`,`bot`,`name`,`process_interval_secs`)
VALUES
	(5,'UshahidiPublisher','LABB Ushahidi Update',3600),
	(4,'UshahidiPublisher','SkyTruth Ushahidi Update',3600),
	(6,'PAPermitScraper','PA Permit Scraper',3600),
	(7,'PASpudScraper','PA Spud Scraper',3600),
	(8,'BotMonitor','Bot Monitor',3600),
	(9,'WVPermitScraper','WV Permit Activity',3600),
	(10,'PAViolationScraper','PA Permit Violations',3600),
	(34,'FracFocusScraper','FracFocus Scraper OH',85000),
	(35,'FracFocusScraper','FracFocus Scraper OK',85000),
	(47,'FracFocusScraper','FracFocus Scraper WV',85000),
	(37,'FracFocusScraper','FracFocus Scraper PA',85000),
	(49,'FracFocusScraper','FracFocus Scraper WY',85000),
	(45,'FracFocusScraper','FracFocus Scraper VA',85000),
	(43,'FracFocusScraper','FracFocus Scraper UT',85000),
	(41,'FracFocusScraper','FracFocus Scraper TN',85000),
	(48,'FracFocusScraper','FracFocus Scraper WI',85000),
	(46,'FracFocusScraper','FracFocus Scraper WA',85000),
	(44,'FracFocusScraper','FracFocus Scraper VT',85000),
	(40,'FracFocusScraper','FracFocus Scraper SD',85000),
	(39,'FracFocusScraper','FracFocus Scraper SC',85000),
	(38,'FracFocusScraper','FracFocus Scraper RI',85000),
	(36,'FracFocusScraper','FracFocus Scraper OR',85000),
	(33,'FracFocusScraper','FracFocus Scraper ND',85000),
	(32,'FracFocusScraper','FracFocus Scraper NC',85000),
	(31,'FracFocusScraper','FracFocus Scraper NY',85000),
	(30,'FracFocusScraper','FracFocus Scraper NM',85000),
	(29,'FracFocusScraper','FracFocus Scraper NJ',85000),
	(28,'FracFocusScraper','FracFocus Scraper NH',85000),
	(27,'FracFocusScraper','FracFocus Scraper NV',85000),
	(26,'FracFocusScraper','FracFocus Scraper NE',85000),
	(25,'FracFocusScraper','FracFocus Scraper MT',85000),
	(24,'FracFocusScraper','FracFocus Scraper MO',85000),
	(23,'FracFocusScraper','FracFocus Scraper MS',85000),
	(22,'FracFocusScraper','FracFocus Scraper MN',85000),
	(21,'FracFocusScraper','FracFocus Scraper MI',85000),
	(20,'FracFocusScraper','FracFocus Scraper MA',85000),
	(19,'FracFocusScraper','FracFocus Scraper MD',85000),
	(18,'FracFocusScraper','FracFocus Scraper ME',85000),
	(17,'FracFocusScraper','FracFocus Scraper LA',85000),
	(16,'FracFocusScraper','FracFocus Scraper KY',85000),
	(15,'FracFocusScraper','FracFocus Scraper KS',85000),
	(14,'FracFocusScraper','FracFocus Scraper IA',85000),
	(13,'FracFocusScraper','FracFocus Scraper IN',85000),
	(12,'FracFocusScraper','FracFocus Scraper IL',85000),
	(11,'FracFocusScraper','FracFocus Scraper ID',85000),
	(42,'FracFocusScraper','FracFocus Scraper TX',85000),
	(10,'FracFocusScraper','FracFocus Scraper GA',85000),
	(9,'FracFocusScraper','FracFocus Scraper FL',85000),
	(8,'FracFocusScraper','FracFocus Scraper DC',85000),
	(7,'FracFocusScraper','FracFocus Scraper DE',85000),
	(6,'FracFocusScraper','FracFocus Scraper CT',85000),
	(5,'FracFocusScraper','FracFocus Scraper CO',85000),
	(4,'FracFocusScraper','FracFocus Scraper CA',85000),
	(3,'FracFocusScraper','FracFocus Scraper AR',85000),
	(2,'FracFocusScraper','FracFocus Scraper AZ',85000),
	(1,'FracFocusScraper','FracFocus Scraper AL',85000),
	(50,'FracFocusScraper','FracFocus Scraper AK',85000);

/*!40000 ALTER TABLE `BotTask` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table BotTaskParams
# ------------------------------------------------------------

LOCK TABLES `BotTaskParams` WRITE;
/*!40000 ALTER TABLE `BotTaskParams` DISABLE KEYS */;
INSERT INTO `BotTaskParams` (`task_id`,`bot`,`key`,`value`)
VALUES
	(4,'UshahidiPublisher','feed_url','http://alerts.skytruth.org/json?tag=BigSpill,SkyTruth&region=GOM&channel=gost'),
	(4,'UshahidiPublisher','api_url','http://oilspill.skytruth.org/api'),
	(4,'UshahidiPublisher','last_item_updated','2013-01-01 07:41:18.006'),
	(4,'UshahidiPublisher','ushahidi_category','19'),
	(5,'UshahidiPublisher','feed_url','http://alerts.skytruth.org/json?tag=LABB&channel=LABB'),
	(5,'UshahidiPublisher','api_url','http://www.oilspill.labucketbrigade.org/api'),
	(5,'UshahidiPublisher','last_item_updated','2013-01-02 07:41:12.005'),
	(5,'UshahidiPublisher','ushahidi_category','LABB'),
	(6,'PAPermitScraper','target_url','http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FPermits_Issued_Detail&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_START_DATE=05%2F01%2F2012%2000%3A00%3A00&P_END_DATE=12%2F31%2F2012%2000%3A00%3A00&P_SEARCH_NAME%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x0'),
	(9,'WVPermitScraper','about_url','http://www.dep.wv.gov/oil-and-gas/databaseinfo/Pages/OGD.aspx'),
	(6,'PAPermitScraper','sheet','0'),
	(6,'PAPermitScraper','header_row','0'),
	(9,'WVPermitScraper','target_url','http://apps.dep.wv.gov/oog/permitsearch_new.cfm'),
	(6,'PAPermitScraper','about_url','http://www.portal.state.pa.us/portal/server.pt/community/oil_and_gas_reports/20297'),
	(7,'PASpudScraper','sheet','0'),
	(7,'PASpudScraper','header_row','0'),
	(7,'PASpudScraper','about_url','http://www.portal.state.pa.us/portal/server.pt/community/oil_and_gas_reports/20297'),
	(7,'PASpudScraper','target_url','http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FSpud_External_Data&P_SPUD_START_DATE=03%2F01%2F2012%2000%3A00%3A00&P_SPUD_END_DATE=12%2F31%2F2012%2000%3A00%3A00&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_REGION%3Aisnull=True&P_OPERATOR%3Aisnull=True&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x0'),
	(10,'PAViolationScraper','target_url','http://www.depreportingservices.state.pa.us/ReportServer?%2FOil_Gas%2FOG_Compliance&P_COUNTY%3Aisnull=True&P_MUNICIPALITY%3Aisnull=True&P_SEARCH_NAME%3Aisnull=True&P_INSPECTIONS=Y&P_RESOLVED_VIOLATIONS=N&rs%3AParameterLanguage=&rs%3ACommand=Render&rs%3AFormat=ATOM&rc%3ADataFeed=xAx0x4'),
	(10,'PAViolationScraper','about_url','http://www.depweb.state.pa.us/portal/server.pt/community/oil_and_gas_compliance_report/20299'),
	(10,'PAViolationScraper','date_offset','14'),
	(0,'ColoradoFeedGenerato','last_seqid','2012-07-16'),
	(0,'FracFocusFeedGenerat','last_seqid','2012-07-16'),
	(34,'FracFocusScraper','state','34'),
	(35,'FracFocusScraper','state','35'),
	(47,'FracFocusScraper','state','47'),
	(37,'FracFocusScraper','state','37'),
	(49,'FracFocusScraper','state','49'),
	(45,'FracFocusScraper','state','45'),
	(43,'FracFocusScraper','state','43'),
	(41,'FracFocusScraper','state','41'),
	(48,'FracFocusScraper','state','48'),
	(46,'FracFocusScraper','state','46'),
	(44,'FracFocusScraper','state','44'),
	(40,'FracFocusScraper','state','40'),
	(39,'FracFocusScraper','state','39'),
	(38,'FracFocusScraper','state','38'),
	(36,'FracFocusScraper','state','36'),
	(33,'FracFocusScraper','state','33'),
	(32,'FracFocusScraper','state','32'),
	(31,'FracFocusScraper','state','31'),
	(30,'FracFocusScraper','state','30'),
	(29,'FracFocusScraper','state','29'),
	(28,'FracFocusScraper','state','28'),
	(27,'FracFocusScraper','state','27'),
	(26,'FracFocusScraper','state','26'),
	(25,'FracFocusScraper','state','25'),
	(24,'FracFocusScraper','state','24'),
	(23,'FracFocusScraper','state','23'),
	(22,'FracFocusScraper','state','22'),
	(21,'FracFocusScraper','state','21'),
	(20,'FracFocusScraper','state','20'),
	(19,'FracFocusScraper','state','19'),
	(18,'FracFocusScraper','state','18'),
	(17,'FracFocusScraper','state','17'),
	(16,'FracFocusScraper','state','16'),
	(15,'FracFocusScraper','state','15'),
	(14,'FracFocusScraper','state','14'),
	(13,'FracFocusScraper','state','13'),
	(12,'FracFocusScraper','state','12'),
	(11,'FracFocusScraper','state','11'),
	(10,'FracFocusScraper','state','10'),
	(9,'FracFocusScraper','state','9'),
	(8,'FracFocusScraper','state','8'),
	(7,'FracFocusScraper','state','7'),
	(6,'FracFocusScraper','state','6'),
	(5,'FracFocusScraper','state','5'),
	(4,'FracFocusScraper','state','4'),
	(3,'FracFocusScraper','state','3'),
	(2,'FracFocusScraper','state','2'),
	(1,'FracFocusScraper','state','1'),
	(42,'FracFocusScraper','state','42'),
	(50,'FracFocusScraper','state','50');

/*!40000 ALTER TABLE `BotTaskParams` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
