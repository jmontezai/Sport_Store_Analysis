-- ==================================================
-- Question 6
-- Which products generate the highest number of units sold?
-- ==================================================

SELECT TOP 10
    p.ProductName,
    SUM(s.OrderQuantity) AS TotalUnitsSold
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Product AS p
    ON s.IDProduct = p.IDProduct
GROUP BY
    p.ProductName
ORDER BY
    TotalUnitsSold DESC;

-- Insight:
-- CompressionSock leads with 926 units, followed by
-- ReflectRun Vest and CoolMesh Top. Small accessories
-- dominate the top sellers.
