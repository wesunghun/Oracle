SELECT a.department_id, a.department_name
  FROM departments a
 WHERE a.department_id IN (SELECT department_id
        FROM job_history);