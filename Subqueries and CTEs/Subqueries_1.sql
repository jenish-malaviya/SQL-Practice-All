SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 1 Single Row Subquery
-- =,>,<,>=,<=,<>

-- Equal To
SELECT *
FROM courses
WHERE fees = (
	SELECT fees 
	FROM courses
	WHERE fees = 5999
);

-- Greater then
SELECT *
FROM courses
WHERE fees > (
	SELECT AVG(fees)
	FROM courses
);

-- Less Then
SELECT * 
FROM courses
WHERE fees < (
	SELECT AVG(fees)
	FROM courses;
);

-- Greater Then Equal To
SELECT * 
FROM courses
WHERE fees >= (
	SELECT AVG(fees)
	FROM courses
);

-- Less Then Equal To
SELECT *
FROM courses
WHERE fees <= (
	SELECT AVG(fees)
	FROM courses
);

-- Not Equal To
SELECT *
FROM courses
WHERE fees <> (
	SELECT AVG(fees)
	FROM courses
);



