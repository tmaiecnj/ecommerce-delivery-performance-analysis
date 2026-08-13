--Are our highest-revenue categories also our highest-rated ones, or is there a mismatch?

WITH product_categories AS(
	SELECT COUNT(*) AS total_item_sold,
			COALESCE(pc.product_category_name_english, 'Other/Unmapped') AS category,
			SUM(oi.price) AS total_revenue
	FROM products p
	LEFT JOIN product_category_name_translations pc
		ON p.product_category_name = pc.product_category_name
	LEFT JOIN order_items oi
		ON p.product_id = oi.product_id
	GROUP BY category
),
	category_review AS(
		SELECT DISTINCT COALESCE(pc.product_category_name_english, 'Other/Unmapped') AS category,
				oi.order_id,
				orrev.review_score
		FROM order_items oi
		LEFT JOIN products p
			ON oi.product_id = p.product_id
		LEFT JOIN product_category_name_translations pc
			ON p.product_category_name = pc.product_category_name
		LEFT JOIN order_reviews orrev
			ON oi.order_id = orrev.order_id
)

SELECT prodcat.category,
		prodcat.total_revenue,
		AVG(catrev.review_score) AS avg_review_score
FROM product_categories prodcat
LEFT JOIN category_review catrev
	ON prodcat.category = catrev.category
GROUP BY prodcat.category, prodcat.total_revenue
ORDER BY prodcat.total_revenue DESC;