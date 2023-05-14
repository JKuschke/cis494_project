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
-- Temporary view structure for view `vw_all_balances`
--

DROP TABLE IF EXISTS `vw_all_balances`;
/*!50001 DROP VIEW IF EXISTS `vw_all_balances`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_all_balances` AS SELECT 
 1 AS `Patient_ID`,
 1 AS `Account_ID`,
 1 AS `First_name`,
 1 AS `Last_Name`,
 1 AS `Balance`,
 1 AS `Phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_all_patients`
--

DROP TABLE IF EXISTS `vw_all_patients`;
/*!50001 DROP VIEW IF EXISTS `vw_all_patients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_all_patients` AS SELECT 
 1 AS `Patient_ID`,
 1 AS `First_name`,
 1 AS `Last_name`,
 1 AS `Age`,
 1 AS `Gender`,
 1 AS `Phone_number`,
 1 AS `Email_address`,
 1 AS `Active_date`,
 1 AS `Inactive_date`,
 1 AS `Primary_Physician_ID`,
 1 AS `Insurance_provider_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ny_patients`
--

DROP TABLE IF EXISTS `vw_ny_patients`;
/*!50001 DROP VIEW IF EXISTS `vw_ny_patients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ny_patients` AS SELECT 
 1 AS `Patient_ID`,
 1 AS `First_name`,
 1 AS `Last_Name`,
 1 AS `Street_address`,
 1 AS `City`,
 1 AS `State`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_accepted_insurance_providers`
--

DROP TABLE IF EXISTS `vw_accepted_insurance_providers`;
/*!50001 DROP VIEW IF EXISTS `vw_accepted_insurance_providers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_accepted_insurance_providers` AS SELECT 
 1 AS `Insurance_Provider_ID`,
 1 AS `Name`,
 1 AS `Street_address`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_all_physicians`
--

DROP TABLE IF EXISTS `vw_all_physicians`;
/*!50001 DROP VIEW IF EXISTS `vw_all_physicians`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_all_physicians` AS SELECT 
 1 AS `Physician_ID`,
 1 AS `First_name`,
 1 AS `Last_Name`,
 1 AS `Physician_phone`,
 1 AS `Name`,
 1 AS `Street_address`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Location_phone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_patient_debts`
--

DROP TABLE IF EXISTS `vw_patient_debts`;
/*!50001 DROP VIEW IF EXISTS `vw_patient_debts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_patient_debts` AS SELECT 
 1 AS `Patient_ID`,
 1 AS `Account_ID`,
 1 AS `First_name`,
 1 AS `Last_Name`,
 1 AS `Balance`,
 1 AS `Phone_number`,
 1 AS `Email_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_all_balances`
--

/*!50001 DROP VIEW IF EXISTS `vw_all_balances`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_all_balances` AS select `p`.`Patient_ID` AS `Patient_ID`,`a`.`Account_ID` AS `Account_ID`,`p`.`First_name` AS `First_name`,`p`.`Last_name` AS `Last_Name`,`a`.`Balance` AS `Balance`,`p`.`Phone_number` AS `Phone_number` from (`patients` `p` join `accounts` `a` on((`a`.`Patient_ID` = `p`.`Patient_ID`))) order by `a`.`Balance` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_all_patients`
--

/*!50001 DROP VIEW IF EXISTS `vw_all_patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_all_patients` AS select `patients`.`Patient_ID` AS `Patient_ID`,`patients`.`First_name` AS `First_name`,`patients`.`Last_name` AS `Last_name`,`patients`.`Age` AS `Age`,`patients`.`Gender` AS `Gender`,`patients`.`Phone_number` AS `Phone_number`,`patients`.`Email_address` AS `Email_address`,`patients`.`Active_date` AS `Active_date`,`patients`.`Inactive_date` AS `Inactive_date`,`patients`.`Primary_Physician_ID` AS `Primary_Physician_ID`,`patients`.`Insurance_provider_ID` AS `Insurance_provider_ID` from `patients` order by `patients`.`Patient_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ny_patients`
--

/*!50001 DROP VIEW IF EXISTS `vw_ny_patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ny_patients` AS select `p`.`Patient_ID` AS `Patient_ID`,`p`.`First_name` AS `First_name`,`p`.`Last_name` AS `Last_Name`,`l`.`Street_address` AS `Street_address`,`l`.`City` AS `City`,`l`.`State` AS `State` from ((`patients` `p` join `physicians` on((`physicians`.`Physician_ID` = `p`.`Primary_Physician_ID`))) join `locations` `l` on((`l`.`Location_ID` = `physicians`.`Location_ID`))) where ((`l`.`State` = 'NY') or (`l`.`State` = 'ny') or (`l`.`State` = 'New York') or (`l`.`State` = 'new york')) order by `p`.`Patient_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_accepted_insurance_providers`
--

/*!50001 DROP VIEW IF EXISTS `vw_accepted_insurance_providers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_accepted_insurance_providers` AS select `insurance_provider`.`Insurance_Provider_ID` AS `Insurance_Provider_ID`,`insurance_provider`.`Name` AS `Name`,`insurance_provider`.`Street_address` AS `Street_address`,`insurance_provider`.`City` AS `City`,`insurance_provider`.`State` AS `State`,`insurance_provider`.`Phone_number` AS `Phone_number` from `insurance_provider` order by `insurance_provider`.`Insurance_Provider_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_all_physicians`
--

/*!50001 DROP VIEW IF EXISTS `vw_all_physicians`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_all_physicians` AS select `p`.`Physician_ID` AS `Physician_ID`,`p`.`First_name` AS `First_name`,`p`.`Last_Name` AS `Last_Name`,`p`.`Phone_number` AS `Physician_phone`,`l`.`Name` AS `Name`,`l`.`Street_address` AS `Street_address`,`l`.`City` AS `City`,`l`.`State` AS `State`,`l`.`Phone_number` AS `Location_phone` from (`physicians` `p` join `locations` `l` on((`l`.`Location_ID` = `p`.`Location_ID`))) order by `p`.`Physician_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_patient_debts`
--

/*!50001 DROP VIEW IF EXISTS `vw_patient_debts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_patient_debts` AS select `p`.`Patient_ID` AS `Patient_ID`,`a`.`Account_ID` AS `Account_ID`,`p`.`First_name` AS `First_name`,`p`.`Last_name` AS `Last_Name`,`a`.`Balance` AS `Balance`,`p`.`Phone_number` AS `Phone_number`,`p`.`Email_address` AS `Email_address` from (`patients` `p` join `accounts` `a` on((`a`.`Patient_ID` = `p`.`Patient_ID`))) where (`a`.`Balance` < 0) order by `a`.`Balance` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14 12:08:14
