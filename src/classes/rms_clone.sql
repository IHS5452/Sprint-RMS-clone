DROP TABLE IF EXISTS user_info CASCADE;

CREATE TABLE IF NOT EXISTS user_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prefix VARCHAR(50),
    firstName VARCHAR(100),
    middleName VARCHAR(100),
    lastName VARCHAR(100),
    suffix VARCHAR(50),
    email VARCHAR(255),
    emailNotProvided BOOLEAN,
    ssn VARCHAR(11),
    birthDate DATE,
    dlNumber VARCHAR(50),
    dlState VARCHAR(2),
    dlExp DATE,
    contactPhone1 VARCHAR(20),
    contactPhone2 VARCHAR(20),
    contactPhone3 VARCHAR(20),
    streetNumber VARCHAR(20),
    streetName VARCHAR(255),
    addressLine2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(2),
    zip VARCHAR(10),
    employer VARCHAR(255),
    assignToBusinessAccount BOOLEAN,
    attachToEmployeeAccount BOOLEAN,
    creditSsn VARCHAR(11),
    creditClass VARCHAR(50),
    approvedLines INT,
    lastDateChecked DATE,
    agent_type VARCHAR(50), 
    groupId VARCHAR(50)
);

INSERT INTO user_info (prefix, firstName, middleName, lastName, suffix, email, emailNotProvided, ssn, birthDate, dlNumber, dlState, dlExp, contactPhone1, contactPhone2, contactPhone3, streetNumber, streetName, addressLine2, city, state, zip, employer, assignToBusinessAccount, attachToEmployeeAccount, creditSsn, creditClass, approvedLines, lastDateChecked, agent_type, groupId)
VALUES
(null, 'John', 'A.', 'Doe', '', 'john.doe@example.com', FALSE, '123-45-6789', '1985-06-15', 'D1234567', 'CA', '2028-04-15', '555-1234', NULL, NULL, '123', 'Main St', NULL, 'Los Angeles', 'CA', '90001', 'TechCorp', TRUE, FALSE, '123-45-6789', 'A', 3, '2025-03-20', 'Personal', 'GROUP123'),
(null, 'Jane', 'B.', 'Smith', '', 'jane.smith@example.com', FALSE, '987-65-4321', '1992-08-22', 'S9876543', 'TX', '2030-09-30', '555-5678', NULL, NULL, '456', 'Elm St', 'Apt 2B', 'Dallas', 'TX', '75201', 'FinanceCo', FALSE, TRUE, '987-65-4321', 'B', 2, '2025-03-18', 'Business', 'GROUP123'),
('Dr.', 'Emily', 'C.', 'Johnson', 'PhD', 'emily.johnson@example.com', FALSE, '654-32-1987', '1979-12-05', 'J6543210', 'NY', '2029-06-25', '555-9876', NULL, NULL, '789', 'Broadway', 'Suite 101', 'New York', 'NY', '10001', 'EduInstitute', FALSE, FALSE, '654-32-1987', 'C', 1, '2025-03-15', 'Prepaid', 'GROUP456');

CREATE TABLE IF NOT EXISTS phone_numbers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  assigned_to_group_id VARCHAR(50) NOT NULL,
  type_of_line VARCHAR(50) CHECK (type_of_line IN ('Voice Prepaid','Data Only Prepaid', 'Personal Voice Postpaid', 'Personal Data Only Postpaid', 'Business Voice Postpaid', 'Business Data Only Postpaid')), 
  phoneNumber VARCHAR(20) NOT NULL,
  date_time_added_to_acct TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  caller_id_fname VARCHAR(255) NOT NULL,
  caller_id_lname VARCHAR(255) NOT NULL,
  is_unlimited_talk BOOLEAN NOT NULL,
  is_unlimited_text BOOLEAN NOT NULL,
  is_unlimited_data BOOLEAN NOT NULL,
  ammt_of_priority_data_gb INT NOT NULL,
  plan_name VARCHAR(255) NOT NULL,
  plan_code INT NOT NULL,
  can_inbound BOOLEAN NOT NULL,
  can_outbound BOOLEAN NOT NULL,
  is_forwarding_calls BOOLEAN NOT NULL,
  forward_calls_number VARCHAR(20) NULL,
  assigned_service_ids_csv VARCHAR(255) NULL
);

