-- ==================================================
-- Question 9
-- Which customer income segment generates  the highest sales?
-- ==================================================

SELECT
    CASE
        WHEN c.AnnualIncome < 50000 THEN 'Low Income'
        WHEN c.AnnualIncome BETWEEN 50000 AND 90000 THEN 'Mid Income'
        ELSE 'High Income'
    END AS IncomeSegment,
    SUM(s.OrderQuantity)  AS TotalProductsSold,
    COUNT(s.IDCustomer)   AS TotalCustomers
FROM Analytics.Vw_Fact_Sales AS s
INNER JOIN Analytics.Vw_Dim_Customer AS c
    ON s.IDCustomer = c.IDCustomer
GROUP BY
    CASE
        WHEN c.AnnualIncome < 50000 THEN 'Low Income'
        WHEN c.AnnualIncome BETWEEN 50000 AND 90000 THEN 'Mid Income'
        ELSE 'High Income'
    END
ORDER BY
    TotalProductsSold DESC;

-- Insight:
-- Mid-income customers drive the highest sales (38.5k),
-- followed by high-income (30.7k) and low-income (17.3k).
-- The middle segment is the company's core audience.
