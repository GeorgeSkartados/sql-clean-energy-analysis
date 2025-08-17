WITH actual AS (
  SELECT date, SUM(output_mwh) AS actual_mwh
  FROM EnergyOutput
  GROUP BY date
),
err AS (
  SELECT a.date,
         ABS(f.predicted_demand_mwh - a.actual_mwh) / NULLIF(a.actual_mwh,0) AS err_ratio
  FROM actual a
  JOIN AI_Forecast f ON f.date = a.date
)
SELECT date, ROUND(err_ratio*100,2) AS pct_error
FROM err
WHERE err_ratio > 0.10
ORDER BY date;
