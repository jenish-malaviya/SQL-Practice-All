SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 10. Subquery in FROM
-- Definition: Used as a derived table.

SELECT *
FROM (SELECT marks, AVG(marks) AS Avg_marks
	  FROM enrollments
	  GROUP BY student_id
	  );

SELECT student_id, AVG(marks) AS avg_marks
FROM enrollments
GROUP BY student_id;s