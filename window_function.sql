1. RANK()
       
SELECT customer_id,
       SUM(amount) AS total_revenue,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank
FROM transactions
GROUP BY customer_id
ORDER BY revenue_rank;

2. SUM() & OVER()
       
SELECT sale_date,
       SUM(amount) AS daily_sales,
       SUM(SUM(amount)) OVER (ORDER BY sale_date
                              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM transactions
GROUP BY sale_date
ORDER BY sale_date;

3.LAG() / LEAD()
SELECT month,
       monthly_sales,
       LAG(monthly_sales) OVER (ORDER BY month) AS prev_month_sales,
       ROUND(((monthly_sales - LAG(monthly_sales) OVER (ORDER BY month))
              / LAG(monthly_sales) OVER (ORDER BY month)) * 100, 2) AS growth_percent
FROM (
    SELECT TO_CHAR(sale_date, 'YYYY-MM') AS month,
           SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
    ORDER BY month
);

4.NTILE()
       
SELECT customer_id,
       SUM(amount) AS total_revenue,
       NTILE(4) OVER (ORDER BY SUM(amount) DESC) AS revenue_quartile
FROM transactions
GROUP BY customer_id
ORDER BY revenue_quartile;

5.AVG & OVER
       
SELECT month,
       monthly_sales,
       ROUND(AVG(monthly_sales) OVER (
                 ORDER BY month
                 ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
             ), 2) AS moving_avg_3m
FROM (
    SELECT TO_CHAR(sale_date, 'YYYY-MM') AS month,
           SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
    ORDER BY month
);
