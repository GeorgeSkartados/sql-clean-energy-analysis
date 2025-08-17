SELECT p.type, AVG(e.output_mwh) AS avg_output_mwh
FROM EnergyOutput e
JOIN PowerPlants p ON p.id = e.plant_id
GROUP BY p.type;
