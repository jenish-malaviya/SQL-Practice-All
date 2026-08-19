-- Syntax

-- CREATE PROCEDURE procedure_name()
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN

--     -- SQL statements

-- END;
-- $$;

-- First Store Procedure
CREATE PROCEDURE hello_world()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Hello World';
END;
$$;

CALL hello_world();

-- Without Parameters
CREATE PROCEDURE test_message()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Procedure Executed Successfully';
END;
$$;

CALL test_message();

-- Parameters
CREATE TABLE employees1 (
    employee_id INT,
    employee_name VARCHAR(100),
    salary NUMERIC
);

CREATE PROCEDURE add_employee(
    p_id INT,
    p_name VARCHAR,
    p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO employees1(employee_id, employee_name, salary)
    VALUES (p_id, p_name, p_salary);

END;
$$;

CALL add_employee(101, 'Rahul', 50000);
CALL add_employee(102, 'Kriya', 10000);
CALL add_employee(103, 'jenish', 100000);

SELECT * FROM employees1;

-- Update 
CREATE PROCEDURE increase_salary (
	p_id INT,
	p_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE employees1
	SET salary = salary + p_amount
	WHERE employee_id = p_id;
END;
$$;

CALL increase_salary(103, 500000);

SELECT * FROM employees1;

-- Delete
CREATE PROCEDURE delete_employee(
	p_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	DELETE FROM employees1
	WHERE employee_id = p_id;
END;
$$;

CALL delete_employee(101);

SELECT * FROM employees1;

-- With if
CREATE PROCEDURE check_salary(
	p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF p_salary >= 50000 THEN 
		RAISE NOTICE 'Good Salary';
	ELSE 
		RAISE NOTICE 'Under 50000';
	END IF;
END;
$$;

CALL check_salary (30000);

-- if / else if / else

CREATE OR REPLACE PROCEDURE salary_category(
    p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

    IF p_salary >= 100000 THEN
        RAISE NOTICE 'High Salary';

    ELSIF p_salary >= 50000 THEN
        RAISE NOTICE 'Medium Salary';

    ELSE
        RAISE NOTICE 'Low Salary';

    END IF;

END;
$$;

CALL salary_category(1000000);

-- Variables 
-- Syntax
DECLARE
	variable_name datatype;

-- Example

CREATE PROCEDURE calculate_total ()
LANGUAGE plpgsql
AS $$
DECLARE 
	total NUMERIC;
BEGIN
	total = 100 + 200;
	RAISE NOTICE 'Total = %', total;
END;
$$;

CALL calculate_total();

-- Select Into
CREATE PROCEDURE get_employee_salary(
    p_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_salary NUMERIC;
BEGIN

    SELECT salary
    INTO v_salary
    FROM employees1
    WHERE employee_id = p_id;

    IF v_salary IS NULL THEN
        RAISE NOTICE 'Employee % not found', p_id;
    ELSE
        RAISE NOTICE 'Salary = %', v_salary;
    END IF;

END;
$$;

CALL get_employee_salary(101);

-- Count
CREATE PROCEDURE employee_count()
LANGUAGE plpgsql
AS $$
DECLARE 
	v_count INT;
BEGIN
	SELECT COUNT(*) 
	INTO v_count
	FROM employees1;

	RAISE NOTICE 'Total Employees = %', v_count;
END;
$$;

CALL employee_count();

-- Loop
CREATE PROCEDURE print_numbers()
LANGUAGE plpgsql
AS $$
DECLARE 
	v_numbers INT = 1;
BEGIN
	LOOP
		RAISE NOTICE 'Number = %',v_numbers;
		v_numbers = v_numbers + 1;
		EXIT WHEN v_numbers > 100;
	END LOOP;
END;
$$;

CALL print_numbers();

-- IN     → Give data
-- OUT    → Get data
-- INOUT  → Give + get data
-- In Parameters

CREATE PROCEDURE add_employee5(
    IN p_id INT,
    IN p_name VARCHAR,
    IN p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO employees5
    VALUES (p_id, p_name, p_salary);

END;
$$;

-- Out

CREATE PROCEDURE get_employee_count(
	OUT total_employees INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT COUNT(*)
	INTO total_employees
	FROM employees;

END;
$$;

CALL get_employee_count(NULL);

-- Inout Parameter
CREATE PROCEDURE increase_amount(
	INOUT p_amount INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	p_amount = p_amount + 100;
END;
$$;

CALL increase_amount(500);

-- Drop 
DROP PROCEDURE procedure_name();

-- Procedure Calling Another Procedure
CREATE PROCEDURE procedure_a()
LANGUAGE plpgsql
AS $$
BEGIN
	RAISE NOTICE 'Procedure A';
END;
$$;

CREATE PROCEDURE procedure_b()
LANGUAGE plpgsql
AS $$
BEGIN
	CALL procedure_a();
	RAISE NOTICE 'Procedure B';
END;
$$;

CALL procedure_b();



-- Mini Projects
CREATE TABLE bank_account (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance NUMERIC
);
INSERT INTO bank_account
VALUES
(1, 'Rahul', 10000),
(2, 'Amit', 5000);

CREATE PROCEDURE withdraw_money(
    p_account_id INT,
    p_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_balance NUMERIC;
BEGIN

    SELECT balance
    INTO v_balance
    FROM bank_account
    WHERE account_id = p_account_id;

    IF v_balance >= p_amount THEN

        UPDATE bank_account
        SET balance = balance - p_amount
        WHERE account_id = p_account_id;

        RAISE NOTICE 'Withdrawal successful';

    ELSE

        RAISE NOTICE 'Insufficient balance';

    END IF;

END;
$$;

CALL withdraw_money(1, 3000);

SELECT * FROM bank_account;

