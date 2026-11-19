SELECT cust_id,
       cust_name,
       cust_year_of_birth,
       DECODE(TRUNC((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) / 10),
              3, '30대',
              4, '40대',
              5, '50대',
                 '기타') AS generation
FROM customers;
