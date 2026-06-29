-- Campus Greenery Management: Business Queries
-- Each query contains: Question, SQL, Insight, and Recommendation

-- 1. Question: Which block has the highest total number of trees?
-- Query: SELECT BLOCK, SUM(COUNT) FROM cleaned_tree_data GROUP BY BLOCK ORDER BY SUM(COUNT) DESC LIMIT 1;
-- Insight: Identifies the greenest area of the campus.
-- Recommendation: Use this area as a model for other blocks to increase greenery.

-- 2. Question: Which species is the most common overall?
-- Query: SELECT TREE_NAME, SUM(COUNT) FROM cleaned_tree_data GROUP BY TREE_NAME ORDER BY SUM(COUNT) DESC LIMIT 1;
-- Insight: Shows the dominant species.
-- Recommendation: Ensure the campus doesn't become a monoculture by planting other species.

-- 3. Question: Which block has the highest species diversity?
-- Query: SELECT BLOCK, COUNT(DISTINCT TREE_NAME) FROM cleaned_tree_data GROUP BY BLOCK ORDER BY COUNT(DISTINCT TREE_NAME) DESC LIMIT 1;
-- Insight: Identifies the most biologically diverse zone.
-- Recommendation: Protect this area as a biodiversity hotspot.

-- 4. Question: What is the total number of fruit trees on campus?
-- Query: SELECT SUM(COUNT) FROM cleaned_tree_data WHERE CATEGORY = 'Fruit';
-- Insight: Measures the availability of food-producing plants.
-- Recommendation: Consider organizing a harvest festival or fruit distribution.

-- 5. Question: Which block has the fewest trees?
-- Query: SELECT BLOCK, SUM(COUNT) FROM cleaned_tree_data GROUP BY BLOCK ORDER BY SUM(COUNT) ASC LIMIT 1;
-- Insight: Identifies the area most in need of reforestation.
-- Recommendation: Prioritize new planting projects in this block.

-- 6. Question: What is the ratio of Shade trees to the total tree population?
-- Query: SELECT (SUM(CASE WHEN CATEGORY = 'Shade' THEN COUNT ELSE 0 END) * 100.0 / SUM(COUNT)) as Shade_Percentage FROM cleaned_tree_data;
-- Insight: Evaluates the campus's ability to provide shade.
-- Recommendation: Increase shade trees in parking and walking areas.

-- 7. Question: Are there any blocks with only one species of tree?
-- Query: SELECT BLOCK FROM cleaned_tree_data GROUP BY BLOCK HAVING COUNT(DISTINCT TREE_NAME) = 1;
-- Insight: Highlights areas with very low biodiversity.
-- Recommendation: Introduce a variety of species to improve ecological health.

-- 8. Question: Which top 3 categories contribute the most to the total count?
-- Query: SELECT CATEGORY, SUM(COUNT) FROM cleaned_tree_data GROUP BY CATEGORY ORDER BY SUM(COUNT) DESC LIMIT 3;
-- Insight: Shows the primary types of greenery.
-- Recommendation: Balance the categories to ensure a diverse ecosystem.

-- 9. Question: What is the average number of trees per species in 'OUR CAMPUS'?
-- Query: SELECT AVG(COUNT) FROM cleaned_tree_data WHERE BLOCK = 'OUR CAMPUS';
-- Insight: Shows the average density of species in the main area.
-- Recommendation: Use this as a benchmark for other blocks.

-- 10. Question: Which species appear in every single block?
-- Query: SELECT TREE_NAME FROM cleaned_tree_data GROUP BY TREE_NAME HAVING COUNT(DISTINCT BLOCK) = (SELECT COUNT(DISTINCT BLOCK) FROM cleaned_tree_data);
-- Insight: Identifies ubiquitous species.
-- Recommendation: These are likely hardy species; consider them for difficult terrains.

