-- ==================================================
-- Question 8
-- Which customers generate the highest number of orders?
-- ==================================================

SELECT TOP 10
    c.CustomerName,
    COUNT(*) AS TotalOrders
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Customer AS c
    ON s.IDCustomer = c.IDCustomer
GROUP BY
    c.CustomerName
ORDER BY
    TotalOrders DESC;

-- Insight:
-- Roy Johnston leads with 21 orders, followed by a cluster
-- of customers with 16–18 orders. The top buyers purchase
-- far more often than the average.
