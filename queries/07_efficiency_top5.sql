SELECT e.date, p.name, p.capacity_mw,
       e.output_mwh,
       ROUND(e.output_mwh / (p.capacity_mw * 24), 4) AS efficiency
FROM EnergyOutput e
JOIN PowerPlants p ON p.id = e.plant_id
ORDER BY efficiency DESC
LIMIT 5;
