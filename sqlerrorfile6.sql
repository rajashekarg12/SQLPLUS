CREATE TABLE test_table (id NUMBER PRIMARY KEY, name VARCHAR2(50));

INSERT INTO test_table (id, name) VALUES (1, 'Test');
INSERT INTO test_table (id, name) VALUES (1, 'Duplicate');
