WITH actual AS (
  SELECT date, SUM(output_mwh) AS actual_mwh
  FROM EnergyOutput
  GROUP BY date
)
SELECT a.date,
       a.actual_mwh,
       f.predicted_demand_mwh,
       ROUND(ABS(f.predicted_demand_mwh - a.actual_mwh), 2) AS abs_error_mwh,
       ROUND(ABS(f.predicted_demand_mwh - a.actual_mwh) / NULLIF(a.actual_mwh,0) * 100, 2) AS pct_error
FROM actual a
JOIN AI_Forecast f ON f.date = a.date
ORDER BY a.date;
