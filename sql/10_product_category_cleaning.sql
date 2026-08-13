SELECT p.product_id, p.product_category_name,
	COALESCE(pc.product_category_name_english, 'Other/Unmapped') AS clean_category
FROM products p
LEFT JOIN product_category_name_translations pc
	ON p.product_category_name = pc.product_category_name
