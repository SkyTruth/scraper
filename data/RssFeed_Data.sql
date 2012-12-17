# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.1.39-log)
# Database: NRC_Data
# Generation Time: 2012-12-12 17:27:32 -0500
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table RssFeed
# ------------------------------------------------------------

LOCK TABLES `RssFeed` WRITE;
/*!40000 ALTER TABLE `RssFeed` DISABLE KEYS */;
INSERT INTO `RssFeed` (`id`,`url`,`last_read`,`update_interval_secs`,`tag`,`name`,`source_id`)
VALUES
	(1,'http://skytruth-alerts.blogspot.com/feeds/posts/default','2011-10-25 21:52:14',20,'skytruth','Skytruth Alert',2),
	(2,'http://www.incidentnews.gov/incidents.atom','2011-10-25 21:52:16',20,'NOAA','NOAA',3);

/*!40000 ALTER TABLE `RssFeed` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
