-- Product category delivery times
SELECT
p.product_category_name,
AVG(
TIMESTAMP_DIFF(o.order_delivered_customer_date,
               o.order_purchase_timestamp,
               DAY)
) AS avg_delivery_days,
COUNT(*) AS total_orders
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY product_category_name
ORDER BY avg_delivery_days DESC
LIMIT 20;

-- Product category order volume
SELECT
p.product_category_name,
COUNT(*) AS total_orders
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY product_category_name
ORDER BY total_orders DESC
LIMIT 20;

-- Delivery time by customer state
SELECT
c.customer_state,
AVG(
TIMESTAMP_DIFF(o.order_delivered_customer_date,
               o.order_purchase_timestamp,
               DAY)
) AS avg_delivery_days,
COUNT(*) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY customer_state
ORDER BY avg_delivery_days DESC;

-- Delivery time vs review score
SELECT
r.review_score,
AVG(
TIMESTAMP_DIFF(o.order_delivered_customer_date,
               o.order_purchase_timestamp,
               DAY)
) AS avg_delivery_days,
COUNT(*) AS total_orders
FROM orders o
JOIN order_reviews r
ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY review_score
ORDER BY review_score;
