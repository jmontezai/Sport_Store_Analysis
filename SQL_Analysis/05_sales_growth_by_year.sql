-- ==========================================
-- Question 5
-- What is the sales growth by year?
-- ==========================================

SELECT
    Sales_Year AS Year,
    SUM(OrderQuantity) AS TotalProductsSold,
    CAST((SUM(OrderQuantity) - LAG(SUM(OrderQuantity)) OVER (ORDER BY Sales_Year)) * 100.0 
    / LAG(SUM(OrderQuantity)) OVER (ORDER BY Sales_Year) AS DECIMAL(5,2)) AS GrowthPercent
FROM Analytics.Vw_Fact_Sales
GROUP BY
    Sales_Year
ORDER BY
    Year;

-- Insight:
-- Sales grew consistently from 20.6k units in 2022
-- to 35.7k in 2024. The biggest jump was in 2023
-- (+47%), followed by a smaller rise in 2024 (+18%),
-- showing solid growth at a stabilizing pace.
