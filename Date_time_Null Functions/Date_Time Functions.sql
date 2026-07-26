SELECT * FROM employees_date;

-- | Function                  | What it Does                        | Syntax (Code)                                                         |
-- | ------------------------- | ----------------------------------- | --------------------------------------------------------------------- |
-- | `CURRENT_DATE`            | Returns current date                | `SELECT CURRENT_DATE;`                                                |
-- | `CURRENT_TIME`            | Returns current time                | `SELECT CURRENT_TIME;`                                                |
-- | `CURRENT_TIMESTAMP`       | Returns current date & time         | `SELECT CURRENT_TIMESTAMP;`                                           |
-- | `NOW()`                   | Returns current timestamp           | `SELECT NOW();`                                                       |
-- | `LOCALTIME`               | Returns local time                  | `SELECT LOCALTIME;`                                                   |
-- | `LOCALTIMESTAMP`          | Returns local timestamp             | `SELECT LOCALTIMESTAMP;`                                              |
-- | `CLOCK_TIMESTAMP()`       | Returns actual current time         | `SELECT CLOCK_TIMESTAMP();`                                           |
-- | `TRANSACTION_TIMESTAMP()` | Returns transaction start time      | `SELECT TRANSACTION_TIMESTAMP();`                                     |
-- | `STATEMENT_TIMESTAMP()`   | Returns statement start time        | `SELECT STATEMENT_TIMESTAMP();`                                       |
-- | `TIMEOFDAY()`             | Returns current date & time as text | `SELECT TIMEOFDAY();`                                                 |
-- | `EXTRACT()`               | Extracts year, month, day, etc.     | `SELECT EXTRACT(YEAR FROM CURRENT_DATE);`                             |
-- | `DATE_PART()`             | Extracts date/time part             | `SELECT DATE_PART('month', CURRENT_DATE);`                            |
-- | `DATE_TRUNC()`            | Truncates date/time                 | `SELECT DATE_TRUNC('month', NOW());`                                  |
-- | `AGE()`                   | Finds difference between dates      | `SELECT AGE('2025-12-31','2000-05-15');`                              |
-- | `JUSTIFY_DAYS()`          | Converts days into months           | `SELECT JUSTIFY_DAYS(INTERVAL '35 days');`                            |
-- | `JUSTIFY_HOURS()`         | Converts hours into days            | `SELECT JUSTIFY_HOURS(INTERVAL '30 hours');`                          |
-- | `JUSTIFY_INTERVAL()`      | Normalizes interval                 | `SELECT JUSTIFY_INTERVAL(INTERVAL '30 days 48 hours');`               |
-- | `MAKE_DATE()`             | Creates a date                      | `SELECT MAKE_DATE(2026,7,26);`                                        |
-- | `MAKE_TIME()`             | Creates a time                      | `SELECT MAKE_TIME(10,30,45);`                                         |
-- | `MAKE_TIMESTAMP()`        | Creates a timestamp                 | `SELECT MAKE_TIMESTAMP(2026,7,26,10,30,45);`                          |
-- | `TO_DATE()`               | Converts text to date               | `SELECT TO_DATE('26-07-2026','DD-MM-YYYY');`                          |
-- | `TO_TIMESTAMP()`          | Converts text to timestamp          | `SELECT TO_TIMESTAMP('26-07-2026 10:30:45','DD-MM-YYYY HH24:MI:SS');` |
-- | `TO_CHAR()`               | Formats date/time                   | `SELECT TO_CHAR(NOW(),'DD-Mon-YYYY');`                                |
-- | `ISFINITE()`              | Checks finite date                  | `SELECT ISFINITE(CURRENT_DATE);`                                      |
-- | `DATE_BIN()`              | Groups timestamps into intervals    | `SELECT DATE_BIN(INTERVAL '1 hour', NOW(), TIMESTAMP '2026-01-01');`  |
-- | `AT TIME ZONE`            | Converts time zones                 | `SELECT NOW() AT TIME ZONE 'Asia/Kolkata';`                           |
-- | `INTERVAL`                | Adds/Subtracts time                 | `SELECT NOW() + INTERVAL '7 days';`                                   |
-- | `Date + Interval`         | Adds time                           | `SELECT CURRENT_DATE + INTERVAL '1 month';`                           |
-- | `Date - Interval`         | Subtracts time                      | `SELECT CURRENT_DATE - INTERVAL '10 days';`                           |
-- | `DATE` Literal            | Creates a date literal              | `SELECT DATE '2026-07-26';`                                           |
-- | `TIMESTAMP` Literal       | Creates a timestamp literal         | `SELECT TIMESTAMP '2026-07-26 10:30:45';`                             |


-- 1 Current_date
-- Returns current date  

SELECT emp_name, CURRENT_DATE
FROM employees_date;

-- 2 Current_time
-- Returns current time

SELECT CURRENT_TIME;

-- 3 Current_Timestamp
-- Returns current date & time

SELECT CURRENT_TIMESTAMP;

-- 4 Now()
-- Returns local time  

SELECT emp_name, NOW()
FROM employees_date;

-- 5 Localtime
-- Returns local time

SELECT LOCALTIMESTAMP;

-- 6 Localtimestamp
-- Returns local time

