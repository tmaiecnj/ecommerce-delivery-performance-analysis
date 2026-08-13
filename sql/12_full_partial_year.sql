SELECT
	CASE
		WHEN EXTRACT(YEAR FROM order_purchase_timestamp)=2017 THEN 'Full Year' ELSE 'Partial Year' 
	END AS full_partial,
	COUNT(*) AS total_year
FROM orders
GROUP BY
	CASE
		WHEN EXTRACT(YEAR FROM order_purchase_timestamp)=2017 THEN 'Full Year' ELSE 'Partial Year' 
	END;