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

-- Having

CREATE VIEW Total AS
SELECT coursename,COUNT(price) AS Total
FROM Courses
GROUP BY coursename
HAVING SUM(price) > 6000;

SELECT * 
FROM Total;

-- Case

CREATE VIEW Showing_price AS
SELECT e.studentname,c.level,c.price,
	CASE 
		WHEN c.price > 6000 THEN 'High'
		WHEN c.price > 3000 THEN 'Mediam'
		ELSE 'Low'
	END AS Compare
FROM Enrollments e
JOIN Courses c
ON e.courseid = c.courseid;

SELECT *
FROM Showing_price
WHERE compare = 'Low';

-- Calculated Column

CREATE VIEW Discount AS
SELECT 
		coursename,
		category,
		price,
		price - (price * discountpercent / 100.0) AS price_afte_discount
FROM Courses;

SELECT *
FROM Discount;

-- Subsquries

CREATE VIEW Low AS
SELECT 
		coursename,
		category,
		level,
		price
		FROM Courses
		WHERE price IN (
				SELECT price
				FROM Courses
				WHERE price < 4000
		
);

SELECT *
FROM Low;

-- DISTINCT

CREATE VIEW Group_by AS
SELECT DISTINCT(language) AS category , language
FROM Courses;

SELECT *
FROM Group_by;

-- Nested View

CREATE VIEW Active_Courses AS
SELECT
    CourseID,
    CourseName,
    Category,
    InstructorName,
    Level,
    Price,
    Rating,
    CourseStatus
FROM Courses
WHERE CourseStatus = 'Active';

CREATE VIEW High_Rated_Courses AS
SELECT
    CourseID,
    CourseName,
    Category,
    InstructorName,
    Price,
    Rating
FROM Active_Courses
WHERE Rating >= 4.8;

SELECT *
FROM Active_Courses;

SELECT *
FROM High_Rated_Courses;

-- Query in View

CREATE VIEW Highest_amount AS 
SELECT 
		courseid, 
		studentname,
		paymentstatus,
		amountpaid
FROM Enrollments;

SELECT *
FROM Highest_amount
WHERE amountpaid > 5000
ORDER BY amountpaid 
DESC;
