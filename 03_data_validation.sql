-- Data Quality Checks
WITH validation_checks AS (
    SELECT
        -- Check for duplicate orders
        (SELECT COUNT(*) FROM (
            SELECT order_id, COUNT(*) 
            FROM sales_clean 
            GROUP BY order_id 
            HAVING COUNT(*) > 1
        )) AS duplicate_orders,
        
        -- Check for negative sales (should be 0 after cleaning)
        (SELECT COUNT(*) FROM sales_clean WHERE total_sales < 0) AS negative_sales,
        
        -- Check for missing countries
        (SELECT COUNT(*) FROM sales_clean WHERE country IS NULL) AS null_countries
)

SELECT 
    CASE 
        WHEN duplicate_orders = 0 THEN 'PASSED' 
        ELSE CONCAT('FAILED: ', duplicate_orders, ' duplicates found') 
    END AS duplicate_check,
    
    CASE 
        WHEN negative_sales = 0 THEN 'PASSED' 
        ELSE CONCAT('FAILED: ', negative_sales, ' negative sales') 
    END AS negative_sales_check,
    
    CASE 
        WHEN null_countries = 0 THEN 'PASSED' 
        ELSE CONCAT('FAILED: ', null_countries, ' null countries') 
    END AS null_country_check
FROM validation_checks;