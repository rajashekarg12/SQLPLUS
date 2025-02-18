SET SERVEROUTPUT ON;
WHENEVER SQLERROR CONTINUE;

-- 1. Table does not exist (Repeating multiple times)
BEGIN
    FOR i IN 1..20 LOOP
        EXECUTE IMMEDIATE 'SELECT * FROM non_existent_table_' || i;
    END LOOP;
END;
/

-- 2. Invalid Column Name (Repeating multiple times)
BEGIN
    FOR i IN 1..20 LOOP
        EXECUTE IMMEDIATE 'SELECT invalid_column_' || i || ' FROM dual';
    END LOOP;
END;
/

-- 3. Unique Constraint Violation
CREATE TABLE test_table (id NUMBER PRIMARY KEY, name VARCHAR2(50));

INSERT INTO test_table (id, name) VALUES (1, 'Test');
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO test_table (id, name) VALUES (1, 'Duplicate_' || i);
    END LOOP;
END;
/

-- 4. Foreign Key Constraint Violation
CREATE TABLE parent_table (id NUMBER PRIMARY KEY);
CREATE TABLE child_table (id NUMBER PRIMARY KEY, parent_id NUMBER,
   CONSTRAINT fk_parent FOREIGN KEY (parent_id) REFERENCES parent_table(id));

BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO child_table (id, parent_id) VALUES (i, i * 100);
    END LOOP;
END;
/

-- 5. Division by Zero (Repeating multiple times)
BEGIN
    FOR i IN 1..10 LOOP
        EXECUTE IMMEDIATE 'SELECT 1 / 0 FROM dual';
    END LOOP;
END;
/

-- 6. Invalid Data Type Conversion (Repeating multiple times)
BEGIN
    FOR i IN 1..10 LOOP
        EXECUTE IMMEDIATE 'SELECT TO_DATE(''invalid-date-' || i || ''', ''YYYY-MM-DD'') FROM dual';
    END LOOP;
END;
/

-- 7. Syntax Errors (Repeating multiple times)
BEGIN
    FOR i IN 1..10 LOOP
        EXECUTE IMMEDIATE 'SELECT FROM dual';
    END LOOP;
END;
/

-- 8. Dropping Non-Existent Tables (Repeating multiple times)
BEGIN
    FOR i IN 1..10 LOOP
        EXECUTE IMMEDIATE 'DROP TABLE missing_table_' || i;
    END LOOP;
END;
/
