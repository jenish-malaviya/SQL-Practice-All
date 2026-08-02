----------------------------------------------------------------------------------------------------------- Step 1
-- Create a Table 
CREATE TABLE Employeess
(
    EmployeeID SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Salary NUMERIC
);

-- Create 2 table another 
CREATE TABLE Employee_Log
(
    LogID SERIAL PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ActionDate TIMESTAMP
);

-- Show the table
SELECT *
FROM Employeess;

-- Show the table
SELECT *
FROM Employee_Log;

----------------------------------------------------------------------------------------------------------- Step 2
-- Create a function
-- A Trigger cannot work alone.
-- It must call a Trigger Function.
-- A Trigger Function contains the SQL statements that execute automatically.

CREATE OR REPLACE FUNCTION employee_insert() -- Creates a function.
RETURNS TRIGGER                              -- Means this function will be used by a Trigger.
LANGUAGE plpgsql							 --	The function is written in PostgreSQL's procedural language.
AS											 -- Starts the function body.
$$											
BEGIN										 -- Starts executable code.

    INSERT INTO Employee_Log
    (
        EmployeeName,
        ActionDate
    )
											 -- Insert employee information into the log table.
    VALUES
    (
        NEW.Name,
        CURRENT_TIMESTAMP
    );

    RETURN NEW;

END;
$$;

----------------------------------------------------------------------------------------------------------- Step 3
CREATE TRIGGER employee_trigger
AFTER INSERT
ON Employees
FOR EACH ROW
EXECUTE FUNCTION employee_insert();

----------------------------------------------------------------------------------------------------------- Step 4
INSERT INTO Employeess
(
    Name,
    Salary
)

VALUES
(
    'Kriya',
    50000
);

----------------------------------------------------------------------------------------------------------- Step 5
SELECT *
FROM Employeess;