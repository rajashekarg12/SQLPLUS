-- Create a PL/SQL file named "student_example.sql"
--set serveroutput on
spool test.txt
-- Drop the table if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE students';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Do nothing if the table does not exist
END;
/



    

-- Create a table for students
CREATE TABLe students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    student_age NUMBER,
    student_grade VARCHAR2(10)
);

-- Insert some sample data
INSERT INTO students (student_id, student_name, student_age, student_grade)
VALUES (1, 'John Doe', 20, 'A');

INSERT INTO students (student_id, student_name, student_age, student_grade)
VALUES (2, 'Jane Smith', 22, 'B');

-- Procedure to retrieve student details
CREATE OR REPLACE PROCEDURE get_student_details(
    p_student_id IN NUMBER,
    o_student_name OUT VARCHAR2,
    o_student_age OUT NUMBER,
    o_student_grade OUT VARCHAR2
)
AS
BEGIN
    -- Retrieve student details based on student ID
    SELECT student_name, student_age, student_grade
    INTO o_student_name, o_student_age, o_student_grade
    FROM students
    WHERE student_id = p_student_id;

    -- Exception handling
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Student not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

-- Example of calling the procedure
DECLARE
    v_stud_name VARCHAR2(100);
    v_stud_age NUMBER;
    v_stud_grade VARCHAR2(10);
BEGIN
    -- Call the procedure with a student ID
    get_student_details(1, v_stud_name, v_stud_age, v_stud_grade);

    -- Output retrieved student details
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_stud_name);
    DBMS_OUTPUT.PUT_LINE('Student Age: ' || v_stud_age);
    DBMS_OUTPUT.PUT_LINE('Student Grade: ' || v_stud_grade);

END;
/
