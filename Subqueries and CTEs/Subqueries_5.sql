SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 5. Nested Subquery
-- Definition: A subquery inside another subquery.

SELECT *
FROM courses
WHERE course_id IN (
	SELECT course_id 
	FROM courses
	WHERE course_id = (
		SELECT course_id
		FROM courses
		WHERE fees = (SELECT MAX(fees)FROM courses)
	)
);

