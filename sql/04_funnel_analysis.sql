-- Order lifecycle funnel with counts
SELECT
COUNT(*) AS total_orders,
COUNT(order_approved_at) AS approved_orders,
COUNT(order_delivered_carrier_date) AS shipped_orders,
COUNT(order_delivered_customer_date) AS delivered_orders
FROM orders;

-- Funnel with percentages
SELECT
COUNT(*) AS total_orders,

COUNT(order_approved_at) AS approved_orders,
ROUND(COUNT(order_approved_at) / COUNT(*) * 100, 2) AS approval_rate_pct,

COUNT(order_delivered_carrier_date) AS shipped_orders,
ROUND(COUNT(order_delivered_carrier_date) / COUNT(order_approved_at) * 100, 2) AS shipping_rate_pct,

COUNT(order_delivered_customer_date) AS delivered_orders,
ROUND(COUNT(order_delivered_customer_date) / COUNT(order_delivered_carrier_date) * 100, 2) AS delivery_rate_pct

FROM orders;

-- Funnel structure for visualization
SELECT 'Placed' AS stage, COUNT(*) AS orders
FROM orders

UNION ALL

SELECT 'Approved', COUNT(order_approved_at)
FROM orders

UNION ALL

SELECT 'Shipped', COUNT(order_delivered_carrier_date)
FROM orders

UNION ALL

SELECT 'Delivered', COUNT(order_delivered_customer_date)
FROM orders;
