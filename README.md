# 🛍️ Retail Sales Project Using SQL  

## 📌 Project Overview  
The **Retail Sales Project Using SQL** demonstrates how SQL can be applied to analyze retail sales data and extract valuable insights. This project involves creating a structured database, cleaning raw data, and running advanced SQL queries to answer business-related questions. It is designed for beginners and intermediate learners who want hands-on practice with SQL in the context of real-world retail sales data.  

Through this project, you will learn how to:  
- Build and populate a SQL database.  
- Perform data cleaning and validation.  
- Explore datasets with exploratory data analysis (EDA).  
- Use SQL queries to answer key business questions.  
- Generate actionable insights from sales trends, customer behavior, and product performance.  

---

## 🎯 Objectives  
1. **Database Setup**: Create and populate a retail sales database.  
2. **Data Cleaning**: Identify and remove records with missing or invalid values.  
3. **Exploratory Data Analysis (EDA)**: Summarize and explore the dataset.  
4. **Business Queries**: Use SQL to answer real-world business problems.  
5. **Reporting & Insights**: Present findings that can help optimize sales and customer engagement.  

---

## 🗂️ Project Structure  
- **Retail_Sales_Project.sql** → Contains database creation, table schema, and queries.  
- **SQL - Retail Sales Analysis_utf.csv** → Dataset used in the project.  
- **README.md** → Documentation for the project.  

---

## 🛠️ Database Schema  
The main table in this project is `retail_sales`, which stores transaction-level data.  

```sql
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```
 📊 Key Insights
1. Customer Demographics: Customers span multiple age groups with balanced gender distribution.
2. High-Value Transactions: Some orders exceeded 1000 in total sales, highlighting premium purchases.
3. Sales Trends: Seasonal variations show peak sales in certain months.
4. Top Customers: A small group of customers contributes significantly to revenue.
5. Shift-Based Sales: Evenings tend to have more sales compared to mornings.

🧑‍💻 Technologies Used
1. SQL Server / PostgreSQL (adapt queries as needed)
2. Retail Dataset (CSV)
3. SQL Queries for Analysis


