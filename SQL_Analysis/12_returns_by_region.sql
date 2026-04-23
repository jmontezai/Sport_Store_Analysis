-- ==================================================
-- Question 12
-- Which regions have the highest number of product returns?
-- ==================================================

SELECT
    l.Region,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Analytics.Vw_Fact_Returns AS r
INNER JOIN Analytics.Vw_Dim_Location AS l
    ON r.IDLocation = l.IDLocation
GROUP BY
    l.Region
ORDER BY
    TotalReturns DESC;

-- Insight:
-- Berlin, London and Paris lead in product returns,
-- matching the regions with the highest sales volume.
-- Lisboa has the lowest returns, consistent with its
-- smaller market presence.
