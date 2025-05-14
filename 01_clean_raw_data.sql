-- Step 1: Clean raw sales data and calculate total_sales
CREATE OR REPLACE TABLE sales_clean AS
SELECT 
    order_id,
    TRY_CAST(order_date AS DATE) AS order_date,  -- Handle invalid dates
    customer_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_sales,
    country
FROM sales_raw
WHERE 
    TRY_CAST(order_date AS DATE) IS NOT NULL  -- Remove invalid dates
    AND order_id IS NOT NULL  -- Remove records with missing IDs
    AND quantity > 0  -- Prevent negative quantities
    AND unit_price > 0;  -- Prevent negative prices

-- Add index for better query performance (if supported in Ilum)
CREATE INDEX idx_sales_clean_order_date ON sales_clean(order_date);