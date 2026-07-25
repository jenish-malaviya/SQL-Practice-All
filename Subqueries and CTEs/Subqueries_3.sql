SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 3. Multi-Column Subquery
-- Definition: Returns multiple columns.

SELECT *
FROM courses 
WHERE (course_id, fees) = (
	SELECT course_id, fees
	FROM courses
	WHERE course_id = 104
);


