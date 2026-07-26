CREATE TABLE employees_date (
    emp_id      INT,
    emp_name    VARCHAR(50),
    hire_date   DATE,
    review_date DATE,
    department  VARCHAR(50)
);
 
INSERT INTO employees_date_(emp_id, emp_name, hire_date, review_date, department) VALUES
(1, 'Jenish Patel', '2023-03-15', '2026-06-10', 'Data Analytics'),
(2, 'Priya Sharma',  '2022-07-01', '2026-07-01', 'Marketing'),
(3, 'Rahul Verma',   '2021-11-20', '2026-05-15', 'Sales'),
(4, 'Ankit Shah',    '2024-01-10', '2026-07-20', 'Data Analytics'),
(5, 'Kriya Mehta',   '2023-09-05', '2026-04-25', 'HR'),
(6, 'Nisha Desai',   '2020-02-28', '2026-03-01', 'Finance'),
(7, 'Aman Gupta',    '2024-06-18', '2026-07-22', 'Sales'),
(8, 'Sneha Joshi',   '2022-12-01', '2026-06-30', 'Marketing'),
(9, 'Vivek Nair',    '2023-08-14', '2026-02-14', 'Data Analytics'),
(10,'Meera Iyer',    '2021-05-30', '2026-01-30', 'HR');

SELECT * FROM employees_date;