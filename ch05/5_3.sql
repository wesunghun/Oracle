SELECT period, gubun, SUM(loan_jan_amt) AS totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%'
 GROUP BY period, gubun
UNION ALL
SELECT period, NULL, SUM(loan_jan_amt) AS totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%'
 GROUP BY period
 ORDER BY period, gubun;