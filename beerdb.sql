-- MySQL dump 10.13  Distrib 8.0.11, for Linux (x86_64)
--
-- Host: localhost    Database: beerdb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beer`
--

DROP TABLE IF EXISTS `beer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `beer` (
  `name` varchar(30) NOT NULL,
  `size` float NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `percentage` float unsigned NOT NULL,
  PRIMARY KEY (`name`,`size`),
  KEY `supplier_id_idx` (`supplier_id`),
  CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beer`
--

LOCK TABLES `beer` WRITE;
/*!40000 ALTER TABLE `beer` DISABLE KEYS */;
INSERT INTO `beer` VALUES ('Budweiser Black Crown',0.5,'Amber Lager',3.2,3,6),('Budweiser Select 55',0.5,'Light Lager',2.4,3,2.4),('Heineken',0.33,'Pale Lager',1.9,4,5),('Heineken',0.5,'Pale Lager',2.3,4,5),('Karhu III',0.5,'Pale Lager',1.3,6,4.6),('Leffe Blonde',0.5,'Belgian Ale',3,3,6.6),('Snow Beer',0.33,'Pale Lager',1,5,4),('Tuborg Grøn (Green)',0.4,'Pilsner',1.93,6,4.6);
/*!40000 ALTER TABLE `beer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Abbey','Homestreet 15'),(2,'Georgie','Ulululu alley'),(3,'Chris','Kansas street 12'),(4,'Morgan','Aleksiskiventie 3'),(5,'Homer','Andalusia road 555'),(6,'Carlos','A la Playa 2'),(7,'Winston','Devils Den 666'),(8,'Monica','Street street 2'),(9,'Jarmo','Kaskirauniontie 16'),(10,'Jorma','Vaajakatu 5'),(11,'Sharon','Madison square 497');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `name` varchar(45) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `headquarters` varchar(45) NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('Hartwall','Finland','Finland',1),('Anheuser-Busch','USA','Belgium',3),('Heineken','Netherlands','Netherlands',4),('China Resources Snow Breweries','China','China',5),('Carlsberg','Denmark','Denmark',6),('Molson Coors Brewing','Canada','Canada',7),('Tsingtao Brewery Group','China','China',8),('Asahi','Japan','Japan',9),('Yanjing','China','China',10),('Olvi','Finland','Finland',11);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `beer_name` varchar(30) NOT NULL,
  `beer_size` float unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `time` datetime(6) NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `beer_id_idx` (`beer_name`),
  KEY `FK_transaction_beer` (`beer_name`,`beer_size`),
  CONSTRAINT `FK_transaction_beer` FOREIGN KEY (`beer_name`, `beer_size`) REFERENCES `beer` (`name`, `size`),
  CONSTRAINT `beer_id` FOREIGN KEY (`beer_name`) REFERENCES `beer` (`name`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'Heineken',0.5,12,'2014-09-08 17:51:04.777000',1),(2,'Heineken',0.5,24,'2014-09-11 17:52:04.777000',1),(3,'Heineken',0.33,24,'2014-02-08 12:51:04.777000',3),(4,'Budweiser Select 55',0.5,12,'2015-09-08 17:20:04.777000',7),(5,'Leffe Blonde',0.5,30,'2014-03-08 13:51:04.777000',2),(6,'Budweiser Black Crown',0.5,12,'2016-09-08 17:51:04.777000',8),(7,'Snow Beer',0.33,1,'2014-04-08 14:51:04.777000',4),(8,'Karhu III',0.5,14,'2017-09-08 17:51:04.777000',9),(9,'Snow Beer',0.33,12,'2014-05-08 15:51:31.777000',5),(11,'Heineken',0.5,10,'2015-10-10 05:05:05.000000',3),(15,'Heineken',0.5,10,'2015-10-10 05:05:05.000000',3);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-09 14:29:53
