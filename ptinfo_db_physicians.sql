CREATE DATABASE  IF NOT EXISTS `ptinfo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ptinfo_db`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ptinfo_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `physicians`
--

DROP TABLE IF EXISTS `physicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicians` (
  `Physician_ID` int NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Location_ID` int NOT NULL,
  `Phone_number` varchar(10) NOT NULL,
  PRIMARY KEY (`Physician_ID`),
  KEY `Location_ID` (`Location_ID`),
  CONSTRAINT `physicians_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `locations` (`Location_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicians`
--

LOCK TABLES `physicians` WRITE;
/*!40000 ALTER TABLE `physicians` DISABLE KEYS */;
INSERT INTO `physicians` VALUES (300000001,'Jason','Mann',500000001,'7163459800'),(300000002,'Joseph','Crosby',500000001,'7163453431'),(300000003,'Amelia','Stonne',500000002,'7167776765'),(300000004,'Andrew','Sternin',500000002,'7163456543'),(300000005,'John','Dahlke',500000003,'5857687975'),(300000006,'William','Boeck',500000003,'5852536543'),(300000007,'Joseph','Scandenelli',500000004,'5854574487'),(300000008,'Vera','Dudkowski',500000004,'5857686434'),(300000009,'Anthony','Briarson',500000005,'5701111114'),(300000010,'John','Doe',500000005,'5702343533'),(300000011,'Steven','Stevenson',500000006,'5707879753'),(300000012,'Jane','Doe',500000006,'5704585938');
/*!40000 ALTER TABLE `physicians` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14 12:08:14
