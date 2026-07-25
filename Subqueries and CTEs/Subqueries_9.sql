SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 9. Subquery in SELECT
-- Definition: Used in SELECT clause.

SELECT marks, (
	SELECT Max(marks) 
	FROM enrollments
) AS Highest_marks_From_enrollments
FROM enrollments;