-- Intermediate (8–14)
-- 8.Find the average salary of doctors using a CTE.
-- 9.Display doctors whose salary is above the average salary.
-- 10.Find the average patient age and display patients older than the average.
-- 11.Count the number of appointments handled by each doctor.
-- 12.Calculate the total bill amount for each patient.
-- 13.Find the city having the highest number of patients.
-- 14.Find the total amount of paid bills.

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Bills;

-- 8.Find the average salary of doctors using a CTE.

WITH Find_avg AS (
	SELECT doctorname, salary, AVG(salary)
	FROM Doctors
	GROUP BY doctorname, salary
)
SELECT *
FROM Find_avg;

-- 9.Display doctors whose salary is above the average salary.

-- 2 CTEs
WITH avg_salary AS (
    SELECT AVG(Salary) AS avg_sal
    FROM Doctors
),
highest AS (
    SELECT DoctorName, Salary
    FROM Doctors
    WHERE Salary > (SELECT avg_sal FROM avg_salary)
)
SELECT *
FROM highest;

-- 1 CTEs
WITH highest AS (
	SELECT doctorname,salary
	FROM Doctors
	WHERE salary > (
		SELECT AVG(salary)
		FROM Doctors
	)
)
SELECT *
FROM highest;

-- 10.Find the average patient age and display patients older than the average.

WITH avg_value AS (
	SELECT patientname, age
	FROM Patients
	WHERE age > (
		SELECT AVG(age)
		FROM Patients
	)
)
SELECT *
FROM avg_value;

-- 11.Count the number of appointments handled by each doctor.

WITH Total_appointments AS (
	SELECT d.doctorname,COUNT(a.appointmentid) AS total_appointments
	FROM Doctors d
	INNER JOIN Appointments a
	ON d.doctorid = a.doctorid
	GROUP BY doctorname
)
SELECT *
FROM Total_appointments;

-- 12.Calculate the total bill amount for each patient.

WITH bill_status AS (
	SELECT patientname,SUM(totalamount) 
	FROM Patients p
	INNER JOIN Bills b
	ON p.patientid = b.patientid
	GROUP BY patientname
)
SELECT *
FROM bill_status;

-- 13.Find the city having the highest number of patients.

WITH more_patient AS (
	SELECT city, COUNT(*) AS total_patient
	FROM Patients
	GROUP BY city
)
SELECT city,total_patient
FROM more_patient
WHERE total_patient = (
	SELECT MAX(total_patient)
	FROM more_patient
);

-- 14.Find the total amount of paid bills.

WITH paid_bills AS (
	SELECT paymentstatus, SUM(totalamount) AS Total_amount
	FROM Bills
	WHERE paymentstatus = 'Paid'
	GROUP BY paymentstatus
)
SELECT *
FROM paid_bills;











