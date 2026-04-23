-- =============================================================
-- Create schema to store analytical views
-- Separates raw data (DwStore) from transformed data (Analytics)
-- =============================================================
USE Dw_SportStore;
GO

CREATE SCHEMA Analytics;
GO

-- =============================================================
-- Analytics.Vw_Dim_Calendar
-- Calendar with useful date fields (year, quarter, month, etc.)
-- Used for time-based analysis
-- =============================================================
CREATE VIEW Analytics.Vw_Dim_Calendar AS
    SELECT
        Date,
        YEAR(Date)              AS Year,
        DATEPART(QUARTER, Date) AS Quarter,
        MONTH(Date)             AS Month,
        DATENAME(MONTH, Date)   AS MonthName,
        DATEPART(DAY, Date)     AS DayNumber
    FROM Store.Dim_Calendar;
GO

-- =============================================================
-- Analytics.Vw_Dim_Customer
-- Clean customer data and standardize values:
--   - Trim extra spaces
--   - Proper-case first/last names
--   - Expand codes (M/S -> Married/Single, Y/N -> Yes/No), etc
-- Used for customer analysis and segmentation
-- =============================================================
CREATE VIEW Analytics.Vw_Dim_Customer AS
    SELECT
        IDCustomer,

        -- Full name
		UPPER(LEFT(LTRIM(RTRIM(FirstName)), 1)) +
        LOWER(SUBSTRING(LTRIM(RTRIM(FirstName)), 2, LEN(LTRIM(RTRIM(FirstName))))) + ' ' +
        UPPER(LEFT(LTRIM(RTRIM(LastName)), 1)) +
        LOWER(SUBSTRING(LTRIM(RTRIM(LastName)), 2, LEN(LTRIM(RTRIM(LastName))))) AS CustomerName,
        BirthDate,

        -- Marital status
        CASE
   			WHEN MaritalStatus IN ('M', 'Married', 'Maried', 'Marryed') THEN 'Married'
    		WHEN MaritalStatus IN ('S', 'Single', 'Singel', 'Sngle')    THEN 'Single'
    		ELSE 'Unknown'
		END AS MaritalStatus,

        -- Gender
        CASE
    		WHEN LTRIM(RTRIM(Gender)) IN ('M', 'Male')   THEN 'Male'
    		WHEN LTRIM(RTRIM(Gender)) IN ('F', 'Female') THEN 'Female'
    		ELSE 'Unknown'
		END AS Gender,
        EmailAddress,
        CAST(AnnualIncome AS DECIMAL(10, 2)) AS AnnualIncome,
        CAST(TotalChildren AS INT) AS TotalChildren,
        EducationLevel,
        
        -- Occupation
        CASE
            WHEN Occupation = 'N/A' THEN 'Unknown'
            WHEN Occupation = 'Professional' THEN 'Professional'
            WHEN Occupation = 'Clerical' THEN 'Clerical'
            WHEN Occupation = 'Manual' THEN 'Manual'
            WHEN Occupation = 'Management' THEN 'Management'
            WHEN Occupation = 'Skilled Manual' THEN 'Skilled Manual'
            ELSE 'Unknown'
        END AS Occupation,

        -- Home ownership
        CASE
            WHEN HomeOwner = 'Y' THEN 'Yes'
            WHEN HomeOwner = 'N' THEN 'No'
            ELSE 'Unknown'
        END AS HomeOwner,
        PreferredPaymentMethod
    FROM Store.Dim_Customer;
GO


-- =============================================================
-- Analytics.Vw_Dim_Product
-- Clean product data and calculate profit
-- =============================================================
CREATE VIEW Analytics.Vw_Dim_Product AS
    SELECT
        IDProduct,
        IDProductSubcategory,
        ProductName,
        CAST(ProductCost  AS DECIMAL(10, 2)) AS ProductCost,
        CAST(ProductPrice AS DECIMAL(10, 2)) AS ProductPrice,

         -- Profit per unit (CAST both sides BEFORE subtracting)
        CAST(ProductPrice AS DECIMAL(10, 2)) -
        CAST(ProductCost  AS DECIMAL(10, 2)) AS ProductProfit
	FROM Store.Dim_Product;
GO


-- =============================================================
-- Analytics.Vw_Dim_Product_Category
-- Exposes product categories for analysis
-- =============================================================
CREATE VIEW Analytics.Vw_Dim_Product_Category AS
    SELECT
        IDProductCategory,
        CategoryName
    FROM Store.Dim_Product_Category;
GO


-- =============================================================
-- Analytics.Vw_Dim_Product_Subcategory
-- Exposes subcategories to build category -> subcategory hierarchy
-- =============================================================
CREATE VIEW Analytics.Vw_Dim_Product_Subcategory AS
    SELECT
        IDProductSubcategory,
        SubcategoryName,
        IDProductCategory
    FROM Store.Dim_Product_Subcategory;
GO


-- =============================================================
-- Analytics.Vw_Dim_Location
-- Exposes location data for geographic analysis (region, country)
-- =============================================================
CREATE VIEW Analytics.Vw_Dim_Location AS
    SELECT
        IDLocation,
        Region,
        Country
    FROM Store.Dim_Location;
GO


-- =============================================================
-- Analytics.Vw_Fact_Sales
-- Combines fact_sales_2022 + 2023 + 2024 into one unified view
-- Adds Sales_Year column for easy year filtering
-- =============================================================
CREATE VIEW Analytics.Vw_Fact_Sales AS
    SELECT
        2022 AS Sales_Year,
        OrderDate AS ID_OrderDate,
        OrderNumber,
        IDCustomer,
        IDProduct,
        IDLocation,
        CAST(OrderQuantity AS INT) AS OrderQuantity,
        PaymentMethod
    FROM Store.Fact_Sales_2022

    UNION ALL

    SELECT
        2023 AS Sales_Year,
        OrderDate AS ID_OrderDate,
        OrderNumber,
        IDCustomer,
        IDProduct,
        IDLocation,
        CAST(OrderQuantity AS INT) AS OrderQuantity,
        PaymentMethod
    FROM Store.Fact_Sales_2023

    UNION ALL

    SELECT
        2024 AS Sales_Year,
        OrderDate AS ID_OrderDate,
        OrderNumber,
        IDCustomer,
        IDProduct,
        IDLocation,
        CAST(OrderQuantity AS INT) AS OrderQuantity,
        PaymentMethod
    FROM Store.Fact_Sales_2024;
GO

-- =============================================================
-- Analytics.Vw_Fact_Returns
-- Exposes returns data for return rate analysis
-- =============================================================
CREATE VIEW Analytics.Vw_Fact_Returns AS
    SELECT
        ReturnDate,
        YEAR(ReturnDate) AS Return_Year,
        IDLocation,
        IDProduct,
        CAST(ReturnQuantity AS INT) AS ReturnQuantity
    FROM Store.Fact_Returns_Data;
GO
