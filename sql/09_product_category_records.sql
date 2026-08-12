-- Check if there is a categories with no translation match
--SELECT DISTINCT p.product_category_name
--FROM products p
--LEFT JOIN product_category_name_translations pc
--	ON p.product_category_name = pc.product_category_name
--WHERE pc.product_category_name IS NULL;

SELECT p.product_category_name, COUNT(*) AS affected_products
FROM products p
LEFT JOIN product_category_name_translations pc
	ON p.product_category_name = pc.product_category_name
WHERE pc.product_category_name IS NULL
GROUP BY p.product_category_name;