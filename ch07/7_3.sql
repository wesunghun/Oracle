WITH basis AS (
    SELECT TRUNC((TO_CHAR(SYSDATE, 'YYYY') - b.cust_year_of_birth) / 10) * 10 AS age_grp,
           a.amount_sold
      FROM sales a,
           customers b
     WHERE a.cust_id     = b.cust_id
       AND a.sales_month = '200112'
)
SELECT age_grp || '대'   AS 연령대,
       SUM(amount_sold)  AS 매출금액
  FROM basis
 GROUP BY age_grp
 ORDER BY age_grp;