WITH basis AS (
    SELECT region,
           gubun,
           SUM(DECODE(period, '201111', loan_jan_amt, 0)) AS amt1,
           SUM(DECODE(period, '201112', loan_jan_amt, 0)) AS amt2,
           SUM(DECODE(period, '201210', loan_jan_amt, 0)) AS amt3,
           SUM(DECODE(period, '201211', loan_jan_amt, 0)) AS amt4,
           SUM(DECODE(period, '201212', loan_jan_amt, 0)) AS amt5,
           SUM(DECODE(period, '201310', loan_jan_amt, 0)) AS amt6,
           SUM(DECODE(period, '201311', loan_jan_amt, 0)) AS amt7
      FROM kor_loan_status
     GROUP BY region, gubun
)
SELECT region AS 지역,
       gubun  AS 대출종류,
       amt1 || '( ' || ROUND(RATIO_TO_REPORT(amt1) OVER (PARTITION BY region) * 100) || '% )' AS "201111",
       amt2 || '( ' || ROUND(RATIO_TO_REPORT(amt2) OVER (PARTITION BY region) * 100) || '% )' AS "201112",
       amt3 || '( ' || ROUND(RATIO_TO_REPORT(amt3) OVER (PARTITION BY region) * 100) || '% )' AS "201210",
       amt4 || '( ' || ROUND(RATIO_TO_REPORT(amt4) OVER (PARTITION BY region) * 100) || '% )' AS "201211",
       amt5 || '( ' || ROUND(RATIO_TO_REPORT(amt5) OVER (PARTITION BY region) * 100) || '% )' AS "201212",
       amt6 || '( ' || ROUND(RATIO_TO_REPORT(amt6) OVER (PARTITION BY region) * 100) || '% )' AS "201310",
       amt7 || '( ' || ROUND(RATIO_TO_REPORT(amt7) OVER (PARTITION BY region) * 100) || '% )' AS "201311"
  FROM basis
ORDER BY region, gubun;