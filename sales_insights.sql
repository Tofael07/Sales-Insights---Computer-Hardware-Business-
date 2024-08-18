-- Sales Insights Data Analysis Project

--  Data Analysis Using SQL

-- 1. Show all customer records

SELECT * 
FROM customers;

-- 2. Show total number of customers

SELECT COUNT(*)
FROM customers;

-- 3. Show transactions for Chennai market market code for chennai is Mark001

SELECT * 
FROM transactions 
WHERE market_code='Mark001';

-- 4. Show distrinct product codes that were sold in chennai

SELECT DISTINCT product_code 
FROM transactions 
WHERE market_code='Mark001';

-- 5. Show transactions where currency is US dollars

SELECT * 
FROM transactions 
WHERE currency="USD";

-- 6. Show transactions in 2020 join by date table

SELECT transactions.*, date.* 
FROM transactions 
INNER JOIN date 
	ON transactions.order_date=date.date
WHERE date.year=2020;

-- 7. Show total revenue in year 2020,

SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
WHERE date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";
	
-- 8. Show total revenue in year 2020, January Month,

SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
WHERE date.year=2020 and and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

-- 9. Show total revenue in year 2020 in Chennai

SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date ON transactions.order_date=date.date 
WHERE date.year=2020 and transactions.market_code="Mark001";

-- 10. Show top five cusomers by revenue.

SELECT t.customer_code, SUM(sales_amount)
FROM transactions t 
JOIN customers c
ON t.customer_code = c.customer_code
GROUP BY customer_code
ORDER BY 2 DESC
LIMIt 5;

-- 11. Show top five products by revenue

SELECT t.product_code, SUM(sales_amount)
FROM transactions t 
JOIN products p 
ON t.product_code = p.product_code
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;






