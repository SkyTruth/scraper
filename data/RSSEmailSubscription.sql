# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: ewn2.skytruth.org (MySQL 5.1.41-3ubuntu12.10)
# Database: NRC_Data
# Generation Time: 2013-01-03 11:44:40 -0500
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table RSSEmailSubscription
# ------------------------------------------------------------

LOCK TABLES `RSSEmailSubscription` WRITE;
/*!40000 ALTER TABLE `RSSEmailSubscription` DISABLE KEYS */;
INSERT INTO `RSSEmailSubscription` (`id`,`confirmed`,`email`,`rss_url`,`interval_hours`,`last_email_sent`,`last_item_updated`,`lat1`,`lat2`,`lng1`,`lng2`,`last_update_sent`,`active`,`name`)
VALUES


	('abd7dc0a-fe28-af16-9a47-bcc90597c9f1',1,'paul@oldwillow.com','http://alerts.skytruth.org/rss?l=28.924:-88.992:28.952:-88.96&channel=stae',1,'2013-01-03 08:13:02','2013-01-03 07:41:15',28.924,28.952,-88.992,-88.96,NULL,1,NULL);

/*!40000 ALTER TABLE `RSSEmailSubscription` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
