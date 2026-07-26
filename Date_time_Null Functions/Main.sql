CREATE TABLE employees_string_practice (
    emp_id      INT,
    emp_name    VARCHAR(50),
    email       VARCHAR(100),
    city        VARCHAR(50),
    department  VARCHAR(50)
);

INSERT INTO employees_string_practice (emp_id, emp_name, email, city, department) VALUES
(1, 'Jenish Patel',   'jenish.patel@gmail.com',   'Surat',      'Data Analytics'),
(2, 'Priya Sharma',   'priya.sharma@gmail.com',   'Bengaluru',  'Marketing'),
(3, 'Rahul Verma',    'rahul.verma@company.com',  'Mumbai',     'Sales'),
(4, '  Ankit Shah  ', 'ankit.shah@company.com',   'Ahmedabad',  'Data Analytics'),
(5, 'Kriya Mehta',    'kriya.mehta@gmail.com',    'Surat',      'HR'),
(6, 'Nisha Desai',    'nisha.desai@company.com',  'Pune',       'Finance'),
(7, 'Aman Gupta',     'aman.gupta@gmail.com',     'Delhi',      'Sales'),
(8, 'Sneha Joshi',    'sneha.joshi@company.com',  'Bengaluru',  'Marketing'),
(9, 'Vivek Nair',     'vivek.nair@gmail.com',     'Kochi',      'Data Analytics'),
(10,'Meera Iyer',     'meera.iyer@company.com',   'Chennai',    'HR');

SELECT * FROM employees_string_practice;