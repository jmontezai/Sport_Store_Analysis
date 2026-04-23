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
CREATE SCHEMA DwStore;
GO

-- ========================================
-- dim_calendar
-- ========================================
CREATE TABLE DwStore.dim_calendar (
    Date DATE PRIMARY KEY
);
GO

-- ========================================
-- dim_customer
-- ========================================
CREATE TABLE DwStore.dim_customer (
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
CREATE TABLE DwStore.dim_product_category (
    IDProductCategory INT PRIMARY KEY,
    CategoryName      VARCHAR(50)
);
GO

-- ========================================
-- dim_product_subcategory
-- ========================================
CREATE TABLE DwStore.dim_product_subcategory (
    IDProductSubcategory INT PRIMARY KEY,
    SubcategoryName      VARCHAR(50),
    IDProductCategory    INT
);
GO

-- ========================================
-- dim_product
-- ========================================
CREATE TABLE DwStore.dim_product (
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
CREATE TABLE DwStore.dim_location (
    IDLocation INT PRIMARY KEY,
    Region     VARCHAR(50),
    Country    VARCHAR(50)
);
GO

-- ========================================
-- fact_sales_2022
-- ========================================
CREATE TABLE DwStore.fact_sales_2022 (
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
CREATE TABLE DwStore.fact_sales_2023 (
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
CREATE TABLE DwStore.fact_sales_2024 (
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
CREATE TABLE DwStore.fact_returns_data (
    ReturnDate     DATE,
    IDLocation     INT,
    IDProduct      INT,
    ReturnQuantity VARCHAR(10)
);
GO

-- ========================================
-- BULK INSERTS
-- ========================================

BULK INSERT DwStore.dim_calendar
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

BULK INSERT DwStore.dim_customer
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

BULK INSERT DwStore.dim_product_category
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

BULK INSERT DwStore.dim_product_subcategory
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

BULK INSERT DwStore.dim_product
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

BULK INSERT DwStore.dim_location
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

BULK INSERT DwStore.fact_sales_2022
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

BULK INSERT DwStore.fact_sales_2023
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

BULK INSERT DwStore.fact_sales_2024
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

BULK INSERT DwStore.fact_returns_data
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
