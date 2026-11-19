SELECT cust_id,
       cust_name,
       cust_year_of_birth,
       age,
       CASE WHEN age < 20 THEN '10대 이하'
            WHEN age < 30 THEN '20대'
            WHEN age < 40 THEN '30대'
            WHEN age < 50 THEN '40대'
            WHEN age < 60 THEN '50대'
            WHEN age < 70 THEN '60대'
            WHEN age < 80 THEN '70대'
            WHEN age < 90 THEN '80대'
            ELSE '90대 이상'
        END AS generation
    FROM(SELECT cust_id, cust_name, cust_year_of_birth, TO_CHAR(SYSDATE, 'YYYY') 
            - cust_year_of_birth AS age FROM customers)
  ORDER BY age;