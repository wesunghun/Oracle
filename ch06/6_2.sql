    select a.employee_id, a.emp_name, b.job_id, b.department_id
      from employees a,
           job_history b
     where a.employee_id      = b.employee_id(+)
       and a.department_id(+) = b.department_id;
