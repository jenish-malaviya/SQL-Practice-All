SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- Syntax

-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

-- 3 Create a View

CREATE VIEW information AS
SELECT 
	courseid,
	coursename,
	category,
	Instructorname
FROM Courses;

SELECT *
FROM information;

-- 4 Where

CREATE VIEW time_duration AS
SELECT coursename,durationhours
FROM Courses
WHERE durationhours > 50;

SELECT *
FROM time_duration;

-- Joins

CREATE VIEW same_value AS
SELECT c.courseid,c.coursename,c.category,e.studentname
FROM Courses c
INNER JOIN Enrollments e
ON c.courseid = e.courseid;

SELECT *
FROM same_value;

-- Aggregate Functions

CREATE VIEW values_number AS
SELECT 
	AVG(price) AS Avg_Price,
	MIN(price) AS Min_price,
	MAX(price) AS Max_price,
	SUM(price) AS Total_Sum,
	COUNT(price) AS Total
FROM Courses;

SELECT *
FROM values_number;

-- Group by

CREATE VIEW Find_avg_value AS
SELECT courseid, AVG(amountpaid)
FROM Enrollments
GROUP BY courseid;

SELECT *
FROM Find_avg_value;
