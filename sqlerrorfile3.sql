
-- Create a table
CREATE TABLE President (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(5),
    department VARCHAR2(50),
    salary NUMBER
);

-- Insert a row into the table
INSERT INTO President (id, name, department, salary) 
VALUES (1, 'MODI', 'PM', 50000.00.00);
