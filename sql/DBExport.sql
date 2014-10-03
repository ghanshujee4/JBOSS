-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: closerby
-- ------------------------------------------------------
-- Server version	5.5.11

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
-- Current Database: `closerby`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `closerby` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `closerby`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `address_1` varchar(256) NOT NULL,
  `address_2` varchar(256) DEFAULT NULL,
  `address_3` varchar(256) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '99',
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `postalcode` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_address_country_id` (`country_id`),
  KEY `FK_address_state_id` (`state_id`),
  KEY `FK_address_city_id` (`city_id`),
  CONSTRAINT `FK_address_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Sreeharsha',NULL,'Shivalingaiah','#199, 2nd Cross, 4th Main','Girinagar BDA Extension',NULL,99,17,441,'560085','9886097989',1,1,1,'2014-04-09 00:09:30','2014-04-09 00:09:30',1,'sreeharshas@gmail.com'),(2,'Parinitha',NULL,'Sreeharsha','#1473, 17th Main','Muneshwara Block',NULL,99,17,441,'560050','9886181512',1,1,1,'2014-04-09 00:13:40','2014-04-09 00:13:40',1,'sree_harsha_s@yahoo.co.in'),(3,'Nikitha',NULL,'Sreeharsha','#1417, 13thA Main','Muneshwara Block',NULL,99,17,441,'560050','9880565327',1,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1,'sree_harsha_s@yahoo.co.in'),(9,'Pankaj',NULL,'Mishra','Shop No. 9, Opposite BSNL Telephone Exchange','4th Block 1st A Cross Rd, Koramangala 1A Block, Koramangala',NULL,99,17,441,'560080','9881234567',1,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1,'admin.ad@tresfocus.com'),(10,'Admin','','Admin','Admin','Admin',NULL,99,17,441,'560001','9886097989',1,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1,'neerajamn@gmail.com'),(11,'More',NULL,'Ltd','#10, 2nd Cross, ','Girinagar',NULL,99,17,441,'560085','22200066',1,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1,'more@gmail.com'),(12,'Nilgiris',NULL,'Pvt Ltd','#50, 2nd Cross','Girinagar',NULL,99,17,441,'560085','22200077',1,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1,'nilgiris@gmail.com'),(13,'Niki Enterprises',NULL,'Niki Enterprises','199, 2nd Cross, 4th Main, Giringar BDA extension',NULL,NULL,99,17,441,'560085','9886097989',1,1,1,'2014-07-15 09:13:14','2014-07-15 09:13:14',0,'sreeharshas@gmail.com'),(14,'Niki Enterprises',NULL,'Niki Enterprises','199, 2nd Cross, 4th Main, Giringar BDA extension',NULL,NULL,99,17,441,'560085','9886097989',1,1,1,'2014-07-15 09:14:42','2014-07-15 09:14:42',0,'sreeharshas@gmail.com'),(18,'Niki Enterprises',NULL,'Niki Enterprises','199, 2nd Cross, 4th Main, Giringar BDA extension',NULL,NULL,99,17,441,'560085','9886097989',1,1,1,'2014-07-15 16:53:23','2014-07-15 16:53:23',0,'sreeharshas@gmail.com'),(39,'Parinitha Retail Stores',NULL,'Parinitha Retail Stores','#199',NULL,NULL,99,17,441,'560080','9886097989',1,1,1,'2014-07-15 18:49:31','2014-07-15 18:49:31',0,'sreeharshas@rediffmail.com'),(43,'Giri Retailer Svc',NULL,'Giri Retailer Svc','199',NULL,NULL,99,17,441,'560085','99999999',1,1,1,'2014-07-15 19:29:17','2014-07-15 19:29:17',0,'sree@gmail.com'),(46,'Star Bazaar',NULL,'Star Bazaar','23, 2nd Main',NULL,NULL,99,17,441,'560091','9886097989',1,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0,'sreeharshas@gmail.com'),(47,'Pankaj Enterprises',NULL,'Pankaj Enterprises','199, 4th Main',NULL,NULL,99,17,441,'560001','9999',1,1,1,'2014-07-15 23:18:18','2014-07-15 23:18:18',0,'sreeharshas@gmail.com'),(50,'asas',NULL,'asas','asdas',NULL,NULL,99,17,441,'32423','12312',1,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0,'s@s.com');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branded_product`
--

DROP TABLE IF EXISTS `branded_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branded_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_brand_product_brand_id` (`brand_id`),
  KEY `FK_brand_product_product_id` (`product_id`),
  CONSTRAINT `FK_brand_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_brand_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branded_product`
--

