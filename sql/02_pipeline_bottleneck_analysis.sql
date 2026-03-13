-- Average duration of each stage in the order pipeline
SELECT
AVG(TIMESTAMP_DIFF(order_approved_at,
                   order_purchase_timestamp,
                   HOUR)) AS avg_approval_hours,

AVG(TIMESTAMP_DIFF(order_delivered_carrier_date,
                   order_approved_at,
                   HOUR)) AS avg_shipping_hours,

AVG(TIMESTAMP_DIFF(order_delivered_customer_date,
                   order_delivered_carrier_date,
                   HOUR)) AS avg_delivery_hours

FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Delivery time distribution
SELECT
APPROX_QUANTILES(
TIMESTAMP_DIFF(order_delivered_customer_date,
               order_purchase_timestamp,
               DAY),
5) AS delivery_time_distribution
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Most delayed orders
SELECT
order_id,
TIMESTAMP_DIFF(order_delivered_customer_date,
               order_purchase_timestamp,
               DAY) AS delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
ORDER BY delivery_days DESC
LIMIT 20;

-- Seller shipping delays
SELECT
oi.seller_id,
AVG(TIMESTAMP_DIFF(o.order_delivered_carrier_date,
                   o.order_approved_at,
                   DAY)) AS avg_shipping_days,
COUNT(*) AS total_orders
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
WHERE o.order_delivered_carrier_date IS NOT NULL
GROUP BY seller_id
ORDER BY avg_shipping_days DESC
LIMIT 20;

-- Top sellers by order volume
SELECT
seller_id,
COUNT(*) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 20;
