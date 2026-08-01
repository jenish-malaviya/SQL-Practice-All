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

-- 5 Joins

CREATE VIEW same_value AS
SELECT c.courseid,c.coursename,c.category,e.studentname
FROM Courses c
INNER JOIN Enrollments e
ON c.courseid = e.courseid;

SELECT *
FROM same_value;

-- 6 Aggregate Functions

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

-- 7 Group by

CREATE VIEW Find_avg_value AS
SELECT courseid, AVG(amountpaid)
FROM Enrollments
GROUP BY courseid;

SELECT *
FROM Find_avg_value;

-- 8 Having

CREATE VIEW Total AS
SELECT coursename,COUNT(price) AS Total
FROM Courses
GROUP BY coursename
HAVING SUM(price) > 6000;

SELECT * 
FROM Total;

-- 9 Case

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

-- 10 Calculated Column

CREATE VIEW Discount AS
SELECT 
		coursename,
		category,
		price,
		price - (price * discountpercent / 100.0) AS price_afte_discount
FROM Courses;

SELECT *
FROM Discount;

-- 11 Subsquries

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

-- 12 DISTINCT

CREATE VIEW Group_by AS
SELECT DISTINCT(language) AS category , language
FROM Courses;

SELECT *
FROM Group_by;

-- 13 Nested View

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

-- 14 Query in View

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

-- 15 Update data

-- Create a View
CREATE VIEW Update_data AS
SELECT courseid, price
FROM Courses;

-- View Seen
SELECT *
FROM Update_data;

-- Update the data
UPDATE Update_data
SET price = 100000.00
WHERE courseid = 101;

-- Only Update data check
SELECT *
FROM Update_data; 

-- Check the data in Main Table 
SELECT *
FROM Courses;

-- 16 Insert Data

CREATE VIEW insert_data AS
SELECT *
FROM Courses;
INSERT INTO Courses(courseid ,coursename) VALUES (116, 'Python Developer');

SELECT *
FROM insert_data;

-- 17 Delete

CREATE VIEW Delete_data AS
SELECT courseid,coursename,category
FROM Courses;

DELETE FROM Delete_data
WHERE courseid = 116;

SELECT *
FROM Delete_data;

SELECT *
FROM Courses;

-- 18 Create View and Replace

-- CREATE OR REPLACE VIEW view_name AS
CREATE VIEW have_data AS
SELECT coursename,category
FROM Courses
WHERE category = 'Analytics';

SELECT *
FROM have_data;

-- 19 Alter table view
/*  You Can Used only CREATE or REPLACE Becaluse of 
    ALTER Used Only mysql application */
	
-- CREATE VIEW range_value AS
-- SELECT
--     courseid,
--     studentname,
--     paymentstatus
-- FROM Enrollments
-- WHERE courseid BETWEEN 101 AND 110;

-- SELECT *
-- FROM range_value;

-- ALTER VIEW range_value AS
-- SELECT
--     courseid,
--     studentname,
--     paymentstatus,
--     amountpaid
-- FROM Enrollments
-- WHERE courseid BETWEEN 101 AND 110;

-- SELECT *
-- FROM range_value;

-- 20 Drop View

CREATE VIEW range_value AS
SELECT
    courseid,
    studentname,
    paymentstatus,
    amountpaid
FROM enrollments
WHERE courseid BETWEEN 101 AND 110;

SELECT *
FROM range_value;

DROP VIEW range_value;

-- 21 With Check option
-- When i will update and insert data in table so make sure same before condition according 

CREATE VIEW paid_enrollments AS
SELECT
    enrollmentid,
    courseid,
    studentname,
    paymentstatus,
    amountpaid
FROM enrollments
WHERE paymentstatus = 'Paid'
WITH CHECK OPTION;

SELECT *
FROM paid_enrollments;

UPDATE paid_enrollments
SET amountpaid = 3500
WHERE enrollmentid = 1001;

SELECT *
FROM paid_enrollments;

-- 22 update_View and Non_update_view

-- Update_view
CREATE VIEW course_details AS
SELECT
    courseid,
    coursename,
    price
FROM courses;

SELECT *
FROM course_details;

UPDATE course_details
SET price = 5000
WHERE courseid = 101;

-- Non_update_view
/*  ❌ GROUP BY
	❌ HAVING
	❌ DISTINCT
	❌ Aggregate functions (SUM(), COUNT(), AVG(), etc.)
	❌ UNION 
*/ 
CREATE VIEW course_summary AS
SELECT
    category,
    COUNT(*) AS total_courses
FROM courses
GROUP BY category;

SELECT *
FROM course_summary;

UPDATE course_summary
SET total_courses = 10
WHERE category = 'Programming';

-- 23 System Views
-- sys.views 				→ Shows all views in a SQL Server database. -- Dont Support
-- information_schema.views → Shows all views and their information in a database. It works across multiple database systems.

SELECT *
FROM information_schema.views;

-- 24 . View Security

-- Easy Interview Definition
-- View Security → Hide sensitive columns using a view.
-- GRANT → Give permission to a user.
-- REVOKE → Remove permission from a user.
-- Memory Trick
-- View     → Hide Sensitive Data

-- GRANT    → Give Permission ✔

-- REVOKE   → Remove Permission ❌

-- Create a view
CREATE VIEW student_details AS
SELECT
    enrollmentid,
    studentname,
    paymentstatus
FROM enrollments;

-- Show the view
SELECT *
FROM student_details;

-- Grant Permission
GRANT SELECT
ON student_details
TO postgres;

