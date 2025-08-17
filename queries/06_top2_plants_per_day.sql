WITH ranked AS (
  SELECT e.date, p.name,
         SUM(e.output_mwh) AS gen_mwh,
         DENSE_RANK() OVER (PARTITION BY e.date ORDER BY SUM(e.output_mwh) DESC) AS rnk
  FROM EnergyOutput e
  JOIN PowerPlants p ON p.id = e.plant_id
  GROUP BY e.date, p.name
)
SELECT date, name, gen_mwh
FROM ranked
WHERE rnk <= 2
ORDER BY date, gen_mwh DESC, name;
