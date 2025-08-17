# SQL Clean Energy Analysis ⚡🌱

- Mini SQL project simulating clean energy data (power plants, consumption, prices, forecasts).  
- Includes schema, inserts, and 12 queries demonstrating joins, aggregations, window functions, and forecast error analysis.
- This project simulates a **clean energy company** that manages solar & wind power plants, monitors energy output, customer consumption, wholesale prices, and AI demand forecasts.  

---

## 📂 Project Structure
- `schema_and_inserts.sql` → creates the database schema and inserts sample data.
- `queries/` → contains 12 analytical queries solving real-world business questions:
  1. Solar plants over 60 MW capacity  
  2. Daily generation per plant  
  3. Average output by plant type (solar vs wind)  
  4. Regional consumption costs  
  5. Customers above average usage  
  6. Top 2 plants per day (generation)  
  7. Efficiency ranking of plants  
  8. Rolling 3-day average price  
  9. Daily generation % change  
  10. Forecast vs actual demand  
  11. Forecast errors greater than 10%  
  12. Pattern: biggest single transaction  

---

## 🔗 Live Demo
You can explore the schema and queries interactively here:  
👉 [Run on dbfiddle.uk](https://dbfiddle.uk/24FWolAr)

---

## 🚀 How to Run 
1. Copy the contents of `schema_and_inserts.sql` into [dbfiddle.uk](https://dbfiddle.uk) (select **MySQL 8.0**).
2. Run it to create the schema and load data.
3. Copy queries from the `queries/` folder and run them individually to view outputs.

---

## 🎯 Skills Demonstrated
- **Beginner SQL**: SELECT, WHERE, GROUP BY, HAVING, JOINs  
- **Intermediate SQL**: CTEs, Window Functions, Subqueries, Set Operations  
- **Advanced SQL**: Efficiency calculations, Forecast error analysis, Indexing  

---

## 🌍 Why Clean Energy?
Energy & AI are **fast-growing industries**. This project shows:
- How to work with production/consumption data
- Price forecasting
- AI error analysis
- Real-world reporting scenarios for stakeholders  

---

## 📌 Example Business Question
*"Which plants had the highest efficiency (MWh per capacity) over the last week?"*  
→ Query [07_efficiency_top5.sql](queries/07_efficiency_top5.sql) answers this.

---
