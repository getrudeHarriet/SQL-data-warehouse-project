/*
=============================================================================
Quality Checks
============================================================================+
Script Purpose:
  This script perfoms various quality checks for data consistency, accuracy
  and standardization accross the silver schema.
  It includes  checks for:
	- Null or duplicate primary keys.
	- Unwanted spaces in string fields.
	- Data Standardization and consistency.
	- Invalid date ranges and orders.
	- Data consistency between related fields

Usage Notes:
Run this checks after data loading in Silver Layer.
Investigate and resolve any discrepencies found during the checks
=============================================================================
*/


-- CRM customer info
SELECT
*
FROM (
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM bronze.crm_cust_info
)t WHERE flag_last = 1 AND cst_id = 29466


-- Check for unwanted Spaces 
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname !=  TRIM(cst_firstname)



-- Check for unwanted Spaces 
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm !=  TRIM(prd_nm)

-- Data Standardization and Consistency
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT * FROM silver.crm_prd_info

-- Check for invalid dates
SELECT
*
FROM silver.crm_sales_info
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Sales Price Calculations
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_info
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

SELECT * FROM silver.crm_sales_info


-- Identify out of range dates
SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Gender Data Standardization and Consistency
SELECT DISTINCT 
gen
FROM silver.erp_cust_az12

SELECT * FROM silver.erp_cust_az12

-- Check for inconsistencies
SELECT
REPLACE(cid, '-', '') cid,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	 ELSE TRIM(cntry)
END AS cntry
FROM bronze.erp_loc_a101;

SELECT cst_key FROM silver.crm_cust_info;

-- Cntry Data Standardization and consistency
SELECT DISTINCT 
cntry AS old_cntry,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	 ELSE TRIM(cntry)
END AS cntry
FROM silver.erp_loc_a101
ORDER BY cntry

-- Clean the last table in the bronze layer
SELECT
id,
cat,
subcat,
maintenance
FROM silver.erp_px_cat_g1v2

-- Check for unwanted spaces
SELECT * FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)

-- Data Standardization and Consistency
SELECT DISTINCT
maintenance
FROM silver.erp_px_cat_g1v2

SELECT * FROM silver.erp_px_cat_g1v2

