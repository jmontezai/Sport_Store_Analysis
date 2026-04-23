-- ===============================================
-- Question 7
-- Which products generate the highest profit?
-- ===============================================

SELECT TOP 10
    p.ProductName,
    SUM(s.OrderQuantity) AS UnitsSold,
    SUM(s.OrderQuantity * p.ProductProfit) AS TotalProfit
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Product AS p
    ON s.IDProduct = p.IDProduct
GROUP BY
    p.ProductName
ORDER BY
    TotalProfit DESC;

-- Insight:
-- E-Bikes and high-end bikes dominate the top profit list,
-- with EcoRide E-Bike Purple leading at €52k. Despite lower
-- unit volumes, premium products drive the biggest margins,
-- showing where real profitability lies in the catalog.
