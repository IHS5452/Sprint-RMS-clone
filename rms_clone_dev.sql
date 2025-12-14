-- MySQL dump 10.13  Distrib 9.5.0, for macos15 (arm64)
--
-- Host: localhost    Database: rms_clone_dev
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e936b2ec-d69a-11f0-ad36-7944e8bf04d5:1-78';

--
-- Table structure for table `account_notes`
--

DROP TABLE IF EXISTS `account_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_notes` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `created_by_pid` int NOT NULL,
  `assigned_to_group_id` varchar(50) NOT NULL,
  `note_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`note_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_notes`
--

LOCK TABLES `account_notes` WRITE;
/*!40000 ALTER TABLE `account_notes` DISABLE KEYS */;
INSERT INTO `account_notes` VALUES (1,1,'GROUP123','Customer requested plan change.','2025-11-29 19:51:36'),(2,2,'GROUP123','Fraud alert flagged on account.','2025-11-29 19:51:36'),(3,3,'GROUP456','Address verification completed.','2025-11-29 19:51:36');
/*!40000 ALTER TABLE `account_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_logins`
--

DROP TABLE IF EXISTS `company_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_logins` (
  `PID` int NOT NULL,
  `agent_fname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `agent_lname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `agent_position` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password_to_rms` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_contractor` tinyint(1) NOT NULL,
  `is_active_in_payroll` tinyint(1) NOT NULL,
  `hire_date` date NOT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_leadership` tinyint(1) NOT NULL DEFAULT '0',
  `can_access_RMS_lite` tinyint(1) NOT NULL,
  `is_franchise_employee` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_logins`
--

LOCK TABLES `company_logins` WRITE;
/*!40000 ALTER TABLE `company_logins` DISABLE KEYS */;
INSERT INTO `company_logins` VALUES (1,'Alice','Brown','Customer Service Rep','alice@company.com','password123',0,1,'2023-01-10',0,0,1,0),(2,'Bob','Green','Sales Manager','bob@company.com','securepass2',0,1,'2021-06-15',1,1,1,0),(3,'Charlie','Davis','Tech Support','charlie@company.com','securepass3',1,1,'2020-11-20',0,0,1,1);
/*!40000 ALTER TABLE `company_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csr_extensions`
--

DROP TABLE IF EXISTS `csr_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csr_extensions` (
  `csr_id` int NOT NULL AUTO_INCREMENT,
  `csr_extension` varchar(20) NOT NULL,
  `csr_type` enum('Voice','Data','Business','Personal') NOT NULL,
  `group_id` varchar(50) NOT NULL,
  PRIMARY KEY (`csr_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csr_extensions`
--

LOCK TABLES `csr_extensions` WRITE;
/*!40000 ALTER TABLE `csr_extensions` DISABLE KEYS */;
INSERT INTO `csr_extensions` VALUES (1,'1001','Voice','GROUP123'),(2,'1002','Data','GROUP123'),(3,'1003','Business','GROUP456');
/*!40000 ALTER TABLE `csr_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_alerts`
--

DROP TABLE IF EXISTS `customer_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_alerts` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `assigned_to_group` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `alert_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `alert_desc` text COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `datetime_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_alerts`
--

