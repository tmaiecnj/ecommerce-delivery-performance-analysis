--Do late deliveries actually correlate with lower review scores?

SELECT AVG(review_score),
		CASE WHEN order_delivered_customer_date IS NULL THEN 'Invalid'
				WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 'On time'
					ELSE 'Late'
		END AS delivery_data
FROM orders o
LEFT JOIN order_reviews orrev
	ON o.order_id = orrev.order_id
GROUP BY delivery_data