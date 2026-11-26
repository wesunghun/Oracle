SELECT employee_id,
       emp_name,
       hire_date,
       LEAD(hire_date) OVER (ORDER BY hire_date) AS retire_date
  FROM employees
 WHERE job_id = 'SH_CLERK'
 ORDER BY hire_date;