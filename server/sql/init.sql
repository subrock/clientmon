-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ClientMon
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Current Database: `ClientMon`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ClientMon` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ClientMon`;


DROP TABLE IF EXISTS `UserTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserTable` (
  `user_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)                                                                                                                                                                                        
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_table`
--

DROP TABLE IF EXISTS `category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_table`
--

LOCK TABLES `category_table` WRITE;
/*!40000 ALTER TABLE `category_table` DISABLE KEYS */;
INSERT INTO `category_table` VALUES (5,'SoapAPI'),(8,'Front End');
/*!40000 ALTER TABLE `category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table`
--

LOCK TABLES `customer_table` WRITE;
/*!40000 ALTER TABLE `customer_table` DISABLE KEYS */;
INSERT INTO `customer_table` VALUES (10,'Databases'),(5,'Administrative'),(12,'Web Servers');
/*!40000 ALTER TABLE `customer_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_table`
--

DROP TABLE IF EXISTS `group_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(254) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_table`
--

LOCK TABLES `group_table` WRITE;
/*!40000 ALTER TABLE `group_table` DISABLE KEYS */;
INSERT INTO `group_table` VALUES (13,'Databases',10),(15,'Deploy',5),(11,'URLs',12),(12,'Servers',12);
/*!40000 ALTER TABLE `group_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_mapping`
--

DROP TABLE IF EXISTS `server_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_mapping` (
  `group_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_mapping`
--

LOCK TABLES `server_mapping` WRITE;
/*!40000 ALTER TABLE `server_mapping` DISABLE KEYS */;
INSERT INTO `server_mapping` VALUES (13,18),(11,3),(15,19),(11,17),(12,16),(12,15);
/*!40000 ALTER TABLE `server_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_table`
--

DROP TABLE IF EXISTS `server_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(254) DEFAULT NULL,
  `server_host` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_table`
--

LOCK TABLES `server_table` WRITE;
/*!40000 ALTER TABLE `server_table` DISABLE KEYS */;
INSERT INTO `server_table` VALUES (3,'subrock','subrock.org'),(19,'deploy_server','deploy_server'),(13,'www.lendmyvoice.com','www.lendmyvoice.com'),(18,'database_server','database_server'),(15,'localhost','localhost'),(16,'karls-ubuntoo','karls-ubuntoo'),(17,'www.subrock.org','www.subrock.org');
/*!40000 ALTER TABLE `server_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_mapping`
--

DROP TABLE IF EXISTS `type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_mapping` (
  `server_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_mapping`
--

LOCK TABLES `type_mapping` WRITE;
/*!40000 ALTER TABLE `type_mapping` DISABLE KEYS */;
INSERT INTO `type_mapping` VALUES (19,1),(15,8),(19,8),(18,8),(18,11),(3,1),(16,1),(16,8),(17,1),(15,1);
/*!40000 ALTER TABLE `type_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_table`
--

DROP TABLE IF EXISTS `type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(254) DEFAULT NULL,
  `type_port` int(11) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_table`
--

LOCK TABLES `type_table` WRITE;
/*!40000 ALTER TABLE `type_table` DISABLE KEYS */;
INSERT INTO `type_table` VALUES (1,'Apache HTTPD',80),(2,'Apache SSL',443),(8,'SSH',22),(11,'MySQL',3306);
/*!40000 ALTER TABLE `type_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_table`
--

DROP TABLE IF EXISTS `url_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(254) DEFAULT NULL,
  `url_uri` varchar(254) DEFAULT NULL,
  `category_id` varchar(254) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_table`
--

LOCK TABLES `url_table` WRITE;
/*!40000 ALTER TABLE `url_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-29  0:58:26
