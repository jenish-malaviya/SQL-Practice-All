SELECT * FROM Courses;

-- Syntax

-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

-- Create a View

CREATE VIEW information AS
SELECT 
	courseid,
	coursename,
	category,
	Instructorname
FROM Courses;

SELECT *
FROM information;