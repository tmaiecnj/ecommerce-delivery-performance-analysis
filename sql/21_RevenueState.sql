--Which states generate the most revenue for Olist?

SELECT c.customer_state,
		SUM(price) AS total_revenue,
		COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;