INSERT INTO phone_numbers (assigned_to_group_id, type_of_line, phoneNumber, date_time_added_to_acct, caller_id_fname, caller_id_lname, is_unlimited_talk, is_unlimited_text, is_unlimited_data, ammt_of_priority_data_gb, plan_name, plan_code, can_inbound, can_outbound, is_forwarding_calls, forward_calls_number, assigned_service_ids_csv)
VALUES
('GROUP123', 'Personal Voice Postpaid', '555-1111', NOW(), 'John', 'Doe', TRUE, TRUE, FALSE, 10, 'Standard Plan', 101, TRUE, TRUE, FALSE, NULL, '1,2'),
('GROUP123', 'Business Data Only Postpaid', '555-2222', NOW(), 'Jane', 'Smith', TRUE, TRUE, TRUE, 50, 'Business Premium', 102, TRUE, TRUE, FALSE, NULL, '3,4'),
('GROUP456', 'Voice Prepaid', '555-3333', NOW(), 'Emily', 'Johnson', FALSE, TRUE, FALSE, 5, 'Prepaid Basic', 103, TRUE, TRUE, FALSE, NULL, '5');

CREATE TABLE IF NOT EXISTS phone_plans (
  plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plan_name VARCHAR(255) NOT NULL,
  plan_description TEXT NOT NULL,
  is_active BOOLEAN NOT NULL,
  is_unlimited_talk_mins BOOLEAN NOT NULL,
  max_num_talk_mins INT NULL,
  is_unlimited_texts BOOLEAN NOT NULL,
  max_num_texts INT NULL,
  is_unlimited_data BOOLEAN NOT NULL,
  max_data_gb INT NULL,
  is_unlimited_priority_data BOOLEAN NOT NULL,
  max_priority_data_gb INT NULL,
  is_prepaid BOOLEAN NOT NULL,
  is_postpaid BOOLEAN NOT NULL
);

INSERT INTO phone_plans (plan_name, plan_description, is_active, is_unlimited_talk_mins, max_num_talk_mins, is_unlimited_texts, max_num_texts, is_unlimited_data, max_data_gb, is_unlimited_priority_data, max_priority_data_gb, is_prepaid, is_postpaid)
VALUES
('Standard Plan', 'A balanced plan with talk, text, and data', TRUE, TRUE, NULL, TRUE, NULL, FALSE, 10, FALSE, 5, FALSE, TRUE),
('Business Premium', 'Unlimited data plan for business users', TRUE, TRUE, NULL, TRUE, NULL, TRUE, NULL, TRUE, 50, FALSE, TRUE),
('Prepaid Basic', 'Affordable prepaid plan with limited data', TRUE, FALSE, 500, TRUE, NULL, FALSE, 5, FALSE, 2, TRUE, FALSE);

CREATE TABLE IF NOT EXISTS user_alerts (
  alert_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  assigned_to_group VARCHAR(50) NOT NULL,
  alert_title TEXT NOT NULL,
  alert_desc TEXT NOT NULL,
  is_active BOOLEAN NOT NULL,
  datetime_added TIMESTAMP NOT NULL
);

INSERT INTO user_alerts (assigned_to_group, alert_title, alert_desc, is_active, datetime_added)
VALUES
('GROUP123', 'Billing Issue', 'Your recent payment has failed.', TRUE, NOW()),
('GROUP123', 'Plan Upgrade', 'You are eligible for a free upgrade.', TRUE, NOW()),
('GROUP456', 'Data Usage Warning', 'You have used 90% of your data.', TRUE, NOW());

CREATE TABLE IF NOT EXISTS company_logins (
  PID INT NOT NULL,
  agent_fname VARCHAR(255) NOT NULL,
  agent_lname VARCHAR(255) NOT NULL,
  agent_position VARCHAR(255) NOT NULL,
  company_email VARCHAR(255) NOT NULL,
  password_to_rms VARCHAR(255) NOT NULL,
  is_contractor BOOLEAN NOT NULL,
  is_active_in_payroll BOOLEAN NOT NULL,
  hire_date DATE NOT NULL,
  is_manager BOOLEAN NOT NULL DEFAULT FALSE,
  is_leadership BOOLEAN NOT NULL DEFAULT FALSE,
  can_access_RMS_lite BOOLEAN NOT NULL,
  is_franchise_employee BOOLEAN NOT NULL
);

