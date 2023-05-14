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
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` int NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Age` int NOT NULL,
  `Gender` varchar(15) DEFAULT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Email_address` varchar(50) DEFAULT NULL,
  `Active_date` date NOT NULL,
  `Inactive_date` date DEFAULT NULL,
  `Primary_Physician_ID` int NOT NULL,
  `Insurance_provider_ID` int NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Primary_Physician_ID` (`Primary_Physician_ID`),
  KEY `Insurance_provider_ID` (`Insurance_provider_ID`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`Primary_Physician_ID`) REFERENCES `physicians` (`Physician_ID`) ON DELETE CASCADE,
  CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`Insurance_provider_ID`) REFERENCES `insurance_provider` (`Insurance_Provider_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'sam','w',5735,'female','123456789','jhyrytkcutku@gmail.com','2023-05-05','9999-12-31',300000001,400000001),(2,'Dandre','J',500,'unknown','1234567890','f5ykyfblnghivugry@gmail.com','2023-05-05','9999-12-31',300000001,400000001),(100000001,'Jason','Stevens',27,'Male','7162224578','testEmail1@gmail.com','2023-02-28','9999-12-31',300000001,400000001),(100000002,'Mark','Zucc',46,'Male','7168995324','testEmail2@gmail.com','2023-02-13','9999-12-31',300000002,400000002),(100000003,'Gabriel','Newell',31,'Male','5851236665','testEmail3@gmail.com','2023-01-04','9999-12-31',300000005,400000003),(100000004,'Susan','Prue',33,'Female','5187958642','testEmail4@gmail.com','2023-02-28','9999-12-31',300000008,400000004),(100000005,'Carol','Cook',68,'Female','5707876569','testEmail5@gmail.com','2023-01-25','9999-12-31',300000012,400000005),(100000009,'hjhlgha','phgpofhgpoh',81,'Male','7162256658','genericmail@gmail.com','2023-04-18','9999-12-31',300000001,400000001),(100000010,'Henry','Chapman',98,'Female','7778236401','mailmailmail@gmail.com','2023-03-21','9999-12-31',300000003,400000004),(100000022,'sgflsg','jhjhf',384,'Male','1274956923','kahfgd@mail.com','2023-03-09','9999-12-31',300000001,400000001),(111111111,'hhhhhh','ggggg',12,'Female','','88Gmails@gmail.com','2023-03-21','9999-12-31',300000001,400000001);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
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
