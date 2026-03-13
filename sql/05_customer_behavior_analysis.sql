-- Total customers
SELECT
COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

-- Orders per customer
SELECT
customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 20;

-- Average orders per customer
SELECT
COUNT(order_id) / COUNT(DISTINCT customer_id) AS avg_orders_per_customer
FROM orders;

-- Repeat customers
SELECT
COUNT(*) AS repeat_customers
FROM (
SELECT
customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
);

-- Repeat customer rate
SELECT
ROUND(
COUNTIF(order_count > 1) / COUNT(*) * 100,
2
) AS repeat_customer_rate_pct
FROM (
SELECT
customer_id,
COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
);
