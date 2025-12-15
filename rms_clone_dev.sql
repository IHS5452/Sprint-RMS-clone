-- rms_seed_full.sql
-- Full schema + sample data (account_number-based) for customer search joins
-- Includes customer_info + phone_numbers + related tables used in app queries.
-- Safe to import into a fresh MySQL database.

-- ------------------------------------------------------
-- Create database
-- -----------------------------------------------------

-- ------------------------------------------------------
-- Tables
-- ------------------------------------------------------

DROP TABLE IF EXISTS account_notes;
CREATE TABLE account_notes (
  note_id int NOT NULL AUTO_INCREMENT,
  created_by_pid int NOT NULL,
  note_content text NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  account_number varchar(255) DEFAULT NULL,
  PRIMARY KEY (note_id),
  KEY idx_account_notes_account_number (account_number)
);

DROP TABLE IF EXISTS company_logins;
CREATE TABLE company_logins (
  PID int NOT NULL,
  agent_fname varchar(255) NOT NULL,
  agent_lname varchar(255) NOT NULL,
  agent_position varchar(255) NOT NULL,
  company_email varchar(255) NOT NULL,
  password_to_rms varchar(255) NOT NULL,
  is_contractor tinyint(1) NOT NULL,
  is_active_in_payroll tinyint(1) NOT NULL,
  hire_date date NOT NULL,
  is_manager tinyint(1) NOT NULL DEFAULT 0,
  is_leadership tinyint(1) NOT NULL DEFAULT 0,
  can_access_RMS_lite tinyint(1) NOT NULL,
  is_franchise_employee tinyint(1) NOT NULL,
  PRIMARY KEY (PID)
);

DROP TABLE IF EXISTS csr_extensions;
CREATE TABLE csr_extensions (
  csr_id int NOT NULL AUTO_INCREMENT,
  csr_extension varchar(20) NOT NULL,
  csr_type enum('Voice','Data','Business','Personal') NOT NULL,
  account_number varchar(255) DEFAULT NULL,
  PRIMARY KEY (csr_id),
  KEY idx_csr_extensions_account_number (account_number)
);

DROP TABLE IF EXISTS customer_alerts;
CREATE TABLE customer_alerts (
  alert_id int NOT NULL AUTO_INCREMENT,
  alert_title varchar(255) NOT NULL,
  alert_desc text NOT NULL,
  is_active tinyint(1) NOT NULL DEFAULT 1,
  datetime_added timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  account_number varchar(255) DEFAULT NULL,
  PRIMARY KEY (alert_id),
  KEY idx_customer_alerts_account_number (account_number)
);

DROP TABLE IF EXISTS customer_info;
CREATE TABLE customer_info (
  id int NOT NULL AUTO_INCREMENT,
  prefix varchar(50) DEFAULT NULL,
  firstName varchar(100) DEFAULT NULL,
  middleName varchar(100) DEFAULT NULL,
  lastName varchar(100) DEFAULT NULL,
  suffix varchar(50) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  emailNotProvided tinyint(1) DEFAULT 0,
  ssn varchar(50) DEFAULT NULL,
  birthDate datetime DEFAULT NULL,
  dlNumber varchar(100) DEFAULT NULL,
  dlState varchar(10) DEFAULT NULL,
  dlExp datetime DEFAULT NULL,
  contactPhone1 varchar(20) DEFAULT NULL,
  contactPhone2 varchar(20) DEFAULT NULL,
  contactPhone3 varchar(20) DEFAULT NULL,
  streetNumber varchar(20) DEFAULT NULL,
  streetName varchar(255) DEFAULT NULL,
  addressLine2 varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  state varchar(10) DEFAULT NULL,
  zip varchar(20) DEFAULT NULL,
  employer varchar(255) DEFAULT NULL,
  isNvp tinyint(1) DEFAULT 0,
  assignToBusinessAccount tinyint(1) DEFAULT 0,
  attachToHierarchy tinyint(1) DEFAULT 0,
  accountType varchar(255) DEFAULT NULL,
  creditSsn varchar(50) DEFAULT NULL,
  creditClass varchar(50) DEFAULT NULL,
  approvedLines int DEFAULT 0,
  lastDateChecked datetime DEFAULT NULL,
  typeOfAccount varchar(255) DEFAULT NULL,
  account_number varchar(255) DEFAULT NULL,
  downpay_perc int DEFAULT NULL,
  downpayment_needed tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_customer_info_account_number (account_number),
  KEY idx_customer_info_name (lastName, firstName)
);

