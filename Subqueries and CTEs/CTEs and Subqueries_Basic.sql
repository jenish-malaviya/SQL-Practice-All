SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Bills;

--Basic
-- 1. Display all patient details using a CTE.
-- 2. Display only admitted patients (DischargeDate IS NULL) using a CTE.
-- 3. Display doctors earning more than 120000 using a CTE.
-- 4. Display completed appointments using a CTE.
-- 5. Display all paid bills using a CTE.
-- 6. Count the total number of patients using a CTE.
-- 7. Find all doctors with more than 10 years of experience using a CTE..


-- 1. Display all patient details using a CTE.

WITH details AS (
	SELECT *
	FROM Patients
)
SELECT *
FROM details;

-- 2. Display only admitted patients (DischargeDate IS NULL) using a CTE.

WITH status AS (
	SELECT patientname,dischargedate
	FROM Patients
	WHERE dischargedate IS NULL
)
SELECT *
FROM status;

-- 3. Display doctors earning more than 120000 using a CTE.

WITH earnings AS (
	SELECT doctorname,salary
	FROM doctors
	WHERE salary > 120000
)
SELECT *
FROM earnings;

-- 4. Display completed appointments using a CTE.

WITH completed AS (
	SELECT status
	FROM Appointments
	WHERE status = 'Completed'
)
SELECT *
FROM completed;

-- 5. Display all paid bills using a CTE.

WITH pending AS (
	SELECT totalamount,paymentstatus
	FROM Bills
	WHERE paymentstatus = 'Paid'
)
SELECT *
FROM pending;

-- 6. Count the total number of patients using a CTE.

WITH sum_total AS (
	SELECT COUNT(*)
	FROM Patients
)
SELECT *
FROM sum_total;

-- 7. Find all doctors with more than 10 years of experience using a CTE..

WITH find AS (
	SELECT doctorname,experience
	FROM Doctors
	WHERE experience > 10
)
SELECT *
FROM find;
