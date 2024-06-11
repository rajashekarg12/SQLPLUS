set serveroutput on
CREATE OR REPLACE PROCEDURE generate_warnings AS
BEGIN
    DECLARE
        v_variable NUMBER;
    BEGIN
        -- This assignment will cause an "unused variable" warning
        v_variable := 10;
        
        -- This statement will cause a "procedure created with compilation errors" warning
        SELECT column_name
        INTO v_variable
        FROM non_existing_table;
        
        -- This statement will cause a "no_data_found" warning
        SELECT column_name
        INTO v_variable
        FROM your_table
        WHERE 1 = 2;
        
    END;
END;
/
