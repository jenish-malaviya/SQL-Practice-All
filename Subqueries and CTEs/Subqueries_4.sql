SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 4. Correlated Subquery
-- Definition: Uses values from the outer query.

SELECT * 
FROM courses c
WHERE fees > (
	SELECT AVG(fees)
	FROM courses c2
	WHERE course_id = c2.course_id 
);
