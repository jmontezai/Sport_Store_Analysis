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
