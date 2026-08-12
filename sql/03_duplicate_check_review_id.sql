SELECT review_id, COUNT(*) AS duplicate_review_id
FROM order_reviews
GROUP BY review_id
HAVING COUNT(*) > 1