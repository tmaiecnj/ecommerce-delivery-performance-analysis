--SELECT order_items.*
--FROM order_items
--LEFT JOIN products ON order_items.product_id = products.product_id
--WHERE products.product_id IS NULL;

SELECT oi.*
FROM order_items oi
LEFT JOIN sellers s
	ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;