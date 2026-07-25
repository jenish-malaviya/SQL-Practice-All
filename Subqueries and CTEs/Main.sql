CREATE TABLE students (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(50),
    city         VARCHAR(50),
    age          INT,
    joined_date  DATE
);

INSERT INTO students VALUES
(1, 'Aarav Shah',      'Surat',     21, '2023-06-01'),
(2, 'Diya Patel',      'Ahmedabad', 22, '2023-06-05'),
(3, 'Kabir Mehta',     'Vadodara',  20, '2023-07-10'),
(4, 'Ananya Joshi',    'Surat',     23, '2023-06-15'),
(5, 'Reyansh Desai',   'Rajkot',    21, '2023-08-01'),
(6, 'Myra Trivedi',    'Ahmedabad', 24, '2023-06-20'),
(7, 'Vivaan Solanki',  'Surat',     22, '2023-09-05'),
(8, 'Ishaan Rana',     'Vadodara',  20, '2023-07-25'),
(9, 'Saanvi Chauhan',  'Rajkot',    23, '2023-06-30'),
(10,'Aditya Pandya',   'Surat',     21, '2023-10-01');

CREATE TABLE courses (
    course_id    INT PRIMARY KEY,
    course_name  VARCHAR(50),
    instructor   VARCHAR(50),
    fees         NUMERIC(8,2),
    duration_weeks INT
);

INSERT INTO courses VALUES
(101, 'SQL Fundamentals',    'Neha Kapoor',   4999, 4),
(102, 'Python for Data',     'Rohit Sinha',   6999, 6),
(103, 'Power BI Mastery',    'Neha Kapoor',   5999, 5),
(104, 'Machine Learning',    'Arjun Malhotra',8999, 8),
(105, 'Excel Advanced',      'Rohit Sinha',   2999, 3);

CREATE TABLE enrollments (
    enroll_id    INT PRIMARY KEY,
    student_id   INT REFERENCES students(student_id),
    course_id    INT REFERENCES courses(course_id),
    marks        INT,
    enroll_date  DATE
);

INSERT INTO enrollments VALUES
(1001, 1, 101, 85, '2023-06-10'),
(1002, 1, 102, 78, '2023-07-01'),
(1003, 2, 101, 92, '2023-06-12'),
(1004, 2, 103, 88, '2023-07-15'),
(1005, 3, 102, 65, '2023-07-20'),
(1006, 3, 104, 70, '2023-08-05'),
(1007, 4, 101, 95, '2023-06-25'),
(1008, 5, 103, 60, '2023-08-10'),
(1009, 5, 104, 55, '2023-08-20'),
(1010, 6, 102, 82, '2023-07-05'),
(1011, 7, 101, 45, '2023-09-15'),
(1012, 7, 103, 73, '2023-09-20'),
(1013, 8, 104, 91, '2023-08-01'),
(1014, 9, 102, 68, '2023-07-10'),
(1015, 9, 101, 77, '2023-07-12');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;



