SELECT * FROM employees_string_practice;

-- Basic

-- Q1. Display emp_name in UPPERCASE and department in lowercase, side by side.

-- Q2. Find the length of each emp_name (use LENGTH()). Which name is the longest?

-- Q3. emp_id = 4 (Ankit Shah) has extra spaces around the name. Write a query to TRIM() it and show both the original and trimmed length, to prove the spaces existed.

-- Q4. Concatenate emp_name and city to produce output like: Jenish Patel (Surat).

-- Intermediate

-- Q5. Extract just the username part of each email (everything before @) — e.g., jenish.patel from jenish.patel@gmail.com. (Hint: SUBSTRING + POSITION/STRPOS in Postgres, SUBSTRING_INDEX in MySQL.)

-- Q6. Extract just the domain of each email (gmail.com or company.com) and count how many employees belong to each domain.

-- Q7. Replace gmail.com with outlook.com in the email column for all rows — but only in the query output, don't actually update the table.

-- Q8. Find all employees whose email starts with a letter from 'a' to 'm' (use LIKE), and separately, find all employees whose emp_name contains the letter 'i' more than once. (Second part is the tricky one — think about combining LENGTH() and REPLACE().)

-- Advanced

-- Q9. For every employee, generate a "masked email" where the username part is hidden except the first 2 characters, like je******@gmail.com. (Hint: combine LEFT, REPEAT/generate_series, POSITION, and CONCAT.)

-- Q10. Using STRING_AGG (PostgreSQL) or GROUP_CONCAT (MySQL), produce one row per department showing all employee names in that department as a single comma-separated string, sorted alphabetically within the group — e.g., Data Analytics → Ankit Shah, Jenish Patel, Vivek Nair.


-- Basic

-- Q1. Display emp_name in UPPERCASE and department in lowercase, side by side.

SELECT emp_name, department,
	upper(emp_name),
	lower(department)
FROM employees_string_practice;

-- Q2. Find the length of each emp_name (use LENGTH()). Which name is the longest?

SELECT emp_name,
	LENGTH(emp_name)
FROM employees_string_practice;

-- Q3. emp_id = 4 (Ankit Shah) has extra spaces around the name. Write a query to TRIM() it and show both the original and trimmed length, to prove the spaces existed.

SELECT emp_name,
	TRIM(emp_name) 
FROM employees_string_practice
WHERE emp_id = 4;

-- Q4. Concatenate emp_name and city to produce output like: Jenish Patel (Surat).

SELECT emp_name, city,
	CONCAT(emp_name,' (',city,')')
FROM employees_string_practice
WHERE emp_id = 1;

-- Intermediate

-- Q5. Extract just the username part of each email (everything before @) — e.g., jenish.patel from jenish.patel@gmail.com. 
-- (Hint: SUBSTRING + POSITION/STRPOS in Postgres, SUBSTRING_INDEX in MySQL.)
-- -1 Before
-- +1 After

SELECT emp_name,email,
	SUBSTRING(email FROM 1 FOR POSITION('@' IN email) - 1) AS Username
FROM employees_string_practice;

-- Q6. Extract just the domain of each email (gmail.com or company.com) and count how many employees belong to each domain.
-- -1 Before
-- +1 After

SELECT
	SUBSTRING(email FROM POSITION('@' IN email) + 1) AS Domain_name,
	COUNT(*) AS Total_employees
FROM employees_string_practice
GROUP BY Domain_name;

-- Q7. Replace gmail.com with outlook.com in the email column for all rows — but only in the query output, don't actually update the table.

SELECT emp_name,email,
	REPLACE(email, 'gmail.com', 'outlook.com')
FROM employees_string_practice;

-- Q8. Find all employees whose email starts with a letter from 'a' to 'm' (use LIKE), and separately, find all employees whose emp_name 
-- contains the letter 'i' more than once. (Second part is the tricky one — think about combining LENGTH() and REPLACE().)

SELECT emp_name, email
FROM employees_string_practice
WHERE email LIKE 'a%' OR email LIKE 'b%' OR email LIKE 'c%' 
   OR email LIKE 'd%' OR email LIKE 'e%' OR email LIKE 'f%'
   OR email LIKE 'g%' OR email LIKE 'h%' OR email LIKE 'i%'
   OR email LIKE 'j%' OR email LIKE 'k%' OR email LIKE 'l%'
   OR email LIKE 'm%';
SELECT emp_name,
       LENGTH(emp_name) - LENGTH(REPLACE(LOWER(emp_name), 'i', '')) AS i_count
FROM employees_string_practice
WHERE LENGTH(emp_name) - LENGTH(REPLACE(LOWER(emp_name), 'i', '')) > 1;

-- Advanced

-- Q9. For every employee, generate a "masked email" where the username part is hidden except the 
-- first 2 characters, like je******@gmail.com. (Hint: combine LEFT, REPEAT/generate_series, POSITION, and CONCAT.)

SELECT emp_name,email,
	CONCAT(
			LEFT(email ,2),
			REPEAT('*' ,POSITION('@' IN email)-1 -2),
			SUBSTRING(email FROM POSITION('@' IN email))
	) AS makes_email
FROM employees_string_practice;

-- Q10. Using STRING_AGG (PostgreSQL) or GROUP_CONCAT (MySQL), produce one row per department showing all employee names in that 
-- department as a single comma-separated string, sorted alphabetically within the group — e.g., Data Analytics → Ankit Shah, Jenish Patel, Vivek Nair.

SELECT department,
	STRING_AGG(emp_name, ', ') AS List
FROM employees_string_practice
GROUP BY department;