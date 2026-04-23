-- =============================================================
-- Create schema to store analytical views
-- Separates raw data (DwStore) from transformed data (Analytics)
-- =============================================================
USE DW_SportStore;
GO

CREATE SCHEMA Analytics;
GO

-- =============================================================
-- Analytics.vw_dim_calendar
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
    FROM DwStore.dim_calendar;
GO

-- =============================================================
-- Analytics.vw_dim_customer
-- Clean customer data and standardize values:
--   - Trim extra spaces
--   - Proper-case first/last names (fixes "tRINITY", "sMITH", etc.)
--   - Expand codes (M/S -> Married/Single, Y/N -> Yes/No)
--   - Convert NULLs to 'Unknown' on descriptive fields
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
            WHEN MaritalStatus = 'M' THEN 'Married'
            WHEN MaritalStatus = 'S' THEN 'Single'
            ELSE 'Unknown'
        END AS MaritalStatus,

        -- Gender
        CASE
            WHEN Gender = 'M' THEN 'Male'
            WHEN Gender = 'F' THEN 'Female'
            ELSE 'Unknown'
        END AS Gender,

        EmailAddress,
        CAST(AnnualIncome AS DECIMAL(10, 2)) AS AnnualIncome,
        CAST(TotalChildren AS INT) AS TotalChildren,
        ISNULL(EducationLevel, 'Unknown') AS EducationLevel,
        ISNULL(Occupation,     'Unknown') AS Occupation,

        -- Home ownership
        CASE
            WHEN HomeOwner = 'Y' THEN 'Yes'
            WHEN HomeOwner = 'N' THEN 'No'
            ELSE 'Unknown'
        END AS HomeOwner,

        PreferredPaymentMethod

    FROM DwStore.dim_customer;
GO


-- =============================================================
-- Analytics.vw_dim_product
-- Clean product data and calculate profit + margin
-- Joins subcategory and category for a flat product hierarchy
-- =============================================================
CREATE VIEW Analytics.vw_dim_product AS
    SELECT
        IDProduct,
        IDProductSubcategory,
        ProductName,
        CAST(ProductCost  AS DECIMAL(10, 2)) AS ProductCost,
        CAST(ProductPrice AS DECIMAL(10, 2)) AS ProductPrice,

         -- Profit per unit (CAST both sides BEFORE subtracting)
        CAST(ProductPrice AS DECIMAL(10, 2)) -
        CAST(ProductCost  AS DECIMAL(10, 2)) AS ProductProfit,

GO


-- =============================================================
-- Analytics.vw_dim_product_category
-- Exposes product categories for analysis
-- =============================================================
CREATE VIEW Analytics.vw_dim_product_category AS
    SELECT
        IDProductCategory,
        CategoryName
    FROM DwStore.dim_product_category;
GO


-- =============================================================
-- Analytics.vw_dim_product_subcategory
-- Exposes subcategories to build category → subcategory hierarchy
-- =============================================================
CREATE VIEW Analytics.vw_dim_product_subcategory AS
    SELECT
        IDProductSubcategory,
        SubcategoryName,
        IDProductCategory
    FROM DwStore.dim_product_subcategory;
GO


-- =============================================================
-- Analytics.vw_dim_location
-- Exposes location data for geographic analysis (region, country)
-- =============================================================
CREATE VIEW Analytics.vw_dim_location AS
    SELECT
        IDLocation,
        Region,
        Country
    FROM DwStore.dim_location;
GO


-- =============================================================
-- Analytics.vw_fact_sales
-- Combines fact_sales_2022 + 2023 + 2024 into one unified view
-- Adds Sales_Year column for easy year filtering
-- =============================================================
CREATE VIEW Analytics.vw_fact_sales AS
    SELECT
        2022 AS Sales_Year,
        OrderDate AS ID_OrderDate,
        OrderNumber,
        IDCustomer,
        IDProduct,
        IDLocation,
        CAST(OrderQuantity AS INT) AS OrderQuantity,
        PaymentMethod
    FROM DwStore.fact_sales_2022

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
    FROM DwStore.fact_sales_2023

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
    FROM DwStore.fact_sales_2024;
GO

-- =============================================================
-- Analytics.vw_fact_returns
-- Exposes returns data for return rate analysis
-- =============================================================
CREATE VIEW Analytics.vw_fact_returns AS
    SELECT
        ReturnDate,
        YEAR(ReturnDate) AS Return_Year,
        IDLocation,
        IDProduct,
        CAST(ReturnQuantity AS INT) AS ReturnQuantity
    FROM DwStore.fact_returns_data;
GO
