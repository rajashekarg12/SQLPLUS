
-- Create a table
CREATE TABLE employees1 (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(5),
    department VARCHAR2(50),
    salary NUMBER
);

-- Insert a row into the table
INSERT INTO employees (id, name, department, salary) 
VALUES (1, 'Trump Donald', 'HR', 50000);
