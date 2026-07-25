SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 7. EXISTS
-- Definition: Checks if matching rows exist.

SELECT *
FROM courses c
WHERE EXISTS (
	SELECT *
	FROM enrollments e
	WHERE c.course_id = e.course_id 
);