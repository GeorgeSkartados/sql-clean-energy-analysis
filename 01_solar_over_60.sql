SELECT name, capacity_mw, location
FROM PowerPlants
WHERE type='solar' AND capacity_mw > 60
ORDER BY capacity_mw DESC;
