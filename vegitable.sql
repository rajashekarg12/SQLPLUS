set serveroutput on
-- Create a PL/SQL file named "vegetable_example.sql"


-- Drop the table if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE veggietables';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Do nothing if the table does not exist
END;
/

-- Create a table for vegetable tables
CREATE TABLE veggietables (
    vegtable_id NUMBER PRIMARY KEY,
    vegtable_name VARCHAR2(100),
    vegtable_quantity NUMBER,
    vegtable_category VARCHAR2(50)
);

-- Insert some sample data
INSERT INTO veggietables (vegtable_id, vegtable_name, vegtable_quantity, vegtable_category)
VALUES (1, 'Carrot', 50, 'Root');

INSERT INTO veggietables (vegtable_id, vegtable_name, vegtable_quantity, vegtable_category)
VALUES (2, 'Spinach', 100, 'Leafy');

-- Procedure to retrieve vegetable table details
CREATE OR REPLACE PROCEDURE get_veggietable_details(
    p_vegtable_id IN NUMBER,
    o_vegtable_name OUT VARCHAR2,
    o_vegtable_quantity OUT NUMBER,
    o_vegtable_category OUT VARCHAR2
)
AS
BEGIN
    -- Retrieve vegetable table details based on vegetable table ID
    SELECT vegtable_name, vegtable_quantity, vegtable_category
    INTO o_vegtable_name, o_vegtable_quantity, o_vegtable_category
    FROM veggietables
    WHERE vegtable_id = p_vegtable_id;

    -- Exception handling
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Vegetable table not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

-- Example of calling the procedure
DECLARE
    v_vegtable_name VARCHAR2(100);
    v_vegtable_quantity NUMBER;
    v_vegtable_category VARCHAR2(50);
BEGIN
    -- Call the procedure with a vegetable table ID
    get_veggietable_details(1, v_vegtable_name, v_vegtable_quantity, v_vegtable_category);

    -- Output retrieved vegetable table details
    DBMS_OUTPUT.PUT_LINE('Vegetable Table Name: ' || v_vegtable_name);
    DBMS_OUTPUT.PUT_LINE('Vegetable Table Quantity: ' || v_vegtable_quantity);
    DBMS_OUTPUT.PUT_LINE('Vegetable Table Category: ' || v_vegtable_category);

END;
/
