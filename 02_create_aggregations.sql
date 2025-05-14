-- Step 2: Create aggregated business metrics
CREATE OR REPLACE TABLE sales_by_country AS
SELECT 
    country,
    SUM(total_sales) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_count,
    COUNT(DISTINCT customer_id) AS customer_count,
    SUM(total_sales) / COUNT(DISTINCT order_id) AS avg_order_value
FROM sales_clean
GROUP BY country
ORDER BY total_revenue DESC;

-- Bonus: Monthly sales trend
CREATE OR REPLACE TABLE monthly_sales AS
SELECT 
    DATE_TRUNC('MONTH', order_date) AS month,
    SUM(total_sales) AS monthly_revenue
FROM sales_clean
GROUP BY 1
ORDER BY 1;