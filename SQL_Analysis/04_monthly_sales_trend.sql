-- ==================================================
-- Question 4
-- How do sales vary across different months?
-- ==================================================

SELECT
    YEAR(ID_OrderDate) AS Year,
    MONTH(ID_OrderDate) AS Month,
    DATENAME(MONTH, ID_OrderDate) AS MonthName,
    SUM(OrderQuantity) AS TotalUnitsSold
FROM Analytics.Vw_Fact_Sales
GROUP BY
    YEAR(ID_OrderDate),
    MONTH(ID_OrderDate),
    DATENAME(MONTH, ID_OrderDate)
ORDER BY
    Year,
    Month;

-- Insight:
-- Sales show steady growth year over year, with volumes
-- rising from 2022 to 2024. Monthly demand stays fairly
-- stable, with small peaks in late year (Oct–Nov) and a
-- slight dip in December, suggesting consistent demand
-- with mild seasonal variation.
