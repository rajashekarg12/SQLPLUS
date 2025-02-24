SELECT * FROM employees WHERE emp_id = 1;

SELECT first_name last_name FROM employees;

SELECT * FROM non_existent_table;

SELECT AVG(emp_id FROM employees);

SELECT * FROM employees WHERE hire_date = 'ABC';

SELECT * WHERE emp_id = 1;

INSERT INTO employees (emp_id, emp_name, emp_age) VALUES (1, 'John', 30);

DELETE employees WHERE emp_id = 1;

SELECT * FROM employees e JOIN departments d ON e.dept_id = d.dept_id WHERE e.emp_id = 'abc';

SELECT select FROM employees;

SELECT e.emp_name FROM employees e, departments d WHERE e.dept_id = d.dept_id;

SELECT COUNT(*) FROM employees WHERE emp_id > 5

SELECT * FROM employees WHERE hire_date = '2025-30-02';

SELECT * FROM employees WHERE emp_id = (SELECT emp_id FROM employees);

INSERT INTO employees (emp_id, emp_name, hire_date) VALUES ('abc', 'John', '2025-02-24');

SELECT emp_name, hire_date FROM employees GROUP BY emp_name;

SELECT e.emp_name FROM employees e WHERE dept_id = 2;

SELECT * FROM employees WHERE emp_age ! 30;

INSERT INTO employees (emp_id, emp_name) VALUES (1, 'John');
