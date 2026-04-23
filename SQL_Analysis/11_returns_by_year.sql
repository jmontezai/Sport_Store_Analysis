-- ==================================================
-- Question 11
-- Are product returns increasing or decreasing over time?
-- ==================================================

SELECT
    Return_Year AS Year,
    SUM(ReturnQuantity) AS TotalReturns
FROM Analytics.Vw_Fact_Returns
GROUP BY
    Return_Year
ORDER BY
    Year;

-- Insight:
-- Returns are clearly increasing, rising from 348
-- in 2022 to 1,062 in 2024. The upward trend signals
-- a need to review product quality or return policies.
