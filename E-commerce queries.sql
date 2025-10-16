create database ecommerce;
use ecommerce;
select * from table_sales;
SELECT COUNT(*) AS Total_Records
FROM table_sales;

-- Find total sales revenue
SELECT SUM(price) AS total_sales_revenue FROM table_sales;

-- Find top 5 best-selling product categories
SELECT product_category_name, COUNT(order_id) AS total_orders
FROM table_sales
GROUP BY product_category_name
ORDER BY total_orders DESC
LIMIT 5;

-- Average review score by category
SELECT product_category_name, ROUND(AVG(review_score), 2) AS avg_review_score
FROM table_sales
GROUP BY product_category_name
ORDER BY avg_review_score DESC;

-- Delivery performance (actual vs. estimated)
SELECT 
    AVG(DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date)) AS avg_days_diff
FROM table_sales;

-- payment insights – most used payment type
SELECT payment_type, COUNT(*) AS usage_count
FROM table_sales
GROUP BY payment_type
ORDER BY usage_count DESC;

-- Sales by state
SELECT customer_state, SUM(price) AS total_sales
FROM table_sales
GROUP BY customer_state
ORDER BY total_sales DESC;

-- Find the top 5 product categories with the highest number of orders
SELECT product_category_name, COUNT(order_id) AS total_orders
FROM table_sales
GROUP BY product_category_name
ORDER BY total_orders DESC
LIMIT 5;

-- Calculate the average review score for each product category
SELECT product_category_name, ROUND(AVG(review_score), 2) AS average_review_score
FROM table_sales
GROUP BY product_category_name
ORDER BY average_review_score DESC;

-- Find the most commonly used payment method
SELECT payment_type, COUNT(*) AS total_payments
FROM table_sales
GROUP BY payment_type
ORDER BY total_payments DESC
LIMIT 1;

-- Calculate average delivery delay (how many days earlier or later orders were delivered)
SELECT 
    ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)), 2) 
    AS average_delivery_delay
FROM table_sales;

-- Find total revenue by customer state
SELECT customer_state, ROUND(SUM(price), 2) AS total_revenue
FROM table_sales
GROUP BY customer_state
ORDER BY total_revenue DESC;

-- Find the top 5 cities with the highest number of customers
SELECT customer_city, COUNT(DISTINCT customer_id) AS total_customers
FROM table_sales
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 5;

-- Find the percentage of delayed orders (delivered after estimated date)
SELECT 
    ROUND(
        (SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(*)) * 100, 2
    ) AS delayed_order_percentage
FROM table_sales;

-- Find the month-wise sales revenue trend
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    ROUND(SUM(price), 2) AS total_sales
FROM table_sales
GROUP BY order_month
ORDER BY order_month;

-- Identify the top 5 sellers with the highest total sales
SELECT 
    seller_id,
    ROUND(SUM(price), 2) AS total_sales_amount,
    COUNT(order_id) AS total_orders
FROM table_sales
GROUP BY seller_id
ORDER BY total_sales_amount DESC
LIMIT 5;

-- Find the total number of orders, average payment value, and total revenue per payment type
SELECT 
    payment_type,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(payment_value), 2) AS avg_payment_value,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM table_sales
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- Find the customer who placed the highest total purchase amount
SELECT 
    customer_id,
    ROUND(SUM(price), 2) AS total_purchase_value,
    COUNT(order_id) AS total_orders
FROM table_sales
GROUP BY customer_id
ORDER BY total_purchase_value DESC
LIMIT 1;