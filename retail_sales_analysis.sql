
-- Project: Retail Sales Analysis


--Creating table name 'retail_sales'.


CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

SELECT * FROM retail_sales
LIMIT 10

-- Dealing with the NULL values 

  SELECT * FROM retail_sales 
  WHERE
       transaction_id IS NULL
	   OR
	   sale_date IS NULL
	   OR 
	   sale_time IS NULL
	   OR 
	   gender IS NULL
	   OR 
	   category IS NULL
	   OR 
	   quantity IS NULL 
	   OR
	   cogs IS NULL
	   OR 
	   total_sale IS NULL;


-- Deleting the NULL values 
--- the dataset have null values for quantity, price_per_unit, cogs and total_sale. 
--- i am deleting the null values because i dont have any information for dealing with the null values 



DELETE FROM retail_sales 
  WHERE
       transaction_id IS NULL
	   OR
	   sale_date IS NULL
	   OR 
	   sale_time IS NULL
	   OR 
	   gender IS NULL
	   OR 
	   category IS NULL
	   OR 
	   quantity IS NULL 
	   OR
	   cogs IS NULL
	   OR 
	   total_sale IS NULL;


-- Data Exploration

-- 1. how many sales i have?

SELECT COUNT(*) as total_sale FROM retail_sales
-- i have total 1997 sales in the dataset.


-- 2. how many unique customers i have in the dataset ?

  SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales
  -- i have 155 unique cutomers in the dataset.

--3. how many unique categories i have in the dataset?

  SELECT DISTINCT category FROM retail_sales
  -- i have total 3 unique categories electronics, clothing and beauty in the dataset.


  
  --Data Analysis & Business Key Problems % Answers.

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05';

 -- there is 11 records for sales made on '2022-11-05'


-- Q2. Write a SQL query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 4 in the month of NOV-2022.

SELECT
  *
  FROM retail_sales 
  WHERE
     category ='Clothing'
	 AND 
	 TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	 AND 
	 quantity >= 4
	 -- there is 17 records for category clothing in NOV-2022 where quantity sold is 4 or more than 4


-- Q3. Write SQL query to calculate the (total sales) aand (total orders) for each category.

SELECT 
  category,
  SUM(total_sale) as net_sale,
  COUNT(*) as total_orders 
  FROM retail_sales 
  GROUP BY 1 


-- Q4. Write SQL query to find the average age of customers who purchased items from 'beauty' category.

SELECT 
   ROUND(AVG(age),2) as avg_age
   FROM retail_sales
   WHERE category = 'Beauty'
   -- the average age of the customer is 40 who purchased items from the 'beauty'


-- Q5 Write a SQL query to find all transacions where the total_sale is greater than 1000.

SELECT * FROM retail_sales
WHERE 
total_sale > 1000
---there is 306 records


-- Q6. Write SQL query to find the total number of transactions (transaction_id) made by each gender in each category.


SELECT 
    category,
	gender,
	COUNT(*) as total_transaction 
	FROM retail_sales
	GROUP BY 
	category,
	gender
	ORDER BY 1


-- Q7. Write SQL query to calculate the average sale for each month. find out best selling month in each year.


SELECT
   year,
   month,
   avg_sale
 FROM

 (
     SELECT 
	    EXTRACT(YEAR FROM sale_date) as year,
		EXTRACT(MONTH FROM sale_date) as month,
		AVG(total_sale) as avg_sale, 
		RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
	FROM retail_sales
	GROUP BY 1, 2
	) as t1
WHERE rank = 1 



-- Q8 Write SQL query to find the top 5 customers based on the highest total sales

--select * from retail_sales

SELECT 
    customer_id,
	SUM(total_sale) as total_sales 
FROM retail_sales 
GROUP BY 1 
ORDER BY 2 DESC 
LIMIT 5


-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
   category,
   COUNT(DISTINCT customer_id) as cnt_unique_cs
  FROM retail_sales 
  GROUP BY category

-- Q10. Write a SQL query to create each shift and number of orders (example morning < 12, afternoon between 12& 17, evening > 17) 

WITH hourly_sale
AS 
(
SELECT *,
  CASE 
   WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
   WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
   ELSE 'Evening'
 END as shift 
 FROM retail_sales)
 SELECT 
 shift,
 COUNT(*) as total_orders 
 FROM hourly_sale 
 GROUP BY shift 


 -- End Of Project
 


