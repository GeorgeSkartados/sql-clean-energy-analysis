-- Clean Energy SQL Mini Project (MySQL 8)
DROP TABLE IF EXISTS AI_Forecast, Prices, Consumption, EnergyOutput, PowerPlants;

CREATE TABLE PowerPlants (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  type VARCHAR(10),         -- 'solar' | 'wind'
  capacity_mw INT,
  location VARCHAR(40)
);

CREATE TABLE EnergyOutput (
  id INT PRIMARY KEY,
  plant_id INT,
  date DATE,
  output_mwh DECIMAL(10,2)
);

CREATE TABLE Consumption (
  id INT PRIMARY KEY,
  customer_id INT,
  region VARCHAR(20),
  date DATE,
  usage_kwh DECIMAL(10,2)
);

CREATE TABLE Prices (
  id INT PRIMARY KEY,
  date DATE,
  price_usd_per_mwh DECIMAL(10,2)
);

CREATE TABLE AI_Forecast (
  id INT PRIMARY KEY,
  date DATE,
  predicted_demand_mwh DECIMAL(10,2),
  predicted_price_usd DECIMAL(10,2)
);

-- Plants
INSERT INTO PowerPlants VALUES
(1,'Helios Park','solar',80,'AZ'),
(2,'SunField West','solar',60,'CA'),
(3,'WindRidge','wind',120,'TX'),
(4,'Prairie Wind','wind',90,'OK'),
(5,'Desert Sun','solar',50,'NV');

-- Energy output (3 days each, varied)
INSERT INTO EnergyOutput VALUES
(1,1,'2025-03-20',320.0),(2,1,'2025-03-21',340.0),(3,1,'2025-03-22',310.0),
(4,2,'2025-03-20',210.0),(5,2,'2025-03-21',200.0),(6,2,'2025-03-22',195.0),
(7,3,'2025-03-20',500.0),(8,3,'2025-03-21',520.0),(9,3,'2025-03-22',510.0),
(10,4,'2025-03-20',410.0),(11,4,'2025-03-21',0.0),(12,4,'2025-03-22',425.0),
(13,5,'2025-03-20',180.0),(14,5,'2025-03-21',175.0),(15,5,'2025-03-22',0.0);

-- Consumption (3 regions, 6 customers)
INSERT INTO Consumption VALUES
(1,101,'West','2025-03-20',38.0),(2,101,'West','2025-03-21',41.0),(3,101,'West','2025-03-22',39.0),
(4,102,'West','2025-03-20',55.0),(5,102,'West','2025-03-21',0.0),(6,102,'West','2025-03-22',57.0),
(7,201,'South','2025-03-20',72.5),(8,201,'South','2025-03-21',75.0),(9,201,'South','2025-03-22',70.0),
(10,202,'South','2025-03-20',15.0),(11,202,'South','2025-03-21',18.0),(12,202,'South','2025-03-22',19.0),
(13,301,'Central','2025-03-20',95.0),(14,301,'Central','2025-03-21',96.0),(15,301,'Central','2025-03-22',92.0),
(16,302,'Central','2025-03-20',0.0),(17,302,'Central','2025-03-21',12.0),(18,302,'Central','2025-03-22',14.0);

-- Prices (wholesale)
INSERT INTO Prices VALUES
(1,'2025-03-20',42.50),(2,'2025-03-21',44.00),(3,'2025-03-22',39.75);

-- AI forecasts (demand & price)
INSERT INTO AI_Forecast VALUES
(1,'2025-03-20',1800.0,43.00),
(2,'2025-03-21',1850.0,45.00),
(3,'2025-03-22',1750.0,40.00);

-- Optional indexes
CREATE INDEX idx_energyoutput_plant_date ON EnergyOutput(plant_id, date);
CREATE INDEX idx_consumption_customer_date ON Consumption(customer_id, date);
CREATE INDEX idx_prices_date ON Prices(date);
CREATE INDEX idx_forecast_date ON AI_Forecast(date);