-- [Continuing for 30 queries...]
-- (I will provide the full list in the final output, but for the file I'll include a representative sample of the logic for all 30)

-- 11. Question: Which species are categorized as 'Medicinal' and where are they most common?
-- Query: SELECT TREE_NAME, BLOCK, SUM(COUNT) FROM cleaned_tree_data WHERE CATEGORY = 'Medicinal' GROUP BY TREE_NAME, BLOCK ORDER BY SUM(COUNT) DESC;
-- Insight: Identifies sources of medicinal plants.
-- Recommendation: Create an educational trail for medicinal plants.

-- 12. Question: What is the total count of trees in 'ST PATRICK'S' and 'ST MICHAELS' combined?
-- Query: SELECT SUM(COUNT) FROM cleaned_tree_data WHERE BLOCK IN ('ST PATRICK''S', 'ST MICHAELS');
-- Insight: Combined greenery of the two main areas.
-- Recommendation: Coordinate maintenance between these two sectors.

-- 13. Question: Which species has the highest variation in count across different blocks?
-- Query: SELECT TREE_NAME, MAX(COUNT) - MIN(COUNT) as Diff FROM cleaned_tree_data GROUP BY TREE_NAME ORDER BY Diff DESC LIMIT 1;
-- Insight: Shows species that thrive in some areas but not others.
-- Recommendation: Study the soil/environment of the high-count block.

-- 14. Question: How many unique species are there on the entire campus?
-- Query: SELECT COUNT(DISTINCT TREE_NAME) FROM cleaned_tree_data;
-- Insight: Overall biodiversity metric.
-- Recommendation: Set a goal to increase this number by 10% annually.

-- 15. Question: Which block has the most 'Ornamental' trees?
-- Query: SELECT BLOCK, SUM(COUNT) FROM cleaned_tree_data WHERE CATEGORY = 'Ornamental' GROUP BY BLOCK ORDER BY SUM(COUNT) DESC LIMIT 1;
-- Insight: Identifies the most aesthetic area.
-- Recommendation: Use this area for campus tours and photography.

-- 16. Question: What is the most common species in the 'PARKING' block?
-- Query: SELECT TREE_NAME, SUM(COUNT) FROM cleaned_tree_data WHERE BLOCK = 'PARKING' GROUP BY TREE_NAME ORDER BY SUM(COUNT) DESC LIMIT 1;
-- Insight: Shows what trees are used for parking shade.
-- Recommendation: Ensure these trees are not blocking signage.

-- 17. Question: Are there any trees with only 1 individual on the whole campus?
-- Query: SELECT TREE_NAME FROM cleaned_tree_data GROUP BY TREE_NAME HAVING SUM(COUNT) = 1;
-- Insight: Identifies rare or endangered species on campus.
-- Recommendation: Give these trees special care and markers.

-- 18. Question: Which block has the lowest average tree count per species?
-- Query: SELECT BLOCK, AVG(COUNT) FROM cleaned_tree_data GROUP BY BLOCK ORDER BY AVG(COUNT) ASC LIMIT 1;
-- Insight: Area with many species but few individuals of each.
-- Recommendation: Consider planting more of the existing species to strengthen the population.

-- 19. Question: What percentage of trees in 'A BLOCK' are 'Fruit' trees?
-- Query: SELECT (SUM(CASE WHEN CATEGORY = 'Fruit' THEN COUNT ELSE 0 END) * 100.0 / SUM(COUNT)) FROM cleaned_tree_data WHERE BLOCK = 'A BLOCK';
-- Insight: Localized category density.
-- Recommendation: Balance the variety of trees in A Block.

-- 20. Question: Which species is the most common in 'GROUND' block?
-- Query: SELECT TREE_NAME, SUM(COUNT) FROM cleaned_tree_data WHERE BLOCK = 'GROUND' GROUP BY TREE_NAME ORDER BY SUM(COUNT) DESC LIMIT 1;
-- Insight: Primary greenery for the ground area.
-- Recommendation: Ensure these trees are resilient to foot traffic.

-- 21. Question: Total trees in blocks starting with 'B' or 'C'?
-- Query: SELECT SUM(COUNT) FROM cleaned_tree_data WHERE BLOCK LIKE 'B%' OR BLOCK LIKE 'C%';
-- Insight: Regional greenery summary.
-- Recommendation: Group these blocks for shared landscaping resources.

-- 22. Question: Which species is found in the 'ICSE' block but not in 'OUR CAMPUS'?
-- Query: SELECT TREE_NAME FROM cleaned_tree_data WHERE BLOCK = 'ICSE' EXCEPT SELECT TREE_NAME FROM cleaned_tree_data WHERE BLOCK = 'OUR CAMPUS';
-- Insight: Unique species in the ICSE area.
-- Recommendation: Consider transplanting these species to other areas.

-- 23. Question: What is the total count of 'Other' category trees?
-- Query: SELECT SUM(COUNT) FROM cleaned_tree_data WHERE CATEGORY = 'Other';
-- Insight: Amount of trees not fitting into primary categories.
-- Recommendation: Review the 'Other' category and refine the classification.

-- 24. Question: Which block has the best balance between Shade and Fruit trees?
-- Query: SELECT BLOCK, ABS(SUM(CASE WHEN CATEGORY = 'Shade' THEN COUNT ELSE 0 END) - SUM(CASE WHEN CATEGORY = 'Fruit' THEN COUNT ELSE 0 END)) as Diff FROM cleaned_tree_data GROUP BY BLOCK ORDER BY Diff ASC LIMIT 1;
-- Insight: Area with balanced ecological function.
-- Recommendation: Use this as a template for urban planning.

-- 25. Question: Which species has the lowest total count across the campus?
-- Query: SELECT TREE_NAME, SUM(COUNT) FROM cleaned_tree_data GROUP BY TREE_NAME ORDER BY SUM(COUNT) ASC LIMIT 1;
-- Insight: Least common species.
-- Recommendation: Research why this species is rare and if it can be expanded.

-- 26. Question: How many blocks contain 'NEEM' trees?
-- Query: SELECT COUNT(DISTINCT BLOCK) FROM cleaned_tree_data WHERE TREE_NAME LIKE '%NEEM%';
-- Insight: Distribution of a highly valued medicinal tree.
-- Recommendation: Plant Neem in blocks where it's currently absent.

-- 27. Question: Which block has more trees than the average tree count across all blocks?
-- Query: SELECT BLOCK, SUM(COUNT) FROM cleaned_tree_data GROUP BY BLOCK HAVING SUM(COUNT) > (SELECT SUM(COUNT)/COUNT(DISTINCT BLOCK) FROM cleaned_tree_data);
-- Insight: Above-average greenery blocks.
-- Recommendation: Maintain these high-performing zones.

-- 28. Question: What is the total number of trees in the 'E BLOCK'?
-- Query: SELECT SUM(COUNT) FROM cleaned_tree_data WHERE BLOCK = 'E BLOCK';
-- Insight: Specific block capacity.
-- Recommendation: Evaluate if E Block needs more trees for temperature control.

-- 29. Question: Which species are most common in 'ST MICHAELS' but rare overall?
-- Query: SELECT TREE_NAME FROM cleaned_tree_data WHERE BLOCK = 'ST MICHAELS' GROUP BY TREE_NAME HAVING SUM(COUNT) > 10 AND TREE_NAME NOT IN (SELECT TREE_NAME FROM cleaned_tree_data GROUP BY TREE_NAME ORDER BY SUM(COUNT) DESC LIMIT 10);
-- Insight: Local specialties.
-- Recommendation: Promote these species as "signature trees" of St Michaels.

-- 30. Question: What is the total number of trees with a scientific name provided?
-- Query: SELECT SUM(COUNT) FROM cleaned_tree_data WHERE SCIENTIFIC_NAME != 'UNKNOWN';
-- Insight: Level of botanical documentation.
-- Recommendation: Launch a project to identify the remaining 'UNKNOWN' species.
