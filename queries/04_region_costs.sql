WITH region_usage AS (
  SELECT region, date, SUM(usage_kwh) AS kwh
  FROM Consumption
  GROUP BY region, date
)
SELECT r.region, r.date, r.kwh,
       pr.price_usd_per_mwh,
       ROUND((r.kwh/1000.0) * pr.price_usd_per_mwh, 2) AS est_cost_usd
FROM region_usage r
JOIN Prices pr ON pr.date = r.date
ORDER BY r.date, r.region;
