-- ==================================================
-- Question 10
-- Which customers generate the highest revenue and 
-- what is their average order value?
-- ==================================================

SELECT TOP 10
    s.IDCustomer,
    c.CustomerName,
    SUM(s.OrderQuantity * p.ProductPrice) AS TotalRevenue,
    COUNT(DISTINCT s.OrderNumber) AS TotalOrders,
    ROUND(SUM(s.OrderQuantity * p.ProductPrice)
        / COUNT(DISTINCT s.OrderNumber), 2) AS AvgRevenuePerOrder
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Product  AS p 
    ON s.IDProduct  = p.IDProduct
INNER JOIN Analytics.Vw_Dim_Customer AS c 
    ON c.IDCustomer = s.IDCustomer
GROUP BY
    s.IDCustomer,
    c.CustomerName
ORDER BY
    TotalRevenue DESC;

-- Insight:
-- Easton Watkins leads with €10.5k in revenue across 5 orders,
-- while Ryker Jensen shows the highest average order value
-- (€4.8k) with just 2 purchases. Top customers mix frequent
-- buyers and big spenders.
