-- MySQL dump 10.13  Distrib 9.5.0, for macos26.1 (arm64)
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c47ffed8-efbb-11f0-965d-714c29ea1bc5:1-135,
e936b2ec-d69a-11f0-ad36-7944e8bf04d5:1-425';

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `itid` int DEFAULT NULL,
  `item_sku` text,
  `item_name` text,
  `item_type` text,
  `quantity_in_warehouse` int DEFAULT NULL,
  `is_in_stock` tinyint(1) DEFAULT NULL,
  `price_usd` double DEFAULT NULL,
  `is_preorder` tinyint(1) DEFAULT NULL,
  `item_desc` text
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES (1,'123','Test Item 1','Test Item',999,1,9.99,0,'Test Item 1. Delete in prod'),(1,'1232','Test Item 2','Test Item',999,1,9.99,0,'Test Item 2. Delete in prod'),(1,'1233','Test Item 3','Test Item',999,1,9.99,0,'Test Item 3. Delete in prod');
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=58764025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_notes`
--

LOCK TABLES `account_notes` WRITE;
/*!40000 ALTER TABLE `account_notes` DISABLE KEYS */;
INSERT INTO `account_notes` VALUES (1,1,'Customer requested plan review.','2025-12-14 20:12:42','ACC-10001'),(2,2,'Billing verified and confirmed.','2025-12-14 20:12:42','ACC-10001'),(3,1,'Customer asked about plan options.','2025-12-14 20:12:42','ACC-20002'),(2576937,1,'test','2026-03-21 17:38:07','ACC-10001'),(58764024,1,'test 2','2026-03-21 17:40:27','ACC-10001');
/*!40000 ALTER TABLE `account_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acct_search_history`
--

DROP TABLE IF EXISTS `acct_search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acct_search_history` (
  `sid` int DEFAULT NULL,
  `employee_pid` int DEFAULT NULL,
  `search_method` text,
  `search_gave_results` tinyint(1) DEFAULT NULL,
  `located_account_number` text,
  `is_sensitive_account` tinyint(1) DEFAULT NULL,
  `date_time_searched` datetime DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acct_search_history`
--

LOCK TABLES `acct_search_history` WRITE;
/*!40000 ALTER TABLE `acct_search_history` DISABLE KEYS */;
INSERT INTO `acct_search_history` VALUES (0,1,'Phone Number',1,'PENDING',0,'2026-03-22 14:02:48');
/*!40000 ALTER TABLE `acct_search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_feedback`
--

DROP TABLE IF EXISTS `agent_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_feedback` (
  `fid` int DEFAULT NULL,
  `reported_uid` int DEFAULT NULL,
  `for_agent_uid` int DEFAULT NULL,
  `feedback_type` text,
  `topic` text,
  `description` text,
  `is_visible_to_agent` tinyint(1) DEFAULT NULL,
  `mgr_reviewed` tinyint(1) DEFAULT NULL,
  `needs_coaching` tinyint(1) DEFAULT NULL,
  `mgr_comments` text,
  `agent_comments` text
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_feedback`
--

LOCK TABLES `agent_feedback` WRITE;
/*!40000 ALTER TABLE `agent_feedback` DISABLE KEYS */;
INSERT INTO `agent_feedback` VALUES (4500518,1,2,'Negitive','they suck','i hate them ',0,0,0,'','');
/*!40000 ALTER TABLE `agent_feedback` ENABLE KEYS */;
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
  `is_active` tinyint(1) NOT NULL,
  `hire_date` date NOT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_leadership` tinyint(1) NOT NULL DEFAULT '0',
  `can_access_RMS_lite` tinyint(1) NOT NULL,
  `is_franchise_employee` tinyint(1) NOT NULL,
  PRIMARY KEY (`PID`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_logins`
--

