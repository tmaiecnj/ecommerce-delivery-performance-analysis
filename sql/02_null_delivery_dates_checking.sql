SELECT order_status, COUNT(*) AS total_orders,
SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS null_delivery_count
FROM orders
GROUP BY order_status;