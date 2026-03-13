-- Orders per month
SELECT
DATE_TRUNC(order_purchase_timestamp, MONTH) AS month,
COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Average delivery time
SELECT
AVG(TIMESTAMP_DIFF(order_delivered_customer_date,
                   order_purchase_timestamp,
                   DAY)) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Order status distribution
SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
