SELECT
	CASE
		WHEN order_status='delivered' AND order_delivered_customer_date IS NOT NULL THEN 'Valid'
		WHEN order_status='delivered' AND order_delivered_customer_date IS NULL THEN 'Invalid'
		WHEN order_status<>'delivered' THEN 'Not Applicable'
	END AS is_delivery_data_valid,
	COUNT(*) AS total_orders
FROM orders
GROUP BY
	CASE
		WHEN order_status='delivered' AND order_delivered_customer_date IS NOT NULL THEN 'Valid'
		WHEN order_status='delivered' AND order_delivered_customer_date IS NULL THEN 'Invalid'
		WHEN order_status<>'delivered' THEN 'Not Applicable'
	END;