-- SQL Data Cleaning Script for Campus Tree Inventory
-- This script assumes the raw data is loaded into a table named 'raw_tree_data'

-- 1. Create Cleaned Table
CREATE TABLE cleaned_tree_data AS
SELECT 
    UPPER(TRIM(BLOCK)) AS BLOCK,
    UPPER(TRIM("TREES NAME")) AS TREE_NAME,
    COALESCE(UPPER(TRIM("SCIENTIFIC NAME")), 'UNKNOWN') AS SCIENTIFIC_NAME,
    CAST(COALESCE("COUNT", 0) AS INTEGER) AS TREE_COUNT
FROM raw_tree_data;

-- 2. Remove Duplicates
DELETE FROM cleaned_tree_data 
WHERE rowid NOT IN (
    SELECT MIN(rowid) 
    FROM cleaned_tree_data 
    GROUP BY BLOCK, TREE_NAME, SCIENTIFIC_NAME, TREE_COUNT
);

-- 3. Feature Engineering: Tree Category
-- Adding a category column
ALTER TABLE cleaned_tree_data ADD COLUMN CATEGORY TEXT;

UPDATE cleaned_tree_data
SET CATEGORY = CASE 
    WHEN TREE_NAME LIKE '%MANGO%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%COCONUT%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%PAPAYA%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%BANANA%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%NEEM%' THEN 'Medicinal'
    WHEN TREE_NAME LIKE '%ALMOND%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%FIG%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%TAMARIND%' THEN 'Fruit'
    WHEN TREE_NAME LIKE '%GOLDEN BAMBOO%' THEN 'Ornamental'
    WHEN TREE_NAME LIKE '%ACACIA%' THEN 'Shade'
    WHEN TREE_NAME LIKE '%HAINANIA%' THEN 'Shade'
    WHEN TREE_NAME LIKE '%MONKEY POD%' THEN 'Shade'
    WHEN TREE_NAME LIKE '%INDIAN BEECH%' THEN 'Shade'
    WHEN TREE_NAME LIKE '%PALM%' THEN 'Ornamental'
    WHEN TREE_NAME LIKE '%ASIAN BULLET WOOD%' THEN 'Shade'
    ELSE 'Other'
END;

-- 4. Data Validation: Remove negative counts
DELETE FROM cleaned_tree_data WHERE TREE_COUNT < 0;