INSERT INTO company_logins (PID, agent_fname, agent_lname, agent_position, company_email, password_to_rms, is_contractor, is_active_in_payroll, hire_date, is_manager, is_leadership, can_access_RMS_lite, is_franchise_employee)
VALUES
(1, 'Alice', 'Brown', 'Customer Service Rep', 'alice@company.com', 'password123', FALSE, TRUE, '2023-01-10', FALSE, FALSE, TRUE, FALSE),
(2, 'Bob', 'Green', 'Sales Manager', 'bob@company.com', 'securepass2', FALSE, TRUE, '2021-06-15', TRUE, TRUE, TRUE, FALSE),
(3, 'Charlie', 'Davis', 'Tech Support', 'charlie@company.com', 'securepass3', TRUE, TRUE, '2020-11-20', FALSE, FALSE, TRUE, TRUE);

CREATE TABLE IF NOT EXISTS account_notes (
  note_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created_by_pid INT NOT NULL,
  assigned_to_group_id VARCHAR(50) NOT NULL,
  note_content TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO account_notes (created_by_pid, assigned_to_group_id, note_content, created_at)
VALUES
(1, 'GROUP123', 'Customer requested plan change.', NOW()),
(2, 'GROUP123', 'Fraud alert flagged on account.', NOW()),
(3, 'GROUP456', 'Address verification completed.', NOW());

CREATE TABLE IF NOT EXISTS services (
  service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  is_active BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  service_name VARCHAR(255) NOT NULL,
  service_desc VARCHAR(255) NOT NULL,
  requires_supervisor_approval BOOLEAN
);

INSERT INTO services (is_active, service_name, service_desc, requires_supervisor_approval)
VALUES
(TRUE, 'Call Forwarding', 'Enables call forwarding to another number', FALSE),
(TRUE, 'Voicemail', 'Standard voicemail service', FALSE),
(TRUE, 'International Calling', 'Enable international dialing capabilities', TRUE);

CREATE TABLE IF NOT EXISTS csr_extensions (
  csr_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  csr_extension VARCHAR(20) NOT NULL,
  csr_type ENUM('Voice', 'Data', 'Business', 'Personal') NOT NULL,
  group_id VARCHAR(50) NOT NULL
);

INSERT INTO csr_extensions (csr_extension, csr_type, group_id)
VALUES
('1001', 'Voice', 'GROUP123'),
('1002', 'Data', 'GROUP123'),
('1003', 'Business', 'GROUP456');



CREATE TABLE IF NOT EXISTS phone_bills (
  bill_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  assigned_to_group_id VARCHAR(50) NOT NULL,
  bill_cycle_start_date DATE NOT NULL,
  bill_cycle_end_date DATE NOT NULL,
  total_amount_due DECIMAL(10, 2) NOT NULL,
  total_amount_paid DECIMAL(10, 2) NOT NULL,
  is_paid BOOLEAN NOT NULL,
  payment_due_date DATE NOT NULL,
  payment_received_date DATE,
  bill_status VARCHAR(50) CHECK (bill_status IN ('Pending', 'Paid', 'Overdue')),
  service_ids_csv VARCHAR(255) NOT NULL
);

INSERT INTO phone_bills (assigned_to_group_id, bill_cycle_start_date, bill_cycle_end_date, total_amount_due, total_amount_paid, is_paid, payment_due_date, payment_received_date, bill_status, service_ids_csv)
VALUES
('GROUP123', '2025-01-01', '2025-01-31', 99.99, 99.99, TRUE, '2025-02-01', '2025-01-29', 'Paid', '1,2'),
('GROUP123', '2025-02-01', '2025-02-28', 120.00, 60.00, FALSE, '2025-03-01', NULL, 'Pending', '1,3'),
('GROUP456', '2025-01-01', '2025-01-31', 150.00, 150.00, TRUE, '2025-02-01', '2025-01-30', 'Paid', '2,3');

CREATE TABLE IF NOT EXISTS payments (
  payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bill_id INT NOT NULL,
  payment_amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(50) NOT NULL,
  FOREIGN KEY (bill_id) REFERENCES phone_bills(bill_id)
);

INSERT INTO payments (bill_id, payment_amount, payment_method)
VALUES
(1, 99.99, 'Credit Card'),
(2, 60.00, 'Bank Transfer'),
(3, 150.00, 'Credit Card');



CREATE TABLE customer_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prefix VARCHAR(50),
    firstName VARCHAR(100),
    middleName VARCHAR(100),
    lastName VARCHAR(100),
    suffix VARCHAR(50),
    email VARCHAR(255),
    emailNotProvided TINYINT(1) DEFAULT 0,
    ssn VARCHAR(50),
    birthDate DATETIME,
    dlNumber VARCHAR(100),
    dlState VARCHAR(10),
    dlExp DATETIME,
    contactPhone1 VARCHAR(20),
    contactPhone2 VARCHAR(20),
    contactPhone3 VARCHAR(20),
    streetNumber VARCHAR(20),
    streetName VARCHAR(255),
    addressLine2 VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(10),
    zip VARCHAR(20),
    employer VARCHAR(255),
    isNvp TINYINT(1) DEFAULT 0,
    assignToBusinessAccount TINYINT(1) DEFAULT 0,
    attachToHierarchy TINYINT(1) DEFAULT 0,
    accountType VARCHAR(255),
    creditSsn VARCHAR(50),
    creditClass VARCHAR(50),
    approvedLines INT DEFAULT 0,
    lastDateChecked DATETIME,
    typeOfAccount VARCHAR(255),
    groupId VARCHAR(255)
);



