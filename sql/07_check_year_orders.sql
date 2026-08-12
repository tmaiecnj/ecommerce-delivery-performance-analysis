-- SELECT MIN(order_purchase_timestamp), MAX(order_purchase_timestamp)
-- FROM orders;

SELECT EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,
	COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(YEAR FROM order_purchase_timestamp)
ORDER BY order_year;