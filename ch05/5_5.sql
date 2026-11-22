SELECT region AS 지역,
       SUM(DECODE(period, '201111', loan_jan_amt, 0)) AS "201111",
       SUM(DECODE(period, '201112', loan_jan_amt, 0)) AS "201112",
       SUM(DECODE(period, '201210', loan_jan_amt, 0)) AS "201210",
       SUM(DECODE(period, '201211', loan_jan_amt, 0)) AS "201211",
       SUM(DECODE(period, '201212', loan_jan_amt, 0)) AS "201212",
       SUM(DECODE(period, '201310', loan_jan_amt, 0)) AS "201310",
       SUM(DECODE(period, '201311', loan_jan_amt, 0)) AS "201311"
  FROM kor_loan_status
 GROUP BY region
 ORDER BY region;