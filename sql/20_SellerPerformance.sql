--Which sellers are driving the most business for Olist?

SELECT seller_id,
		SUM(price) AS total_revenue,
		COUNT(DISTINCT order_id) as total_orders
FROM order_items
GROUP BY seller_id
HAVING SUM(price) >= 100000
ORDER BY total_revenue DESC
LIMIT 10;
