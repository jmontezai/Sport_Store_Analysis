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
-- E-Bikes and premium bikes generate the highest profit,
-- led by EcoRide E-Bike Purple at €52k, showing where
-- the biggest margins are.
