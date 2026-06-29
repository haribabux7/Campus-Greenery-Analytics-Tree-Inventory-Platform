-- EDA SQL Analysis
-- Dataset Summary
SELECT COUNT(*) as Total_Records, SUM(COUNT) as Total_Trees FROM cleaned_tree_data;

-- Category Analysis
SELECT CATEGORY, SUM(COUNT) as Total_Trees, COUNT(DISTINCT TREE_NAME) as Unique_Species
FROM cleaned_tree_data
GROUP BY CATEGORY
ORDER BY Total_Trees DESC;

-- Block Analysis
SELECT BLOCK, SUM(COUNT) as Total_Trees, COUNT(DISTINCT TREE_NAME) as Unique_Species
FROM cleaned_tree_data
GROUP BY BLOCK
ORDER BY Total_Trees DESC;

-- Top 5 Species on Campus
SELECT TREE_NAME, SUM(COUNT) as Total_Count
FROM cleaned_tree_data
GROUP BY TREE_NAME
ORDER BY Total_Count DESC
LIMIT 5;
