WITH region_sales AS(
    SELECT a.sales_month, 
           c.country_region,
           SUM(a.amount_sold) AS amount_sold
        FROM sales  a,
             customers b,
             countries c
        WHERE a.cust_id = b.cust_id
          AND b.country_id = c.country_id
        GROUP BY a.sales_month, c.country_region
),
ranked AS (
    SELECT sales_month,
           country_region,
           amount_sold,
           RANK() OVER (PARTITION BY sales_month
                        ORDER BY amount_sold) AS rnk
      FROM region_sales
)
SELECT sales_month    AS 매출월,
       country_region AS "지역(대륙)",
       amount_sold    AS 매출금액
  FROM ranked
 WHERE rnk = 1
 ORDER BY sales_month;