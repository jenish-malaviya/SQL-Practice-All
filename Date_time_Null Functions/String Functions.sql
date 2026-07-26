SELECT * FROM employees_string_practice;

-- | Function                     | What it Does (Work)                            | Where to Use                                    |
-- | ---------------------------- | ---------------------------------------------- | ----------------------------------------------- |
-- | `UPPER()`                    | Converts all letters to **UPPERCASE**          | Standardize text (e.g., names, cities)          |
-- | `LOWER()`                    | Converts all letters to **lowercase**          | Case-insensitive comparisons, emails            |
-- | `LENGTH()` / `LEN()`         | Counts the number of characters                | Validate text length, find string size          |
-- | `CONCAT()`                   | Joins two or more strings                      | Combine first name and last name                |
-- | `SUBSTRING()`                | Extracts part of a string                      | Get specific characters (e.g., first 3 letters) |
-- | `LEFT()`                     | Returns characters from the left side          | Extract prefixes, initials, codes               |
-- | `RIGHT()`                    | Returns characters from the right side         | Extract file extensions, last digits, suffixes  |
-- | `TRIM()`                     | Removes spaces from both ends                  | Clean imported or messy data                    |
-- | `REPLACE()`                  | Replaces one text with another                 | Correct spelling, update text values            |
-- | `REVERSE()`                  | Reverses the order of characters               | String manipulation, palindrome checks          |
-- | `POSITION()` / `CHARINDEX()` | Finds the position of a substring              | Search for a character or word inside text      |
-- | `STRING_AGG()`               | Combines multiple row values into one string   | Create comma-separated lists from rows          |
-- | `STRING_SPLIT()`             | Splits one string into multiple rows           | Break comma-separated values into rows          |
-- | `ASCII()`                    | Returns the ASCII value of the first character | Character encoding and comparisons              |
-- | `CHAR()`                     | Converts an ASCII value into a character       | Generate characters from ASCII codes            |

-- 1 Upper

SELECT emp_name, 
	UPPER(emp_name) AS upper_name
FROM employees_string_practice;

-- 2 Lower

SELECT emp_name,
	LOWER(emp_name) AS lower_name
FROM employees_string_practice;

-- 3 Length

SELECT emp_name,
	LENGTH(emp_name) AS length_number
FROM employees_string_practice;

-- 4 Concat

SELECT emp_name,
	CONCAT(emp_name,' - ',department) AS Merge_string
FROM employees_string_practice;

-- 5 Substring
-- By default 1
-- Include Space Count

SELECT emp_name,
	SUBSTRING(emp_name, 1, 5) AS Range_number
FROM employees_string_practice;

-- 6 Left
-- By default 1
-- Include Space Count

SELECT emp_name,
	LEFT(emp_name, 8) AS Left_name
FROM employees_string_practice;

-- 7 Right
-- By default 1
-- Include Space Count

SELECT emp_name,
	RIGHT(emp_name, 8) AS Right_name
FROM employees_string_practice;

-- 8 Trim

SELECT * ,
	TRIM(department) AS Remove_space
FROM employees_string_practice;

SELECT emp_name, 
	TRIM(emp_name) AS trimmed_name, 
	LENGTH(emp_name) AS before_len, 
	LENGTH(TRIM(emp_name)) AS after_len
FROM employees_string_practice
WHERE emp_id = 4;   -- row with extra spaces

-- 9 Replace

SELECT email,
	REPLACE(email, '@gmail.com', '@company.com') AS Update_email
FROM employees_string_practice;

-- 10 Reverse

SELECT city,
	REVERSE(city) AS reverse_name
FROM employees_string_practice;

-- 11 Position and charindex

SELECT emp_name,
	POSITION('a' IN emp_name) AS Find_char
FROM employees_string_practice;

-- 12 String Agg

SELECT department,
	STRING_AGG(emp_name, ', ') AS employees_list
FROM employees_string_practice
GROUP BY department;

-- 13 string_split
-- Break the word
-- Mysql --> STRING_SPLIT
-- Postgre --> unnest

SELECT emp_name, unnest(string_to_array(email, '@')) AS email_part
FROM employees_string_practice
WHERE emp_id = 1;

-- 14 ASCII
-- A - 65 To Z 90
-- a - 97 To z 122
-- 0 - 48 To 9 57
-- CHR(ASCII('a') - 32)  →  CHR(65)  →  'A'
-- CHR(ASCII('A') + 32)  →  CHR(97)  →  'a'

SELECT emp_name, 
	ASCII(emp_name) AS Ascii_of_first_value
FROM employees_string_practice;

-- 15 Char
-- Convert Code Into string

SELECT chr(75) AS letter;

SELECT 
    'a' AS original_char,
    ASCII('a') AS ascii_value,
    CHR(ASCII('a') - 32) AS manual_upper,
    UPPER('a') AS builtin_upper;

-- Uppercase
-- Letter	ASCII	Letter	ASCII	Letter	ASCII
--   A		  65	  J	     74			S	83
--   B	      66	  K	     75			T	84
--   C	      67	  L	     76			U	85
--   D 	 	  68	  M	     77			V	86
--   E	      69	  N	     78			W	87
--   F	      70	  O	     79			X	88
--   G	      71	  P	     80			Y	89
--   H	      72	  Q	     81			Z	90
--   I	      73	  R	     82

-- Lowercase
-- Letter	ASCII	Letter	ASCII	Letter	ASCII
-- 	a		97		j		106		s		115
-- 	b		98		k		107		t		116
-- 	c		99		l		108		u		117
-- 	d		100		m		109		v		118
-- 	e		101		n		110		w		119
-- 	f		102		o		111		x		120
-- 	g		103		p		112		y		121
-- 	h		104		q		113		z		122
-- 	i		105		r		114

-- Digits (0–9)
-- Digit	ASCII
-- 0		48
-- 1		49
-- 2		50
-- 3		51
-- 4		52
-- 5		53
-- 6		54
-- 7		55
-- 8		56
-- 9		57
