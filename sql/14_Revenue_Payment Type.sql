--Which product categories generate the most revenue?

WITH product_categories AS(
	SELECT COUNT(*) AS total_item_sold,
		COALESCE(pc.product_category_name_english, 'Other/Unmapped') AS clean_category,
		SUM(oi.price) AS total_revenue
	FROM products p
	LEFT JOIN product_category_name_translations pc
		ON p.product_category_name = pc.product_category_name
	LEFT JOIN order_items oi
		ON p.product_id = oi.product_id
	GROUP BY clean_category
	ORDER BY total_revenue DESC
	LIMIT 10
)

SELECT clean_category, total_item_sold, total_revenue FROM product_categories;