LOCK TABLES `company_logins` WRITE;
/*!40000 ALTER TABLE `company_logins` DISABLE KEYS */;
INSERT INTO `company_logins` VALUES (1,'Alice','Brown','Customer Service Rep','alice@company.com','password123',0,1,'2023-01-10',0,0,1,0),(2,'Bob','Green','Sales Manager','bob@company.com','password123',0,1,'2021-06-15',1,0,1,0),(3,'Charlie','Davis','Tech Support','charlie@company.com','password123',1,0,'2020-11-20',0,0,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `current_credits` double DEFAULT NULL,
  `is_sensitive` tinyint(1) DEFAULT NULL,
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
INSERT INTO `customer_info` VALUES (1,'Mr.','John','A','Doe',NULL,'john.doe@example.com',0,'123-45-6789','1985-06-15 00:00:00','D1234567','MO','2028-05-01 00:00:00','5125552000',NULL,NULL,'1500','Corporate Woods Dr',NULL,'Chesterfield','MO','63017','MegaCorp LLC',1,1,1,'Business','123-45-6789','A',5,'2025-12-14 14:12:42','Corporate','ACC-10001',0,0,100,NULL),(2,'Ms.','Jane',NULL,'Smith',NULL,'jane.smith@example.com',0,'987-65-4321','1990-02-20 00:00:00','S7654321','MO','2027-09-30 00:00:00','6365553333','REDACTED',NULL,'42','Market St','Apt 5','St. Louis','MO','63101','Acme Co',0,0,0,'Personal','987-65-4321','B',2,'2025-12-14 14:12:42','Consumer','ACC-20002',20,1,0,NULL);
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
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `dvid` int DEFAULT NULL,
  `device_type` text,
  `device_make` text,
  `device_model` text,
  `device_imei` text,
  `device_release_year` text,
  `payment_plan_eligable` tinyint(1) DEFAULT NULL,
  `payment_plan_monthly_cost` double DEFAULT NULL,
  `up_front_cost` double DEFAULT NULL,
  `is_pre_order` tinyint(1) DEFAULT NULL,
  `is_pending_shipment` tinyint(1) DEFAULT NULL,
  `is_refurb` tinyint(1) DEFAULT NULL,
  `return_eligable` tinyint(1) DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'Smartphone','Samsung','Galaxy S23','9781234567891','2023',1,89.99,799,0,0,0,1),(2,'Smartphone','Apple','iPhone 15','9781234567892','2023',1,79.99,999,0,0,0,1),(3,'Tablet','Samsung','Galaxy Tab S8','9781234567893','2023',0,39.99,449,0,0,0,1),(4,'Smartphone','Google','Pixel 8','9781234567894','2023',1,99.99,699,0,0,0,1),(5,'Smartphone','OnePlus','12','9781234567895','2023',0,49.99,699,0,0,0,1),(6,'Smartphone','Xiaomi','14','9781234567896','2023',1,69.99,599,0,0,0,1),(7,'Smartphone','Motorola','Edge 50','9781234567897','2023',0,59.99,449,0,0,1,0),(8,'Tablet','Apple','iPad Air','9781234567898','2023',1,49.99,399,0,0,0,1),(9,'IoT Device','Amazon','Echo Dot (5th Gen)','9781234567899','2023',1,29.99,49.99,0,0,0,1),(10,'Hotspot','Tmobile','Mace II','9781234567810','2023',0,49.99,79.99,0,0,0,1);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `dscid` int DEFAULT NULL,
  `discount_perc_off` double DEFAULT NULL,
  `discount_usd_off` double DEFAULT NULL,
  `requires_mgr_approval` tinyint(1) DEFAULT NULL,
  `discount_name` text,
  `discount_description` text,
  `discount_use` text,
  `is_active` tinyint(1) DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,-1,50,0,'Test Discount. $50 off','A Test discount for dev purposes. Delete in prod.','Other Accessories',1),(2,50,-1,0,'Percentage discount','A Test discount for dev purposes. Delete in prod.','Other Accessories',1);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
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
) ;
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
-- Table structure for table `manager_signoffs`
--