DROP TABLE IF EXISTS phone_numbers;
CREATE TABLE phone_numbers (
  id int NOT NULL AUTO_INCREMENT,
  type_of_line varchar(50) DEFAULT NULL,
  phoneNumber varchar(20) NOT NULL,
  date_time_added_to_acct timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  caller_id_fname varchar(255) NOT NULL,
  caller_id_lname varchar(255) NOT NULL,
  is_unlimited_talk tinyint(1) NOT NULL,
  is_unlimited_text tinyint(1) NOT NULL,
  is_unlimited_data tinyint(1) NOT NULL,
  ammt_of_priority_data_gb int NOT NULL,
  plan_name varchar(255) NOT NULL,
  plan_code int NOT NULL,
  can_inbound tinyint(1) NOT NULL,
  can_outbound tinyint(1) NOT NULL,
  is_forwarding_calls tinyint(1) NOT NULL,
  forward_calls_number varchar(20) DEFAULT NULL,
  assigned_service_ids_csv varchar(255) DEFAULT NULL,
  account_number varchar(255) DEFAULT NULL,
  is_active tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_phone_numbers_account_number (account_number),
  KEY idx_phone_numbers_phone (phoneNumber)
);

DROP TABLE IF EXISTS phone_bills;
CREATE TABLE phone_bills (
  bill_id int NOT NULL AUTO_INCREMENT,
  bill_cycle_start_date date NOT NULL,
  bill_cycle_end_date date NOT NULL,
  total_amount_due decimal(10,2) NOT NULL,
  total_amount_paid decimal(10,2) NOT NULL,
  is_paid tinyint(1) NOT NULL,
  payment_due_date date NOT NULL,
  payment_received_date date DEFAULT NULL,
  bill_status varchar(50) DEFAULT NULL,
  service_ids_csv varchar(255) NOT NULL,
  account_number varchar(255) DEFAULT NULL,
  PRIMARY KEY (bill_id),
  KEY idx_phone_bills_account_number (account_number)
);

DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
  payment_id int NOT NULL AUTO_INCREMENT,
  bill_id int NOT NULL,
  payment_amount decimal(10,2) NOT NULL,
  payment_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_method varchar(50) NOT NULL,
  PRIMARY KEY (payment_id),
  KEY idx_payments_bill_id (bill_id),
  CONSTRAINT payments_ibfk_1 FOREIGN KEY (bill_id) REFERENCES phone_bills (bill_id)
);

DROP TABLE IF EXISTS services;
CREATE TABLE services (
  service_id int NOT NULL AUTO_INCREMENT,
  is_active tinyint(1) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  service_name varchar(255) NOT NULL,
  service_desc varchar(255) NOT NULL,
  requires_supervisor_approval tinyint(1) DEFAULT NULL,
  monthly_price double DEFAULT NULL,
  PRIMARY KEY (service_id)
);

DROP TABLE IF EXISTS phone_plans;
CREATE TABLE phone_plans (
  plan_id int NOT NULL AUTO_INCREMENT,
  plan_name varchar(255) NOT NULL,
  plan_description text NOT NULL,
  is_active tinyint(1) NOT NULL,
  is_unlimited_talk_mins tinyint(1) NOT NULL,
  max_num_talk_mins int DEFAULT NULL,
  is_unlimited_texts tinyint(1) NOT NULL,
  max_num_texts int DEFAULT NULL,
  is_unlimited_data tinyint(1) NOT NULL,
  max_data_gb int DEFAULT NULL,
  is_unlimited_priority_data tinyint(1) NOT NULL,
  max_priority_data_gb int DEFAULT NULL,
  is_prepaid tinyint(1) NOT NULL,
  is_postpaid tinyint(1) NOT NULL,
  PRIMARY KEY (plan_id)
);

DROP TABLE IF EXISTS customer_services_list;
CREATE TABLE customer_services_list (
  service_entry_id int NOT NULL AUTO_INCREMENT,
  associated_service_id int NOT NULL,
  assosiated_phone_number varchar(30) DEFAULT NULL,
  associated_service_name varchar(255) NOT NULL,
  associated_service_effective_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  associated_service_falloff_date date DEFAULT NULL,
  pid_of_added_user int NOT NULL,
  cost_per_month double NOT NULL,
  PRIMARY KEY (service_entry_id),
  KEY idx_csl_phone (assosiated_phone_number),
  KEY idx_csl_service_id (associated_service_id)
);

DROP TABLE IF EXISTS user_alerts;
CREATE TABLE user_alerts (
  alert_id int NOT NULL AUTO_INCREMENT,
  alert_title text NOT NULL,
  alert_desc text NOT NULL,
  is_active tinyint(1) NOT NULL,
  datetime_added timestamp NOT NULL,
  account_number varchar(255) DEFAULT NULL,
  PRIMARY KEY (alert_id),
  KEY idx_user_alerts_account_number (account_number)
);


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
);


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


