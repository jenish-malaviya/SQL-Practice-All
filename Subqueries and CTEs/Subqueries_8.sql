SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 8. NOT EXISTS
-- Definition: Checks if matching rows do not exist.


SELECT *
FROM courses c
WHERE NOT EXISTS (
	SELECT *
	FROM enrollments e
	WHERE c.course_id = e.course_id 
);