LOCK TABLES `branded_product` WRITE;
/*!40000 ALTER TABLE `branded_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `branded_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (4,'AATA',NULL,14,14,'2014-08-31 17:07:35','2014-08-31 17:07:35',4);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `object_version_number` int(11) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `category_type_id` int(11) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_category_name` (`name`),
  KEY `FK_category_categorytype_id` (`category_type_id`),
  KEY `FK_parent_category_id` (`parent_category_id`),
  CONSTRAINT `FK_category_categorytype_id` FOREIGN KEY (`category_type_id`) REFERENCES `category_type` (`id`),
  CONSTRAINT `FK_parent_category_id` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (53,'FOOD','2014-04-07 22:22:11','2014-04-07 22:22:11',1,1,1,NULL,1,NULL),(54,'FRUITS AND VEGETABLES','2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,1,NULL,1,NULL),(55,'ITC','2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,1,NULL,1,NULL),(56,'STAPLES','2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,1,NULL,1,NULL),(57,'BHAGYALAKSHMI','2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,1,NULL,1,NULL),(58,'BUSCITS','2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,1,NULL,1,NULL),(59,'COVERS','2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,1,NULL,1,NULL),(60,'CATCH MASALA','2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,1,NULL,1,NULL),(61,'KINDER JOY','2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,1,NULL,1,NULL),(62,'OILS','2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,1,NULL,1,NULL),(63,'TOILETERS','2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,1,NULL,1,NULL),(64,'KIMIS NOODLES','2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,1,NULL,1,NULL),(65,'KWALITY','2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,1,NULL,1,NULL),(66,'MODERN BREAD 400 G','2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,1,NULL,1,NULL),(67,'MTR','2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,1,NULL,1,NULL),(68,'SUGUNA','2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,1,NULL,1,NULL),(69,'SUPER MAX','2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,1,NULL,1,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_type`
--

DROP TABLE IF EXISTS `category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_type` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `image` varchar(128) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_updated_by` int(11) NOT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type`
--

LOCK TABLES `category_type` WRITE;
/*!40000 ALTER TABLE `category_type` DISABLE KEYS */;
INSERT INTO `category_type` VALUES (1,'GROCERY','/images/customer/','2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,1),(2,'PHARMA','/images/customer/','2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,1),(3,'GIFTS','/images/customer/','2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,1),(4,'TOYS','/images/customer/','2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,1);
/*!40000 ALTER TABLE `category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_state_id` (`state_id`),
  CONSTRAINT `city_state_id` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Adilabad'),(2,1,'Adoni'),(3,1,'Amadalavalasa'),(4,1,'Amalapuram'),(5,1,'Anakapalle'),(6,1,'Anantapur'),(7,1,'Badepalle'),(8,1,'Banganapalle'),(9,1,'Bapatla'),(10,1,'Bellampalle'),(11,1,'Bethamcherla'),(12,1,'Bhadrachalam'),(13,1,'Bhainsa'),(14,1,'Bheemunipatnam'),(15,1,'Bhimavaram'),(16,1,'Bhongir'),(17,1,'Bobbili'),(18,1,'Bodhan'),(19,1,'Chilakaluripet'),(20,1,'Chirala'),(21,1,'Chittoor'),(22,1,'Cuddapah'),(23,1,'Devarakonda'),(24,1,'Dharmavaram'),(25,1,'Eluru'),(26,1,'Farooqnagar'),(27,1,'Gadwal'),(28,1,'Gooty'),(29,1,'Gudivada'),(30,1,'Gudur'),(31,1,'Guntakal'),(32,1,'Guntur'),(33,1,'Hanuman Junction'),(34,1,'Hindupur'),(35,1,'Hyderabad'),(36,1,'Ichchapuram'),(37,1,'Jaggaiahpet'),(38,1,'Jagtial'),(39,1,'Jammalamadugu'),(40,1,'Jangaon'),(41,1,'Kadapa'),(42,1,'Kadiri'),(43,1,'Kagaznagar'),(44,1,'Kakinada'),(45,1,'Kalyandurg'),(46,1,'Kamareddy'),(47,1,'Kandukur'),(48,1,'Karimnagar'),(49,1,'Kavali'),(50,1,'Khammam'),(51,1,'Koratla'),(52,1,'Kothagudem'),(53,1,'Kothapeta'),(54,1,'Kovvur'),(55,1,'Kurnool'),(56,1,'Kyathampalle'),(57,1,'Macherla'),(58,1,'Machilipatnam'),(59,1,'Madanapalle'),(60,1,'Mahbubnagar'),(61,1,'Mancherial'),(62,1,'Mandamarri'),(63,1,'Mandapeta'),(64,1,'Manuguru'),(65,1,'Markapur'),(66,1,'Medak'),(67,1,'Miryalaguda'),(68,1,'Mogalthur'),(69,1,'Nagari'),(70,1,'Nagarkurnool'),(71,1,'Nandyal'),(72,1,'Narasapur'),(73,1,'Narasaraopet'),(74,1,'Narayanpet'),(75,1,'Narsipatnam'),(76,1,'Nellore'),(77,1,'Nidadavole'),(78,1,'Nirmal'),(79,1,'Nizamabad'),(80,1,'Nuzvid'),(81,1,'Ongole'),(82,1,'Palacole'),(83,1,'Palasa Kasibugga'),(84,1,'Palwancha'),(85,1,'Parvathipuram'),(86,1,'Pedana'),(87,1,'Peddapuram'),(88,1,'Pithapuram'),(89,1,'Pondur'),(90,1,'Ponnur'),(91,1,'Proddatur'),(92,1,'Punganur'),(93,1,'Puttur'),(94,1,'Rajahmundry'),(95,1,'Rajam'),(96,1,'Ramachandrapuram'),(97,1,'Ramagundam'),(98,1,'Rayachoti'),(99,1,'Rayadurg'),(100,1,'Renigunta'),(101,1,'Repalle'),(102,1,'Sadasivpet'),(103,1,'Salur'),(104,1,'Samalkot'),(105,1,'Sangareddy'),(106,1,'Sattenapalle'),(107,1,'Siddipet'),(108,1,'Singapur'),(109,1,'Sircilla'),(110,1,'Srikakulam'),(111,1,'Srikalahasti'),(112,1,'Suryapet'),(113,1,'Tadepalligudem'),(114,1,'Tadpatri'),(115,1,'Tandur'),(116,1,'Tanuku'),(117,1,'Tenali'),(118,1,'Tirupati'),(119,1,'Tuni'),(120,1,'Uravakonda'),(121,1,'Venkatagiri'),(122,1,'Vicarabad'),(123,1,'Vijayawada'),(124,1,'Vinukonda'),(125,1,'Visakhapatnam'),(126,1,'Vizianagaram'),(127,1,'Wanaparthy'),(128,1,'Warangal'),(129,1,'Yellandu'),(130,1,'Yemmiganur'),(131,1,'Yerraguntla'),(132,1,'Zahirabad'),(133,4,'Abhayapuri'),(134,4,'Amguri'),(135,4,'Anandnagaar'),(136,4,'Barpeta'),(137,4,'Barpeta Road'),(138,4,'Bilasipara'),(139,4,'Bongaigaon'),(140,4,'Dhekiajuli'),(141,4,'Dhubri'),(142,4,'Dibrugarh'),(143,4,'Digboi'),(144,4,'Diphu'),(145,4,'Dispur'),(146,4,'Gauripur'),(147,4,'Goalpara'),(148,4,'Golaghat'),(149,4,'Guwahati'),(150,4,'Haflong'),(151,4,'Hailakandi'),(152,4,'Hojai'),(153,4,'Jorhat'),(154,4,'Karimganj'),(155,4,'Kokrajhar'),(156,4,'Lanka'),(157,4,'Lumding'),(158,4,'Mangaldoi'),(159,4,'Mankachar'),(160,4,'Margherita'),(161,4,'Mariani'),(162,4,'Marigaon'),(163,4,'Nagaon'),(164,4,'Nalbari'),(165,4,'North Lakhimpur'),(166,4,'Rangia'),(167,4,'Sibsagar'),(168,4,'Silapathar'),(169,4,'Silchar'),(170,4,'Tezpur'),(171,4,'Tinsukia'),(172,2,'Along'),(173,2,'Bomdila'),(174,2,'Itanagar'),(175,2,'Naharlagun'),(176,2,'Pasighat'),(177,12,'Ahmedabad'),(178,12,'Amreli'),(179,12,'Anand'),(180,12,'Ankleshwar'),(181,12,'Bharuch'),(182,12,'Bhavnagar'),(183,12,'Bhuj'),(184,12,'Cambay'),(185,12,'Dahod'),(186,12,'Deesa'),(187,12,'Dholka'),(188,12,'Gandhinagar'),(189,12,'Godhra'),(190,12,'Himatnagar'),(191,12,'Idar'),(192,12,'Jamnagar'),(193,12,'Junagadh'),(194,12,'Kadi'),(195,12,'Kalavad'),(196,12,'Kalol'),(197,12,'Kapadvanj'),(198,12,'Karjan'),(199,12,'Keshod'),(200,12,'Khambhalia'),(201,12,'Khambhat'),(202,12,'Kheda'),(203,12,'Khedbrahma'),(204,12,'Kheralu'),(205,12,'Kodinar'),(206,12,'Lathi'),(207,12,'Limbdi'),(208,12,'Lunawada'),(209,12,'Mahesana'),(210,12,'Mahuva'),(211,12,'Manavadar'),(212,12,'Mandvi'),(213,12,'Mangrol'),(214,12,'Mansa'),(215,12,'Mehmedabad'),(216,12,'Modasa'),(217,12,'Morvi'),(218,12,'Nadiad'),(219,12,'Navsari'),(220,12,'Padra'),(221,12,'Palanpur'),(222,12,'Palitana'),(223,12,'Pardi'),(224,12,'Patan'),(225,12,'Petlad'),(226,12,'Porbandar'),(227,12,'Radhanpur'),(228,12,'Rajkot'),(229,12,'Rajpipla'),(230,12,'Rajula'),(231,12,'Ranavav'),(232,12,'Rapar'),(233,12,'Salaya'),(234,12,'Sanand'),(235,12,'Savarkundla'),(236,12,'Sidhpur'),(237,12,'Sihor'),(238,12,'Songadh'),(239,12,'Surat'),(240,12,'Talaja'),(241,12,'Thangadh'),(242,12,'Tharad'),(243,12,'Umbergaon'),(244,12,'Umreth'),(245,12,'Una'),(246,12,'Unjha'),(247,12,'Upleta'),(248,12,'Vadnagar'),(249,12,'Vadodara'),(250,12,'Valsad'),(251,12,'Vapi'),(252,12,'Vapi'),(253,12,'Veraval'),(254,12,'Vijapur'),(255,12,'Viramgam'),(256,12,'Visnagar'),(257,12,'Vyara'),(258,12,'Wadhwan'),(259,12,'Wankaner'),(260,5,'Amarpur'),(261,5,'Araria'),(262,5,'Areraj'),(263,5,'Arrah'),(264,5,'Asarganj'),(265,5,'Aurangabad'),(266,5,'Bagaha'),(267,5,'Bahadurganj'),(268,5,'Bairgania'),(269,5,'Bakhtiarpur'),(270,5,'Banka'),(271,5,'Banmankhi Bazar'),(272,5,'Barahiya'),(273,5,'Barauli'),(274,5,'Barbigha'),(275,5,'Barh'),(276,5,'Begusarai'),(277,5,'Behea'),(278,5,'Bettiah'),(279,5,'Bhabua'),(280,5,'Bhagalpur'),(281,5,'Bihar Sharif'),(282,5,'Bikramganj'),(283,5,'Bodh Gaya'),(284,5,'Buxar'),(285,5,'Chandan Bara'),(286,5,'Chanpatia'),(287,5,'Chhapra'),(288,5,'Colgong'),(289,5,'Dalsinghsarai'),(290,5,'Darbhanga'),(291,5,'Daudnagar'),(292,5,'Dehri-on-Sone'),(293,5,'Dhaka'),(294,5,'Dighwara'),(295,5,'Dumraon'),(296,5,'Fatwah'),(297,5,'Forbesganj'),(298,5,'Gaya'),(299,5,'Gogri Jamalpur'),(300,5,'Gopalganj'),(301,5,'Hajipur'),(302,5,'Hilsa'),(303,5,'Hisua'),(304,5,'Islampur'),(305,5,'Jagdispur'),(306,5,'Jamalpur'),(307,5,'Jamui'),(308,5,'Jehanabad'),(309,5,'Jhajha'),(310,5,'Jhanjharpur'),(311,5,'Jogabani'),(312,5,'Kanti'),(313,5,'Katihar'),(314,5,'Khagaria'),(315,5,'Kharagpur'),(316,5,'Kishanganj'),(317,5,'Lakhisarai'),(318,5,'Lalganj'),(319,5,'Madhepura'),(320,5,'Madhubani'),(321,5,'Maharajganj'),(322,5,'Mahnar Bazar'),(323,5,'Makhdumpur'),(324,5,'Maner'),(325,5,'Manihari'),(326,5,'Marhaura'),(327,5,'Masaurhi'),(328,5,'Mirganj'),(329,5,'Mokameh'),(330,5,'Motihari'),(331,5,'Motipur'),(332,5,'Munger'),(333,5,'Murliganj'),(334,5,'Muzaffarpur'),(335,5,'Narkatiaganj'),(336,5,'Naugachhia'),(337,5,'Nawada'),(338,5,'Nokha'),(339,5,'Patna'),(340,5,'Piro'),(341,5,'Purnia'),(342,5,'Rafiganj'),(343,5,'Rajgir'),(344,5,'Ramnagar'),(345,5,'Raxaul Bazar'),(346,5,'Revelganj'),(347,5,'Rosera'),(348,5,'Saharsa'),(349,5,'Samastipur'),(350,5,'Sasaram'),(351,5,'Sheikhpura'),(352,5,'Sheohar'),(353,5,'Sherghati'),(354,5,'Silao'),(355,5,'Sitamarhi'),(356,5,'Siwan'),(357,5,'Sonepur'),(358,5,'Sugauli'),(359,5,'Sultanganj'),(360,5,'Supaul'),(361,5,'Warisaliganj'),(362,13,'Ambala'),(363,13,'Ambala'),(364,13,'Asankhurd'),(365,13,'Assandh'),(366,13,'Ateli'),(367,13,'Babiyal'),(368,13,'Bahadurgarh'),(369,13,'Barwala'),(370,13,'Bhiwani'),(371,13,'Charkhi Dadri'),(372,13,'Cheeka'),(373,13,'Ellenabad 2'),(374,13,'Faridabad'),(375,13,'Fatehabad'),(376,13,'Ganaur'),(377,13,'Gharaunda'),(378,13,'Gohana'),(379,13,'Gurgaon'),(380,13,'Haibat(Yamuna Nagar)'),(381,13,'Hansi'),(382,13,'Hisar'),(383,13,'Hodal'),(384,13,'Jhajjar'),(385,13,'Jind'),(386,13,'Kaithal'),(387,13,'Kalan Wali'),(388,13,'Kalka'),(389,13,'Karnal'),(390,13,'Ladwa'),(391,13,'Mahendragarh'),(392,13,'Mandi Dabwali'),(393,13,'Narnaul'),(394,13,'Narwana'),(395,13,'Palwal'),(396,13,'Panchkula'),(397,13,'Panipat'),(398,13,'Pehowa'),(399,13,'Pinjore'),(400,13,'Rania'),(401,13,'Ratia'),(402,13,'Rewari'),(403,13,'Rohtak'),(404,13,'Safidon'),(405,13,'Samalkha'),(406,13,'Shahbad'),(407,13,'Sirsa'),(408,13,'Sohna'),(409,13,'Sonipat'),(410,13,'Taraori'),(411,13,'Thanesar'),(412,13,'Tohana'),(413,13,'Yamunanagar'),(414,14,'Arki'),(415,14,'Baddi'),(416,14,'Bilaspur'),(417,14,'Chamba'),(418,14,'Dalhousie'),(419,14,'Dharamsala'),(420,14,'Hamirpur'),(421,14,'Mandi'),(422,14,'Nahan'),(423,14,'Shimla'),(424,14,'Solan'),(425,14,'Sundarnagar'),(426,15,'Achabbal'),(427,15,'Akhnoor'),(428,15,'Anantnag'),(429,15,'Arnia'),(430,15,'Awantipora'),(431,15,'Bandipore'),(432,15,'Baramula'),(433,15,'Kathua'),(434,15,'Leh'),(435,15,'Punch'),(436,15,'Rajauri'),(437,15,'Sopore'),(438,15,'Srinagar'),(439,15,'Udhampur'),(440,17,'Arasikere'),(441,17,'Bangalore'),(442,17,'Belgaum'),(443,17,'Bellary'),(444,17,'Chamrajnagar'),(445,17,'Chikkaballapur'),(446,17,'Chintamani'),(447,17,'Chitradurga'),(448,17,'Gulbarga'),(449,17,'Gundlupet'),(450,17,'Hassan'),(451,17,'Hospet'),(452,17,'Hubli'),(453,17,'Karkala'),(454,17,'Karwar'),(455,17,'Kolar'),(456,17,'Kota'),(457,17,'Lakshmeshwar'),(458,17,'Lingsugur'),(459,17,'Maddur'),(460,17,'Madhugiri'),(461,17,'Madikeri'),(462,17,'Magadi'),(463,17,'Mahalingpur'),(464,17,'Malavalli'),(465,17,'Malur'),(466,17,'Mandya'),(467,17,'Mangalore'),(468,17,'Manvi'),(469,17,'Mudalgi'),(470,17,'Mudbidri'),(471,17,'Muddebihal'),(472,17,'Mudhol'),(473,17,'Mulbagal'),(474,17,'Mundargi'),(475,17,'Mysore'),(476,17,'Nanjangud'),(477,17,'Pavagada'),(478,17,'Puttur'),(479,17,'Rabkavi Banhatti'),(480,17,'Raichur'),(481,17,'Ramanagaram'),(482,17,'Ramdurg'),(483,17,'Ranibennur'),(484,17,'Robertson Pet'),(485,17,'Ron'),(486,17,'Sadalgi'),(487,17,'Sagar'),(488,17,'Sakleshpur'),(489,17,'Sandur'),(490,17,'Sankeshwar'),(491,17,'Saundatti-Yellamma'),(492,17,'Savanur'),(493,17,'Sedam'),(494,17,'Shahabad'),(495,17,'Shahpur'),(496,17,'Shiggaon'),(497,17,'Shikapur'),(498,17,'Shimoga'),(499,17,'Shorapur'),(500,17,'Shrirangapattana'),(501,17,'Sidlaghatta'),(502,17,'Sindgi'),(503,17,'Sindhnur'),(504,17,'Sira'),(505,17,'Sirsi'),(506,17,'Siruguppa'),(507,17,'Srinivaspur'),(508,17,'Talikota'),(509,17,'Tarikere'),(510,17,'Tekkalakota'),(511,17,'Terdal'),(512,17,'Tiptur'),(513,17,'Tumkur'),(514,17,'Udupi'),(515,17,'Vijayapura'),(516,17,'Wadi'),(517,17,'Yadgir'),(518,17,'Chikmagalur'),(519,17,'Davanagere'),(520,17,'Dharwad'),(521,17,'Gadag'),(522,18,'Adoor'),(523,18,'Akathiyoor'),(524,18,'Alappuzha'),(525,18,'Ancharakandy'),(526,18,'Aroor'),(527,18,'Ashtamichira'),(528,18,'Attingal'),(529,18,'Avinissery'),(530,18,'Chalakudy'),(531,18,'Changanassery'),(532,18,'Chendamangalam'),(533,18,'Chengannur'),(534,18,'Cherthala'),(535,18,'Cheruthazham'),(536,18,'Chittur-Thathamangalam'),(537,18,'Chockli'),(538,18,'Erattupetta'),(539,18,'Guruvayoor'),(540,18,'Irinjalakuda'),(541,18,'Kadirur'),(542,18,'Kalliasseri'),(543,18,'Kalpetta'),(544,18,'Kanhangad'),(545,18,'Kanjikkuzhi'),(546,18,'Kannur'),(547,18,'Kasaragod'),(548,18,'Kayamkulam'),(549,18,'Kochi'),(550,18,'Kodungallur'),(551,18,'Kollam'),(552,18,'Koothuparamba'),(553,18,'Kothamangalam'),(554,18,'Kottayam'),(555,18,'Kozhikode'),(556,18,'Kunnamkulam'),(557,18,'Malappuram'),(558,18,'Mattannur'),(559,18,'Mavelikkara'),(560,18,'Mavoor'),(561,18,'Muvattupuzha'),(562,18,'Nedumangad'),(563,18,'Neyyattinkara'),(564,18,'Ottappalam'),(565,18,'Palai'),(566,18,'Palakkad'),(567,18,'Panniyannur'),(568,18,'Pappinisseri'),(569,18,'Paravoor'),(570,18,'Pathanamthitta'),(571,18,'Payyannur'),(572,18,'Peringathur'),(573,18,'Perinthalmanna'),(574,18,'Perumbavoor'),(575,18,'Ponnani'),(576,18,'Punalur'),(577,18,'Quilandy'),(578,18,'Shoranur'),(579,18,'Taliparamba'),(580,18,'Thiruvalla'),(581,18,'Thiruvananthapuram'),(582,18,'Thodupuzha'),(583,18,'Thrissur'),(584,18,'Tirur'),(585,18,'Vadakara'),(586,18,'Vaikom'),(587,18,'Varkala'),(588,20,'Ashok Nagar'),(589,20,'Balaghat'),(590,20,'Betul'),(591,20,'Bhopal'),(592,20,'Burhanpur'),(593,20,'Chhatarpur'),(594,20,'Dabra'),(595,20,'Datia'),(596,20,'Dewas'),(597,20,'Dhar'),(598,20,'Fatehabad'),(599,20,'Gwalior'),(600,20,'Indore'),(601,20,'Itarsi'),(602,20,'Jabalpur'),(603,20,'Katni'),(604,20,'Kotma'),(605,20,'Lahar'),(606,20,'Lundi'),(607,20,'Maharajpur'),(608,20,'Mahidpur'),(609,20,'Maihar'),(610,20,'Malajkhand'),(611,20,'Manasa'),(612,20,'Manawar'),(613,20,'Mandideep'),(614,20,'Mandla'),(615,20,'Mandsaur'),(616,20,'Mauganj'),(617,20,'Mhow Cantonment'),(618,20,'Mhowgaon'),(619,20,'Morena'),(620,20,'Multai'),(621,20,'Murwara'),(622,20,'Nagda'),(623,20,'Nainpur'),(624,20,'Narsinghgarh'),(625,20,'Narsinghgarh'),(626,20,'Neemuch'),(627,20,'Nepanagar'),(628,20,'Niwari'),(629,20,'Nowgong'),(630,20,'Nowrozabad'),(631,20,'Pachore'),(632,20,'Pali'),(633,20,'Panagar'),(634,20,'Pandhurna'),(635,20,'Panna'),(636,20,'Pasan'),(637,20,'Pipariya'),(638,20,'Pithampur'),(639,20,'Porsa'),(640,20,'Prithvipur'),(641,20,'Raghogarh-Vijaypur'),(642,20,'Rahatgarh'),(643,20,'Raisen'),(644,20,'Rajgarh'),(645,20,'Ratlam'),(646,20,'Rau'),(647,20,'Rehli'),(648,20,'Rewa'),(649,20,'Sabalgarh'),(650,20,'Sagar'),(651,20,'Sanawad'),(652,20,'Sarangpur'),(653,20,'Sarni'),(654,20,'Satna'),(655,20,'Sausar'),(656,20,'Sehore'),(657,20,'Sendhwa'),(658,20,'Seoni'),(659,20,'Seoni-Malwa'),(660,20,'Shahdol'),(661,20,'Shajapur'),(662,20,'Shamgarh'),(663,20,'Sheopur'),(664,20,'Shivpuri'),(665,20,'Shujalpur'),(666,20,'Sidhi'),(667,20,'Sihora'),(668,20,'Singrauli'),(669,20,'Sironj'),(670,20,'Sohagpur'),(671,20,'Tarana'),(672,20,'Tikamgarh'),(673,20,'Ujhani'),(674,20,'Ujjain'),(675,20,'Umaria'),(676,20,'Vidisha'),(677,20,'Wara Seoni'),(678,21,'Kolhapur'),(679,21,'Ahmednagar'),(680,21,'Akola'),(681,21,'Amravati'),(682,21,'Aurangabad'),(683,21,'Baramati'),(684,21,'Chalisgaon'),(685,21,'Chinchani'),(686,21,'Devgarh'),(687,21,'Dhule'),(688,21,'Dombivli'),(689,21,'Durgapur'),(690,21,'Ichalkaranji'),(691,21,'Jalna'),(692,21,'Kalyan'),(693,21,'Latur'),(694,21,'Loha'),(695,21,'Lonar'),(696,21,'Lonavla'),(697,21,'Mahad'),(698,21,'Mahuli'),(699,21,'Malegaon'),(700,21,'Malkapur'),(701,21,'Manchar'),(702,21,'Mangalvedhe'),(703,21,'Mangrulpir'),(704,21,'Manjlegaon'),(705,21,'Manmad'),(706,21,'Manwath'),(707,21,'Mehkar'),(708,21,'Mhaswad'),(709,21,'Miraj'),(710,21,'Morshi'),(711,21,'Mukhed'),(712,21,'Mul'),(713,21,'Mumbai'),(714,21,'Murtijapur'),(715,21,'Nagpur'),(716,21,'Nalasopara'),(717,21,'Nanded-Waghala'),(718,21,'Nandgaon'),(719,21,'Nandura'),(720,21,'Nandurbar'),(721,21,'Narkhed'),(722,21,'Nashik'),(723,21,'Navi Mumbai'),(724,21,'Nawapur'),(725,21,'Nilanga'),(726,21,'Osmanabad'),(727,21,'Ozar'),(728,21,'Pachora'),(729,21,'Paithan'),(730,21,'Palghar'),(731,21,'Pandharkaoda'),(732,21,'Pandharpur'),(733,21,'Panvel'),(734,21,'Parbhani'),(735,21,'Parli'),(736,21,'Parola'),(737,21,'Partur'),(738,21,'Pathardi'),(739,21,'Pathri'),(740,21,'Patur'),(741,21,'Pauni'),(742,21,'Pen'),(743,21,'Phaltan'),(744,21,'Pulgaon'),(745,21,'Pune'),(746,21,'Purna'),(747,21,'Pusad'),(748,21,'Rahuri'),(749,21,'Rajura'),(750,21,'Ramtek'),(751,21,'Ratnagiri'),(752,21,'Raver'),(753,21,'Risod'),(754,21,'Sailu'),(755,21,'Sangamner'),(756,21,'Sangli'),(757,21,'Sangole'),(758,21,'Sasvad'),(759,21,'Satana'),(760,21,'Satara'),(761,21,'Savner'),(762,21,'Sawantwadi'),(763,21,'Shahade'),(764,21,'Shegaon'),(765,21,'Shendurjana'),(766,21,'Shirdi'),(767,21,'Shirpur-Warwade'),(768,21,'Shirur'),(769,21,'Shrigonda'),(770,21,'Shrirampur'),(771,21,'Sillod'),(772,21,'Sinnar'),(773,21,'Solapur'),(774,21,'Soyagaon'),(775,21,'Talegaon Dabhade'),(776,21,'Talode'),(777,21,'Tasgaon'),(778,21,'Tirora'),(779,21,'Tuljapur'),(780,21,'Tumsar'),(781,21,'Uran'),(782,21,'Uran Islampur'),(783,21,'Wadgaon Road'),(784,21,'Wai'),(785,21,'Wani'),(786,21,'Wardha'),(787,21,'Warora'),(788,21,'Warud'),(789,21,'Washim'),(790,21,'Yevla'),(791,22,'Kakching'),(792,22,'Lilong'),(793,22,'Mayang Imphal'),(794,22,'Thoubal'),(795,23,'Jowai'),(796,23,'Nongstoin'),(797,23,'Shillong'),(798,23,'Tura'),(799,24,'Aizawl'),(800,24,'Champhai'),(801,24,'Lunglei'),(802,24,'Saiha'),(803,25,'Dimapur'),(804,25,'Kohima'),(805,25,'Mokokchung'),(806,25,'Tuensang'),(807,25,'Wokha'),(808,25,'Zunheboto'),(809,26,'Anandapur'),(810,26,'Anugul'),(811,26,'Asika'),(812,26,'Balangir'),(813,26,'Balasore'),(814,26,'Baleshwar'),(815,26,'Bamra'),(816,26,'Barbil'),(817,26,'Bargarh'),(818,26,'Bargarh'),(819,26,'Baripada'),(820,26,'Basudebpur'),(821,26,'Belpahar'),(822,26,'Bhadrak'),(823,26,'Bhawanipatna'),(824,26,'Bhuban'),(825,26,'Bhubaneswar'),(826,26,'Biramitrapur'),(827,26,'Brahmapur'),(828,26,'Brajrajnagar'),(829,26,'Byasanagar'),(830,26,'Cuttack'),(831,26,'Debagarh'),(832,26,'Dhenkanal'),(833,26,'Gunupur'),(834,26,'Hinjilicut'),(835,26,'Jagatsinghapur'),(836,26,'Jajapur'),(837,26,'Jaleswar'),(838,26,'Jatani'),(839,26,'Jeypur'),(840,26,'Jharsuguda'),(841,26,'Joda'),(842,26,'Kantabanji'),(843,26,'Karanjia'),(844,26,'Kendrapara'),(845,26,'Kendujhar'),(846,26,'Khordha'),(847,26,'Koraput'),(848,26,'Malkangiri'),(849,26,'Nabarangapur'),(850,26,'Paradip'),(851,26,'Parlakhemundi'),(852,26,'Pattamundai'),(853,26,'Phulabani'),(854,26,'Puri'),(855,26,'Rairangpur'),(856,26,'Rajagangapur'),(857,26,'Raurkela'),(858,26,'Rayagada'),(859,26,'Sambalpur'),(860,26,'Soro'),(861,26,'Sunabeda'),(862,26,'Sundargarh'),(863,26,'Talcher'),(864,26,'Titlagarh'),(865,26,'Umarkote'),(866,28,'Ahmedgarh'),(867,28,'Amritsar'),(868,28,'Barnala'),(869,28,'Batala'),(870,28,'Bathinda'),(871,28,'Bhagha Purana'),(872,28,'Budhlada'),(873,28,'Chandigarh'),(874,28,'Dasua'),(875,28,'Dhuri'),(876,28,'Dinanagar'),(877,28,'Faridkot'),(878,28,'Fazilka'),(879,28,'Firozpur'),(880,28,'Firozpur Cantt.'),(881,28,'Giddarbaha'),(882,28,'Gobindgarh'),(883,28,'Gurdaspur'),(884,28,'Hoshiarpur'),(885,28,'Jagraon'),(886,28,'Jaitu'),(887,28,'Jalalabad'),(888,28,'Jalandhar'),(889,28,'Jalandhar Cantt.'),(890,28,'Jandiala'),(891,28,'Kapurthala'),(892,28,'Karoran'),(893,28,'Kartarpur'),(894,28,'Khanna'),(895,28,'Kharar'),(896,28,'Kot Kapura'),(897,28,'Kurali'),(898,28,'Longowal'),(899,28,'Ludhiana'),(900,28,'Malerkotla'),(901,28,'Malout'),(902,28,'Mansa'),(903,28,'Maur'),(904,28,'Moga'),(905,28,'Mohali'),(906,28,'Morinda'),(907,28,'Mukerian'),(908,28,'Muktsar'),(909,28,'Nabha'),(910,28,'Nakodar'),(911,28,'Nangal'),(912,28,'Nawanshahr'),(913,28,'Pathankot'),(914,28,'Patiala'),(915,28,'Patran'),(916,28,'Patti'),(917,28,'Phagwara'),(918,28,'Phillaur'),(919,28,'Qadian'),(920,28,'Raikot'),(921,28,'Rajpura'),(922,28,'Rampura Phul'),(923,28,'Rupnagar'),(924,28,'Samana'),(925,28,'Sangrur'),(926,28,'Sirhind Fatehgarh Sahib'),(927,28,'Sujanpur'),(928,28,'Sunam'),(929,28,'Talwara'),(930,28,'Tarn Taran'),(931,28,'Urmar Tanda'),(932,28,'Zira'),(933,28,'Zirakpur'),(934,29,'Ajmer'),(935,29,'Alwar'),(936,29,'Bandikui'),(937,29,'Baran'),(938,29,'Barmer'),(939,29,'Bikaner'),(940,29,'Fatehpur'),(941,29,'Jaipur'),(942,29,'Jaisalmer'),(943,29,'Jodhpur'),(944,29,'Kota'),(945,29,'Lachhmangarh'),(946,29,'Ladnu'),(947,29,'Lakheri'),(948,29,'Lalsot'),(949,29,'Losal'),(950,29,'Makrana'),(951,29,'Malpura'),(952,29,'Mandalgarh'),(953,29,'Mandawa'),(954,29,'Mangrol'),(955,29,'Merta City'),(956,29,'Mount Abu'),(957,29,'Nadbai'),(958,29,'Nagar'),(959,29,'Nagaur'),(960,29,'Nargund'),(961,29,'Nasirabad'),(962,29,'Nathdwara'),(963,29,'Navalgund'),(964,29,'Nawalgarh'),(965,29,'Neem-Ka-Thana'),(966,29,'Nelamangala'),(967,29,'Nimbahera'),(968,29,'Nipani'),(969,29,'Niwai'),(970,29,'Nohar'),(971,29,'Nokha'),(972,29,'Pali'),(973,29,'Phalodi'),(974,29,'Phulera'),(975,29,'Pilani'),(976,29,'Pilibanga'),(977,29,'Pindwara'),(978,29,'Pipar City'),(979,29,'Prantij'),(980,29,'Pratapgarh'),(981,29,'Raisinghnagar'),(982,29,'Rajakhera'),(983,29,'Rajaldesar'),(984,29,'Rajgarh (Alwar)'),(985,29,'Rajgarh (Churu'),(986,29,'Rajsamand'),(987,29,'Ramganj Mandi'),(988,29,'Ramngarh'),(989,29,'Ratangarh'),(990,29,'Rawatbhata'),(991,29,'Rawatsar'),(992,29,'Reengus'),(993,29,'Sadri'),(994,29,'Sadulshahar'),(995,29,'Sagwara'),(996,29,'Sambhar'),(997,29,'Sanchore'),(998,29,'Sangaria'),(999,29,'Sardarshahar'),(1000,29,'Sawai Madhopur'),(1001,29,'Shahpura'),(1002,29,'Shahpura'),(1003,29,'Sheoganj'),(1004,29,'Sikar'),(1005,29,'Sirohi'),(1006,29,'Sojat'),(1007,29,'Sri Madhopur'),(1008,29,'Sujangarh'),(1009,29,'Sumerpur'),(1010,29,'Suratgarh'),(1011,29,'Taranagar'),(1012,29,'Todabhim'),(1013,29,'Todaraisingh'),(1014,29,'Tonk'),(1015,29,'Udaipur'),(1016,29,'Udaipurwati'),(1017,29,'Vijainagar'),(1018,30,'Gangtok'),(1019,31,'Arakkonam'),(1020,31,'Arcot'),(1021,31,'Aruppukkottai'),(1022,31,'Bhavani'),(1023,31,'Chengalpattu'),(1024,31,'Chennai'),(1025,31,'Chinna salem'),(1026,31,'Coimbatore'),(1027,31,'Coonoor'),(1028,31,'Cuddalore'),(1029,31,'Dharmapuri'),(1030,31,'Dindigul'),(1031,31,'Erode'),(1032,31,'Gudalur'),(1033,31,'Gudalur'),(1034,31,'Gudalur'),(1035,31,'Kanchipuram'),(1036,31,'Karaikudi'),(1037,31,'Karungal'),(1038,31,'Karur'),(1039,31,'Kollankodu'),(1040,31,'Lalgudi'),(1041,31,'Madurai'),(1042,31,'Nagapattinam'),(1043,31,'Nagercoil'),(1044,31,'Namagiripettai'),(1045,31,'Namakkal'),(1046,31,'Nandivaram-Guduvancheri'),(1047,31,'Nanjikottai'),(1048,31,'Natham'),(1049,31,'Nellikuppam'),(1050,31,'Neyveli'),(1051,31,'O Valley'),(1052,31,'Oddanchatram'),(1053,31,'P.N.Patti'),(1054,31,'Pacode'),(1055,31,'Padmanabhapuram'),(1056,31,'Palani'),(1057,31,'Palladam'),(1058,31,'Pallapatti'),(1059,31,'Pallikonda'),(1060,31,'Panagudi'),(1061,31,'Panruti'),(1062,31,'Paramakudi'),(1063,31,'Parangipettai'),(1064,31,'Pattukkottai'),(1065,31,'Perambalur'),(1066,31,'Peravurani'),(1067,31,'Periyakulam'),(1068,31,'Periyasemur'),(1069,31,'Pernampattu'),(1070,31,'Pollachi'),(1071,31,'Polur'),(1072,31,'Ponneri'),(1073,31,'Pudukkottai'),(1074,31,'Pudupattinam'),(1075,31,'Puliyankudi'),(1076,31,'Punjaipugalur'),(1077,31,'Rajapalayam'),(1078,31,'Ramanathapuram'),(1079,31,'Rameshwaram'),(1080,31,'Rasipuram'),(1081,31,'Salem'),(1082,31,'Sankarankoil'),(1083,31,'Sankari'),(1084,31,'Sathyamangalam'),(1085,31,'Sattur'),(1086,31,'Shenkottai'),(1087,31,'Sholavandan'),(1088,31,'Sholingur'),(1089,31,'Sirkali'),(1090,31,'Sivaganga'),(1091,31,'Sivagiri'),(1092,31,'Sivakasi'),(1093,31,'Srivilliputhur'),(1094,31,'Surandai'),(1095,31,'Suriyampalayam'),(1096,31,'Tenkasi'),(1097,31,'Thammampatti'),(1098,31,'Thanjavur'),(1099,31,'Tharamangalam'),(1100,31,'Tharangambadi'),(1101,31,'Theni Allinagaram'),(1102,31,'Thirumangalam'),(1103,31,'Thirunindravur'),(1104,31,'Thiruparappu'),(1105,31,'Thirupuvanam'),(1106,31,'Thiruthuraipoondi'),(1107,31,'Thiruvallur'),(1108,31,'Thiruvarur'),(1109,31,'Thoothukudi'),(1110,31,'Thuraiyur'),(1111,31,'Tindivanam'),(1112,31,'Tiruchendur'),(1113,31,'Tiruchengode'),(1114,31,'Tiruchirappalli'),(1115,31,'Tirukalukundram'),(1116,31,'Tirukkoyilur'),(1117,31,'Tirunelveli'),(1118,31,'Tirupathur'),(1119,31,'Tirupathur'),(1120,31,'Tiruppur'),(1121,31,'Tiruttani'),(1122,31,'Tiruvannamalai'),(1123,31,'Tiruvethipuram'),(1124,31,'Tittakudi'),(1125,31,'Udhagamandalam'),(1126,31,'Udumalaipettai'),(1127,31,'Unnamalaikadai'),(1128,31,'Usilampatti'),(1129,31,'Uthamapalayam'),(1130,31,'Uthiramerur'),(1131,31,'Vadakkuvalliyur'),(1132,31,'Vadalur'),(1133,31,'Vadipatti'),(1134,31,'Valparai'),(1135,31,'Vandavasi'),(1136,31,'Vaniyambadi'),(1137,31,'Vedaranyam'),(1138,31,'Vellakoil'),(1139,31,'Vellore'),(1140,31,'Vikramasingapuram'),(1141,31,'Viluppuram'),(1142,31,'Virudhachalam'),(1143,31,'Virudhunagar'),(1144,31,'Viswanatham'),(1145,31,'Chennai'),(1146,31,'Coimbatore'),(1147,32,'Agartala'),(1148,32,'Badharghat'),(1149,32,'Dharmanagar'),(1150,32,'Indranagar'),(1151,32,'Jogendranagar'),(1152,32,'Kailasahar'),(1153,32,'Khowai'),(1154,32,'Pratapgarh'),(1155,32,'Udaipur'),(1156,34,'Achhnera'),(1157,34,'Adari'),(1158,34,'Agra'),(1159,34,'Aligarh'),(1160,34,'Allahabad'),(1161,34,'Amroha'),(1162,34,'Azamgarh'),(1163,34,'Bahraich'),(1164,34,'Ballia'),(1165,34,'Balrampur'),(1166,34,'Banda'),(1167,34,'Bareilly'),(1168,34,'Chandausi'),(1169,34,'Dadri'),(1170,34,'Deoria'),(1171,34,'Etawah'),(1172,34,'Fatehabad'),(1173,34,'Fatehpur'),(1174,34,'Fatehpur'),(1175,34,'Greater Noida'),(1176,34,'Hamirpur'),(1177,34,'Hardoi'),(1178,34,'Jajmau'),(1179,34,'Jaunpur'),(1180,34,'Jhansi'),(1181,34,'Kalpi'),(1182,34,'Kanpur'),(1183,34,'Kota'),(1184,34,'Laharpur'),(1185,34,'Lakhimpur'),(1186,34,'Lal Gopalganj Nindaura'),(1187,34,'Lalganj'),(1188,34,'Lalitpur'),(1189,34,'Lar'),(1190,34,'Loni'),(1191,34,'Lucknow'),(1192,34,'Mathura'),(1193,34,'Meerut'),(1194,34,'Modinagar'),(1195,34,'Muradnagar'),(1196,34,'Nagina'),(1197,34,'Najibabad'),(1198,34,'Nakur'),(1199,34,'Nanpara'),(1200,34,'Naraura'),(1201,34,'Naugawan Sadat'),(1202,34,'Nautanwa'),(1203,34,'Nawabganj'),(1204,34,'Nehtaur'),(1205,34,'NOIDA'),(1206,34,'Noorpur'),(1207,34,'Obra'),(1208,34,'Orai'),(1209,34,'Padrauna'),(1210,34,'Palia Kalan'),(1211,34,'Parasi'),(1212,34,'Phulpur'),(1213,34,'Pihani'),(1214,34,'Pilibhit'),(1215,34,'Pilkhuwa'),(1216,34,'Powayan'),(1217,34,'Pukhrayan'),(1218,34,'Puranpur'),(1219,34,'Purquazi'),(1220,34,'Purwa'),(1221,34,'Rae Bareli'),(1222,34,'Rampur'),(1223,34,'Rampur Maniharan'),(1224,34,'Rasra'),(1225,34,'Rath'),(1226,34,'Renukoot'),(1227,34,'Reoti'),(1228,34,'Robertsganj'),(1229,34,'Rudauli'),(1230,34,'Rudrapur'),(1231,34,'Sadabad'),(1232,34,'Safipur'),(1233,34,'Saharanpur'),(1234,34,'Sahaspur'),(1235,34,'Sahaswan'),(1236,34,'Sahawar'),(1237,34,'Sahjanwa'),(1238,34,'Sambhal'),(1239,34,'Samdhan'),(1240,34,'Samthar'),(1241,34,'Sandi'),(1242,34,'Sandila'),(1243,34,'Sardhana'),(1244,34,'Seohara'),(1245,34,'Shahganj'),(1246,34,'Shahjahanpur'),(1247,34,'Shamli'),(1248,34,'Sherkot'),(1249,34,'Shikohabad'),(1250,34,'Shishgarh'),(1251,34,'Siana'),(1252,34,'Sikanderpur'),(1253,34,'Sikandra Rao'),(1254,34,'Sikandrabad'),(1255,34,'Sirsaganj'),(1256,34,'Sirsi'),(1257,34,'Sitapur'),(1258,34,'Soron'),(1259,34,'Suar'),(1260,34,'Sultanpur'),(1261,34,'Sumerpur'),(1262,34,'Tanda'),(1263,34,'Tanda'),(1264,34,'Tetri Bazar'),(1265,34,'Thakurdwara'),(1266,34,'Thana Bhawan'),(1267,34,'Tilhar'),(1268,34,'Tirwaganj'),(1269,34,'Tulsipur'),(1270,34,'Tundla'),(1271,34,'Unnao'),(1272,34,'Utraula'),(1273,34,'Varanasi'),(1274,34,'Vrindavan'),(1275,34,'Warhapur'),(1276,34,'Zaidpur'),(1277,34,'Zamania'),(1278,35,'Calcutta'),(1279,35,'Alipurduar'),(1280,35,'Arambagh'),(1281,35,'Asansol'),(1282,35,'Baharampur'),(1283,35,'Bally'),(1284,35,'Balurghat'),(1285,35,'Bankura'),(1286,35,'Barakar'),(1287,35,'Barasat'),(1288,35,'Bardhaman'),(1289,35,'Bidhan Nagar'),(1290,35,'Chinsura'),(1291,35,'Contai'),(1292,35,'Cooch Behar'),(1293,35,'Darjeeling'),(1294,35,'Durgapur'),(1295,35,'Haldia'),(1296,35,'Howrah'),(1297,35,'Islampur'),(1298,35,'Jhargram'),(1299,35,'Kharagpur'),(1300,35,'Kolkata'),(1301,35,'Mainaguri'),(1302,35,'Mal'),(1303,35,'Mathabhanga'),(1304,35,'Medinipur'),(1305,35,'Memari'),(1306,35,'Monoharpur'),(1307,35,'Murshidabad'),(1308,35,'Nabadwip'),(1309,35,'Naihati'),(1310,35,'Panchla'),(1311,35,'Pandua'),(1312,35,'Paschim Punropara'),(1313,35,'Purulia'),(1314,35,'Raghunathpur'),(1315,35,'Raiganj'),(1316,35,'Rampurhat'),(1317,35,'Ranaghat'),(1318,35,'Sainthia'),(1319,35,'Santipur'),(1320,35,'Siliguri'),(1321,35,'Sonamukhi'),(1322,35,'Srirampore'),(1323,35,'Suri'),(1324,35,'Taki'),(1325,35,'Tamluk'),(1326,35,'Tarakeswar'),(1327,10,'Asola'),(1328,10,'Delhi'),(1329,11,'Aldona'),(1330,11,'Curchorem Cacora'),(1331,11,'Madgaon'),(1332,11,'Mapusa'),(1333,11,'Margao'),(1334,11,'Marmagao'),(1335,11,'Panaji'),(1336,27,'Karaikal'),(1337,27,'Mahe'),(1338,27,'Pondicherry'),(1339,27,'Yanam'),(1340,16,'Amlabad'),(1341,16,'Ara'),(1342,16,'Barughutu'),(1343,16,'Bokaro Steel City'),(1344,16,'Chaibasa'),(1345,16,'Chakradharpur'),(1346,16,'Chandrapura'),(1347,16,'Chatra'),(1348,16,'Chirkunda'),(1349,16,'Churi'),(1350,16,'Daltonganj'),(1351,16,'Deoghar'),(1352,16,'Dhanbad'),(1353,16,'Dumka'),(1354,16,'Garhwa'),(1355,16,'Ghatshila'),(1356,16,'Giridih'),(1357,16,'Godda'),(1358,16,'Gomoh'),(1359,16,'Gumia'),(1360,16,'Gumla'),(1361,16,'Hazaribag'),(1362,16,'Hussainabad'),(1363,16,'Jamshedpur'),(1364,16,'Jamtara'),(1365,16,'Jhumri Tilaiya'),(1366,16,'Khunti'),(1367,16,'Lohardaga'),(1368,16,'Madhupur'),(1369,16,'Mihijam'),(1370,16,'Musabani'),(1371,16,'Pakaur'),(1372,16,'Patratu'),(1373,16,'Phusro'),(1374,16,'Ramngarh'),(1375,16,'Ranchi'),(1376,16,'Sahibganj'),(1377,16,'Saunda'),(1378,16,'Simdega'),(1379,16,'Tenu Dam-cum- Kathhara'),(1380,7,'Ahiwara'),(1381,7,'Akaltara'),(1382,7,'Ambagarh Chowki'),(1383,7,'Ambikapur'),(1384,7,'Arang'),(1385,7,'Bade Bacheli'),(1386,7,'Balod'),(1387,7,'Baloda Bazar'),(1388,7,'Bemetra'),(1389,7,'Bhatapara'),(1390,7,'Bilaspur'),(1391,7,'Birgaon'),(1392,7,'Champa'),(1393,7,'Chirmiri'),(1394,7,'Dalli-Rajhara'),(1395,7,'Dhamtari'),(1396,7,'Dipka'),(1397,7,'Dongargarh'),(1398,7,'Durg-Bhilai Nagar'),(1399,7,'Gobranawapara'),(1400,7,'Jagdalpur'),(1401,7,'Janjgir'),(1402,7,'Jashpurnagar'),(1403,7,'Kanker'),(1404,7,'Kawardha'),(1405,7,'Kondagaon'),(1406,7,'Korba'),(1407,7,'Mahasamund'),(1408,7,'Mahendragarh'),(1409,7,'Mungeli'),(1410,7,'Naila Janjgir'),(1411,7,'Raigarh'),(1412,7,'Raipur'),(1413,7,'Rajnandgaon'),(1414,7,'Sakti'),(1415,7,'Tilda Newra'),(1416,33,'Nainital'),(1417,33,'Almora'),(1418,33,'Pitoragarh'),(1419,33,'Udhamsingh Nagar'),(1420,33,'Bageshwar'),(1421,33,'Champawat'),(1422,33,'Garhwal(Pauri)'),(1423,33,'Tehri-Garhwal'),(1424,33,'Chamoli( Gopeshwar )'),(1425,33,'Uttarkashi'),(1426,33,'Dehradun'),(1427,33,'Rudraprayag'),(1428,33,'Haridwar'),(1429,9,'Dama'),(1430,9,'Diu'),(1431,3,'Andaman'),(1432,3,'Nicobar');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` varchar(1024) NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan','AF','AFG','',0,1),(2,'Albania','AL','ALB','',0,1),(3,'Algeria','DZ','DZA','',0,1),(4,'American Samoa','AS','ASM','',0,1),(5,'Andorra','AD','AND','',0,1),(6,'Angola','AO','AGO','',0,1),(7,'Anguilla','AI','AIA','',0,1),(8,'Antarctica','AQ','ATA','',0,1),(9,'Antigua and Barbuda','AG','ATG','',0,1),(10,'Argentina','AR','ARG','',0,1),(11,'Armenia','AM','ARM','',0,1),(12,'Aruba','AW','ABW','',0,1),(13,'Australia','AU','AUS','',0,1),(14,'Austria','AT','AUT','',0,1),(15,'Azerbaijan','AZ','AZE','',0,1),(16,'Bahamas','BS','BHS','',0,1),(17,'Bahrain','BH','BHR','',0,1),(18,'Bangladesh','BD','BGD','',0,1),(19,'Barbados','BB','BRB','',0,1),(20,'Belarus','BY','BLR','',0,1),(21,'Belgium','BE','BEL','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',0,1),(22,'Belize','BZ','BLZ','',0,1),(23,'Benin','BJ','BEN','',0,1),(24,'Bermuda','BM','BMU','',0,1),(25,'Bhutan','BT','BTN','',0,1),(26,'Bolivia','BO','BOL','',0,1),(27,'Bosnia and Herzegovina','BA','BIH','',0,1),(28,'Botswana','BW','BWA','',0,1),(29,'Bouvet Island','BV','BVT','',0,1),(30,'Brazil','BR','BRA','',0,1),(31,'British Indian Ocean Territory','IO','IOT','',0,1),(32,'Brunei Darussalam','BN','BRN','',0,1),(33,'Bulgaria','BG','BGR','',0,1),(34,'Burkina Faso','BF','BFA','',0,1),(35,'Burundi','BI','BDI','',0,1),(36,'Cambodia','KH','KHM','',0,1),(37,'Cameroon','CM','CMR','',0,1),(38,'Canada','CA','CAN','',0,1),(39,'Cape Verde','CV','CPV','',0,1),(40,'Cayman Islands','KY','CYM','',0,1),(41,'Central African Republic','CF','CAF','',0,1),(42,'Chad','TD','TCD','',0,1),(43,'Chile','CL','CHL','',0,1),(44,'China','CN','CHN','',0,1),(45,'Christmas Island','CX','CXR','',0,1),(46,'Cocos (Keeling) Islands','CC','CCK','',0,1),(47,'Colombia','CO','COL','',0,1),(48,'Comoros','KM','COM','',0,1),(49,'Congo','CG','COG','',0,1),(50,'Cook Islands','CK','COK','',0,1),(51,'Costa Rica','CR','CRI','',0,1),(52,'Cote D\'Ivoire','CI','CIV','',0,1),(53,'Croatia','HR','HRV','',0,1),(54,'Cuba','CU','CUB','',0,1),(55,'Cyprus','CY','CYP','',0,1),(56,'Czech Republic','CZ','CZE','',0,1),(57,'Denmark','DK','DNK','',0,1),(58,'Djibouti','DJ','DJI','',0,1),(59,'Dominica','DM','DMA','',0,1),(60,'Dominican Republic','DO','DOM','',0,1),(61,'East Timor','TL','TLS','',0,1),(62,'Ecuador','EC','ECU','',0,1),(63,'Egypt','EG','EGY','',0,1),(64,'El Salvador','SV','SLV','',0,1),(65,'Equatorial Guinea','GQ','GNQ','',0,1),(66,'Eritrea','ER','ERI','',0,1),(67,'Estonia','EE','EST','',0,1),(68,'Ethiopia','ET','ETH','',0,1),(69,'Falkland Islands (Malvinas)','FK','FLK','',0,1),(70,'Faroe Islands','FO','FRO','',0,1),(71,'Fiji','FJ','FJI','',0,1),(72,'Finland','FI','FIN','',0,1),(74,'France, Metropolitan','FR','FRA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),(75,'French Guiana','GF','GUF','',0,1),(76,'French Polynesia','PF','PYF','',0,1),(77,'French Southern Territories','TF','ATF','',0,1),(78,'Gabon','GA','GAB','',0,1),(79,'Gambia','GM','GMB','',0,1),(80,'Georgia','GE','GEO','',0,1),(81,'Germany','DE','DEU','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),(82,'Ghana','GH','GHA','',0,1),(83,'Gibraltar','GI','GIB','',0,1),(84,'Greece','GR','GRC','',0,1),(85,'Greenland','GL','GRL','',0,1),(86,'Grenada','GD','GRD','',0,1),(87,'Guadeloupe','GP','GLP','',0,1),(88,'Guam','GU','GUM','',0,1),(89,'Guatemala','GT','GTM','',0,1),(90,'Guinea','GN','GIN','',0,1),(91,'Guinea-Bissau','GW','GNB','',0,1),(92,'Guyana','GY','GUY','',0,1),(93,'Haiti','HT','HTI','',0,1),(94,'Heard and Mc Donald Islands','HM','HMD','',0,1),(95,'Honduras','HN','HND','',0,1),(96,'Hong Kong','HK','HKG','',0,1),(97,'Hungary','HU','HUN','',0,1),(98,'Iceland','IS','ISL','',0,1),(99,'India','IN','IND','',0,1),(100,'Indonesia','ID','IDN','',0,1),(101,'Iran (Islamic Republic of)','IR','IRN','',0,1),(102,'Iraq','IQ','IRQ','',0,1),(103,'Ireland','IE','IRL','',0,1),(104,'Israel','IL','ISR','',0,1),(105,'Italy','IT','ITA','',0,1),(106,'Jamaica','JM','JAM','',0,1),(107,'Japan','JP','JPN','',0,1),(108,'Jordan','JO','JOR','',0,1),(109,'Kazakhstan','KZ','KAZ','',0,1),(110,'Kenya','KE','KEN','',0,1),(111,'Kiribati','KI','KIR','',0,1),(112,'North Korea','KP','PRK','',0,1),(113,'Korea, Republic of','KR','KOR','',0,1),(114,'Kuwait','KW','KWT','',0,1),(115,'Kyrgyzstan','KG','KGZ','',0,1),(116,'Lao People\'s Democratic Republic','LA','LAO','',0,1),(117,'Latvia','LV','LVA','',0,1),(118,'Lebanon','LB','LBN','',0,1),(119,'Lesotho','LS','LSO','',0,1),(120,'Liberia','LR','LBR','',0,1),(121,'Libyan Arab Jamahiriya','LY','LBY','',0,1),(122,'Liechtenstein','LI','LIE','',0,1),(123,'Lithuania','LT','LTU','',0,1),(124,'Luxembourg','LU','LUX','',0,1),(125,'Macau','MO','MAC','',0,1),(126,'FYROM','MK','MKD','',0,1),(127,'Madagascar','MG','MDG','',0,1),(128,'Malawi','MW','MWI','',0,1),(129,'Malaysia','MY','MYS','',0,1),(130,'Maldives','MV','MDV','',0,1),(131,'Mali','ML','MLI','',0,1),(132,'Malta','MT','MLT','',0,1),(133,'Marshall Islands','MH','MHL','',0,1),(134,'Martinique','MQ','MTQ','',0,1),(135,'Mauritania','MR','MRT','',0,1),(136,'Mauritius','MU','MUS','',0,1),(137,'Mayotte','YT','MYT','',0,1),(138,'Mexico','MX','MEX','',0,1),(139,'Micronesia, Federated States of','FM','FSM','',0,1),(140,'Moldova, Republic of','MD','MDA','',0,1),(141,'Monaco','MC','MCO','',0,1),(142,'Mongolia','MN','MNG','',0,1),(143,'Montserrat','MS','MSR','',0,1),(144,'Morocco','MA','MAR','',0,1),(145,'Mozambique','MZ','MOZ','',0,1),(146,'Myanmar','MM','MMR','',0,1),(147,'Namibia','NA','NAM','',0,1),(148,'Nauru','NR','NRU','',0,1),(149,'Nepal','NP','NPL','',0,1),(150,'Netherlands','NL','NLD','',0,1),(151,'Netherlands Antilles','AN','ANT','',0,1),(152,'New Caledonia','NC','NCL','',0,1),(153,'New Zealand','NZ','NZL','',0,1),(154,'Nicaragua','NI','NIC','',0,1),(155,'Niger','NE','NER','',0,1),(156,'Nigeria','NG','NGA','',0,1),(157,'Niue','NU','NIU','',0,1),(158,'Norfolk Island','NF','NFK','',0,1),(159,'Northern Mariana Islands','MP','MNP','',0,1),(160,'Norway','NO','NOR','',0,1),(161,'Oman','OM','OMN','',0,1),(162,'Pakistan','PK','PAK','',0,1),(163,'Palau','PW','PLW','',0,1),(164,'Panama','PA','PAN','',0,1),(165,'Papua New Guinea','PG','PNG','',0,1),(166,'Paraguay','PY','PRY','',0,1),(167,'Peru','PE','PER','',0,1),(168,'Philippines','PH','PHL','',0,1),(169,'Pitcairn','PN','PCN','',0,1),(170,'Poland','PL','POL','',0,1),(171,'Portugal','PT','PRT','',0,1),(172,'Puerto Rico','PR','PRI','',0,1),(173,'Qatar','QA','QAT','',0,1),(174,'Reunion','RE','REU','',0,1),(175,'Romania','RO','ROM','',0,1),(176,'Russian Federation','RU','RUS','',0,1),(177,'Rwanda','RW','RWA','',0,1),(178,'Saint Kitts and Nevis','KN','KNA','',0,1),(179,'Saint Lucia','LC','LCA','',0,1),(180,'Saint Vincent and the Grenadines','VC','VCT','',0,1),(181,'Samoa','WS','WSM','',0,1),(182,'San Marino','SM','SMR','',0,1),(183,'Sao Tome and Principe','ST','STP','',0,1),(184,'Saudi Arabia','SA','SAU','',0,1),(185,'Senegal','SN','SEN','',0,1),(186,'Seychelles','SC','SYC','',0,1),(187,'Sierra Leone','SL','SLE','',0,1),(188,'Singapore','SG','SGP','',0,1),(189,'Slovak Republic','SK','SVK','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}',0,1),(190,'Slovenia','SI','SVN','',0,1),(191,'Solomon Islands','SB','SLB','',0,1),(192,'Somalia','SO','SOM','',0,1),(193,'South Africa','ZA','ZAF','',0,1),(194,'South Georgia &amp; South Sandwich Islands','GS','SGS','',0,1),(195,'Spain','ES','ESP','',0,1),(196,'Sri Lanka','LK','LKA','',0,1),(197,'St. Helena','SH','SHN','',0,1),(198,'St. Pierre and Miquelon','PM','SPM','',0,1),(199,'Sudan','SD','SDN','',0,1),(200,'Suriname','SR','SUR','',0,1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM','',0,1),(202,'Swaziland','SZ','SWZ','',0,1),(203,'Sweden','SE','SWE','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),(204,'Switzerland','CH','CHE','',0,1),(205,'Syrian Arab Republic','SY','SYR','',0,1),(206,'Taiwan','TW','TWN','',0,1),(207,'Tajikistan','TJ','TJK','',0,1),(208,'Tanzania, United Republic of','TZ','TZA','',0,1),(209,'Thailand','TH','THA','',0,1),(210,'Togo','TG','TGO','',0,1),(211,'Tokelau','TK','TKL','',0,1),(212,'Tonga','TO','TON','',0,1),(213,'Trinidad and Tobago','TT','TTO','',0,1),(214,'Tunisia','TN','TUN','',0,1),(215,'Turkey','TR','TUR','',0,1),(216,'Turkmenistan','TM','TKM','',0,1),(217,'Turks and Caicos Islands','TC','TCA','',0,1),(218,'Tuvalu','TV','TUV','',0,1),(219,'Uganda','UG','UGA','',0,1),(220,'Ukraine','UA','UKR','',0,1),(221,'United Arab Emirates','AE','ARE','',0,1),(222,'United Kingdom','GB','GBR','',1,1),(223,'United States','US','USA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}',0,1),(224,'United States Minor Outlying Islands','UM','UMI','',0,1),(225,'Uruguay','UY','URY','',0,1),(226,'Uzbekistan','UZ','UZB','',0,1),(227,'Vanuatu','VU','VUT','',0,1),(228,'Vatican City State (Holy See)','VA','VAT','',0,1),(229,'Venezuela','VE','VEN','',0,1),(230,'Viet Nam','VN','VNM','',0,1),(231,'Virgin Islands (British)','VG','VGB','',0,1),(232,'Virgin Islands (U.S.)','VI','VIR','',0,1),(233,'Wallis and Futuna Islands','WF','WLF','',0,1),(234,'Western Sahara','EH','ESH','',0,1),(235,'Yemen','YE','YEM','',0,1),(237,'Democratic Republic of Congo','CD','COD','',0,1),(238,'Zambia','ZM','ZMB','',0,1),(239,'Zimbabwe','ZW','ZWE','',0,1),(240,'Jersey','JE','JEY','',1,1),(241,'Guernsey','GG','GGY','',1,1),(242,'Montenegro','ME','MNE','',0,1),(243,'Serbia','RS','SRB','',0,1),(244,'Aaland Islands','AX','ALA','',0,1),(245,'Bonaire, Sint Eustatius and Saba','BQ','BES','',0,1),(246,'Curacao','CW','CUW','',0,1),(247,'Palestinian Territory, Occupied','PS','PSE','',0,1),(248,'South Sudan','SS','SSD','',0,1),(249,'St. Barthelemy','BL','BLM','',0,1),(250,'St. Martin (French part)','MF','MAF','',0,1),(251,'Canary Islands','IC','ICA','',0,1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_retailer`
--

DROP TABLE IF EXISTS `customer_retailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_retailer_customer_id` (`customer_id`),
  KEY `customer_retailer_retailer_id` (`retailer_id`),
  CONSTRAINT `customer_retailer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_retailer_retailer_id` FOREIGN KEY (`retailer_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_retailer`
--

LOCK TABLES `customer_retailer` WRITE;
/*!40000 ALTER TABLE `customer_retailer` DISABLE KEYS */;
INSERT INTO `customer_retailer` VALUES (3,12,2,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1),(4,12,13,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1);
/*!40000 ALTER TABLE `customer_retailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_type`
--

DROP TABLE IF EXISTS `lookup_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code_UNIQUE` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_type`
--

LOCK TABLES `lookup_type` WRITE;
/*!40000 ALTER TABLE `lookup_type` DISABLE KEYS */;
INSERT INTO `lookup_type` VALUES (1,'USER_TYPE','ADMIN','Admin',1,1,'2014-04-09 00:03:22','2014-04-09 00:03:22',1),(2,'USER_TYPE','CUSTOMER','Customer',1,1,'2014-04-09 00:03:22','2014-04-09 00:03:22',1),(3,'USER_TYPE','RETAILER','Retailer',1,1,'2014-04-09 00:03:22','2014-04-09 00:03:22',1),(9,'ORDER_TYPE','ORDER','Order',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(10,'ORDER_TYPE','WISHLIST','WishList',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(11,'ORDER_STATUS','DRAFT','Draft',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(12,'ORDER_STATUS','ORDERED','Ordered',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(13,'ORDER_STATUS','PACKAGING','Packaging',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(14,'ORDER_STATUS','OUT_FOR_DELIVERY','Out for Delivery',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(15,'ORDER_STATUS','DELIVERED','Delivered',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(16,'ORDER_STATUS','ALL','All',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(17,'ORDER_STATUS','READY_FOR_DELIVERY','Ready for Delivery',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(18,'ORDER_STATUS','CONFIRMED','Confirmed',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1),(19,'ORDER_STATUS','REJECTED','Rejected',1,1,'2014-04-09 00:04:56','2014-04-09 00:04:56',1);
/*!40000 ALTER TABLE `lookup_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measuring_unit`
--

DROP TABLE IF EXISTS `measuring_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measuring_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_measuring_unit_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measuring_unit`
--

LOCK TABLES `measuring_unit` WRITE;
/*!40000 ALTER TABLE `measuring_unit` DISABLE KEYS */;
INSERT INTO `measuring_unit` VALUES (178,'Qty','2014-04-07 22:22:39','2014-04-07 22:22:39',1,1,1),(179,'EA','2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,1),(180,'Kg','2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,1);
/*!40000 ALTER TABLE `measuring_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `comments` varchar(1024) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_history_order_id` (`order_id`),
  KEY `FK_order_history_org_id` (`org_id`),
  CONSTRAINT `FK_order_history_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_history_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (29,1,1,'Order Confirmed. We will be delivering soon.','CONFIRMED',2,2,'2014-05-03 10:22:14','2014-05-03 10:22:14',0),(30,1,1,'Packaging Started','PACKAGING',2,2,'2014-05-03 10:30:07','2014-05-03 10:30:07',0),(31,1,1,'Packaging done.','READY_FOR_DELIVERY',1,1,'2014-05-03 10:44:42','2014-05-03 10:44:42',0),(32,1,1,'Ready for Delivery','OUT_FOR_DELIVERY',1,1,'2014-05-03 10:45:37','2014-05-03 10:45:37',0),(33,1,1,'Delivered','DELIVERED',1,1,'2014-05-03 10:45:50','2014-05-03 10:45:50',0),(34,1,1,'Confirmed. We will deliver.','CONFIRMED',2,2,'2014-05-05 16:54:44','2014-05-05 16:54:44',0),(35,1,1,'z','PACKAGING',2,2,'2014-05-05 17:04:31','2014-05-05 17:04:31',0),(36,1,1,'tsr','CONFIRMED',2,2,'2014-06-14 15:16:08','2014-06-14 15:16:08',0),(37,1,1,'test','CONFIRMED',2,2,'2014-06-14 18:25:25','2014-06-14 18:25:25',0),(38,1,1,'wwewe','CONFIRMED',2,2,'2014-07-06 00:15:02','2014-07-06 00:15:02',0),(39,1,1,'werwerwe','PACKAGING',2,2,'2014-07-06 00:15:38','2014-07-06 00:15:38',0),(40,1,1,'werwer','READY_FOR_DELIVERY',2,2,'2014-07-06 00:15:58','2014-07-06 00:15:58',0),(41,1,1,'werwer','OUT_FOR_DELIVERY',2,2,'2014-07-06 00:16:09','2014-07-06 00:16:09',0),(42,1,1,'test','DELIVERED',2,2,'2014-07-06 00:16:49','2014-07-06 00:16:49',0);
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lines`
--

DROP TABLE IF EXISTS `order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `packaged` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  `tax` float NOT NULL,
  `discount` float NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lines_order_id` (`order_id`),
  KEY `order_lines_product_id` (`product_id`),
  KEY `FK_order_lines_org_id` (`org_id`),
  CONSTRAINT `FK_order_lines_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_lines_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_lines_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
INSERT INTO `order_lines` VALUES (1,1,1,1336,5,5,45,5,10,1,1,'2014-04-15 21:39:26','2014-05-03 10:44:28',21),(2,1,1,1343,2,2,120,10,2,1,2,'2014-04-15 21:39:26','2014-05-03 10:44:06',4),(3,2,2,1339,5,7,500,45,6,1,13,'2014-04-20 21:39:26','2014-04-29 13:46:01',17),(5,1,1,1344,4,4,200,7,5,1,5,'2014-04-29 13:46:01','2014-05-05 17:04:59',2),(6,1,1,1345,5,0,300,5,8,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(7,1,1,1346,6,3,400,6,8,1,7,'2014-04-29 13:46:01','2014-05-05 17:04:42',2),(8,1,1,1347,7,0,500,7,4,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(9,1,1,1348,3,0,50,8,8,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(10,1,1,1349,4,0,780,9,3,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(11,1,1,1350,7,0,345,0,8,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(12,1,1,1351,2,0,789,6,2,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(13,1,1,1352,9,0,800,8,8,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(14,1,1,1353,3,0,67,6,3,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(15,1,1,1354,5,0,678,3,4,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(16,1,1,1355,6,0,544,2,5,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(17,1,1,1356,7,0,88,4,6,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(18,1,1,1357,8,0,345,5,6,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(19,1,1,1358,9,0,245,6,6,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1),(20,1,1,1359,10,0,879,7,8,1,1,'2014-04-29 13:46:01','2014-04-29 13:46:01',1);
/*!40000 ALTER TABLE `order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'DRAFT',
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `item_value` float NOT NULL,
  `tax` float NOT NULL,
  `commission` float NOT NULL,
  `ip` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT 'ORDER',
  `expected_delivery_time` datetime DEFAULT NULL,
  `delivery_code` varchar(128) DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `priority` int(2) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `FK_orders_customer_id` (`customer_id`),
  KEY `FK_orders_shipping_addres_id` (`shipping_address_id`),
  KEY `FK_orders_billing_addres_id` (`billing_address_id`),
  KEY `FK_orders_org_id` (`org_id`),
  CONSTRAINT `FK_orders_billing_addres_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_shipping_addres_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,12,'DELIVERED',1,2,'test',5000,125,20,'127.0.0.1',2,2,'2014-04-15 21:36:13','2014-07-06 00:16:48',60,'ORDERED','2014-04-18 21:36:13','1WVcTTG0mSaQONC','kdco18prl7dkou1er59f19vp15',0,5),(2,2,12,'ORDERED',2,3,'dgfdgdg',1000,12,12,'127.0.0.1',13,13,'2014-04-18 21:36:13','2014-04-29 02:17:32',9,'ORDERED','2014-04-21 21:36:13','YLB7eNsC8WNVCQ6','kdc118prl7dkou1er59f19vp15',1,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `owner_name` varchar(45) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `org_type` varchar(45) NOT NULL,
  `year_of_establishment` int(4) NOT NULL,
  `service_area` int(11) NOT NULL DEFAULT '5',
  `min_purchase_amount` int(11) NOT NULL DEFAULT '500',
  `default_delivery_time` int(11) NOT NULL DEFAULT '5',
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_name_address` (`name`,`address_id`),
  KEY `FK_organization_address_id` (`address_id`),
  CONSTRAINT `FK_organization_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'More Girinagar','',11,'RETAILER',2000,5,500,5,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',10),(2,'Nilgiris Girinagar','',12,'RETAILER',2000,5,500,5,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1),(3,'System','',1,'SYSTEM',2000,5,500,5,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',446),(5,'Customer','',1,'CUSTOMER',2000,5,500,5,1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1),(8,'Niki Enterprises','',18,'RETAILER',2000,5,500,5,1,1,'2014-07-15 16:53:23','2014-07-15 16:53:23',0),(36,'Star Bazaar','',46,'RETAILER',2000,5,500,5,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(37,'Pankaj Enterprises','',47,'RETAILER',2000,5,500,5,1,1,'2014-07-15 23:18:18','2014-07-15 23:18:18',0),(38,'asas','dasdsfs',50,'RETAILER',17,17,17,17,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `unique_name` varchar(45) DEFAULT NULL,
  `barcode` varchar(45) DEFAULT NULL,
  `search_code` varchar(45) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `image` varchar(128) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `object_version_number` int(11) NOT NULL,
  `age` int(3) DEFAULT '0',
  `gender` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_product_unique_name` (`manufacturer`,`name`,`category_id`),
  KEY `FK_product_category_id` (`category_id`),
  CONSTRAINT `FK_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1786 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1336,53,'AASHIRVAAD SALT',NULL,'AASHIRVAAD SALT','8901725123123',NULL,1,NULL,'2014-04-07 22:22:51','2014-04-07 22:22:51',1,1,11,0,NULL),(1337,54,'AMARANTHUS GREEN LEAVES - 200G',NULL,'AMARANTHUS GREEN LEAVES - 200G','WFN201','amg',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1338,54,'AMARANTHUS RED LEAVES - 200 G',NULL,'AMARANTHUS RED LEAVES - 200 G','WFN208','amr',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1339,54,'APPLE AMBRI',NULL,'APPLE AMBRI','WFN410','ambri',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1340,54,'APPLE FUJI',NULL,'APPLE FUJI','WFN403','fuji',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1341,54,'APPLE GRANNY SMITH',NULL,'APPLE GRANNY SMITH','WFN406','granny',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1342,54,'APPLE JAMMU KASHMIR DELICIOUS',NULL,'APPLE JAMMU KASHMIR DELICIOUS','WFN408','jammu',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1343,54,'APPLE JUICE SMALL',NULL,'APPLE JUICE SMALL','WFN472','apple juice',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1344,54,'APPLE KINNOR',NULL,'APPLE KINNOR','WFN409','kinnor',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1345,54,'APPLE RED DELICIOUS',NULL,'APPLE RED DELICIOUS','WFN404','reddel',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1346,54,'APPLE ROYAL GALA',NULL,'APPLE ROYAL GALA','WFN405','gala',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1347,54,'APPLE SIMLA',NULL,'APPLE SIMLA','WFN407','simla',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1348,54,'ASH GOURD',NULL,'ASH GOURD','WFN051','ash',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1349,55,'ASHIRWAD ATTA 10 KG',NULL,'ASHIRWAD ATTA 10 KG','8901725121716',NULL,1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1350,55,'ASHIRWAD ATTA 5 KG',NULL,'ASHIRWAD ATTA 5 KG','8901725121723',NULL,1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1351,54,'AVACADO  (Butter Fruit)',NULL,'AVACADO  (Butter Fruit)','WFN401','avacado',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1352,54,'BABY CORN',NULL,'BABY CORN','WFN100','babycorn',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1353,54,'BABY CORN PEELED (KG)',NULL,'BABY CORN PEELED (KG)','WFN125','peeled babycorn',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1354,54,'BABYCORN  200 GM  TP',NULL,'BABYCORN  200 GM  TP','WFN124','tp babycorn',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1355,56,'BAMBINO VERMICELLI',NULL,'BAMBINO VERMICELLI','8901242114307',NULL,1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1356,56,'BAMBINO VERMICELLI SMALL',NULL,'BAMBINO VERMICELLI SMALL','8901242114406',NULL,1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1357,54,'BANANA FLOWER',NULL,'BANANA FLOWER','WFN075','bflower',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1358,54,'BANANA LEAF',NULL,'BANANA LEAF','WFN077','bleaf',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1359,54,'BANANA NENDRAN',NULL,'BANANA NENDRAN','WFN003','nendran',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1360,54,'BANANA PLANT',NULL,'BANANA PLANT','WFN607','bplant',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1361,54,'BANANA RAW',NULL,'BANANA RAW','WFN071','RAW BANANA',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1362,54,'BANANA RED',NULL,'BANANA RED','WFN004','redbanana',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1363,54,'BANANA ROBUSTA',NULL,'BANANA ROBUSTA','WFN001','BR',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1364,54,'BANANA YELLAKI',NULL,'BANANA YELLAKI','WFN002','BY',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1365,57,'BASIL SOJI 500 GM',NULL,'BASIL SOJI 500 GM','8901869197240',NULL,1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1366,54,'BASLAE LEAF - 200 G',NULL,'BASLAE LEAF - 200 G','WFN202','basale',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1367,54,'BATANI SPROUT',NULL,'BATANI SPROUT','T00034',NULL,1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1368,54,'BEANS AWAREYKAAYI',NULL,'BEANS AWAREYKAAYI','WFN012','awaerakai',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1369,54,'BEANS AWAREYKAAYI PEELED 250GM',NULL,'BEANS AWAREYKAAYI PEELED 250GM','WFN708','peeled awarakai',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1370,54,'BEANS COWPEA (Karamani)',NULL,'BEANS COWPEA (Karamani)','WFN010','cow',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1371,54,'BEANS DOUBLE',NULL,'BEANS DOUBLE','WFN013','double beans',1,NULL,'2014-04-07 22:53:52','2014-04-07 22:53:52',1,1,6,0,NULL),(1372,54,'BEANS FRENCH FLAT',NULL,'BEANS FRENCH FLAT','WFN014','flat beans',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1373,54,'BEANS FRENCH HARICOT- NATTI',NULL,'BEANS FRENCH HARICOT- NATTI','WFN006','natti haricot beans',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1374,54,'BEANS FRENCH ROUND STRINGLESS',NULL,'BEANS FRENCH ROUND STRINGLESS','WFN005','beans',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1375,54,'BEANS RED GRAM (THOGARI KAAYI)',NULL,'BEANS RED GRAM (THOGARI KAAYI)','W00005','thogari',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1376,54,'BEET ROOT',NULL,'BEET ROOT','WFN055','beet',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1377,54,'BERMUDA GRASS (Garikey Hullu) - 50g',NULL,'BERMUDA GRASS (Garikey Hullu) - 50g','WFN608','garikey',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1378,54,'BETEL LEAF',NULL,'BETEL LEAF','WFN200','betel',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1379,57,'BG TOOR DALL  1 K G',NULL,'BG TOOR DALL  1 K G','8901869200056',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1380,54,'BITTER GOURD',NULL,'BITTER GOURD','WFN042','bitter',1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1381,57,'BL ATTA 1 KG',NULL,'BL ATTA 1 KG','8901869199718',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1382,57,'BL BENGAL GRAM 500 GM',NULL,'BL BENGAL GRAM 500 GM','8901869200070',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1383,57,'BL FRIED GRAM 250 GM',NULL,'BL FRIED GRAM 250 GM','8901869197219',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1384,57,'BL FRIED GRAM 500 GM',NULL,'BL FRIED GRAM 500 GM','8901869200063',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1385,57,'BL GATTI AVALAKKI 500 G',NULL,'BL GATTI AVALAKKI 500 G','8901869197264',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1386,57,'BL GRAM FLOUR 500 GM',NULL,'BL GRAM FLOUR 500 GM','8901869197288',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1387,56,'BL IDLI SOOJI 1 KG',NULL,'BL IDLI SOOJI 1 KG','8901869199756',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1388,57,'BL MAIDA  1 KG',NULL,'BL MAIDA  1 KG','8901869199725',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1389,57,'BL MAIDA 500 GM',NULL,'BL MAIDA 500 GM','8901869200025',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1390,57,'BL MOONG  DALL 500 GM',NULL,'BL MOONG  DALL 500 GM','8901869200087',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1391,57,'BL MOONG 500 GM',NULL,'BL MOONG 500 GM','8901869200094',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1392,57,'BL RAAGI FLOUR 1 KG',NULL,'BL RAAGI FLOUR 1 KG','8901869199749',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1393,57,'BL RAGI FLOUR 1 KG',NULL,'BL RAGI FLOUR 1 KG','4901962199749',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1394,57,'BL RAGI FLOUR 500 G',NULL,'BL RAGI FLOUR 500 G','8901869200018',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1395,57,'BL TOOR DALL 500 GM',NULL,'BL TOOR DALL 500 GM','8901869199787',NULL,1,NULL,'2014-04-07 22:53:53','2014-04-07 22:53:53',1,1,6,0,NULL),(1396,57,'BL URAD GOLA 500 GM',NULL,'BL URAD GOLA 500 GM','8901869199794',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1397,57,'BL WHEAT ATTA 1 KG',NULL,'BL WHEAT ATTA 1 KG','8901869199732',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1398,54,'BOTTLE GOURD',NULL,'BOTTLE GOURD','WFN043','bottle',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1399,53,'BOURNVITA',NULL,'BOURNVITA','8901233012292',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1400,54,'BRINJAL BLACK BIG (Bottle Shape)',NULL,'BRINJAL BLACK BIG (Bottle Shape)','WFN018','BB',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1401,54,'BRINJAL LONG GREEN',NULL,'BRINJAL LONG GREEN','WFN016','BLG',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1402,54,'BRINJAL PURPLE STRIPED (Varikathri)',NULL,'BRINJAL PURPLE STRIPED (Varikathri)','WFN017','BVK',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1403,54,'BRINJAL ROUND PURPLE',NULL,'BRINJAL ROUND PURPLE','WFN019','BRP',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1404,54,'BRINJAL WHITE STRIPED',NULL,'BRINJAL WHITE STRIPED','WFN020','BWS',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1405,58,'BRITANNIA 50 50',NULL,'BRITANNIA 50 50','8901063016682',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1406,58,'BRITANNIA TIGER',NULL,'BRITANNIA TIGER','8901063163010',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1407,54,'BROAD BEANS (Chikdi)',NULL,'BROAD BEANS (Chikdi)','WFN008','chik',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1408,54,'BROCCOLLI',NULL,'BROCCOLLI','WFN101','brocolli',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1409,54,'BUTTON MUSHROOM 200GM TP',NULL,'BUTTON MUSHROOM 200GM TP','WFN109','mush',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1410,54,'CABBAGE RED',NULL,'CABBAGE RED','WFN113','red cabbage',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1411,54,'CABBAGE REGULAR',NULL,'CABBAGE REGULAR','WFN036','cabb',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1412,53,'CADBARY 5 STAR',NULL,'CADBARY 5 STAR','8901233011608',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1413,53,'CADBARY PERK',NULL,'CADBARY PERK','8901233012582',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1414,53,'CADBARY PERK 17 G',NULL,'CADBARY PERK 17 G','8901233010397',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1415,54,'CAPSICUM 2 COLOR PACK',NULL,'CAPSICUM 2 COLOR PACK','WFN118','caps 2 colour',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1416,54,'CAPSICUM GREEN',NULL,'CAPSICUM GREEN','WFN028','gcaps',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1417,54,'CAPSICUM RED',NULL,'CAPSICUM RED','WFN116','rcaps',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1418,54,'CAPSICUM YELLOW',NULL,'CAPSICUM YELLOW','WFN117','ycaps',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1419,54,'CARROT BABY',NULL,'CARROT BABY','W00001','bcarrot',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1420,54,'CARROT DELHI',NULL,'CARROT DELHI','WFN026','delhicarrot',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1421,54,'CARROT LARGE',NULL,'CARROT LARGE','WFN024','largecarrot',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1422,54,'CARROT LOCAL',NULL,'CARROT LOCAL','WFN027','lcarr',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1423,54,'CARROT OOTY',NULL,'CARROT OOTY','WFN025','ocarr',1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1424,59,'CARRY BAG LARGE',NULL,'CARRY BAG LARGE','T00040',NULL,1,NULL,'2014-04-07 22:53:54','2014-04-07 22:53:54',1,1,6,0,NULL),(1425,59,'CARRY BAG MEDIUM',NULL,'CARRY BAG MEDIUM','T00039',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1426,59,'CARRY BAG SMALL',NULL,'CARRY BAG SMALL','T00038',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1427,56,'CASHEW 100 G',NULL,'CASHEW 100 G','T00054',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1428,60,'CATCH BLACK SALT 200 G',NULL,'CATCH BLACK SALT 200 G','8901192001207',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1429,60,'CATCH CHAT MASALA 100 G',NULL,'CATCH CHAT MASALA 100 G','8901192205100',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1430,60,'CATCH CHAT MASALA 50 G',NULL,'CATCH CHAT MASALA 50 G','8901192205001',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1431,60,'CATCH DAHI MASALA 50 G',NULL,'CATCH DAHI MASALA 50 G','8901192227003',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1432,60,'CATCH PEPPER 100 G',NULL,'CATCH PEPPER 100 G','8901192114105',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1433,60,'CATCH PEPPER 50 G',NULL,'CATCH PEPPER 50 G','8901192114006',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1434,60,'CATCH SENDHA NAMAK 100 G',NULL,'CATCH SENDHA NAMAK 100 G','8901192002105',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1435,60,'CATCH TABLE SALT 100 G',NULL,'CATCH TABLE SALT 100 G','8901192000101',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1436,54,'CAULIFLOWER  FLORETS 250GM PB',NULL,'CAULIFLOWER  FLORETS 250GM PB','WFN709','florets cauli',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1437,54,'CAULIFLOWER  STEMLESS (KG)',NULL,'CAULIFLOWER  STEMLESS (KG)','W00002','stemless cauli',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1438,54,'CAULIFLOWER - LARGE',NULL,'CAULIFLOWER - LARGE','WFN034','large cauli',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1439,54,'CAULIFLOWER - MEDIUM - RETAIL',NULL,'CAULIFLOWER - MEDIUM - RETAIL','WFN033','cauli',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1440,54,'CAULIFLOWER - UNGRADED',NULL,'CAULIFLOWER - UNGRADED','WFN035','ungr cauli',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1441,54,'CELERY',NULL,'CELERY','WFN102','celery',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1442,54,'CHERRY RED 250 GM',NULL,'CHERRY RED 250 GM','WFN462','cherry',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1443,54,'CHERRY TOMATO',NULL,'CHERRY TOMATO','WFN110','cherrytmt',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1444,56,'CHILLE RED (BADAGI)',NULL,'CHILLE RED (BADAGI)','T00044',NULL,1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1445,54,'CHILLI BHAJJI',NULL,'CHILLI BHAJJI','WFN030','BHAJJI',1,NULL,'2014-04-07 22:53:55','2014-04-07 22:53:55',1,1,6,0,NULL),(1446,54,'CHILLI GREEN',NULL,'CHILLI GREEN','WFN029','CG',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1447,54,'CHILLI SMALL GREEN',NULL,'CHILLI SMALL GREEN','WFN031','CS',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1448,54,'CHINESE CABBAGE',NULL,'CHINESE CABBAGE','WFN112','chinese cabb',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1449,54,'CHOW CHOW (BANGALORE BRINJAL)',NULL,'CHOW CHOW (BANGALORE BRINJAL)','WFN023','CHOW',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1450,54,'CHRYSANTHAMUM FLOWER',NULL,'CHRYSANTHAMUM FLOWER','WFN601','flowerchry',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1451,54,'CLUSTER BEANS (Gori Kaayi)',NULL,'CLUSTER BEANS (Gori Kaayi)','WFN009','cluster',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1452,54,'COCCINIEA (Thondeykaayi)',NULL,'COCCINIEA (Thondeykaayi)','WFN044','coccinia',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1453,54,'COCONUT LARGE',NULL,'COCONUT LARGE','WFN314','large coconut',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1454,54,'COCONUT MEDIUM - RETAIL',NULL,'COCONUT MEDIUM - RETAIL','WFN315','coconut',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1455,54,'COCONUT SMALL',NULL,'COCONUT SMALL','WFN316','small coconut',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1456,54,'COCONUT UNGRADED',NULL,'COCONUT UNGRADED','W00003','ungr coconut',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1457,56,'CORIANDER',NULL,'CORIANDER','T00046',NULL,1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1458,56,'CORN FLOUR NANDI',NULL,'CORN FLOUR NANDI','T00050',NULL,1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1459,54,'CORRIANDER  LEAVES - NATI - 100 G',NULL,'CORRIANDER  LEAVES - NATI - 100 G','WFN205','naticorr',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1460,54,'CORRIANDER LEAVES - 100 G',NULL,'CORRIANDER LEAVES - 100 G','WFN204','corr100g',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1461,54,'CUCUMBER',NULL,'CUCUMBER','W00006','cucu',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1462,54,'CUCUMBER KAKADI',NULL,'CUCUMBER KAKADI','WFN037','kakadi',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1463,54,'CUCUMBER MANGALORE',NULL,'CUCUMBER MANGALORE','WFN039','mc',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1464,54,'CUCUMBER SLICES 250 GMS',NULL,'CUCUMBER SLICES 250 GMS','WFN710','slices cucu',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1465,54,'CURRY LEAF - 50 G',NULL,'CURRY LEAF - 50 G','WFN206','curry',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1466,54,'CUSTARD APPLE',NULL,'CUSTARD APPLE','WFN431','custard',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1467,54,'DILL LEAVES - 100 G',NULL,'DILL LEAVES - 100 G','WFN209','dill',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1468,54,'DOUBLE BEANS TP',NULL,'DOUBLE BEANS TP','T00000021','tp double',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1469,56,'DRAGIN',NULL,'DRAGIN','T00049',NULL,1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1470,54,'DRUMSTICK',NULL,'DRUMSTICK','WFN053','drum',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1471,54,'EGG',NULL,'EGG','T00032','egg',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1472,54,'ENGLISH CUCUMBER',NULL,'ENGLISH CUCUMBER','WFN040','engcucu',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1473,61,'FERRERO ROCHER 200G',NULL,'FERRERO ROCHER 200G','8000500003787',NULL,1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1474,54,'FIG',NULL,'FIG','WFN463','fig',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1475,54,'FOREST BITTER GOURD-CANTOLA',NULL,'FOREST BITTER GOURD-CANTOLA','WFN130','cantola',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1476,62,'FURTUNE 1 LT',NULL,'FURTUNE 1 LT','8906007280242',NULL,1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1477,54,'GARLIC INDIAN - BIG - RETAIL',NULL,'GARLIC INDIAN - BIG - RETAIL','WFN317','garlic',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1478,54,'GARLIC INDIAN - BITS',NULL,'GARLIC INDIAN - BITS','WFN319','bits garlic',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1479,54,'GARLIC INDIAN - MEDIUM',NULL,'GARLIC INDIAN - MEDIUM','WFN318','med garlic',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1480,54,'GARLIC INDIAN - UNGRADED',NULL,'GARLIC INDIAN - UNGRADED','W00004','ungr garlic',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1481,54,'GARLIC PEELED (KG)',NULL,'GARLIC PEELED (KG)','WFN129','peeled garlic',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1482,54,'GARLIC PEELED 100 GM',NULL,'GARLIC PEELED 100 GM','WFN128','peeled garlic -100g',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1483,54,'GINGER - DRY',NULL,'GINGER - DRY','WFN321','ginger dry',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1484,54,'GINGER BITS',NULL,'GINGER BITS','WFN322','bits ginger',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1485,54,'GINGER DRY UNGRADED',NULL,'GINGER DRY UNGRADED','WFN320','ungr ginger dry',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1486,54,'GINGER FRESH - BITS',NULL,'GINGER FRESH - BITS','WFN325','bits fresh ginger',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1487,54,'GINGER FRESH - MEDIUM',NULL,'GINGER FRESH - MEDIUM','WFN326','med ginger fresh',1,NULL,'2014-04-07 22:53:56','2014-04-07 22:53:56',1,1,6,0,NULL),(1488,54,'GINGER FRESH - UNGRADED',NULL,'GINGER FRESH - UNGRADED','WFN324','ungr ginger fresh',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1489,54,'GINGER FRESH -BIG - RETAIL',NULL,'GINGER FRESH -BIG - RETAIL','WFN323','ginger fresh',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1490,54,'GOBI MUTTER 250 GM',NULL,'GOBI MUTTER 250 GM','WFN711','mutter mix',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1491,62,'GOLD WINNER 1 LT',NULL,'GOLD WINNER 1 LT','8906010261078',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1492,54,'GONGURA LEAVES - 100 G',NULL,'GONGURA LEAVES - 100 G','WFN213','gongura',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1493,53,'GOOD LIFE 500 ML',NULL,'GOOD LIFE 500 ML','8906036670410',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1494,54,'GOOSEBERRY AMLA',NULL,'GOOSEBERRY AMLA','WFN074','amla',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1495,54,'GRAPEFRUIT - (CHAKKOTHA)',NULL,'GRAPEFRUIT - (CHAKKOTHA)','WFN433','chakkotha',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1496,54,'GRAPES BANGALORE BLUE',NULL,'GRAPES BANGALORE BLUE','WFN434','gbb',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1497,54,'GRAPES BLACK SEEDLESS',NULL,'GRAPES BLACK SEEDLESS','WFN435','gblk',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1498,54,'GRAPES FLAME SEEDLESS',NULL,'GRAPES FLAME SEEDLESS','WFN436','gfl',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1499,54,'GRAPES GREEN SEEDED',NULL,'GRAPES GREEN SEEDED','WFN437','grapes green seed',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1500,54,'GRAPES IMPORTED (RED GLOBE)',NULL,'GRAPES IMPORTED (RED GLOBE)','WFN425','gred',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1501,54,'GRAPES RED GLOBE LOCAL',NULL,'GRAPES RED GLOBE LOCAL','WFN468','redglobe local',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1502,54,'GRAPES SONAKA SEEDLESS',NULL,'GRAPES SONAKA SEEDLESS','WFN438','gs',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1503,54,'GRAPES THOMSON SEEDLESS',NULL,'GRAPES THOMSON SEEDLESS','WFN440','gt',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1504,54,'GREEN PEAS',NULL,'GREEN PEAS','WFN011','gp',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1505,56,'GROUD NUT',NULL,'GROUD NUT','T00048',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1506,54,'GROUND NUT FRESH',NULL,'GROUND NUT FRESH','WFN061','gdnut',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1507,54,'GUAVA',NULL,'GUAVA','WFN421','guava',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1508,63,'HARPIC 1 LT',NULL,'HARPIC 1 LT','8901396173601',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1509,54,'INDIAN LITCHI',NULL,'INDIAN LITCHI','WFN447','litchi-ind',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1510,54,'JACKFRUIT PIECES 200GM TP',NULL,'JACKFRUIT PIECES 200GM TP','WFN702','slices jack',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1511,56,'JAGGARRY ROUND',NULL,'JAGGARRY ROUND','T00051',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1512,54,'JAMUN 250 GM PACK',NULL,'JAMUN 250 GM PACK','WFN466','jamun',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1513,54,'JASMINE FLOWER',NULL,'JASMINE FLOWER','WFN602','flowerjas',1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1514,56,'JEERA 100 G',NULL,'JEERA 100 G','T00055',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1515,56,'JOGGARY SQUARE',NULL,'JOGGARY SQUARE','T00052',NULL,1,NULL,'2014-04-07 22:53:57','2014-04-07 22:53:57',1,1,6,0,NULL),(1516,64,'KIMS EGG NOODLES 160 G',NULL,'KIMS EGG NOODLES 160 G','8908002296501',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1517,64,'KIMS EGG NOOGLES 400 G',NULL,'KIMS EGG NOOGLES 400 G','8908002296822',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1518,64,'KIMS EGG NOOGLES 800 G',NULL,'KIMS EGG NOOGLES 800 G','8908002296839',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1519,64,'KIMS TENDOR VEGETARIAN 160 G',NULL,'KIMS TENDOR VEGETARIAN 160 G','8908002296112',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1520,64,'KIMS VEG NOODLES 400 G',NULL,'KIMS VEG NOODLES 400 G','8908002296815',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1521,64,'KIMS VEG NOODLES 800G',NULL,'KIMS VEG NOODLES 800G','8908002296006',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1522,61,'KINDOR JOY 20G',NULL,'KINDOR JOY 20G','80310891',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1523,54,'KINNOW ORANGE',NULL,'KINNOW ORANGE','WFN417','kinnow',1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1524,54,'KIWI IMPORTED',NULL,'KIWI IMPORTED','WFN441','kiwi',1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1525,54,'KIWI PACKED (2 Nos)',NULL,'KIWI PACKED (2 Nos)','WFN442','packed kiwi',1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1526,54,'KNOL KHOL',NULL,'KNOL KHOL','WFN059','knol',1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1527,54,'KOMBO CORIANDER & CURRY LEAVES',NULL,'KOMBO CORIANDER & CURRY LEAVES','T00000017','combo-corcurry',1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1528,65,'KWALITY   COCOA POWDER',NULL,'KWALITY   COCOA POWDER','8906014900270',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1529,65,'KWALITY   GARAM MASALA 50 GM',NULL,'KWALITY   GARAM MASALA 50 GM','8906014900409',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1530,65,'KWALITY   JAL JIRA 100 G',NULL,'KWALITY   JAL JIRA 100 G','8906014900454',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1531,65,'KWALITY   NOODLES MASALA 50G',NULL,'KWALITY   NOODLES MASALA 50G','8906014900621',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1532,65,'KWALITY  ACTIVE DRY YEAST 25 G',NULL,'KWALITY  ACTIVE DRY YEAST 25 G','8906014900348',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1533,65,'KWALITY  BADAM MILK MIX 170 GM',NULL,'KWALITY  BADAM MILK MIX 170 GM','8906014902052',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1534,65,'KWALITY  BAKING POWDER 50 GM',NULL,'KWALITY  BAKING POWDER 50 GM','8906014900058',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1535,65,'KWALITY  BIRYANI PULAV MASALA 50 G',NULL,'KWALITY  BIRYANI PULAV MASALA 50 G','8906014900089',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1536,65,'KWALITY  CHAT MASALA 50 GM',NULL,'KWALITY  CHAT MASALA 50 GM','8906014900157',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1537,65,'KWALITY  CHHOLE MASALA 50 GM',NULL,'KWALITY  CHHOLE MASALA 50 GM','8906014900126',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1538,65,'KWALITY  CHICKEN MASALA 100 GM',NULL,'KWALITY  CHICKEN MASALA 100 GM','8906014902458',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1539,65,'KWALITY  CHOCO FLAKES 100 G',NULL,'KWALITY  CHOCO FLAKES 100 G','8906014901611',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1540,65,'KWALITY  CORN FLAKES 200 GM',NULL,'KWALITY  CORN FLAKES 200 GM','8906014900959',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1541,65,'KWALITY  CORN FLOUR 100 GM',NULL,'KWALITY  CORN FLOUR 100 GM','8906014900324',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1542,65,'KWALITY  CUSTARD POWDER 100 GM',NULL,'KWALITY  CUSTARD POWDER 100 GM','8906014900331',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1543,65,'KWALITY  DRY MANGO POWDER 100 GM',NULL,'KWALITY  DRY MANGO POWDER 100 GM','8906014900027',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1544,65,'KWALITY  GOBI MANCHURIAN MASALA 125 GM',NULL,'KWALITY  GOBI MANCHURIAN MASALA 125 GM','8906014900423',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1545,65,'KWALITY  GOBI MANCHURIAN MASALA 50 GM',NULL,'KWALITY  GOBI MANCHURIAN MASALA 50 GM','8906014901109',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1546,65,'KWALITY  GULAB JAMUN 200 GM',NULL,'KWALITY  GULAB JAMUN 200 GM','8906014902588',NULL,1,NULL,'2014-04-07 22:53:58','2014-04-07 22:53:58',1,1,6,0,NULL),(1547,65,'KWALITY  KITCHEN KING 100 GM',NULL,'KWALITY  KITCHEN KING 100 GM','8906014900553',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1548,65,'KWALITY  SOYA CHUNKS 200 G',NULL,'KWALITY  SOYA CHUNKS 200 G','8906014901352',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1549,65,'KWALITY  WHITE PEPPER 100 GM',NULL,'KWALITY  WHITE PEPPER 100 GM','8906014900904',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1550,65,'KWALITY  YUMMY CHOCO FLAKES  375 M',NULL,'KWALITY  YUMMY CHOCO FLAKES  375 M','8906014902564',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1551,65,'KWALITY BLACK PEPPER POWDER 100 GM',NULL,'KWALITY BLACK PEPPER POWDER 100 GM','8906014900096',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1552,65,'KWALITY CORN FLAKES 357 GM',NULL,'KWALITY CORN FLAKES 357 GM','8906014902366',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1553,65,'KWALITY GRAM MASALA 100 GM',NULL,'KWALITY GRAM MASALA 100 GM','8906014902434',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1554,65,'KWALITY MASALA  15 GM',NULL,'KWALITY MASALA  15 GM','8906014901369',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1555,65,'KWALITY SAMBAR POWDER 100 GM',NULL,'KWALITY SAMBAR POWDER 100 GM','8906014902441',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1556,54,'LEEK',NULL,'LEEK','WFN103','leek',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1557,54,'LEMON',NULL,'LEMON','WFN032','lemon',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1558,54,'LEMONGRASS (KG)',NULL,'LEMONGRASS (KG)','WFN122','lemongrass',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1559,54,'LETTUCE ICEBERG',NULL,'LETTUCE ICEBERG','WFN106','iceberg',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1560,54,'LETTUCE LEAFY GREEN',NULL,'LETTUCE LEAFY GREEN','WFN104','lettuce',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1561,54,'LETTUCE LEAFY RED (KG)',NULL,'LETTUCE LEAFY RED (KG)','WFN105','lettuce red',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1562,63,'LIZOL 975 ML',NULL,'LIZOL 975 ML','8901396139171',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1563,63,'LIZOL JASMIN 975 ML',NULL,'LIZOL JASMIN 975 ML','8901396138549',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1564,54,'LONGAN',NULL,'LONGAN','WFN443','longan',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1565,53,'MAGGI NOODLES',NULL,'MAGGI NOODLES','8901058814620',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1566,53,'MAGGI VEGETABLE ATTA NOODLES',NULL,'MAGGI VEGETABLE ATTA NOODLES','8901058138054',NULL,1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1567,54,'MANGO ALPHANSO',NULL,'MANGO ALPHANSO','WFN448','alphonso',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1568,54,'MANGO ALPHANSO HALF DOZEN CP',NULL,'MANGO ALPHANSO HALF DOZEN CP','WFN449','alphonsohalfdozen',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1569,54,'MANGO BADAMI',NULL,'MANGO BADAMI','WFN450','badami',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1570,54,'MANGO BANGANAPALLI',NULL,'MANGO BANGANAPALLI','WFN451','banganappalii',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1571,54,'MANGO CHAUSA',NULL,'MANGO CHAUSA','WFN452','chausa',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1572,54,'MANGO DUSSHERI',NULL,'MANGO DUSSHERI','WFN453','dusseri',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1573,54,'MANGO GINGER',NULL,'MANGO GINGER','WFN065','mango ginger',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1574,54,'MANGO LANGDA',NULL,'MANGO LANGDA','WFN454','langda',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1575,54,'MANGO LEAF',NULL,'MANGO LEAF','WFN603','mango leaf',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1576,54,'MANGO MALGOA',NULL,'MANGO MALGOA','WFN455','malgoa',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1577,54,'MANGO MALLIKA',NULL,'MANGO MALLIKA','WFN456','mallika',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1578,54,'MANGO NEELAM',NULL,'MANGO NEELAM','WFN457','neelam',1,NULL,'2014-04-07 22:53:59','2014-04-07 22:53:59',1,1,6,0,NULL),(1579,54,'MANGO RASPURI',NULL,'MANGO RASPURI','WFN458','raspuri',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1580,54,'MANGO SINDHURA',NULL,'MANGO SINDHURA','WFN459','sindura',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1581,54,'MANGO SUGARBABY',NULL,'MANGO SUGARBABY','WFN460','sugarbaby',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1582,54,'MANGO TOTAPURI',NULL,'MANGO TOTAPURI','WFN461','totatpuri',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1583,54,'MANGOSTEEN',NULL,'MANGOSTEEN','WFN444','mangosteen',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1584,54,'MARIGOLD FLOWER',NULL,'MARIGOLD FLOWER','WFN605','flowermari',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1585,54,'MELODY MELON',NULL,'MELODY MELON','WFN432','melody',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1586,56,'MENTHI 100 G',NULL,'MENTHI 100 G','T00056',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1587,54,'METHI LEAVES-200G',NULL,'METHI LEAVES-200G','WFN210','methi',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1588,66,'MILK CLASSIC 400 G',NULL,'MILK CLASSIC 400 G','8904043540047',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1589,54,'MINT LEAVES  - 100 G',NULL,'MINT LEAVES  - 100 G','WFN207','mint',1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1590,66,'MODERN ATTA SHAKTI 400 G',NULL,'MODERN ATTA SHAKTI 400 G','8904043540054',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1591,66,'MODERN BREAD N BUTTER 400 G',NULL,'MODERN BREAD N BUTTER 400 G','8904043540108',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1592,66,'MODERN BROWN BREAD',NULL,'MODERN BROWN BREAD','8904043540115',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1593,66,'MODERN CHAPATHI',NULL,'MODERN CHAPATHI','8748063360045',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1594,66,'MODERN CHOCOLATE CAKE',NULL,'MODERN CHOCOLATE CAKE','8904043550237',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1595,66,'MODERN CUP CAKE 80 G',NULL,'MODERN CUP CAKE 80 G','8904043540214',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1596,66,'MODERN FRUIT BREAD',NULL,'MODERN FRUIT BREAD','8904043540078',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1597,66,'MODERN KREAM ROLL',NULL,'MODERN KREAM ROLL','8904043540566',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1598,66,'MODERN PAV 200 G',NULL,'MODERN PAV 200 G','8904043540511',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1599,66,'MODERN SWEET BREAD',NULL,'MODERN SWEET BREAD','8904043540023',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1600,66,'MODERN SWEET BUN 200 G',NULL,'MODERN SWEET BUN 200 G','8904043540528',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1601,66,'MODERN WHITE SANDWICH BREAD 400 G',NULL,'MODERN WHITE SANDWICH BREAD 400 G','8904043540016',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1602,66,'MODERN WHOLE WHEAT BREAD',NULL,'MODERN WHOLE WHEAT BREAD','3331043330098',NULL,1,NULL,'2014-04-07 22:54:00','2014-04-07 22:54:00',1,1,6,0,NULL),(1603,66,'MODREN FRUIT CAKE',NULL,'MODREN FRUIT CAKE','8904043550220',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1604,66,'MODREN PREMIUM BREAD',NULL,'MODREN PREMIUM BREAD','8904043540085',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1605,66,'MODREN SWEET RUSK 200G',NULL,'MODREN SWEET RUSK 200G','8904043540498',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1606,66,'MODREN WHOLE WHEAT BREAD',NULL,'MODREN WHOLE WHEAT BREAD','8904043540153',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1607,54,'MOSAMBI',NULL,'MOSAMBI','WFN402','mosambi',1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1608,54,'MOSAMBI JUICE SMALL',NULL,'MOSAMBI JUICE SMALL','WFN470','smallmosambi',1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1609,67,'MTR BENNE MURUKKU',NULL,'MTR BENNE MURUKKU','8901042966069',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1610,67,'MTR BISIBELE BHATH',NULL,'MTR BISIBELE BHATH','8901042954882',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1611,67,'MTR CHILLY POWDER',NULL,'MTR CHILLY POWDER','8901042963921',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1612,67,'MTR CHOW CHOW MISTURE',NULL,'MTR CHOW CHOW MISTURE','8901042966090',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1613,67,'MTR CORNFLAKES MIXTURE',NULL,'MTR CORNFLAKES MIXTURE','8901042965673',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1614,67,'MTR DHANIYA CORIANDER POWDER',NULL,'MTR DHANIYA CORIANDER POWDER','8901042963969',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1615,67,'MTR DOSA',NULL,'MTR DOSA','8901042957968',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1616,67,'MTR GULAB JAMUN',NULL,'MTR GULAB JAMUN','8901042961323',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1617,67,'MTR GULAB JAMUN 100 G',NULL,'MTR GULAB JAMUN 100 G','8901042954561',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1618,67,'MTR GULAB JAMUN 500 G',NULL,'MTR GULAB JAMUN 500 G','8901042961194',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1619,67,'MTR HALDI TURMERIC POWDER',NULL,'MTR HALDI TURMERIC POWDER','8901042963938',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1620,67,'MTR KHARA BOONDI',NULL,'MTR KHARA BOONDI','8901042965857',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1621,67,'MTR LIME',NULL,'MTR LIME','8901042955087',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1622,67,'MTR MANGO SLICES',NULL,'MTR MANGO SLICES','8901042955094',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1623,67,'MTR MANGO TENDER',NULL,'MTR MANGO TENDER','8901042955049',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1624,67,'MTR MASALA P',NULL,'MTR MASALA P','8901042956510',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1625,67,'MTR MULTIGRAM DOSA',NULL,'MTR MULTIGRAM DOSA','8901042964478',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1626,67,'MTR OATS IDLY',NULL,'MTR OATS IDLY','8901042964430',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1627,67,'MTR ONION NIBBLES',NULL,'MTR ONION NIBBLES','8901042966007',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1628,67,'MTR PLAIN PAPAD',NULL,'MTR PLAIN PAPAD','8901042956497',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1629,67,'MTR RASAM MIX',NULL,'MTR RASAM MIX','8901042954578',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1630,67,'MTR RASAM POWDER',NULL,'MTR RASAM POWDER','8901042954745',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1631,67,'MTR RASOGOLLA',NULL,'MTR RASOGOLLA','8901042961200',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1632,67,'MTR RAVA IDLY',NULL,'MTR RAVA IDLY','8901042954516',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1633,67,'MTR RAVA IDLY 200 G',NULL,'MTR RAVA IDLY 200 G','8901042954523',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1634,67,'MTR RICE SEVAI VERMICELLI',NULL,'MTR RICE SEVAI VERMICELLI','8901042962504',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1635,67,'MTR RST VERMICELLI',NULL,'MTR RST VERMICELLI','8901042964379',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1636,67,'MTR RST VERMICELLI 430 G',NULL,'MTR RST VERMICELLI 430 G','8901042964362',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1637,67,'MTR SAMBER MIX',NULL,'MTR SAMBER MIX','8901042954585',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1638,67,'MTR SAMBER POWDER',NULL,'MTR SAMBER POWDER','8901042966489',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1639,67,'MTR UPMA',NULL,'MTR UPMA','8901042965543',NULL,1,NULL,'2014-04-07 22:54:01','2014-04-07 22:54:01',1,1,6,0,NULL),(1640,67,'MTR VADA',NULL,'MTR VADA','8901042954653',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1641,67,'MTR VANGI BHATH',NULL,'MTR VANGI BHATH','8901042954769',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1642,67,'MTR VERMICELLI 165 G',NULL,'MTR VERMICELLI 165 G','8901042965468',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1643,67,'MTR VERMICELLI 400 G',NULL,'MTR VERMICELLI 400 G','8901042965451',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1644,67,'MTR VERMICELLI 900 G',NULL,'MTR VERMICELLI 900 G','8901042965444',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1645,54,'MUSK MELON',NULL,'MUSK MELON','WFN419','musk',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1646,56,'MUSTARD',NULL,'MUSTARD','T00053',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1647,53,'NESTLE BAR ONE',NULL,'NESTLE BAR ONE','8901058819274',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1648,53,'NESTLE CARAMEL ECLAIRS',NULL,'NESTLE CARAMEL ECLAIRS','8901058821314',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1649,53,'NESTLE MILKY BAR',NULL,'NESTLE MILKY BAR','89005743',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1650,53,'NESTLE MUNCH',NULL,'NESTLE MUNCH','89006122',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1651,53,'NESTLE MUNCH 3.6 G',NULL,'NESTLE MUNCH 3.6 G','89005958',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1652,53,'NESTLE RED ECLARIS 312 G',NULL,'NESTLE RED ECLARIS 312 G','8901058820782',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1653,61,'NUTELLA 140 GM',NULL,'NUTELLA 140 GM','8000500163900',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1654,61,'NUTELLA 350 GM',NULL,'NUTELLA 350 GM','80177173',NULL,1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1655,54,'OKRA (Ladys Finger)',NULL,'OKRA (Ladys Finger)','WFN021','okra',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1656,54,'OKRA - SECONDS',NULL,'OKRA - SECONDS','WFN022','seconds okra',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1657,54,'ONION 3 KG ECONOMY',NULL,'ONION 3 KG ECONOMY','WFN304','3kg onion economy',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1658,54,'ONION ECONOMY - RETAIL',NULL,'ONION ECONOMY - RETAIL','WFN301','OE',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1659,54,'ONION PREMIUM LARGE',NULL,'ONION PREMIUM LARGE','WFN303','onion large',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1660,54,'ONION SAMBAR',NULL,'ONION SAMBAR','WFN048','sambar onion',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1661,54,'ONION SMALL',NULL,'ONION SMALL','WFN305','OS',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1662,54,'ONION UNGRADED',NULL,'ONION UNGRADED','WFN302','ungr onion',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1663,54,'ONION WHITE',NULL,'ONION WHITE','WFN306','white onion',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1664,54,'ORANGE',NULL,'ORANGE','WFN418','orange ind',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1665,54,'ORANGE IMPORTED',NULL,'ORANGE IMPORTED','WFN416','orange imp',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1666,54,'ORANGE JUICE SMALL',NULL,'ORANGE JUICE SMALL','WFN469','small orange',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1667,54,'PACKCHOY',NULL,'PACKCHOY','WFN115','packchoy',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1668,54,'PAPAYA',NULL,'PAPAYA','WFN414','papaya',1,NULL,'2014-04-07 22:54:02','2014-04-07 22:54:02',1,1,6,0,NULL),(1669,54,'PAPAYA JUICE SMALL',NULL,'PAPAYA JUICE SMALL','WFN471','small papaya',1,NULL,'2014-04-07 22:54:03','2014-04-07 22:54:03',1,1,6,0,NULL),(1670,54,'PARSLEY',NULL,'PARSLEY','WFN111','parsley',1,NULL,'2014-04-07 22:54:03','2014-04-07 22:54:03',1,1,6,0,NULL),(1671,54,'PEARS CHINA IMPORTED',NULL,'PEARS CHINA IMPORTED','WFN427','pears china',1,NULL,'2014-04-07 22:54:03','2014-04-07 22:54:03',1,1,6,0,NULL),(1672,54,'PEARS IMPORTED GREEN',NULL,'PEARS IMPORTED GREEN','WFN426','imp pears green',1,NULL,'2014-04-07 22:54:03','2014-04-07 22:54:03',1,1,6,0,NULL),(1673,54,'PEARS IMPORTED RED',NULL,'PEARS IMPORTED RED','WFN428','imp pears red',1,NULL,'2014-04-07 22:54:03','2014-04-07 22:54:03',1,1,6,0,NULL),(1674,54,'PEARS INDIAN',NULL,'PEARS INDIAN','WFN429','indian pears',1,NULL,'2014-04-07 22:54:03','2014-04-07 22:54:03',1,1,6,0,NULL),(1675,56,'PEPPER 100 G',NULL,'PEPPER 100 G','T00057',NULL,1,NULL,'2014-04-08 08:06:31','2014-04-08 08:06:31',1,1,6,0,NULL),(1676,54,'PINE APPLE QUEEN',NULL,'PINE APPLE QUEEN','WFN422','pine',1,NULL,'2014-04-08 08:06:31','2014-04-08 08:06:31',1,1,6,0,NULL),(1677,54,'PINEAPPLE CLEANED & WRAPPED TP',NULL,'PINEAPPLE CLEANED & WRAPPED TP','WFN712','slices pineapple',1,NULL,'2014-04-08 08:06:31','2014-04-08 08:06:31',1,1,6,0,NULL),(1678,54,'PINEAPPLE WHOLE PEELED',NULL,'PINEAPPLE WHOLE PEELED','WFN703','whole pineapple',1,NULL,'2014-04-08 08:06:31','2014-04-08 08:06:31',1,1,6,0,NULL),(1679,54,'PLUM IMPORTED',NULL,'PLUM IMPORTED','WFN445','plum imp',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1680,54,'PLUM INDIAN',NULL,'PLUM INDIAN','WFN464','plum ind',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1681,54,'POINTED GOURD PARWAL',NULL,'POINTED GOURD PARWAL','WFN045','parwal',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1682,54,'POMEGRANATE BHAGWA',NULL,'POMEGRANATE BHAGWA','WFN424','pomo',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1683,54,'POMEGRANATE GANESH',NULL,'POMEGRANATE GANESH','WFN423','ganesh',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1684,54,'POMEGRANATE SHELLED 100GM TP',NULL,'POMEGRANATE SHELLED 100GM TP','WFN704','shelled pomo',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1685,54,'POTATO 3 KG ECONOMY',NULL,'POTATO 3 KG ECONOMY','WFN311','2kg pot',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1686,54,'POTATO BABY',NULL,'POTATO BABY','WFN313','baby potato',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1687,54,'POTATO ECONOMY - RETAIL',NULL,'POTATO ECONOMY - RETAIL','WFN308','pe',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1688,54,'POTATO PREMIUM',NULL,'POTATO PREMIUM','WFN312','premium potato',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1689,54,'POTATO PREMIUM LARGE',NULL,'POTATO PREMIUM LARGE','WFN309','large potato',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1690,54,'POTATO SMALL',NULL,'POTATO SMALL','WFN310','small potato',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1691,54,'POTATO UNGRADED',NULL,'POTATO UNGRADED','WFN307','ungr potato',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1692,54,'PUMPKIN COUNTRY',NULL,'PUMPKIN COUNTRY','WFN050','pum',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1693,54,'PUMPKIN DISCO',NULL,'PUMPKIN DISCO','WFN049','disco',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1694,54,'RADDISH RED',NULL,'RADDISH RED','WFN123','red radd',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1695,54,'RADDISH WHITE',NULL,'RADDISH WHITE','WFN057','radd',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1696,54,'RADDISH WHITE WITH  LEAFY',NULL,'RADDISH WHITE WITH  LEAFY','T00000005','radd leafy',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1697,54,'RAMBUTAN IMPORTED',NULL,'RAMBUTAN IMPORTED','WFN446','rambutan',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1698,54,'RAW MANGO',NULL,'RAW MANGO','WFN072','raw mango',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1699,67,'READY TO EAT CHANNA MASALA',NULL,'READY TO EAT CHANNA MASALA','8901042956008',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1700,57,'READY TO EAT DAL FRY',NULL,'READY TO EAT DAL FRY','8901042955988',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1701,67,'READY TO EAT KESARI BHATH',NULL,'READY TO EAT KESARI BHATH','8901042959146',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1702,67,'READY TO EAT MASALA RICE',NULL,'READY TO EAT MASALA RICE','8901042956756',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1703,67,'READY TO EAT MIXED VEG CURRY',NULL,'READY TO EAT MIXED VEG CURRY','8901042956015',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1704,67,'READY TO EAT MUTTER PANEER',NULL,'READY TO EAT MUTTER PANEER','8901042957852',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1705,67,'READY TO EAT PANEER MAKHANI',NULL,'READY TO EAT PANEER MAKHANI','8901042956275',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1706,67,'READY TO EAT PANEER TIKKA MASALA',NULL,'READY TO EAT PANEER TIKKA MASALA','8901042959191',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1707,67,'READY TO EAT PAV BHAJI',NULL,'READY TO EAT PAV BHAJI','8901042957340',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1708,67,'READY TO EAT PONGAL',NULL,'READY TO EAT PONGAL','8901042955957',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1709,67,'READY TO EAT RAJMA MASALA',NULL,'READY TO EAT RAJMA MASALA','8901042956213',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1710,67,'READY TO EAT RASA RICE',NULL,'READY TO EAT RASA RICE','8901042957715',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1711,67,'READY TO EAT VEG PUALO',NULL,'READY TO EAT VEG PUALO','8901042956800',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1712,67,'REATY TO EAT BISIBELE BHATH',NULL,'REATY TO EAT BISIBELE BHATH','8901042955964',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1713,67,'REATY TO EAT DAL MAKHANI',NULL,'REATY TO EAT DAL MAKHANI','8901042957517',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1714,56,'RED CHILLI GUNTUR',NULL,'RED CHILLI GUNTUR','T00045',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1715,56,'RICE AMMA BRAND',NULL,'RICE AMMA BRAND','T00043',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1716,56,'RICE KALKI BRAND',NULL,'RICE KALKI BRAND','T00041',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1717,56,'RICE MEERA BRAND',NULL,'RICE MEERA BRAND','T00042',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1718,54,'RIDGE GOURD',NULL,'RIDGE GOURD','WFN041','ridge',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1719,54,'ROSE FLOWER',NULL,'ROSE FLOWER','WFN606','flowerrose',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1720,62,'SAFAL 1 LT',NULL,'SAFAL 1 LT','8908000120280',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1721,54,'SAMBAR ONION  PEELED (KG)',NULL,'SAMBAR ONION  PEELED (KG)','WFN127','peeled sambar onion',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1722,54,'SAMBAR ONION  PEELED 150g',NULL,'SAMBAR ONION  PEELED 150g','WFN126','peeled sambar onion - 150g',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1723,54,'SAPOTA ROUND',NULL,'SAPOTA ROUND','WFN415','sapota',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1724,54,'SLICED MUSK MELON',NULL,'SLICED MUSK MELON','WFN705','sliced musk',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1725,54,'SLICED PAPAYA',NULL,'SLICED PAPAYA','WFN706','sliced papaya',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1726,54,'SMALL COLOCASSIA (Kesuvina Geddey)',NULL,'SMALL COLOCASSIA (Kesuvina Geddey)','WFN062','colocasia',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1727,54,'SNAKE GOURD LONG',NULL,'SNAKE GOURD LONG','WFN047','snake long',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1728,54,'SNAKE GOURD SMALL HYBRID',NULL,'SNAKE GOURD SMALL HYBRID','WFN046','snake small',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1729,53,'SNICKERS',NULL,'SNICKERS','6294001819226',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1730,56,'SOOJI LOCAL',NULL,'SOOJI LOCAL','T00047',NULL,1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1731,54,'SPINACH LEAVES (Palak) - 200G',NULL,'SPINACH LEAVES (Palak) - 200G','WFN212','palak',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1732,54,'SPRING ONION - 200G',NULL,'SPRING ONION - 200G','WFN211','SPRING',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1733,54,'SPROUTS BROWN CHANNA - 200 GM',NULL,'SPROUTS BROWN CHANNA - 200 GM','WFN503','sprouts channa',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1734,54,'SPROUTS CHAAT I 125 GM BOWL',NULL,'SPROUTS CHAAT I 125 GM BOWL','WFN509','sprouts chaat',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1735,54,'SPROUTS GREEN GRAM - 200 GM',NULL,'SPROUTS GREEN GRAM - 200 GM','WFN501','sprouts green gram',1,NULL,'2014-04-08 08:06:32','2014-04-08 08:06:32',1,1,6,0,NULL),(1736,54,'SPROUTS GREEN PEAS - 200 GM',NULL,'SPROUTS GREEN PEAS - 200 GM','WFN504','sprouts green peas',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1737,54,'SPROUTS HORSE GRAM - 200 GM',NULL,'SPROUTS HORSE GRAM - 200 GM','WFN502','sprouts horse',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1738,54,'SPROUTS KABUL CHANNA - 200 GM',NULL,'SPROUTS KABUL CHANNA - 200 GM','WFN507','sprouts kabul',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1739,54,'SPROUTS LOBIA - 200 GM',NULL,'SPROUTS LOBIA - 200 GM','WFN505','sprouts lobia',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1740,54,'SPROUTS MIX GRAM - 200 GM',NULL,'SPROUTS MIX GRAM - 200 GM','WFN506','sprouts mix',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1741,54,'STRAWBERRY TRAY PACK',NULL,'STRAWBERRY TRAY PACK','WFN465','strawberry',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1742,57,'SUGAR',NULL,'SUGAR','T00036',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1743,54,'SUGARCANE - 1foot',NULL,'SUGARCANE - 1foot','WFN604','sugarcane',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1744,54,'SUGARCANE PIECES  200 GM TP',NULL,'SUGARCANE PIECES  200 GM TP','WFN707','sugarcane 200g piece',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1745,68,'SUGUNA ACTIVE EGG',NULL,'SUGUNA ACTIVE EGG','8906027140038',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1746,68,'SUGUNA FRENCH FRIES',NULL,'SUGUNA FRENCH FRIES','8906027141790',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1747,68,'SUGUNA GREEN PEAS',NULL,'SUGUNA GREEN PEAS','8906027141806',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1748,68,'SUGUNA HEART EGG',NULL,'SUGUNA HEART EGG','8906027140045',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1749,57,'SUGUNA NUTRI EGG',NULL,'SUGUNA NUTRI EGG','8906027140489',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1750,68,'SUGUNA PRO EGG',NULL,'SUGUNA PRO EGG','8906027140014',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1751,68,'SUGUNA SHAKTI EGG',NULL,'SUGUNA SHAKTI EGG','8906027140021',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1752,54,'SUN MELON',NULL,'SUN MELON','WFN420','sun',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1753,62,'SUNPURE 1 LT',NULL,'SUNPURE 1 LT','8908000502017',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1754,69,'SUPER MAX 3 SWIFT',NULL,'SUPER MAX 3 SWIFT','8904055131820',NULL,1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1755,54,'SWEET BASIL (KG)',NULL,'SWEET BASIL (KG)','WFN121','swtbasil',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1756,54,'SWEET CORN AMERICAN',NULL,'SWEET CORN AMERICAN','WFN120','sca',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1757,54,'SWEET CORN PELLETS - 250 GM',NULL,'SWEET CORN PELLETS - 250 GM','WFN114','scpellets',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1758,54,'SWEET POTATO',NULL,'SWEET POTATO','WFN063','swtpot',1,NULL,'2014-04-08 08:06:33','2014-04-08 08:06:33',1,1,6,0,NULL),(1759,54,'SWEET TAMRIND 250 GM',NULL,'SWEET TAMRIND 250 GM','WFN430','swttam',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1760,54,'TAPIOCA',NULL,'TAPIOCA','WFN064','tap',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1761,54,'TINDA',NULL,'TINDA','WFN052','tinda',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1762,54,'TOMATO COUNTRY',NULL,'TOMATO COUNTRY','WFN070','TCM',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1763,54,'TOMATO HYBRID - MEDIUM - RETAIL',NULL,'TOMATO HYBRID - MEDIUM - RETAIL','WFN066','TMH',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1764,54,'TOMATO HYBRID - SMALL',NULL,'TOMATO HYBRID - SMALL','WFN068','small tom',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1765,54,'TOMATO HYBRID - UNGRADED',NULL,'TOMATO HYBRID - UNGRADED','WFN067','ungr tmt hy',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1766,54,'TOMATO PREMIUM LARGE',NULL,'TOMATO PREMIUM LARGE','WFN069','premium tom hy',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1767,57,'TOOR DAL SHIVLING',NULL,'TOOR DAL SHIVLING','T00037',NULL,1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1768,56,'TOORDAL GANESH',NULL,'TOORDAL GANESH','T00035',NULL,1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1769,54,'TURNIP',NULL,'TURNIP','WFN119','turnip',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1770,54,'VEG FOR PULAV/BIRYANI 250GM TP',NULL,'VEG FOR PULAV/BIRYANI 250GM TP','WFN713','cut biryani',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1771,54,'VEGETABLE (MIX) 200GM TP',NULL,'VEGETABLE (MIX) 200GM TP','WFN714','cut veg mix',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1772,54,'VEGETABLES FOR SAMBAR 200GM TP',NULL,'VEGETABLES FOR SAMBAR 200GM TP','WFN701','cut sambar',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1773,54,'WATERMELON KIRAN',NULL,'WATERMELON KIRAN','WFN412','kiran',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1774,54,'WATERMELON NAMDHARI',NULL,'WATERMELON NAMDHARI','WFN411','namdhari',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1775,54,'WATERMELON YELLOW',NULL,'WATERMELON YELLOW','WFN413','yellow watermelon',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1776,54,'WOOD APPLE',NULL,'WOOD APPLE','WFN467','woodapple',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1777,54,'YAM',NULL,'YAM','WFN054','yam',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1778,55,'YIPPEE NOODLES 75 G',NULL,'YIPPEE NOODLES 75 G','8901725181222',NULL,1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1779,54,'ZUCCHINI GREEN',NULL,'ZUCCHINI GREEN','WFN107','zuccini green',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1780,54,'ZUCCHINI YELLOW',NULL,'ZUCCHINI YELLOW','WFN108','zuccini yellow',1,NULL,'2014-04-08 08:06:34','2014-04-08 08:06:34',1,1,6,0,NULL),(1785,53,'AASHIRVAAD SALT','AASHIRVAAD',NULL,NULL,NULL,1,NULL,'2014-08-31 17:07:35','2014-08-31 17:07:35',14,14,4,0,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailer_category`
--

DROP TABLE IF EXISTS `retailer_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailer_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_retailer_category_category_id` (`category_id`),
  KEY `FK_retailer_category_org_id` (`org_id`),
  KEY `FK_retailer_category_zone_id` (`zone_id`),
  CONSTRAINT `FK_retailer_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_retailer_category_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_retailer_category_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer_category`
--

LOCK TABLES `retailer_category` WRITE;
/*!40000 ALTER TABLE `retailer_category` DISABLE KEYS */;
INSERT INTO `retailer_category` VALUES (1,8,1,68,1,1,'2014-07-15 16:53:47','2014-07-15 16:53:47',0),(2,8,1,69,1,1,'2014-07-15 16:53:49','2014-07-15 16:53:49',0),(3,8,1,63,1,1,'2014-07-15 16:53:51','2014-07-15 16:53:51',0),(11,36,1,60,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(12,36,1,59,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(13,37,1,62,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(14,37,1,56,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(15,37,1,68,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(16,38,1,57,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(17,38,1,58,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(18,38,1,60,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(19,38,1,59,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(20,38,1,53,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(21,38,1,54,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(22,38,1,55,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(23,38,1,64,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0),(24,38,1,61,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0);
/*!40000 ALTER TABLE `retailer_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailer_snapshot`
--

DROP TABLE IF EXISTS `retailer_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailer_snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sale_price` float NOT NULL,
  `pack_size` varchar(25) DEFAULT '0',
  `mrp` float NOT NULL,
  `bundle_price` float DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  `new_price` float DEFAULT '0',
  `composition` varchar(250) DEFAULT NULL,
  `discount` float DEFAULT '0',
  `offer` float DEFAULT '0',
  `brand_id` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `last_updated_by` int(11) DEFAULT '0',
  `object_version_number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_retailer_snapshot_product_id` (`product_id`),
  KEY `FK_retailer_snapshot_org_id` (`org_id`),
  KEY `FK_retailer_snapshot_brand_id` (`brand_id`),
  CONSTRAINT `FK_retailer_snapshot_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_retailer_snapshot_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_retailer_snapshot_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer_snapshot`
--

LOCK TABLES `retailer_snapshot` WRITE;
/*!40000 ALTER TABLE `retailer_snapshot` DISABLE KEYS */;
INSERT INTO `retailer_snapshot` VALUES (2243,1,1785,23,'100 gms',1000,60,3,23,NULL,2,2,4,NULL,'2014-08-31 17:59:54',14,14,0);
/*!40000 ALTER TABLE `retailer_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailer_zone`
--

DROP TABLE IF EXISTS `retailer_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailer_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retailer_org_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `retailer_org_id_org_id` (`retailer_org_id`),
  KEY `zone_id_zone` (`zone_id`),
  CONSTRAINT `retailer_org_id_org_id` FOREIGN KEY (`retailer_org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `zone_id_zone` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer_zone`
--

LOCK TABLES `retailer_zone` WRITE;
/*!40000 ALTER TABLE `retailer_zone` DISABLE KEYS */;
INSERT INTO `retailer_zone` VALUES (1,8,1,1,1,'2014-07-15 16:53:37','2014-07-15 16:53:37',0),(4,36,1,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(5,37,1,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(6,38,1,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0);
/*!40000 ALTER TABLE `retailer_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN',1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(2,'ROLE_RETAILER',1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(3,'ROLE_CUSTOMER',1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(4,'ROLE_USER',1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL DEFAULT '99',
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id` (`country_id`),
  CONSTRAINT `states_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,99,'Andra Pradesh'),(2,99,'Arunachal Pradesh'),(3,99,'Andaman and Nicobar Islands'),(4,99,'Assam'),(5,99,'Bihar'),(6,99,'Chandigarh'),(7,99,'Chhattisgarh'),(8,99,'Dadar and Nagar Haveli'),(9,99,'Daman and Diu'),(10,99,'Delhi'),(11,99,'Goa'),(12,99,'Gujarat'),(13,99,'Haryana'),(14,99,'Himachal Pradesh'),(15,99,'Jammu and Kashmir'),(16,99,'Jharkhand'),(17,99,'Karnataka'),(18,99,'Kerala'),(19,99,'Lakshadeep'),(20,99,'Madya Pradesh'),(21,99,'Maharashtra'),(22,99,'Manipur'),(23,99,'Meghalaya'),(24,99,'Mizoram'),(25,99,'Nagaland'),(26,99,'Orissa'),(27,99,'Pondicherry'),(28,99,'Punjab'),(29,99,'Rajasthan'),(30,99,'Sikkim'),(31,99,'Tamil Nadu'),(32,99,'Tripura'),(33,99,'Uttaranchal'),(34,99,'Uttar Pradesh'),(35,99,'West Bengal');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `operating_currency` varchar(45) DEFAULT '&#8377;',
  `timezone` varchar(45) DEFAULT 'UTC+5:30',
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `FK_user_org_id` (`org_id`),
  CONSTRAINT `FK_user_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,3,1,'admin','$2a$10$uMR24niNDhokLLwoeDn2ZeLAPiFkswEvCDwJ8lMm1yd/jmVoLa2V6',NULL,NULL,NULL,NULL,NULL,'&#8377;','UTC+5:30',1,1,'2014-04-09 00:11:15','2014-04-09 00:11:15',1),(2,1,1,'more','$2a$10$uMR24niNDhokLLwoeDn2ZeLAPiFkswEvCDwJ8lMm1yd/jmVoLa2V6',NULL,NULL,NULL,NULL,NULL,'&#8377;','UTC+5:30',1,1,'2014-04-09 00:14:23','2014-04-09 00:14:23',1),(12,5,1,'customer','$2a$10$uMR24niNDhokLLwoeDn2ZeLAPiFkswEvCDwJ8lMm1yd/jmVoLa2V6',NULL,NULL,NULL,NULL,NULL,'&#8377;','UTC+5:30',1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1),(13,2,1,'nilgiris','$2a$10$uMR24niNDhokLLwoeDn2ZeLAPiFkswEvCDwJ8lMm1yd/jmVoLa2V6',NULL,NULL,NULL,NULL,NULL,'&#8377;','UTC+5:30',1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1),(14,3,1,'mule_daemon','$2a$10$uMR24niNDhokLLwoeDn2ZeLAPiFkswEvCDwJ8lMm1yd/jmVoLa2V6',NULL,NULL,NULL,NULL,NULL,'&#8377;','UTC+5:30',1,1,'2014-04-11 23:30:43','2014-04-11 23:30:43',1),(43,36,1,'sreeharshas','$2a$10$LtPPYmsiDNeC6fH1XuB5AujyhamtJ9pamYV5BnEvsVy4.MYAnrsX6','Sreeharsha','S','M','sreeharshas@gmail.com','9886097989',NULL,NULL,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(44,37,1,'pankaj.mishra','$2a$10$tEpbdHLrB9yo.3b.gUyrEu2uxyk3cif2aYNmjCVgwpLFEhnxd4fs.','Pankaj','Mishra','M','sreeharshas@gmail.com','919886097989',NULL,NULL,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(45,38,1,'assass','$2a$10$pApxO.bDTOeGiN9uVMTjEuoatZmls7OTiMk9ylLeEfXxW6oizCoK6','SSSS','BBBB','M','','',NULL,NULL,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `primary_address` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_address_user_id` (`user_id`),
  KEY `FK_user_address_address_id` (`address_id`),
  CONSTRAINT `FK_user_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (1,12,1,1,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1),(2,12,2,0,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1),(3,12,3,0,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1),(4,2,11,1,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1),(5,1,10,1,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1),(6,13,12,1,1,1,'2014-04-11 02:44:12','2014-04-11 02:44:12',1),(7,43,46,1,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(8,44,47,1,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(9,45,50,1,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_role_user_id` (`user_id`),
  KEY `user_role_role_id` (`role_id`),
  CONSTRAINT `user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(2,2,2,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(3,2,13,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(4,4,1,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(5,4,2,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(6,4,13,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(8,3,12,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(10,2,43,1,1,'2014-07-15 21:31:14','2014-07-15 21:31:14',0),(11,2,44,1,1,'2014-07-15 23:18:19','2014-07-15 23:18:19',0),(12,2,45,1,1,'2014-08-19 02:00:37','2014-08-19 02:00:37',0);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT '441',
  `created_by` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `object_version_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `zone_city_id` (`city_id`),
  CONSTRAINT `zone_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Girinagar',441,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(2,'Srinagar',441,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(3,'Basavangudi',441,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(4,'Hanumanthanagar',441,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1),(5,'Rajarajeshwarinagar',441,1,1,'2014-04-15 21:39:26','2014-04-15 21:39:26',1);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-06  0:43:58
