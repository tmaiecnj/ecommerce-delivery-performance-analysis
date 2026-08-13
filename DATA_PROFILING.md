# Data Preparation

The Olist dataset were loaded into PostgreSQL and checked for data quality issues before analysis.

## Row Count Verification

| table_name                         | row_count |
| ---------------------------------- | --------- |
| product_category_name_translations | 71        |
| sellers                            | 3095      |
| products                           | 32951     |
| order_payment                      | 103886    |
| customers                          | 99441     |
| orders                             | 99441     |
| order_reviews                      | 99224     |
| order_items                        | 112650    |
| geolocation                        | 1000163   |

## Data Quality Checks

| Issue                                       | Table(s)                                         | Action                                                                                                                                                                        |
| ------------------------------------------- | ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Delivery orders with missing delivery dates | `orders`                                         | Excluded affected records from delivery-time calculations                                                                                                                     |
| Duplicate/uniqueness check                  | `order_reviews`                                  | Enforced a composite `PRIMARY KEY` on review_id and `order_id`                                                                                                                |
| `customer_id` vs `customer_unique_id`       | `customers`                                      | No cleaning needed, both columns serve different purposes                                                                                                                     |
| 2016 - partial year                         | `orders`                                         | Keeping the 2016 data for analysis but excluded from year-over-growth calculations and avoided direct comparison with full years                                              |
| Check unmatched records                     | `order_items`, `products`, `sellers`             | There are zero rows reference a nonexistent product_id or seller_id                                                                                                           |
| Missing category data                       | `products`, `product_category_name_translations` | Include all 623 affected products under 'Other/Unmapped' category in the Dashboard rather than excluding them from category-based analysis                                    |
| Orders without any order_items rows         | `orders`, `order_items`                          | The revenue-based metric calculated from order_items will naturally reflect fewer orders that the full orders table count since orders with no items contributed zero revenue |
