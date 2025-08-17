SELECT p.name, e.date, SUM(e.output_mwh) AS gen_mwh
FROM EnergyOutput e
JOIN PowerPlants p ON p.id = e.plant_id
GROUP BY p.name, e.date
ORDER BY e.date, p.name;
