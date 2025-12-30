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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e936b2ec-d69a-11f0-ad36-7944e8bf04d5:1-425';

--
-- Table structure for table `account_notes`
--

DROP TABLE IF EXISTS `account_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_notes` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `created_by_pid` int NOT NULL,
  `note_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `idx_account_notes_account_number` (`account_number`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_notes`
--

LOCK TABLES `account_notes` WRITE;
/*!40000 ALTER TABLE `account_notes` DISABLE KEYS */;
INSERT INTO `account_notes` VALUES (1,1,'Customer requested plan review.','2025-12-14 20:12:42','ACC-10001'),(2,2,'Billing verified and confirmed.','2025-12-14 20:12:42','ACC-10001'),(3,1,'Customer asked about plan options.','2025-12-14 20:12:42','ACC-20002');
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
  `agent_fname` varchar(255) NOT NULL,
  `agent_lname` varchar(255) NOT NULL,
  `agent_position` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `password_to_rms` varchar(255) NOT NULL,
  `is_contractor` tinyint(1) NOT NULL,
  `is_active_in_payroll` tinyint(1) NOT NULL,
  `hire_date` date NOT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_leadership` tinyint(1) NOT NULL DEFAULT '0',
  `can_access_RMS_lite` tinyint(1) NOT NULL,
  `is_franchise_employee` tinyint(1) NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `csr_username` varchar(20) DEFAULT NULL,
  `csr_ext` varchar(20) NOT NULL,
  `csr_queue` varchar(50) DEFAULT NULL,
  `csr_extension_password` varchar(255) DEFAULT NULL,
  `uses_default_sip` tinyint(1) DEFAULT NULL,
  `alt_sip_address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`csr_id`),
  KEY `idx_csr_extensions_account_number` (`csr_extension_password`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csr_extensions`
--

LOCK TABLES `csr_extensions` WRITE;
/*!40000 ALTER TABLE `csr_extensions` DISABLE KEYS */;
INSERT INTO `csr_extensions` VALUES (1,'17778466561','150','Voice','Agent17012',1,NULL),(2,NULL,'1002','Data',NULL,0,NULL),(3,NULL,'1003','Business','ACC-10001',0,NULL);
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
  `alert_title` varchar(255) NOT NULL,
  `alert_desc` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `datetime_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `idx_customer_alerts_account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_alerts`
--

LOCK TABLES `customer_alerts` WRITE;
/*!40000 ALTER TABLE `customer_alerts` DISABLE KEYS */;
INSERT INTO `customer_alerts` VALUES (1,'Billing Paid','Your most recent invoice has been successfully paid.',1,'2025-12-14 20:12:42','ACC-10001'),(2,'Payment Due','Your invoice is due soon.',1,'2025-12-14 20:12:42','ACC-20002');
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
  `prefix` varchar(50) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailNotProvided` tinyint(1) DEFAULT '0',
  `ssn` varchar(50) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `dlNumber` varchar(100) DEFAULT NULL,
  `dlState` varchar(10) DEFAULT NULL,
  `dlExp` datetime DEFAULT NULL,
  `contactPhone1` varchar(20) DEFAULT NULL,
  `contactPhone2` varchar(20) DEFAULT NULL,
  `contactPhone3` varchar(20) DEFAULT NULL,
  `streetNumber` varchar(20) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `employer` varchar(255) DEFAULT NULL,
  `isNvp` tinyint(1) DEFAULT '0',
  `assignToBusinessAccount` tinyint(1) DEFAULT '0',
  `attachToHierarchy` tinyint(1) DEFAULT '0',
  `accountType` varchar(255) DEFAULT NULL,
  `creditSsn` varchar(50) DEFAULT NULL,
  `creditClass` varchar(50) DEFAULT NULL,
  `approvedLines` int DEFAULT '0',
  `lastDateChecked` datetime DEFAULT NULL,
  `typeOfAccount` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `downpay_perc` int DEFAULT NULL,
  `downpayment_needed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_info_account_number` (`account_number`),
  KEY `idx_customer_info_name` (`lastName`,`firstName`),
  KEY `idx_ci_account_number_trim` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
INSERT INTO `customer_info` VALUES (1,'Mr.','John','A','Doe',NULL,'john.doe@example.com',0,'123-45-6789','1985-06-15 00:00:00','D1234567','MO','2028-05-01 00:00:00','5125552000',NULL,NULL,'1500','Corporate Woods Dr',NULL,'Chesterfield','MO','63017','MegaCorp LLC',1,1,1,'Business','123-45-6789','A',5,'2025-12-14 14:12:42','Corporate','ACC-10001',NULL,NULL),(2,'Ms.','Jane',NULL,'Smith',NULL,'jane.smith@example.com',0,'987-65-4321','1990-02-20 00:00:00','S7654321','MO','2027-09-30 00:00:00','6365553333','REDACTED',NULL,'42','Market St','Apt 5','St. Louis','MO','63101','Acme Co',0,0,0,'Personal','987-65-4321','B',2,'2025-12-14 14:12:42','Consumer','ACC-20002',NULL,NULL);
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
  `assosiated_phone_number` varchar(30) DEFAULT NULL,
  `associated_service_name` varchar(255) NOT NULL,
  `associated_service_effective_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `associated_service_falloff_date` date DEFAULT NULL,
  `pid_of_added_user` int NOT NULL,
  `cost_per_month` double NOT NULL,
  PRIMARY KEY (`service_entry_id`),
  KEY `idx_csl_phone` (`assosiated_phone_number`),
  KEY `idx_csl_service_id` (`associated_service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_services_list`
--

LOCK TABLES `customer_services_list` WRITE;
/*!40000 ALTER TABLE `customer_services_list` DISABLE KEYS */;
INSERT INTO `customer_services_list` VALUES (1,12,'5125552000','International Calling Add-On','2025-12-14 20:12:42',NULL,1,15),(2,14,'5125552000','Voicemail Provisioning','2025-12-14 20:12:42',NULL,1,0),(3,18,'5125552001','Priority Data Add-On','2025-12-14 20:12:42',NULL,2,20),(4,14,'6365553333','Voicemail Provisioning','2025-12-14 20:12:42',NULL,1,0);
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
  KEY `idx_payments_bill_id` (`bill_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `phone_bills` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,129.99,'2025-12-14 20:12:42','Credit Card');
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
  `bill_cycle_start_date` date NOT NULL,
  `bill_cycle_end_date` date NOT NULL,
  `total_amount_due` decimal(10,2) NOT NULL,
  `total_amount_paid` decimal(10,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `payment_due_date` date NOT NULL,
  `payment_received_date` date DEFAULT NULL,
  `bill_status` varchar(50) DEFAULT NULL,
  `service_ids_csv` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `idx_phone_bills_account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_bills`
--

LOCK TABLES `phone_bills` WRITE;
/*!40000 ALTER TABLE `phone_bills` DISABLE KEYS */;
INSERT INTO `phone_bills` VALUES (1,'2025-01-01','2025-01-31',129.99,129.99,1,'2025-02-01','2025-01-29','Paid','12,14,18','ACC-10001'),(2,'2025-01-01','2025-01-31',59.99,0.00,0,'2025-02-01',NULL,'Pending','14','ACC-20002');
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
  `type_of_line` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `date_time_added_to_acct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caller_id_fname` varchar(255) NOT NULL,
  `caller_id_lname` varchar(255) NOT NULL,
  `is_unlimited_talk` tinyint(1) NOT NULL,
  `is_unlimited_text` tinyint(1) NOT NULL,
  `is_unlimited_data` tinyint(1) NOT NULL,
  `ammt_of_priority_data_gb` int NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `plan_code` int NOT NULL,
  `can_inbound` tinyint(1) NOT NULL,
  `can_outbound` tinyint(1) NOT NULL,
  `is_forwarding_calls` tinyint(1) NOT NULL,
  `forward_calls_number` varchar(20) DEFAULT NULL,
  `assigned_service_ids_csv` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_numbers_account_number` (`account_number`),
  KEY `idx_phone_numbers_phone` (`phoneNumber`),
  KEY `idx_cp_account_number_trim` (`account_number`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (1,'Business Voice Postpaid','5125552000','2025-12-14 20:12:42','John','Doe',1,1,0,50,'MegaCorp Business Voice',501,1,1,0,NULL,'12,14','ACC-10001',1),(2,'Business Data Only Postpaid','5125552001','2025-12-14 20:12:42','John','Doe',0,0,1,100,'MegaCorp Business Unlimited Data',502,1,0,0,NULL,'18','ACC-10001',1),(3,'Personal Voice Postpaid','6365553333','2025-12-14 20:12:42','Jane','Smith',1,1,0,10,'Personal Unlimited Talk & Text',201,1,1,0,NULL,'14','ACC-20002',1);
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
-- Table structure for table `recycled_devices`
--

DROP TABLE IF EXISTS `recycled_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recycled_devices` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `imei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `model` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trade_in_value` decimal(10,2) DEFAULT NULL,
  `status_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trade_in_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycled_devices`
--

LOCK TABLES `recycled_devices` WRITE;
/*!40000 ALTER TABLE `recycled_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `recycled_devices` ENABLE KEYS */;
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
  `service_name` varchar(255) NOT NULL,
  `service_desc` varchar(255) NOT NULL,
  `requires_supervisor_approval` tinyint(1) DEFAULT NULL,
  `monthly_price` double DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (12,1,'2025-11-30 03:25:21','International Calling Add-On','Add international calling capabilities to the line.',0,0),(14,1,'2025-11-30 03:25:21','Voicemail Provisioning','Enable or repair voicemail services for the customer line.',0,0),(18,1,'2025-11-30 03:25:21','Priority Data Add-On','Add additional priority data to this phone line.',1,9.99);
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
  `alert_title` text NOT NULL,
  `alert_desc` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `datetime_added` timestamp NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `idx_user_alerts_account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_alerts`
--

LOCK TABLES `user_alerts` WRITE;
/*!40000 ALTER TABLE `user_alerts` DISABLE KEYS */;
INSERT INTO `user_alerts` VALUES (1,'VIP Business Account','Handle with priority support.',1,'2025-12-14 20:12:42','ACC-10001');
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

--
-- Table structure for table `vars`
--

DROP TABLE IF EXISTS `vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vars` (
  `is_application_online` tinyint(1) DEFAULT NULL,
  `default_sip_address` varchar(255) DEFAULT NULL,
  `latest_version_number` varchar(20) DEFAULT NULL,
  `latest_build_number` varchar(20) DEFAULT NULL,
  `latest_build_date` date DEFAULT NULL,
  `row_updated_date` date DEFAULT NULL,
  `is_in_beta` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vars`
--

LOCK TABLES `vars` WRITE;
/*!40000 ALTER TABLE `vars` DISABLE KEYS */;
INSERT INTO `vars` VALUES (1,'REDACTED','0.0.1','202512-0001-01','2025-12-18','2025-12-18',1,1);
/*!40000 ALTER TABLE `vars` ENABLE KEYS */;
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

-- Dump completed on 2025-12-19  7:20:20
