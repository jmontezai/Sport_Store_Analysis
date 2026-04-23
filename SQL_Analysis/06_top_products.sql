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
-- The top seller is the CompressionSock (926 units),
-- followed by the ReflectRun Vest and CoolMesh Top.
-- Small accessories and apparel dominate the top 10,
-- reflecting strong demand for everyday sport essentials.
