SELECT emp.years,
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold,
       CASE WHEN emp.amount_sold = sale.max_sold THEN '최대'
            ELSE '최소'
       END AS gubun
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) AS years,
                a.employee_id,
                SUM(a.amount_sold) AS amount_sold
           FROM sales a, customers b, countries c
          WHERE a.cust_id    = b.cust_id
            AND b.country_id = c.country_id
            AND c.country_name = 'Italy'
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id
       ) emp,
       ( SELECT years,
                MAX(amount_sold) AS max_sold,
                MIN(amount_sold) AS min_sold
           FROM ( SELECT SUBSTR(a.sales_month, 1, 4) AS years,
                         a.employee_id,
                         SUM(a.amount_sold) AS amount_sold
                    FROM sales a, customers b, countries c
                   WHERE a.cust_id    = b.cust_id
                     AND b.country_id = c.country_id
                     AND c.country_name = 'Italy'
                   GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id
                ) k
          GROUP BY years
       ) sale,
       employees emp2
 WHERE emp.years       = sale.years
   AND emp.amount_sold IN (sale.max_sold, sale.min_sold)
   AND emp.employee_id = emp2.employee_id
 ORDER BY emp.years, emp.amount_sold DESC;