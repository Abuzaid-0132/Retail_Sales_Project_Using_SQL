-- creating table
CREATE TABLE retail_sales_tb(
	transactions_id INT PRIMARY KEY, 
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT,
	category VARCHAR(15),
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
)

SELECT *
FROM retail_sales_tb

-- data cleaning
select count(*)
from retail_sales_tb

select *
from retail_sales_tb
where transactions_id IS NULL
OR sale_date IS NULL 
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL


update retail_sales_tb
set age = 42
where age IS NULL

select *
from retail_sales_tb


-- data exploration

-- How many sales we have?
select count(*) as total_sale from retail_sales_tb

-- How many unique customers we have?
select count( DISTINCT customer_id) as total_customers
from retail_sales_tb


-- How many unique category we have?
select distinct category as total_category
from retail_sales_tb

-- Data Analysis & Business Analysis

--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select *
from retail_sales_tb
where sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT *
FROM retail_sales_tb
WHERE category = 'Clothing'
  AND FORMAT(sale_date, 'yyyy-MM') = '2022-11'
  AND quantity >= 4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category:
select category, sum(total_sale), count(*) as total_orders
from retail_sales_tb
group by category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select AVG(Age) as AvgAge
from retail_sales_tb
where category  = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:
select *
from retail_sales_tb
where total_sale > '1000'

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category:
select category, gender ,count(*) as total_trans
from retail_sales_tb
group by category, gender
order by category

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

select * FROM 
(
	select 
	YEAR(sale_date) as year,
	MONTH(sale_date) as month,
	AVG(total_sale) as Avg_sales,
	RANK() OVER (PARTITION BY YEAR(sale_date) order by AVG(total_sale) DESC) as Ranking
	from retail_sales_tb
	group by year(sale_date), month(sale_date)
	) as t1
WHERE Ranking = 1


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales:

select 
	TOP 5
	customer_id,
	SUM(total_sale) as total_sales
from retail_sales_tb
group by customer_id
order by total_sales DESC
	
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.:

select
	category,
	COUNT(DISTINCT(customer_id)) as Unique_Customer
from retail_sales_tb
group by category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

WITH hourly_sale AS
(
    SELECT *,
        CASE
            WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales_tb
)
SELECT 
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift
ORDER BY shift;

-- This is the End of the Project