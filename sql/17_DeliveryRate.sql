--What percentage of orders are delivered on time vs. late?

WITH delivery_data AS (
	SELECT 
		CASE
			WHEN order_delivered_customer_date IS NULL THEN 'Invalid'
			WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 'On time'
				ELSE 'Late'
		END AS delivery,
		COUNT(*) AS total_delivery
	FROM orders
	GROUP BY delivery
)


SELECT delivery,
		total_delivery,
		(total_delivery*100.0)/SUM(total_delivery) OVER() AS delivery_rate
FROM delivery_data
ORDER BY delivery_rate DESC;