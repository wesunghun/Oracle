SELECT period,
       SUM(loan_jan_amt) AS 주택담보대출액,
       0                 AS 기타대출액
  FROM kor_loan_status
 WHERE period = '201311'
   AND gubun  = '주택담보대출'
 GROUP BY period
UNION ALL
SELECT period,
       0,
       SUM(loan_jan_amt)
  FROM kor_loan_status
 WHERE period = '201311'
   AND gubun  = '기타대출'
 GROUP BY period;