INSERT INTO customer_info (
    prefix, firstName, middleName, lastName, suffix, email, emailNotProvided,
    ssn, birthDate, dlNumber, dlState, dlExp, contactPhone1, contactPhone2,
    contactPhone3, streetNumber, streetName, addressLine2, city, state, zip,
    employer, isNvp, assignToBusinessAccount, attachToHierarchy, accountType,
    creditSsn, creditClass, approvedLines, lastDateChecked, typeOfAccount, groupId
) VALUES
-- 1) GROUP123 member (shared info)
('Mr.', 'John', 'A', 'Doe', NULL, 'john.doe@example.com', 0,
 '123-45-6789', '1985-06-15 00:00:00', 'D1234567', 'MO', '2028-05-01 00:00:00',
 '3145552000', NULL, NULL, '1500', 'Corporate Woods Dr', 'Suite 200',
 'Chesterfield', 'MO', '63017',
 'MegaCorp LLC', 1, 1, 1, 'Business',
 '123-45-6789', 'A', 5, '2025-11-20 14:00:00', 'Corporate', 'GROUP123'),

-- 2) GROUP123 member (same address/employer/phones/etc.)
('Ms.', 'Emily', 'R', 'Stone', NULL, 'emily.stone@example.com', 0,
 '987-65-4321', '1990-02-10 00:00:00', 'S9988776', 'MO', '2029-09-10 00:00:00',
 '3145551000', NULL, NULL, '1500', 'Corporate Woods Dr', 'Suite 200',
 'Chesterfield', 'MO', '63017',
 'MegaCorp LLC', 1, 1, 1, 'Business',
 '987-65-4321', 'A', 5, '2025-11-22 10:30:00', 'Corporate', 'GROUP123'),

-- 3) Non-group user
('Mr.', 'Alex', 'J', 'Rivera', NULL, 'alex.rivera@example.com', 0,
 '555-11-2222', '1994-08-21 00:00:00', 'R5544332', 'MO', '2027-03-11 00:00:00',
 '6365553333', '6365554444', NULL, '500', 'Pine St', NULL, 'Springfield', 'MO', '65802',
 'HealthPlus', 1, 1, 0, 'Individual',
 '555-11-2222', 'C', 2, '2025-11-18 16:45:00', 'Retail', 'GRP567'),

-- 4) Non-group user
('Mrs.', 'Sarah', 'K', 'Jenkins', NULL, 'sarah.jenkins@example.com', 0,
 '222-33-4444', '1982-12-30 00:00:00', 'J3322119', 'CA', '2030-01-01 00:00:00',
 '3105557777', NULL, NULL, '890', 'Sunset Blvd', 'Unit 10', 'Los Angeles', 'CA', '90028',
 'FutureSys', 0, 0, 1, 'Indavigual',
 '222-33-4444', 'A', 1, '2025-11-10 12:15:00', 'Premium', 'WEST01'),

-- 5) Non-group user
('Mr.', 'Michael', 'T', 'Callahan', 'Jr.', 'mcallahan@example.com', 0,
 '111-22-3333', '1978-04-05 00:00:00', 'C8877661', 'TX', '2026-12-15 00:00:00',
 '5125559999', NULL, NULL, '221', 'Broadway', NULL, 'Austin', 'TX', '78701',
 'LoneStar Energy', 0, 1, 0, 'Business',
 '111-22-3333', 'B', 4, '2025-11-25 09:10:00', 'Corporate', 'TXGRP01');