SET FOREIGN_KEY_CHECKS=1;

-- ------------------------------------------------------
-- Sample data (designed to match your JOINs on account_number)
-- ------------------------------------------------------
START TRANSACTION;

INSERT INTO `homepage_news` VALUES (0,'test title','this is a test of the new news system. \n new line...',1,'2025-12-11 13:35:59');


INSERT INTO `user_info` VALUES (1,NULL,'John','A.','Doe','','john.doe@example.com',0,'123-45-6789','1985-06-15','D1234567','CA','2028-04-15','555-1234',NULL,NULL,'123','Main St',NULL,'Los Angeles','CA','90001','TechCorp',1,0,'123-45-6789','A',3,'2025-03-20','Personal','GROUP123'),(2,NULL,'Jane','B.','Smith','','jane.smith@example.com',0,'987-65-4321','1992-08-22','S9876543','TX','2030-09-30','555-5678',NULL,NULL,'456','Elm St','Apt 2B','Dallas','TX','75201','FinanceCo',0,1,'987-65-4321','B',2,'2025-03-18','Business','GROUP123'),(3,'Dr.','Emily','C.','Johnson','PhD','emily.johnson@example.com',0,'654-32-1987','1979-12-05','J6543210','NY','2029-06-25','555-9876',NULL,NULL,'789','Broadway','Suite 101','New York','NY','10001','EduInstitute',0,0,'654-32-1987','C',1,'2025-03-15','Prepaid','GROUP456');



-- Logins + extensions (handy if your UI expects them)
INSERT INTO company_logins (PID, agent_fname, agent_lname, agent_position, company_email, password_to_rms, is_contractor, is_active_in_payroll, hire_date, is_manager, is_leadership, can_access_RMS_lite, is_franchise_employee)
VALUES
(1,'Alice','Brown','Customer Service Rep','alice@company.com','password123',0,1,'2023-01-10',0,0,1,0),
(2,'Bob','Green','Sales Manager','bob@company.com','securepass2',0,1,'2021-06-15',1,1,1,0),
(3,'Charlie','Davis','Tech Support','charlie@company.com','securepass3',1,1,'2020-11-20',0,0,1,1);

INSERT INTO csr_extensions (csr_extension, csr_type, account_number) VALUES
('1001','Voice',NULL),
('1002','Data',NULL),
('1003','Business','ACC-10001');

-- Services + plans (optional, but useful for UI dropdowns etc.)
INSERT INTO services (service_id, is_active, created_at, service_name, service_desc, requires_supervisor_approval, monthly_price) VALUES
(12,1,'2025-11-29 21:25:21','International Calling Add-On','Add international calling capabilities to the line.',0,0),
(14,1,'2025-11-29 21:25:21','Voicemail Provisioning','Enable or repair voicemail services for the customer line.',0,0),
(18,1,'2025-11-29 21:25:21','Priority Data Add-On','Add additional priority data to this phone line.',1,9.99);

INSERT INTO phone_plans (plan_id, plan_name, plan_description, is_active, is_unlimited_talk_mins, max_num_talk_mins, is_unlimited_texts, max_num_texts, is_unlimited_data, max_data_gb, is_unlimited_priority_data, max_priority_data_gb, is_prepaid, is_postpaid) VALUES
(1,'Standard Plan','A balanced plan with talk, text, and data',1,1,NULL,1,NULL,0,10,0,5,0,1),
(2,'Business Premium','Unlimited data plan for business users',1,1,NULL,1,NULL,1,NULL,1,50,0,1),
(3,'Prepaid Basic','Affordable prepaid plan with limited data',1,0,500,1,NULL,0,5,0,2,1,0);

