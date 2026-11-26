SELECT department_id,
       SUBSTR(SYS_CONNECT_BY_PATH(emp_name, ','), 2) AS empnames
  FROM ( SELECT emp_name,
                department_id,
                ROW_NUMBER() OVER (PARTITION BY department_id
                                   ORDER BY emp_name)    AS rowseq,
                COUNT(*)     OVER (PARTITION BY department_id) AS cnt
           FROM employees
          WHERE department_id IS NOT NULL )
 WHERE rowseq = cnt
 START WITH rowseq = 1
CONNECT BY PRIOR rowseq + 1 = rowseq
       AND PRIOR department_id = department_id
 ORDER BY department_id;