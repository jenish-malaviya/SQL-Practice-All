-- Advanced (15–20)
-- 15.Using multiple CTEs, find doctors whose appointment count is greater than the average appointment count.
-- 16.Rank doctors by salary using ROW_NUMBER() inside a CTE.
-- 17.Find the top 3 highest billed patients using a CTE.
-- 18.Find the department having the highest average doctor salary.
-- 19.Use a Recursive CTE to generate numbers from 1 to 20.
-- 20.Using multiple CTEs, find each doctor's total bill amount generated from their appointments.

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Bills;

-- 15.Using multiple CTEs, find doctors whose appointment count is greater than the average appointment count.

WITH doctor_appo AS (
	SELECT doctorid, 
		COUNT(*) AS totalappointment
	FROM Appointments 
	GROUP BY doctorid
),
average_appo AS (
	SELECT AVG(totalappointment) AS avgappointmentcount
	FROM doctor_appo 
)
SELECT * 
FROM doctor_appo da
JOIN Doctors d
ON da.doctorid = d.doctorid
CROSS JOIN average_appo aa
WHERE da.totalappointment > aa.avgappointmentcount;

-- 16.Rank doctors by salary using ROW_NUMBER() inside a CTE.

WITH rank_doctor AS (
	SELECT doctorid,doctorname,salary,
		RANK() OVER(ORDER BY salary DESC) AS rank_number,
		ROW_NUMBER() OVER(ORDER BY salary DESC) AS Rows_number
	FROM Doctors
)
SELECT *
FROM rank_doctor;

-- 17.Find the top 3 highest billed patients using a CTE.

WITH who_patients AS (
	SELECT patientid,patientname
	FROM Patients
)
SELECT *
FROM who_patients wp
INNER JOIN Bills b
ON wp.patientid = b.patientid
ORDER BY totalamount
DESC
LIMIT 3;

-- 18.Find the department having the highest average doctor salary.

WITH highest_salary AS (
	SELECT doctorname, department, AVG(salary) AS avg_salary
	FROM Doctors
	GROUP BY department,doctorname
)
SELECT doctorname,department,avg_salary
FROM highest_salary
ORDER BY avg_salary
DESC
LIMIT 1;

-- 19.Use a Recursive CTE to generate numbers from 1 to 20.

WITH RECURSIVE numbers AS (
	SELECT 1 AS numbers

	UNION ALL

	SELECT numbers + 1
	FROM numbers
	WHERE numbers < 20
)
SELECT *
FROM numbers;

-- 20.Using multiple CTEs, find each doctor's total bill amount generated from their appointments.

-- Join the 2 Tables In this CTEs
WITH doctor_patient_bills AS (
    SELECT
        a.DoctorID,
        a.PatientID,
        b.TotalAmount
    FROM Appointments a
    INNER JOIN Bills b
        ON a.PatientID = b.PatientID
),
doctor_total_bills AS (
    SELECT
        DoctorID,
        SUM(TotalAmount) AS TotalBillAmount
    FROM doctor_patient_bills
    GROUP BY DoctorID
)
SELECT
    d.DoctorID,
    d.DoctorName,
    dtb.TotalBillAmount
FROM doctor_total_bills dtb
INNER JOIN Doctors d
    ON dtb.DoctorID = d.DoctorID
ORDER BY dtb.TotalBillAmount DESC;












