-- Core customer + phones (THIS is what your searchCustomer() expects)
INSERT INTO customer_info (
  prefix, firstName, middleName, lastName, suffix,
  email, emailNotProvided, ssn, birthDate,
  dlNumber, dlState, dlExp,
  contactPhone1, contactPhone2, contactPhone3,
  streetNumber, streetName, addressLine2, city, state, zip,
  employer, isNvp, assignToBusinessAccount, attachToHierarchy,
  accountType, creditSsn, creditClass, approvedLines,
  lastDateChecked, typeOfAccount, account_number
) VALUES
(
  'Mr.', 'John', 'A', 'Doe', NULL,
  'john.doe@example.com', 0, '123-45-6789', '1985-06-15 00:00:00',
  'D1234567', 'MO', '2028-05-01 00:00:00',
  '5125552000', NULL, NULL,
  '1500', 'Corporate Woods Dr', NULL, 'Chesterfield', 'MO', '63017',
  'MegaCorp LLC', 1, 1, 1,
  'Business', '123-45-6789', 'A', 5,
  NOW(), 'Corporate', 'ACC-10001'
),
(
  'Ms.', 'Jane', NULL, 'Smith', NULL,
  'jane.smith@example.com', 0, '987-65-4321', '1990-02-20 00:00:00',
  'S7654321', 'MO', '2027-09-30 00:00:00',
  '6365553333', '6365553334', NULL,
  '42', 'Market St', 'Apt 5', 'St. Louis', 'MO', '63101',
  'Acme Co', 0, 0, 0,
  'Personal', '987-65-4321', 'B', 2,
  NOW(), 'Consumer', 'ACC-20002'
);

INSERT INTO phone_numbers (
  type_of_line, phoneNumber,
  caller_id_fname, caller_id_lname,
  is_unlimited_talk, is_unlimited_text, is_unlimited_data,
  ammt_of_priority_data_gb,
  plan_name, plan_code,
  can_inbound, can_outbound, is_forwarding_calls,
  forward_calls_number,
  assigned_service_ids_csv,
  account_number, is_active
) VALUES
(
  'Business Voice Postpaid', '5125552000',
  'John', 'Doe',
  1, 1, 0,
  50,
  'MegaCorp Business Voice', 501,
  1, 1, 0,
  NULL,
  '12,14',
  'ACC-10001', 1
),
(
  'Business Data Only Postpaid', '5125552001',
  'John', 'Doe',
  0, 0, 1,
  100,
  'MegaCorp Business Unlimited Data', 502,
  1, 0, 0,
  NULL,
  '18',
  'ACC-10001', 1
),
(
  'Personal Voice Postpaid', '6365553333',
  'Jane', 'Smith',
  1, 1, 0,
  10,
  'Personal Unlimited Talk & Text', 201,
  1, 1, 0,
  NULL,
  '14',
  'ACC-20002', 1
);

-- Service list entries tied to phone numbers
INSERT INTO customer_services_list (associated_service_id, assosiated_phone_number, associated_service_name, associated_service_effective_date, associated_service_falloff_date, pid_of_added_user, cost_per_month)
VALUES
(12,'5125552000','International Calling Add-On',NOW(),NULL,1,15),
(14,'5125552000','Voicemail Provisioning',NOW(),NULL,1,0),
(18,'5125552001','Priority Data Add-On',NOW(),NULL,2,20),
(14,'6365553333','Voicemail Provisioning',NOW(),NULL,1,0);

-- Billing + payments (FK safe)
INSERT INTO phone_bills (
  bill_cycle_start_date, bill_cycle_end_date,
  total_amount_due, total_amount_paid,
  is_paid, payment_due_date, payment_received_date,
  bill_status, service_ids_csv, account_number
) VALUES
(
  '2025-01-01', '2025-01-31',
  129.99, 129.99,
  1, '2025-02-01', '2025-01-29',
  'Paid', '12,14,18', 'ACC-10001'
),
(
  '2025-01-01', '2025-01-31',
  59.99, 0.00,
  0, '2025-02-01', NULL,
  'Pending', '14', 'ACC-20002'
);

INSERT INTO payments (bill_id, payment_amount, payment_method)
VALUES
(1, 129.99, 'Credit Card');

-- Notes + alerts keyed by account_number
INSERT INTO account_notes (created_by_pid, note_content, account_number) VALUES
(1, 'Customer requested plan review.', 'ACC-10001'),
(2, 'Billing verified and confirmed.', 'ACC-10001'),
(1, 'Customer asked about plan options.', 'ACC-20002');

INSERT INTO customer_alerts (alert_title, alert_desc, is_active, account_number) VALUES
('Billing Paid','Your most recent invoice has been successfully paid.',1,'ACC-10001'),
('Payment Due','Your invoice is due soon.',1,'ACC-20002');

INSERT INTO user_alerts (alert_title, alert_desc, is_active, datetime_added, account_number) VALUES
('VIP Business Account','Handle with priority support.',1,NOW(),'ACC-10001');

COMMIT;

-- ------------------------------------------------------
-- Helpful indexes for your search patterns
-- ------------------------------------------------------
CREATE INDEX idx_ci_account_number_trim ON customer_info (account_number);
CREATE INDEX idx_cp_account_number_trim ON phone_numbers (account_number);

-- End of file
