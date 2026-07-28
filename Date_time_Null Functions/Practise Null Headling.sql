CREATE TABLE Hospital
(
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    BloodGroup VARCHAR(5),
    Disease VARCHAR(100),
    DoctorName VARCHAR(100),
    RoomNumber INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    InsuranceProvider VARCHAR(100),
    InsuranceAmount DECIMAL(10,2),
    EmergencyContact VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50)
);

INSERT INTO Hospital VALUES
(101,'Rahul Sharma','Male',28,'B+','Dengue','Dr. Patel',201,'2025-01-10','2025-01-15','9876543210','rahul@gmail.com','Star Health',50000,'9876500001','Mumbai','Maharashtra'),

(102,'Priya Singh','Female',34,'A+','Malaria','Dr. Shah',NULL,'2025-01-12',NULL,'9876543211',NULL,NULL,NULL,'9876500002','Pune','Maharashtra'),

(103,'Amit Verma','Male',45,'O+','Diabetes','Dr. Patel',305,'2025-01-08',NULL,NULL,'amit@gmail.com','HDFC Ergo',75000,NULL,'Delhi','Delhi'),

(104,'Sneha Patel','Female',29,NULL,'Typhoid','Dr. Mehta',210,'2025-01-15','2025-01-20','9876543213','sneha@gmail.com',NULL,NULL,'9876500004','Ahmedabad','Gujarat'),

(105,'Karan Joshi','Male',38,'AB+','Covid-19',NULL,NULL,'2025-01-18',NULL,NULL,NULL,NULL,NULL,NULL,'Jaipur','Rajasthan'),

(106,'Neha Gupta','Female',50,'O-','Heart Disease','Dr. Mehta',401,'2025-01-05',NULL,'9876543215','neha@gmail.com','ICICI Lombard',120000,'9876500006','Lucknow','Uttar Pradesh'),

(107,'Rohan Desai','Male',31,'A-','Asthma','Dr. Shah',NULL,'2025-01-22',NULL,'9876543216',NULL,'Star Health',40000,NULL,'Surat','Gujarat'),

