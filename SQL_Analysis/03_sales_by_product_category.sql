-- ==================================================
-- Question 3
-- Which product categories generate the highest
-- number of units sold?
-- ==================================================

SELECT
    pc.CategoryName,
    SUM(s.OrderQuantity) AS TotalUnitsSold
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Product AS p
    ON s.IDProduct = p.IDProduct
INNER JOIN Analytics.Vw_Dim_Product_Subcategory AS ps
    ON p.IDProductSubcategory = ps.IDProductSubcategory
INNER JOIN Analytics.Vw_Dim_Product_Category AS pc
    ON ps.IDProductCategory = pc.IDProductCategory
GROUP BY
    pc.CategoryName
ORDER BY
    TotalUnitsSold DESC;

-- Insight:
-- Clothing and Accessories lead in units sold, showing
-- strong demand for everyday and complementary items.
-- Equipment holds a solid mid-tier position, while
-- Footwear lags behind, suggesting weaker traction.
