WITH cust_total AS (
  SELECT customer_id, SUM(usage_kwh) AS total_kwh
  FROM Consumption
  GROUP BY customer_id
),
avg_total AS (
  SELECT AVG(total_kwh) AS avg_kwh FROM cust_total
)
SELECT c.customer_id, c.total_kwh
FROM cust_total c
CROSS JOIN avg_total a
WHERE c.total_kwh > a.avg_kwh
ORDER BY c.total_kwh DESC;
