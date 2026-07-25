SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 2. Multi-Row Subquery
-- IN, NOT IN, ANY, ALL

-- IN
SELECT *
FROM students
WHERE student_id IN (
	SELECT student_id
	FROM students
	WHERE city = 'Surat'
);

-- NOT IN
SELECT *
FROM students
WHERE student_id NOT IN(
	SELECT student_id
	FROM students
	WHERE city = 'Surat'
);

-- = ANY
SELECT *
FROM students
WHERE student_id = ANY (
	SELECT student_id
	FROM students
	WHERE city = 'Surat'
);

-- ALL
SELECT *
FROM students
WHERE student_id <> ALL (
	SELECT student_id
	FROM students
	WHERE city = 'Surat'
);