DROP TABLE IF EXISTS `manager_signoffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_signoffs` (
  `soid` int DEFAULT NULL,
  `date_time_preformed` datetime DEFAULT NULL,
  `for_assosiate_pid` int DEFAULT NULL,
  `mgr_pid` int DEFAULT NULL,
  `reason_for_signoff` text
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_signoffs`
--

LOCK TABLES `manager_signoffs` WRITE;
/*!40000 ALTER TABLE `manager_signoffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_signoffs` ENABLE KEYS */;
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
INSERT INTO `phone_bills` VALUES (1,'2025-01-01','2025-01-31',0.00,0.00,1,'2025-02-01','2026-03-16','Paid','12,14,18','ACC-10001'),(2,'2025-01-01','2025-01-31',0.00,0.00,1,'2025-02-01','2026-03-16','Paid','14','ACC-10001');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type_of_device` text,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_plans`
--

LOCK TABLES `phone_plans` WRITE;
/*!40000 ALTER TABLE `phone_plans` DISABLE KEYS */;
INSERT INTO `phone_plans` VALUES (1,'Standard Plan','A balanced plan with talk, text, and data',1,1,NULL,1,NULL,0,10,0,5,0,1,'Smartphone'),(2,'Business Premium','Unlimited data plan for business users',1,1,NULL,1,NULL,1,NULL,1,50,0,1,'Smartphone'),(3,'Prepaid Basic','Affordable prepaid plan with limited data',1,0,500,1,NULL,0,5,0,2,1,0,'Smartphone'),(4,'Unlimited Tablet Plan','This plan includes Unlimited Data for your cellular tablet!',1,0,0,0,0,1,9999,0,100,0,1,'Tablet');
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
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycled_devices`
--

LOCK TABLES `recycled_devices` WRITE;
/*!40000 ALTER TABLE `recycled_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `recycled_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `rid` int DEFAULT NULL,
  `date_time_of_return` datetime DEFAULT NULL,
  `type_of_item` text,
  `free_of_cracks` tinyint(1) DEFAULT NULL,
  `free_of_dents` tinyint(1) DEFAULT NULL,
  `device_formatted` tinyint(1) DEFAULT NULL,
  `can_go_through_setup` tinyint(1) DEFAULT NULL,
  `opened` tinyint(1) DEFAULT NULL,
  `liquid_damage` tinyint(1) DEFAULT NULL,
  `is_eligable` tinyint(1) DEFAULT NULL,
  `status` text,
  `method_of_return` text,
  `store_number` text,
  `email` text
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,'2026-03-16 06:55:32','Other cable',1,1,1,1,1,1,1,'Unable to return','mail','na','test@test.com');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
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
-- Table structure for table `transactions_all`
--

DROP TABLE IF EXISTS `transactions_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_all` (
  `tid` int DEFAULT NULL,
  `type_of_transaction` text,
  `orig_subtotal` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `discounts_given` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `payment_method` text,
  `cash_given_total` double DEFAULT NULL,
  `change_given` double DEFAULT NULL,
  `date_time_of_transaction` datetime DEFAULT NULL,
  `is_finalized` tinyint(1) DEFAULT NULL,
  `pid_of_assosiate` int DEFAULT NULL,
  `cx_acct_number` text
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_all`
--

LOCK TABLES `transactions_all` WRITE;
/*!40000 ALTER TABLE `transactions_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_pending`
--

DROP TABLE IF EXISTS `transactions_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_pending` (
  `ptid` text,
  `order_number` text,
  `item_name` text,
  `item_price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `is_activation` tinyint(1) DEFAULT NULL,
  `for_account_number` text,
  `handeling_agent_pid` int DEFAULT NULL,
  `status` text
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_pending`
--

LOCK TABLES `transactions_pending` WRITE;
/*!40000 ALTER TABLE `transactions_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_pending` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ;
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

-- Dump completed on 2026-03-22 14:04:48
