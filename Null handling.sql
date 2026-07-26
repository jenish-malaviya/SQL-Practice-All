CREATE TABLE handling (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    ManagerID INT,
    Email VARCHAR(100)
);

INSERT INTO handling VALUES
(1,'John','HR',50000,5000,5,'john@gmail.com'),
(2,'David','IT',60000,NULL,5,NULL),
(3,'Sarah','Sales',NULL,3000,NULL,'sarah@gmail.com'),
(4,'Emma',NULL,45000,NULL,5,'emma@gmail.com'),
(5,'Mike','IT',80000,7000,NULL,'mike@gmail.com'),
(6,'Robert','Sales',55000,NULL,5,NULL),
(7,'Sophia','HR',NULL,NULL,NULL,'sophia@gmail.com'),
(8,'James',NULL,70000,6000,5,NULL);

SELECT * FROM handling;

-- 1. NULL

SELECT null;

-- 2. IS NULL

SELECT *
FROM handling
WHERE salary IS NULL;

-- 3. IS NOT NULL

SELECT * 
FROM handling
WHERE bonus IS NOT NULL;

-- 4. COALESCE()

SELECT name,
	COALESCE(bonus, 0) AS Bonus
FROM handling;

-- 5. NULLIF()
SELECT NULLIF(100, 100);

SELECT 
	name,salary / NULLIF(bonus, 0)
FROM handling;

-- 6. CASE

SELECT name,
		CASE
			WHEN salary >= 60000 THEN 'High Salary'
			ELSE 'Low Salary'
		END AS Salary_status
FROM handling;

-- 7. CASE WHEN ... IS NULL

SELECT name,
		CASE
			WHEN bonus IS NULL THEN 'No_Bonus'
			ELSE 'Bonus_Available'
		END AS Bonus_status
FROM handling;

-- 8. IS DISTINCT FROM
-- Remove the value
-- Remove Same Line and data

SELECT *
FROM handling
WHERE bonus IS DISTINCT FROM 5000;

-- 9. IS NOT DISTINCT FROM
-- Remove Same Line and data

SELECT *
FROM handling
WHERE bonus IS NOT DISTINCT FROM NULL;

-- 10. GREATEST()
-- Find biggest Number

SELECT
    Name,
    GREATEST(Salary, Bonus) AS Highest_Value
FROM handling;

-- 11. LEAST()

SELECT name,
	LEAST(salary,bonus) AS Lowest_value
FROM handling;

-- 12. COUNT(*)
-- Count Only Rows

SELECT COUNT(*)
FROM handling;

-- 13. COUNT(column)
-- Count Only Column Value

SELECT COUNT(bonus)
FROM handling;

-- 14. AVG()

SELECT AVG(salary)
FROM handling;

-- 15. SUM()

SELECT SUM(salary)
FROM handling;

-- 16. MIN()

SELECT MIN(salary)
FROM handling;

-- 17. MAX()

SELECT MAX(salary)
FROM handling;

-- 18. STRING_AGG()
-- join Multiple name 

SELECT department,
	STRING_AGG(name,', ')
FROM handling
GROUP BY department;

-- 19. CONCAT()
-- Add Symbol Between 2 value

SELECT 
	CONCAT(name,' - ',salary)
FROM handling;

-- 20. CONCAT_WS()

SELECT 
	CONCAT_WS(' | ',name, department, email) AS Details
FROM handling;

-- 21. TRIM()
-- Remove Extra Space

SELECT 
	TRIM('      jenish Malaviya  ') AS Result;

-- 22. REPLACE()

SELECT 
	REPLACE('john@gmail.com', 'gmail.com', 'yahoo.com');

-- 23. CAST()

SELECT 
	CAST(salary AS INTEGER)
FROM handling;

-- 24. :: (Type Cast)

SELECT 
	email::CHARACTER
FROM handling;

-- 25. DEFAULT

CREATE TABLE employee_default (
    id INT,
    name VARCHAR(50),
    city VARCHAR(30) DEFAULT 'Pune'
);

INSERT INTO employee_default (id, name)
VALUES (1, 'Jenish');

SELECT * FROM employee_default;

-- 26. NOT NULL

CREATE TABLE employee_notnull(
	id INT,
	name VARCHAR(50) NOT NULL
);

INSERT INTO employee_notnull
VALUES (1, 'Rahul');

-- 27. CHECK

CREATE TABLE employee_check (
    id INT,
    salary NUMERIC CHECK (salary >= 0)
);

INSERT INTO employee_check
VALUES (1, 50000);

-- 28. UNIQUE

CREATE TABLE employee_unique (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

INSERT INTO employee_unique
VALUES (1, 'abc@gmail.com');

-- 29. FILTER
SELECT
	COUNT(*) FILTER (WHERE bonus IS NULL) AS null_bonus,
	COUNT(*) FILTER (WHERE bonus IS NOT NULL) AS Not_null_bonus
FROM handling;

SELECT 
	SUM(bonus) FILTER (WHERE department = 'IT') AS it_Bonus,
	SUM(bonus) FILTER (WHERE department = 'Sales') AS sales_bonus
FROM handling;

-- 30. ORDER BY NULLS FIRST
-- I want to seen null value first 

SELECT *
FROM handling
ORDER BY salary NULLS FIRST;

-- 31. ORDER BY NULLS LAST
-- I want to seen null value last

SELECT *
FROM handling
ORDER BY salary NULLS LAST;