(108,'Pooja Mehra','Female',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Indore','Madhya Pradesh'),

(109,'Vikas Kumar','Male',60,'B-','Cancer','Dr. Rao',502,'2025-01-02',NULL,'9876543218','vikas@gmail.com','Max Bupa',250000,'9876500009','Chennai','Tamil Nadu'),

(110,'Anjali Roy','Female',40,'A+','Migraine','Dr. Patel',208,'2025-01-25','2025-01-28',NULL,'anjali@gmail.com',NULL,NULL,'9876500010','Kolkata','West Bengal');

SELECT * FROM Hospital;


-- Basic Level (10 Questions)
-- No.	Question
-- 1	Display all patient records.
-- 2	Find patients whose DoctorName is NULL.
-- 3	Find patients whose Email is NOT NULL.
-- 4	Find patients whose RoomNumber is NULL.
-- 5	Count the total number of patients.
-- 6	Count how many patients have an email address.
-- 7	Display only PatientName and Disease.
-- 8	Find patients whose InsuranceProvider is NULL.
-- 9	Find patients whose BloodGroup is NULL.
-- 10	Find patients whose DischargeDate is NULL.

-- Intermediate Level (10 Questions)
-- No.	Question
-- 1	Replace NULL InsuranceAmount with 0 using COALESCE().
-- 2	Replace NULL RoomNumber with 0 using IFNULL() (MySQL).
-- 3	Replace NULL DoctorName with 'Not Assigned' using CASE.
-- 4	Display PatientName and first available contact using COALESCE(Email, Phone).
-- 5	Find the average InsuranceAmount.
-- 6	Find the total InsuranceAmount.
-- 7	Find the minimum InsuranceAmount.
-- 8	Find the maximum InsuranceAmount.
-- 9	Count patients grouped by DoctorName (including NULL values).
-- 10	Display distinct InsuranceProvider values.

-- Advanced Level (10 Questions)
-- No.	Question
-- 1	Sort patients by InsuranceAmount with NULL values last.
-- 2	Sort patients by DischargeDate with NULL values first.
-- 3	Find doctors having an average InsuranceAmount greater than 50,000.
-- 4	Display DoctorName and number of patients using GROUP BY.
-- 5	Find cities where all patients have NULL InsuranceProvider.
-- 6	Display PatientName and InsuranceAmount, replacing NULL with 0, then sort by InsuranceAmount descending.
-- 7	Find patients where both Email and Phone are NULL.
-- 8	Find patients who have either DoctorName or RoomNumber as NULL.
-- 9	Display PatientName with status: "Discharged" if DischargeDate is not NULL, otherwise "Admitted" using CASE.
-- 10	Find the percentage of patients whose InsuranceProvider is NULL.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1	Display all patient records.

SELECT *
FROM Hospital;

-- 2	Find patients whose DoctorName is NULL.

SELECT patientname,doctorname
FROM Hospital
WHERE doctorname IS NULL;

-- 3	Find patients whose Email is NOT NULL.

SELECT patientname,email
FROM Hospital
WHERE email IS NOT NULL;

-- 4	Find patients whose RoomNumber is NULL.

SELECT patientname,roomnumber
FROM Hospital
WHERE roomnumber IS NULL;

-- 5	Count the total number of patients.

SELECT COUNT(patientname)
FROM Hospital;

-- 6	Find the total InsuranceAmount.

SELECT SUM(insuranceamount)
FROM Hospital;

-- 7	Find the minimum InsuranceAmount.

SELECT MIN(insuranceamount)
FROM Hospital;

-- 8	Find the maximum InsuranceAmount.

SELECT MAX(insuranceamount)
FROM Hospital;

-- 9	Display PatientName with status: "Discharged" if DischargeDate is not NULL, otherwise "Admitted" using CASE.

SELECT patientname,
	CASE
		WHEN dischargedate IS NOT NULL THEN 'Discharged'
		ELSE 'Admitted'
	END AS status
FROM Hospital;

-- 10	Find the percentage of patients whose InsuranceProvider is NULL.

SELECT 
	COUNT(*) * 100 / (SELECT COUNT(*) FROM Hospital) AS Percentage
FROM Hospital
WHERE insuranceprovider IS NULL;


-- Intermediate Level (10 Questions)
-- No.	Question
-- 1	Replace NULL InsuranceAmount with 0 using COALESCE().
-- 2	Replace NULL RoomNumber with 0 using IFNULL() (MySQL).
-- 3	Replace NULL DoctorName with 'Not Assigned' using CASE.
-- 4	Display PatientName and first available contact using COALESCE(Email, Phone).
-- 5	Find the average InsuranceAmount.
-- 6	Find the total InsuranceAmount.
-- 7	Find the minimum InsuranceAmount.
-- 8	Find the maximum InsuranceAmount.
-- 9	Count patients grouped by DoctorName (including NULL values).
-- 10	Display distinct InsuranceProvider values.


-- 1	Replace NULL InsuranceAmount with 0 using COALESCE().

SELECT insuranceamount,
	COALESCE(insuranceamount, 0) AS Repalce_value
FROM Hospital;

-- 2	Replace NULL RoomNumber with 0 using IFNULL() (MySQL).

-- SELECT
--     patientname,
--     IFNULL(roomnumber, 0) AS RoomNumber
-- FROM Hospital;

-- 3	Replace NULL DoctorName with 'Not Assigned' using CASE.

SELECT doctorname,
	CASE
		WHEN doctorname IS NULL THEN 'Not Assigned'
		ELSE doctorname
	END AS Doctor_name
FROM Hospital;

-- 4	Display PatientName and first available contact using COALESCE(Email, Phone).

SELECT patientname,
	COALESCE(phone, email) AS email
FROM Hospital;

-- 5	Find the average InsuranceAmount.

SELECT AVG(insuranceamount)
FROM Hospital;

-- 6	Find the total InsuranceAmount.

SELECT SUM(insuranceamount)
FROM Hospital;

-- 7	Find the minimum InsuranceAmount.

SELECT MIN(insuranceamount)
FROM Hospital;

-- 8	Find the maximum InsuranceAmount.

SELECT MAX(insuranceamount) 
FROM Hospital;

-- 9	Count patients grouped by DoctorName (including NULL values).
84
SELECT doctorname,
	COUNT(*) 
FROM Hospital
GROUP BY doctorname;

-- 10	Display distinct InsuranceProvider values.
-- Romevo Dublicate Values 

SELECT DISTINCT(insuranceprovider)
FROM Hospital;

-- Advanced Level (10 Questions)
-- No.	Question
-- 1	Sort patients by InsuranceAmount with NULL values last.

SELECT patientname,insuranceamount
FROM Hospital
ORDER BY insuranceamount ASC NULLS LAST;

SELECT patientname,insuranceamount
FROM Hospital
ORDER BY insuranceamount ASC;

-- 2	Sort patients by DischargeDate with NULL values first.

SELECT patientname, dischargedate
FROM Hospital
ORDER BY dischargedate DESC NULLS FIRST;

SELECT patientname, dischargedate
FROM Hospital
ORDER BY dischargedate DESC;

-- 3	Find doctors having an average InsuranceAmount greater than 50,000.

SELECT doctorname, AVG(insuranceamount) AS Average_value
FROM Hospital
GROUP BY doctorname
HAVING AVG(insuranceamount) > 50000;

-- 4	Display DoctorName and number of patients using GROUP BY.

SELECT doctorname, COUNT(patientname)
FROM Hospital
GROUP BY doctorname;

-- 5	Find cities where all patients have NULL InsuranceProvider.

SELECT patientname,insuranceprovider,city
FROM Hospital
WHERE insuranceprovider IS NULL;

-- 6	Display PatientName and InsuranceAmount, replacing NULL with 0, then sort by InsuranceAmount descending.

SELECT patientname,
	COALESCE(insuranceamount, 0) AS Replace_value
FROM hospital
ORDER BY COALESCE(insuranceamount, 0) DESC;

-- 7	Find patients where both Email and Phone are NULL.

SELECT patientname,phone,email
FROM Hospital
WHERE email IS NULL AND phone IS NULL; 

-- 8	Find patients who have either DoctorName or RoomNumber as NULL.

SELECT patientname,doctorname,roomnumber
FROM hospital
WHERE doctorname IS NULL OR roomnumber IS NULL;

-- 9	Display PatientName with status: "Discharged" if DischargeDate is not NULL, otherwise "Admitted" using CASE.

SELECT patientname,
	CASE
		WHEN dischargedate IS NOT NULL THEN 'Discharged'
		ELSE 'Admitted'
	END AS Status
FROM Hospital;

-- 10	Find the percentage of patients whose InsuranceProvider is NULL.

SELECT
	COUNT(*) *100 / (SELECT COUNT(*) FROM Hospital) AS Percentage
FROM Hospital
WHERE insuranceprovider IS NULL;

