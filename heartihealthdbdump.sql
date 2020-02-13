CREATE DATABASE  IF NOT EXISTS `heartihealth` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `heartihealth`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: heartihealth
-- ------------------------------------------------------
-- Server version	5.5.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addressinfo`
--

DROP TABLE IF EXISTS `addressinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressinfo` (
  `address_id` int(11) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `memberinfo_member_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`,`memberinfo_member_id`),
  KEY `fk_addressinfo_memberinfo_idx` (`memberinfo_member_id`),
  CONSTRAINT `fk_addressinfo_memberinfo` FOREIGN KEY (`memberinfo_member_id`) REFERENCES `memberinfo` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressinfo`
--

LOCK TABLES `addressinfo` WRITE;
/*!40000 ALTER TABLE `addressinfo` DISABLE KEYS */;
INSERT INTO `addressinfo` VALUES (1,'bangalore','karnataka','india',560037,1),(2,'chennai','tamilnadu','india',5600089,2),(3,'banglore','karnataka','india',560037,3);
/*!40000 ALTER TABLE `addressinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodtest`
--

DROP TABLE IF EXISTS `bloodtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodtest` (
  `blood_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `bloodpressure` int(11) DEFAULT NULL,
  `fbs` int(11) DEFAULT NULL,
  `thal` int(11) DEFAULT NULL,
  `serumcholesterol` int(11) DEFAULT NULL,
  `cardiodiagnosis_cardio_id` int(11) NOT NULL,
  PRIMARY KEY (`blood_id`,`cardiodiagnosis_cardio_id`),
  KEY `fk_bloodtest_cardiodiagnosis1_idx` (`cardiodiagnosis_cardio_id`),
  CONSTRAINT `fk_bloodtest_cardiodiagnosis1` FOREIGN KEY (`cardiodiagnosis_cardio_id`) REFERENCES `cardiodiagnosis` (`cardio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodtest`
--

LOCK TABLES `bloodtest` WRITE;
/*!40000 ALTER TABLE `bloodtest` DISABLE KEYS */;
INSERT INTO `bloodtest` VALUES (1,'2019-08-19 00:00:00',145,1,1,233,1),(2,'2020-01-24 00:00:00',130,0,2,250,2),(3,'2019-12-26 00:00:00',130,0,2,204,3),(4,'2019-08-19 00:00:00',4,NULL,NULL,NULL,4),(7,'2020-01-24 22:59:52',45,NULL,NULL,45,7),(8,'2020-01-24 22:59:52',45,NULL,NULL,45,8),(9,'2020-01-24 22:59:52',45,NULL,NULL,45,9);
/*!40000 ALTER TABLE `bloodtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardiodiagnosis`
--

DROP TABLE IF EXISTS `cardiodiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardiodiagnosis` (
  `cardio_id` int(11) NOT NULL AUTO_INCREMENT,
  `cardioarrestdetected` tinyint(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `memberinfo_member_id` int(11) NOT NULL,
  PRIMARY KEY (`cardio_id`,`memberinfo_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardiodiagnosis`
--

LOCK TABLES `cardiodiagnosis` WRITE;
/*!40000 ALTER TABLE `cardiodiagnosis` DISABLE KEYS */;
INSERT INTO `cardiodiagnosis` VALUES (1,1,'2019-08-20 00:00:00',1),(2,1,'2019-01-12 00:00:00',2),(3,1,'2020-01-24 00:00:00',3),(4,NULL,'2019-08-19 00:00:00',6),(5,NULL,'2020-01-24 22:59:52',7),(6,NULL,'2020-01-24 22:59:52',8),(7,NULL,'2020-01-24 22:59:52',9),(8,NULL,'2020-01-24 22:59:52',10),(9,NULL,'2020-01-24 22:59:52',11);
/*!40000 ALTER TABLE `cardiodiagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseasedetail`
--

DROP TABLE IF EXISTS `diseasedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseasedetail` (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnoseddate` datetime DEFAULT NULL,
  `recovereddate` datetime DEFAULT NULL,
  `isrecovered` tinyint(1) DEFAULT NULL,
  `cardiodiagnosis_cardio_id` int(11) NOT NULL,
  PRIMARY KEY (`disease_id`,`cardiodiagnosis_cardio_id`),
  KEY `fk_dieseasedetail_cardiodiagnosis1_idx` (`cardiodiagnosis_cardio_id`),
  CONSTRAINT `fk_dieseasedetail_cardiodiagnosis1` FOREIGN KEY (`cardiodiagnosis_cardio_id`) REFERENCES `cardiodiagnosis` (`cardio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseasedetail`
--

LOCK TABLES `diseasedetail` WRITE;
/*!40000 ALTER TABLE `diseasedetail` DISABLE KEYS */;
INSERT INTO `diseasedetail` VALUES (1,'2019-08-20 00:00:00',NULL,0,1),(2,'2019-01-12 00:00:00',NULL,0,2),(3,'2020-01-01 00:00:00',NULL,0,3);
/*!40000 ALTER TABLE `diseasedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecgreport`
--

DROP TABLE IF EXISTS `ecgreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecgreport` (
  `ecg_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `restecg` int(11) DEFAULT NULL,
  `cardiodiagnosis_cardio_id` int(11) NOT NULL,
  PRIMARY KEY (`ecg_id`,`cardiodiagnosis_cardio_id`),
  KEY `fk_ecgreport_cardiodiagnosis1_idx` (`cardiodiagnosis_cardio_id`),
  CONSTRAINT `fk_ecgreport_cardiodiagnosis1` FOREIGN KEY (`cardiodiagnosis_cardio_id`) REFERENCES `cardiodiagnosis` (`cardio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecgreport`
--

LOCK TABLES `ecgreport` WRITE;
/*!40000 ALTER TABLE `ecgreport` DISABLE KEYS */;
INSERT INTO `ecgreport` VALUES (1,'2019-08-20 00:00:00',0,1),(2,'2019-01-12 00:00:00',1,2),(3,'2020-01-01 00:00:00',0,3),(4,NULL,6,4),(5,NULL,6,5),(6,NULL,6,6);
/*!40000 ALTER TABLE `ecgreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberinfo`
--

DROP TABLE IF EXISTS `memberinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberinfo` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phonenumber` bigint(100) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberinfo`
--

LOCK TABLES `memberinfo` WRITE;
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
INSERT INTO `memberinfo` VALUES (1,'johndoe','john','doe',63,'male','johndoe@gmail.com',9876543219),(2,'marryjain','marry','jain',37,'female','marry05@gmail.com',8765439921),(3,'robertjones','robert','jones',41,'male','robertjones1985@gmail.com',8976654321),(5,NULL,NULL,NULL,34,'M',NULL,NULL),(6,NULL,NULL,NULL,34,'M',NULL,NULL),(7,NULL,NULL,NULL,4,'m',NULL,NULL),(8,NULL,NULL,NULL,4,'m',NULL,NULL),(9,NULL,NULL,NULL,4,'m',NULL,NULL),(10,NULL,NULL,NULL,4,'m',NULL,NULL),(11,NULL,NULL,NULL,6,'f',NULL,NULL);
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom`
--

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptom` (
  `symptom_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `exang` int(11) DEFAULT NULL,
  `oldpeak` float DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `cardiodiagnosis_cardio_id` int(11) NOT NULL,
  PRIMARY KEY (`symptom_id`,`cardiodiagnosis_cardio_id`),
  KEY `fk_symptom_cardiodiagnosis1_idx` (`cardiodiagnosis_cardio_id`),
  CONSTRAINT `fk_symptom_cardiodiagnosis1` FOREIGN KEY (`cardiodiagnosis_cardio_id`) REFERENCES `cardiodiagnosis` (`cardio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom`
--

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
INSERT INTO `symptom` VALUES (1,'2019-08-10 22:59:52',0,2.3,3,1),(2,'2020-01-24 22:59:52',0,3.5,2,2),(3,'2019-12-20 22:59:52',0,1.4,1,3),(4,'2020-01-24 22:59:52',6,5,4,7),(5,'2020-01-24 22:59:52',6,5,4,8),(6,'2020-01-24 22:59:52',6,5,4,9);
/*!40000 ALTER TABLE `symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wearabledevicedata`
--

DROP TABLE IF EXISTS `wearabledevicedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wearabledevicedata` (
  `wearable_device_id` int(11) NOT NULL AUTO_INCREMENT,
  `thalach` int(11) DEFAULT NULL,
  `slope` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cardiodiagnosis_cardio_id` int(11) NOT NULL,
  PRIMARY KEY (`wearable_device_id`,`cardiodiagnosis_cardio_id`),
  KEY `fk_wearabledevicedata_cardiodiagnosis1_idx` (`cardiodiagnosis_cardio_id`),
  CONSTRAINT `fk_wearabledevicedata_cardiodiagnosis1` FOREIGN KEY (`cardiodiagnosis_cardio_id`) REFERENCES `cardiodiagnosis` (`cardio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wearabledevicedata`
--

LOCK TABLES `wearabledevicedata` WRITE;
/*!40000 ALTER TABLE `wearabledevicedata` DISABLE KEYS */;
INSERT INTO `wearabledevicedata` VALUES (1,150,0,'2019-08-19 00:00:00',1),(2,187,0,'2020-01-19 00:00:00',2),(3,172,2,'2019-12-20 00:00:00',3),(4,8,7,NULL,4),(5,8,7,NULL,5),(6,8,7,NULL,6);
/*!40000 ALTER TABLE `wearabledevicedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xray`
--

DROP TABLE IF EXISTS `xray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xray` (
  `xray_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `ca` int(11) DEFAULT NULL,
  `cardiodiagnosis_cardio_id` int(11) NOT NULL,
  PRIMARY KEY (`xray_id`,`cardiodiagnosis_cardio_id`),
  KEY `fk_xray_cardiodiagnosis1_idx` (`cardiodiagnosis_cardio_id`),
  CONSTRAINT `fk_xray_cardiodiagnosis1` FOREIGN KEY (`cardiodiagnosis_cardio_id`) REFERENCES `cardiodiagnosis` (`cardio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xray`
--

LOCK TABLES `xray` WRITE;
/*!40000 ALTER TABLE `xray` DISABLE KEYS */;
INSERT INTO `xray` VALUES (1,'2019-08-19 00:00:00',0,1),(2,'2020-01-19 00:00:00',0,2),(3,'2019-12-20 00:00:00',0,3),(4,NULL,6,4),(5,NULL,6,5),(6,NULL,6,6);
/*!40000 ALTER TABLE `xray` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-31 12:23:48
