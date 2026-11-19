INSERT INTO ex3_6 (emp_id, emp_name, salary, manager_id)
SELECT employee_id, emp_name, salary, manager_id
FROM employees
WHERE manager_id = 124
AND salary BETWEEN 2000 AND 3000;

COMMIT;

SELECT * FROM ex3_6;