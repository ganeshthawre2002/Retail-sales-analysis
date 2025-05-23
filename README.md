# 🛍️ Retail Sales Analysis (SQL Project)

This project involves analyzing a retail sales dataset using SQL to extract meaningful insights about customer behavior, sales trends, and product performance. 
It showcases fundamental SQL techniques including data cleaning, exploration, and business-oriented querying.

## 🧠 Objectives

- Clean and explore retail sales data.
- Answer key business questions using SQL queries.
- Identify trends based on sales date, category, customer demographics, and more..

## 🗂️ Dataset Schema

Table: `retail_sales`

| Column Name      | Data Type | Description                          |
|------------------|-----------|--------------------------------------|
| transaction_id   | INT       | Unique transaction identifier        |
| sale_date        | DATE      | Date of the sale                     |
| sale_time        | TIME      | Time of the sale                     |
| customer_id      | INT       | Unique customer identifier           |
| gender           | VARCHAR   | Gender of the customer               |
| age              | INT       | Age of the customer                  |
| category         | VARCHAR   | Product category                     |
| quantity         | INT       | Quantity sold                        |
| price_per_unit   | FLOAT     | Price per item                       |
| cogs             | FLOAT     | Cost of goods sold                   |
| total_sale       | FLOAT     | Total sale amount                    |

## 🧹 Data Cleaning

- Removed rows containing `NULL` values across critical columns such as quantity, price, cogs, and total sale.

## 🔍 Data Exploration

- Total Sales: 1997
- Unique Customers: 155
- Categories: Electronics, Clothing, Beauty

## 📊 Business Questions Answered

1. Sales on a specific date (`2022-11-05`)
2. Clothing sales with quantity > 4 in Nov-2022
3. Total sales and orders per category
4. Average age of customers in the Beauty category
5. Transactions with total sales > 1000
6. Sales by gender across categories
7. Monthly average sales and best-selling months per year
8. Top 5 customers by total sales
9. Unique customer count by category
10. Shift-wise order distribution (Morning, Afternoon, Evening)

## 🛠️ Tech Stack

- SQL (PostgreSQL syntax)

## 📌 Conclusion

This project demonstrates how SQL can be used to transform raw transactional data into insights that support business decisions.

## 📂 File

- `retail_sales_analysis.sql` – Contains the entire SQL workflow

---

🔗 Connect with me on [LinkedIn](www.linkedin.com/in/ganesh-thawre2002) to explore more data analytics projects!
