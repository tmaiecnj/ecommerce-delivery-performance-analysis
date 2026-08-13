--Which customer states experience the slowest deliveries?

WITH extract_days AS(
	SELECT customer_state,
			(order_delivered_customer_date::date - order_purchase_timestamp::date) AS days
	FROM orders o
	INNER JOIN customers c
		ON o.customer_id = c.customer_id
	WHERE (order_delivered_customer_date::date - order_purchase_timestamp::date) IS NOT NULL
)

SELECT customer_state,
		AVG(days) AS avg_days
FROM extract_days
GROUP BY customer_state
ORDER BY avg_days DESC;