SELECT LOCALTIMESTAMP;

-- 7 Clock_timestamp()
-- Returns actual current time

SELECT CLOCK_TIMESTAMP();

-- 8 Transcation_timestamp()
-- Returns Statement Start time

SELECT TRANSACTION_TIMESTAMP();

-- 9 Statement_Timestamp()
-- Returns Statement Start time 

SELECT STATEMENT_TIMESTAMP();

-- 10 Timeofday()
-- Returns current date/time as text

SELECT TIMEOFDAY();

-------------------------------------------------------------------------

-- 11 Extract 
-- Extract year

-- Year
SELECT emp_name,
	EXTRACT(YEAR FROM hire_date) AS Hire_year
FROM employees_date;

-- Month
SELECT emp_name,
	EXTRACT(month FROM hire_date) AS Hire_month
FROM employees_date;

-- Day
SELECT emp_name, 
	EXTRACT(day FROM hire_date) AS Hire_day
FROM employees_date;

-------------------------------------------------------------------------

-- 12 Date_Part()
-- Date Year

-- Year
SELECT emp_name,
	DATE_PART('year', hire_date) AS hire_year
FROM employees_date;

-- Month
SELECT emp_name,
	DATE_PART('month', hire_date) AS hire_month
FROM employees_date;

--------------------------------------------------------------------------

-- 13 date_trunc()
-- Month

-- Month
SELECT emp_name,
	DATE_TRUNC('month', hire_date)
FROM employees_date;

-- Year
SELECT emp_name,
	DATE_TRUNC('year', hire_date)
FROM employees_date;

---------------------------------------------------------------------------

-- 14 AGE
-- Employee Experience

SELECT emp_name,
	AGE(CURRENT_DATE, hire_date) AS Experience
FROM employees_date;

-- Difference Between Review Date and Hire Date

SELECT emp_name,
	AGE(review_date, hire_date) 
FROM employees_date;

---------------------------------------------------------------------------

-- 15 Justify_days()
-- Converts days into months

SELECT JUSTIFY_DAYS(INTERVAL '35 Days');

-- 16 Justify_Hours()
-- Converts hours into days

SELECT JUSTIFY_HOURS(INTERVAL '500 Hours');

-- 17 Justify_interval()
-- Normalizes interval      

SELECT Justify_INTERVAL(INTERVAL '35 days 48 hours');

-- 18 Make_date()
-- Craete a date

SELECT MAKE_DATE(2026,7,26);

-- 19 Nake_Time()
-- Create a time

SELECT MAKE_TIME(10,30,45);

-- 20 Make_Timestamp()
-- Creates a timestamp  

SELECT MAKE_TIMESTAMP(2026,7,26,10,30,45);

-- 21 To_Date()
-- Converts text to date 

SELECT TO_DATE('26-07-2026','DD_MM_YYYY');

-- 22 To_TIMESTAMP()
-- Converts text to timestamp 

SELECT TO_TIMESTAMP('26-07-2026 10:30:45', 'DD_MM_YYYY HH24:MI:SS');

---------------------------------------------------------------------------

-- 23 To_char()
-- Format Hire Date
-- Formats date/time

SELECT emp_name, 
	TO_CHAR(hire_date,'DD-MM-YYYY')
FROM employees_date;

-- Month Name

SELECT emp_name,
	TO_CHAR(hire_date, 'Month')
FROM employees_date;

-- Day name

SELECT emp_name,
	TO_CHAR(hire_date,'Day')
FROM employees_date;

-- Full Date

SELECT emp_name,
	TO_CHAR(hire_date, 'DD-MM-YYYY')
FROM employees_date;

---------------------------------------------------------------------------

-- 24 Isfinite()
-- Checks finite date 

-- true (or t): The value is a normal, finite date or time (e.g., '2026-07-26').
-- false (or f): The value matches the special constants 'infinity' or '-infinity'.
-- NULL: The input value itself is NULL.

SELECT ISFINITE(CURRENT_DATE);

-- 25 DATE_BIN() 
-- Groups timestamps into intervals

SELECT DATE_TRUNC('month', hire_date) AS hire_month,
       COUNT(*) AS employees_hired
FROM employees_date
GROUP BY DATE_TRUNC('month', hire_date)
ORDER BY hire_month;

-- 26 AT TIME ZONE
-- Converts time zones
-- Asia/Kolkata

SELECT NOW() AT TIME ZONE 'Asia/Kolkata';

-- UTC

SELECT NOW() AT TIME ZONE 'UTC';

--------------------------------------------------------------------------

-- 27 INTERVAL
-- Adds/Subtracts time

-- Add 30 Days

SELECT emp_name,
	hire_date + INTERVAL '30 Days'
FROM employees_date;

-- Add 1 Year

SELECT emp_name,
	hire_date + INTERVAL '1 Year'
FROM employees_date;

-- Substract

SELECT emp_name,	
	hire_date - INTERVAL '15 Days'
FROM employees_date;

-- 28 DATE Literal
-- Creates a date literal   
-- Show the Date

SELECT DATE '2026-07-25'; 

-- 29 TIMESTAMP Literal
-- Creates a timestamp literal   

SELECT TIMESTAMP '2026-07-26 10:30:45';