LOCK TABLES `customer_alerts` WRITE;
/*!40000 ALTER TABLE `customer_alerts` DISABLE KEYS */;
INSERT INTO `customer_alerts` VALUES (1,'GROUP123','Billing Issue Detected','A billing discrepancy was identified for this account. Please review recent charges.',1,'2025-11-29 21:07:46'),(2,'GROUP123','Account Security Review','Suspicious login pattern detected. Recommend verifying account activity.',0,'2025-11-29 21:07:46'),(3,'GRP567','Device Upgrade Eligibility','A line on this account is now eligible for a device upgrade.',1,'2025-11-29 21:07:46'),(4,'GRP567','Payment Reminder','Your monthly payment is due in 3 days. Late fees may apply if unpaid.',1,'2025-11-29 21:07:46'),(5,'WEST01','Address Verification Needed','We were unable to verify your mailing address. Please update to avoid service interruptions.',1,'2025-11-29 21:07:46'),(6,'WEST01','System Maintenance Notice','Scheduled maintenance may temporarily impact service on the 15th between 2 AM and 5 AM.',1,'2025-11-29 21:07:46'),(7,'TXGRP01','Data Usage Warning','Your account has reached 85% of its monthly high-speed data allowance.',1,'2025-11-29 21:07:46'),(8,'TXGRP01','Account Change Completed','A recent request to modify your postpaid plan has been successfully completed.',1,'2025-11-29 21:07:46');
/*!40000 ALTER TABLE `customer_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `middleName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `suffix` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `emailNotProvided` tinyint(1) DEFAULT '0',
  `ssn` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `dlNumber` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dlState` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dlExp` datetime DEFAULT NULL,
  `contactPhone1` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contactPhone2` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contactPhone3` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `streetNumber` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `streetName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employer` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isNvp` tinyint(1) DEFAULT '0',
  `assignToBusinessAccount` tinyint(1) DEFAULT '0',
  `attachToHierarchy` tinyint(1) DEFAULT '0',
  `accountType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creditSsn` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creditClass` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approvedLines` int DEFAULT '0',
  `lastDateChecked` datetime DEFAULT NULL,
  `typeOfAccount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `groupId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `downpay_perc` int DEFAULT NULL,
  `downpayment_needed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
INSERT INTO `customer_info` VALUES (11,'Mr.','John','A','Doe',NULL,'john.doe@example.com',0,'123-45-6789','1985-06-15 00:00:00','D1234567','MO','2028-05-01 00:00:00','5125552000',NULL,NULL,'1500','Corporate Woods Dr','Suite 200','Chesterfield','MO','63017','MegaCorp LLC',1,1,1,'Business','123-45-6789','A',5,'2025-11-20 14:00:00','Corporate','GROUP123',NULL,NULL,NULL),(12,'Ms.','Emily','R','Stone',NULL,'emily.stone@example.com',0,'987-65-4321','1990-02-10 00:00:00','S9988776','MO','2029-09-10 00:00:00','5125551000',NULL,NULL,'1500','Corporate Woods Dr','Suite 200','Chesterfield','MO','63017','MegaCorp LLC',1,1,1,'Business','987-65-4321','A',5,'2025-11-22 10:30:00','Corporate','GROUP123',NULL,NULL,NULL),(13,'Mr.','Alex','J','Rivera',NULL,'alex.rivera@example.com',0,'555-11-2222','1994-08-21 00:00:00','R5544332','MO','2027-03-11 00:00:00','6365553333','6365554444',NULL,'500','Pine St',NULL,'Springfield','MO','65802','HealthPlus',1,1,0,'Individual','555-11-2222','C',2,'2025-11-18 16:45:00','Retail','GRP567',NULL,NULL,NULL),(14,'Mrs.','Sarah','K','Jenkins',NULL,'sarah.jenkins@example.com',0,'222-33-4444','1982-12-30 00:00:00','J3322119','CA','2030-01-01 00:00:00','3105557777',NULL,NULL,'890','Sunset Blvd','Unit 10','Los Angeles','CA','90028','FutureSys',0,0,1,'Indavigual','222-33-4444','A',1,'2025-11-10 12:15:00','Premium','WEST01',NULL,NULL,NULL),(15,'Mr.','Michael','T','Callahan','Jr.','mcallahan@example.com',0,'111-22-3333','1978-04-05 00:00:00','C8877661','TX','2026-12-15 00:00:00','5125559999',NULL,NULL,'221','Broadway',NULL,'Austin','TX','78701','LoneStar Energy',0,1,0,'Business','111-22-3333','B',4,'2025-11-25 09:10:00','Corporate','TXGRP01',NULL,NULL,NULL),(16,'Mr.','q','q','qq','-NA-','q',0,'q','2025-10-10 00:00:00','q','Alabama','2025-10-10 00:00:00','q','q','q','q','q','q','q','Alabama','q','q',0,0,0,'postpaid_p','q','L',1,'2025-11-30 11:11:44','','','',NULL,NULL),(17,'Mr.','test','c','ustomer-1','-NA-','',0,'123121234','1997-01-01 00:00:00','M0192837','Delaware','2026-10-10 00:00:00','3143143144',NULL,NULL,'123','test lane',NULL,'Saint Louis','Delaware','12345','WalMart',0,0,0,'postapid_p','123121234','L',1,'2025-12-11 08:36:58','','','',NULL,NULL);
/*!40000 ALTER TABLE `customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_services_list`
--

DROP TABLE IF EXISTS `customer_services_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_services_list` (
  `service_entry_id` int NOT NULL AUTO_INCREMENT,
  `associated_service_id` int NOT NULL,
  `assosiated_phone_number` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `associated_service_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `associated_service_effective_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `associated_service_falloff_date` date DEFAULT NULL,
  `pid_of_added_user` int NOT NULL,
  `cost_per_month` double NOT NULL,
  PRIMARY KEY (`service_entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_services_list`
--

LOCK TABLES `customer_services_list` WRITE;
/*!40000 ALTER TABLE `customer_services_list` DISABLE KEYS */;
INSERT INTO `customer_services_list` VALUES (9,12,'5125552000','International Calling Add-On','2025-11-29 21:50:13',NULL,101,15),(10,18,'5125552000','Priority Data Add-On','2025-11-29 21:50:13',NULL,101,20),(11,14,'6365553333','Voicemail Provisioning','2025-11-29 21:50:13',NULL,202,0),(12,12,'6365553333','International Calling Add-On','2025-11-29 21:50:13',NULL,202,15),(13,14,'3105557777','Voicemail Provisioning','2025-11-29 21:50:13',NULL,303,0),(14,18,'3105557777','Priority Data Add-On','2025-11-29 21:50:13',NULL,303,20),(15,18,'5125559999','Priority Data Add-On','2025-11-29 21:50:13',NULL,404,20),(16,12,'5125559999','International Calling Add-On','2025-11-29 21:50:13',NULL,404,15);
/*!40000 ALTER TABLE `customer_services_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_news`
--

DROP TABLE IF EXISTS `homepage_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homepage_news` (
  `nid` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `is_active` tinyint(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_news`
--

LOCK TABLES `homepage_news` WRITE;
/*!40000 ALTER TABLE `homepage_news` DISABLE KEYS */;
INSERT INTO `homepage_news` VALUES (0,'test title','this is a test of the new news system. \n new line...',1,'2025-12-11 13:35:59');
/*!40000 ALTER TABLE `homepage_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `phone_bills` (`bill_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,99.99,'2025-11-29 19:51:36','Credit Card'),(2,2,60.00,'2025-11-29 19:51:36','Bank Transfer'),(3,3,150.00,'2025-11-29 19:51:36','Credit Card');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_bills`
--

DROP TABLE IF EXISTS `phone_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `assigned_to_group_id` varchar(50) NOT NULL,
  `bill_cycle_start_date` date NOT NULL,
  `bill_cycle_end_date` date NOT NULL,
  `total_amount_due` decimal(10,2) NOT NULL,
  `total_amount_paid` decimal(10,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `payment_due_date` date NOT NULL,
  `payment_received_date` date DEFAULT NULL,
  `bill_status` varchar(50) DEFAULT NULL,
  `service_ids_csv` varchar(255) NOT NULL,
  PRIMARY KEY (`bill_id`),
  CONSTRAINT `phone_bills_chk_1` CHECK ((`bill_status` in (_utf8mb4'Pending',_utf8mb4'Paid',_utf8mb4'Overdue')))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_bills`
--

LOCK TABLES `phone_bills` WRITE;
/*!40000 ALTER TABLE `phone_bills` DISABLE KEYS */;
INSERT INTO `phone_bills` VALUES (1,'GROUP123','2025-01-01','2025-01-31',99.99,99.99,1,'2025-02-01','2025-01-29','Paid','1,2'),(2,'GROUP123','2025-02-01','2025-02-28',120.00,60.00,0,'2025-03-01',NULL,'Pending','1,3'),(3,'GROUP456','2025-01-01','2025-01-31',150.00,150.00,1,'2025-02-01','2025-01-30','Paid','2,3');
/*!40000 ALTER TABLE `phone_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_numbers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assigned_to_group_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `type_of_line` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phoneNumber` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date_time_added_to_acct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caller_id_fname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `caller_id_lname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_unlimited_talk` tinyint(1) NOT NULL,
  `is_unlimited_text` tinyint(1) NOT NULL,
  `is_unlimited_data` tinyint(1) NOT NULL,
  `ammt_of_priority_data_gb` int NOT NULL,
  `plan_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `plan_code` int NOT NULL,
  `can_inbound` tinyint(1) NOT NULL,
  `can_outbound` tinyint(1) NOT NULL,
  `is_forwarding_calls` tinyint(1) NOT NULL,
  `forward_calls_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assigned_service_ids_csv` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `phone_numbers_chk_1` CHECK ((`type_of_line` in (_utf8mb4'Voice Prepaid',_utf8mb4'Data Only Prepaid',_utf8mb4'Personal Voice Postpaid',_utf8mb4'Personal Data Only Postpaid',_utf8mb4'Business Voice Postpaid',_utf8mb4'Business Data Only Postpaid')))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (9,'GROUP123','Business Voice Postpaid','5125552000','2025-11-29 20:32:36','John','Doe',1,1,0,50,'MegaCorp Business Voice',501,1,1,0,NULL,'3, 5','123456',1),(10,'GROUP123','Business Data Only Postpaid','5125552001','2025-11-29 20:32:36','Emily','Stone',1,1,1,100,'MegaCorp Business Unlimited Data',502,1,0,0,NULL,'3, 5','123456',1),(11,'GRP567','Personal Voice Postpaid','6365553030','2025-11-29 20:32:36','Alex','Rivera',1,1,0,20,'Premium Voice & Text',301,1,1,0,NULL,'5, 7, 9','54321',1),(12,'WEST01','Voice Prepaid','3105558080','2025-11-29 20:32:36','Sarah','Jenkins',1,1,0,10,'Prepaid Flex Voice',201,1,0,0,NULL,NULL,'98765',1),(13,'TXGRP01','Business Voice Postpaid','5125559191','2025-11-29 20:32:36','Michael','Callahan',1,1,1,75,'LoneStar Enterprise Voice+',701,1,1,1,'5125550000','1, 5','789456',0);
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_plans`
--

DROP TABLE IF EXISTS `phone_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) NOT NULL,
  `plan_description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_unlimited_talk_mins` tinyint(1) NOT NULL,
  `max_num_talk_mins` int DEFAULT NULL,
  `is_unlimited_texts` tinyint(1) NOT NULL,
  `max_num_texts` int DEFAULT NULL,
  `is_unlimited_data` tinyint(1) NOT NULL,
  `max_data_gb` int DEFAULT NULL,
  `is_unlimited_priority_data` tinyint(1) NOT NULL,
  `max_priority_data_gb` int DEFAULT NULL,
  `is_prepaid` tinyint(1) NOT NULL,
  `is_postpaid` tinyint(1) NOT NULL,
  PRIMARY KEY (`plan_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_plans`
--

LOCK TABLES `phone_plans` WRITE;
/*!40000 ALTER TABLE `phone_plans` DISABLE KEYS */;
INSERT INTO `phone_plans` VALUES (1,'Standard Plan','A balanced plan with talk, text, and data',1,1,NULL,1,NULL,0,10,0,5,0,1),(2,'Business Premium','Unlimited data plan for business users',1,1,NULL,1,NULL,1,NULL,1,50,0,1),(3,'Prepaid Basic','Affordable prepaid plan with limited data',1,0,500,1,NULL,0,5,0,2,1,0);
/*!40000 ALTER TABLE `phone_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recycled_devices_table`
--

DROP TABLE IF EXISTS `recycled_devices_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recycled_devices_table` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `imei` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `model` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition_desc` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trade_in_value` decimal(10,2) DEFAULT NULL,
  `status_desc` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trade_in_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycled_devices_table`
--

LOCK TABLES `recycled_devices_table` WRITE;
/*!40000 ALTER TABLE `recycled_devices_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `recycled_devices_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `service_desc` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `requires_supervisor_approval` tinyint(1) DEFAULT NULL,
  `monthly_price` double DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,1,'2025-11-29 21:25:21','SIM Replacement','Replace a lost or damaged SIM card.',0,0),(2,1,'2025-11-29 21:25:21','Device Activation','Activate a new or transferred device.',0,0),(3,1,'2025-11-29 21:25:21','Billing Dispute Review','Investigate a billing discrepancy.',1,0),(4,1,'2025-11-29 21:25:21','Plan Change Request','Modify the customer’s active plan.',1,0),(5,1,'2025-11-29 21:25:21','Address Verification Update','Update customer address information.',0,0),(6,1,'2025-11-29 21:25:21','Data Reset Request','Reset throttled or deprioritized data.',1,0),(7,1,'2025-11-29 21:25:21','Port-In Request','Transfer an external number into network.',1,0),(8,1,'2025-11-29 21:25:21','Call Forwarding Setup','Configure call forwarding for a line.',0,0),(9,1,'2025-11-29 21:25:21','Business Line Add','Add a new line to a business account.',1,0),(10,1,'2025-11-29 21:25:21','Group Account Audit','Perform a security audit on a group.',1,0),(12,1,'2025-11-29 21:25:21','International Calling Add-On','Add international calling capabilities to the line.',0,0),(14,1,'2025-11-29 21:25:21','Voicemail Provisioning','Enable or repair voicemail services for the customer line.',0,0),(18,1,'2025-11-29 21:25:21','Priority Data Add-On','Add additional priority data to this phone line.',1,9.99);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_alerts`
--

DROP TABLE IF EXISTS `user_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_alerts` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `assigned_to_group` varchar(50) NOT NULL,
  `alert_title` text NOT NULL,
  `alert_desc` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `datetime_added` timestamp NOT NULL,
  PRIMARY KEY (`alert_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_alerts`
--

LOCK TABLES `user_alerts` WRITE;
/*!40000 ALTER TABLE `user_alerts` DISABLE KEYS */;
INSERT INTO `user_alerts` VALUES (1,'GROUP123','Billing Issue','Your recent payment has failed.',1,'2025-11-29 19:51:36'),(2,'GROUP123','Plan Upgrade','You are eligible for a free upgrade.',1,'2025-11-29 19:51:36'),(3,'GROUP456','Data Usage Warning','You have used 90% of your data.',1,'2025-11-29 19:51:36');
/*!40000 ALTER TABLE `user_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailNotProvided` tinyint(1) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `dlNumber` varchar(50) DEFAULT NULL,
  `dlState` varchar(2) DEFAULT NULL,
  `dlExp` date DEFAULT NULL,
  `contactPhone1` varchar(20) DEFAULT NULL,
  `contactPhone2` varchar(20) DEFAULT NULL,
  `contactPhone3` varchar(20) DEFAULT NULL,
  `streetNumber` varchar(20) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `employer` varchar(255) DEFAULT NULL,
  `assignToBusinessAccount` tinyint(1) DEFAULT NULL,
  `attachToEmployeeAccount` tinyint(1) DEFAULT NULL,
  `creditSsn` varchar(11) DEFAULT NULL,
  `creditClass` varchar(50) DEFAULT NULL,
  `approvedLines` int DEFAULT NULL,
  `lastDateChecked` date DEFAULT NULL,
  `agent_type` varchar(50) DEFAULT NULL,
  `groupId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,NULL,'John','A.','Doe','','john.doe@example.com',0,'123-45-6789','1985-06-15','D1234567','CA','2028-04-15','555-1234',NULL,NULL,'123','Main St',NULL,'Los Angeles','CA','90001','TechCorp',1,0,'123-45-6789','A',3,'2025-03-20','Personal','GROUP123'),(2,NULL,'Jane','B.','Smith','','jane.smith@example.com',0,'987-65-4321','1992-08-22','S9876543','TX','2030-09-30','555-5678',NULL,NULL,'456','Elm St','Apt 2B','Dallas','TX','75201','FinanceCo',0,1,'987-65-4321','B',2,'2025-03-18','Business','GROUP123'),(3,'Dr.','Emily','C.','Johnson','PhD','emily.johnson@example.com',0,'654-32-1987','1979-12-05','J6543210','NY','2029-06-25','555-9876',NULL,NULL,'789','Broadway','Suite 101','New York','NY','10001','EduInstitute',0,0,'654-32-1987','C',1,'2025-03-15','Prepaid','GROUP456');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-14 13:01:56
