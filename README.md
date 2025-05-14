# Ilum Sales Data ETL Project

## Project Overview
This project demonstrates a simple ETL pipeline using SQL in Ilum to:
1. Clean raw sales data
2. Create business-ready aggregations
3. Validate data quality

## SQL Scripts
1. `01_clean_raw_data.sql` - Handles data cleaning and basic transformations
2. `02_create_aggregations.sql` - Generates business metrics
3. `03_data_validation.sql` - Runs data quality checks

## How to Run
1. Execute scripts in numerical order in Ilum's SQL workspace
2. Review validation results for data quality issues

## Assumptions
- Invalid dates are excluded rather than repaired
- Orders with missing IDs are removed entirely
- Negative quantities/prices are assumed to be errors and filtered out

## Sample Outputs
- `sales_clean`: Contains the cleaned transaction data
- `sales_by_country`: Revenue and order metrics by country
- `monthly_sales`: Trend analysis by month

## Future Improvements
- Add slowly changing dimensions (SCD) for customer tracking
- Implement incremental loading instead of full refreshes
- Add more robust error logging