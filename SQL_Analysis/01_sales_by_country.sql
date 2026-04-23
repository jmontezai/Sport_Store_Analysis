-- ==================================================
-- Question 1
-- Which countries generate the highest number of orders?
-- ==================================================

SELECT
    l.Country,
    COUNT(*) AS TotalOrders
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Location AS l
    ON s.IDLocation = l.IDLocation
GROUP BY
    l.Country
ORDER BY
    TotalOrders DESC;

-- Insight:
-- Germany, the United Kingdom and France lead in orders
-- and concentrate most of the sales activity, while 
-- Portugal shows the lowest volume, signaling a market with 
-- weak presence.
