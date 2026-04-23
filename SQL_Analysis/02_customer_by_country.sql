-- ==================================================
-- Question 2
-- Which countries have the largest customer base?
-- ==================================================

SELECT
    l.Country,
    COUNT(DISTINCT s.IDCustomer) AS TotalCustomers
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Location AS l
    ON s.IDLocation = l.IDLocation
GROUP BY
    l.Country
ORDER BY
    TotalCustomers DESC;

-- Insight:
-- Germany, the UK and France hold the largest customer
-- base. Portugal has the smallest base, highlighting
-- untapped potential for expansion. 
