SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 6. Scalar Subquery
-- Definition: Returns a single value.

SELECT student_id, marks, (
	SELECT AVG(marks)
	FROM enrollments
	) AS Avg_Marks
FROM enrollments e
JOIN courses c
ON c.course_id = e.course_id;
