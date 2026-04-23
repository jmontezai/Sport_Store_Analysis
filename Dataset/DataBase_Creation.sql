-- ========================================
-- Database Creation
-- ========================================
CREATE DATABASE Dw_SportStore;
GO

USE Dw_SportStore;
GO

-- ========================================
-- Schema Creation
-- ========================================
CREATE SCHEMA Store;
GO

-- ========================================
-- dim_calendar
-- ========================================
CREATE TABLE Store.Dim_Calendar (
    Date DATE PRIMARY KEY
);
GO

-- ========================================
-- dim_customer
-- ========================================
CREATE TABLE Store.Dim_Customer (
    IDCustomer             VARCHAR(10) PRIMARY KEY,
    Prefix                 VARCHAR(10),
    FirstName              VARCHAR(100),
    LastName               VARCHAR(100),
    BirthDate              DATE,
    MaritalStatus          VARCHAR(25),
    Gender                 VARCHAR(25),
    EmailAddress           VARCHAR(150),
    AnnualIncome           VARCHAR(20),
    TotalChildren          INT,
    EducationLevel         VARCHAR(50),
    Occupation             VARCHAR(50),
    HomeOwner              VARCHAR(10),
    PreferredPaymentMethod VARCHAR(50)
);
GO

-- ========================================
-- dim_product_category
-- ========================================
CREATE TABLE Store.Dim_Product_Category (
    IDProductCategory INT PRIMARY KEY,
    CategoryName      VARCHAR(50)
);
GO

-- ========================================
-- dim_product_subcategory
-- ========================================
CREATE TABLE Store.Dim_Product_Subcategory (
    IDProductSubcategory INT PRIMARY KEY,
    SubcategoryName      VARCHAR(50),
    IDProductCategory    INT
);
GO

-- ========================================
-- dim_product
-- ========================================
CREATE TABLE Store.Dim_Product (
    IDProduct            INT PRIMARY KEY,
    IDProductSubcategory INT,
    ProductSKU           VARCHAR(25),
    ProductName          VARCHAR(150),
    ModelName            VARCHAR(100),
    ProductDescription   VARCHAR(500),
    ProductColor         VARCHAR(50),
    ProductSize          VARCHAR(25),
    ProductStyle         VARCHAR(50),
    ProductCost          VARCHAR(20),
    ProductPrice         VARCHAR(20)
);
GO

-- ========================================
-- dim_location
-- ========================================
CREATE TABLE Store.Dim_Location (
    IDLocation INT PRIMARY KEY,
    Region     VARCHAR(50),
    Country    VARCHAR(50)
);
GO

-- ========================================
-- fact_sales_2022
-- ========================================
CREATE TABLE Store.Fact_Sales_2022 (
    OrderDate     DATE,
    OrderNumber   VARCHAR(25),
    IDProduct     INT,
    IDLocation    INT,
    OrderLineItem VARCHAR(10),
    OrderQuantity VARCHAR(10),
    PaymentMethod VARCHAR(50),
    IDCustomer    VARCHAR(10)
);
GO

-- ========================================
-- fact_sales_2023
-- ========================================
CREATE TABLE Store.Fact_Sales_2023 (
    OrderDate     DATE,
    OrderNumber   VARCHAR(25),
    IDProduct     INT,
    IDLocation    INT,
    OrderLineItem VARCHAR(10),
    OrderQuantity VARCHAR(10),
    PaymentMethod VARCHAR(50),
    IDCustomer    VARCHAR(10)
);
GO

-- ========================================
-- fact_sales_2024
-- ========================================
CREATE TABLE Store.Fact_Sales_2024 (
    OrderDate     DATE,
    OrderNumber   VARCHAR(25),
    IDProduct     INT,
    IDLocation    INT,
    OrderLineItem VARCHAR(10),
    OrderQuantity VARCHAR(10),
    PaymentMethod VARCHAR(50),
    IDCustomer    VARCHAR(10)
);
GO

-- ========================================
-- fact_returns_data
-- ========================================
CREATE TABLE Store.Fact_Returns_Data (
    ReturnDate     DATE,
    IDLocation     INT,
    IDProduct      INT,
    ReturnQuantity VARCHAR(10)
);
GO

-- ========================================
-- BULK INSERTS
-- ========================================

BULK INSERT Store.Dim_Calendar
FROM 'C:\Sql_Data\Sport_Store\dim_calendar.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Dim_Customer
FROM 'C:\Sql_Data\Sport_Store\dim_customer.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Dim_Product_Category
FROM 'C:\Sql_Data\Sport_Store\dim_product_category.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Dim_Product_Subcategory
FROM 'C:\Sql_Data\Sport_Store\dim_product_subcategory.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Dim_Product
FROM 'C:\Sql_Data\Sport_Store\dim_product.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Dim_Location
FROM 'C:\Sql_Data\Sport_Store\dim_location.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Fact_Sales_2022
FROM 'C:\Sql_Data\Sport_Store\fact_sales_2022.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Fact_Sales_2023
FROM 'C:\Sql_Data\Sport_Store\fact_sales_2023.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Fact_Sales_2024
FROM 'C:\Sql_Data\Sport_Store\fact_sales_2024.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO

BULK INSERT Store.Fact_Returns_Data
FROM 'C:\Sql_Data\Sport_Store\fact_returns_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    FIELDQUOTE = '"',
    FORMAT = 'CSV',
    TABLOCK
);
GO
