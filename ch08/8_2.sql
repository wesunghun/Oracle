SET SERVEROUTPUT ON
DECLARE
    vs_emp_name  employees.emp_name%TYPE;
    vs_email     employees.email%TYPE;
BEGIN
SELECT emp_name, email
    INTO vs_emp_name, vs_email
    FROM employees
    WHERE employee_id = 201;

    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' - ' || vs_email);
END;
/