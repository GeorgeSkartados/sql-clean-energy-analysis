WITH daily_gen AS (
  SELECT date, SUM(output_mwh) AS total_mwh
  FROM EnergyOutput
  GROUP BY date
)
SELECT date, total_mwh,
       ROUND( (total_mwh - LAG(total_mwh) OVER (ORDER BY date))
              / NULLIF(LAG(total_mwh) OVER (ORDER BY date),0) * 100, 2) AS pct_change
FROM daily_gen
ORDER BY date;
