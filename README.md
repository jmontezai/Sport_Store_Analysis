# 📊 Sales Analysis — Sport Store

## 🚀 Executive Summary
This project highlights three key points:

- Strong **revenue concentration in the Equipment category**, driven by premium products such as the EcoRide E-Bike and RoadRacer 700  
- **Consistent growth** in both revenue and customer base from 2022 to 2024  
- A **healthy margin (~46%)** and a controlled **return rate of 2.72%**, indicating strong operational efficiency  

👉 These findings point to a growing and well-managed business, but also reveal a **dependency on a small group of high-value products**.

---

## 📌 Project Overview
This project analyzes sales, product, and customer performance for a sports retail store between 2022 and 2024.

The goal was to build an end-to-end analytics solution, from **data transformation in SQL** to the creation of an **interactive Power BI dashboard**, focused on business insights.

---

## 🎯 Business Objectives
- Analyze revenue and profit trends over time  
- Identify top-performing products and categories  
- Understand customer segments and purchasing behavior  
- Monitor key metrics:
  - Revenue  
  - Profit  
  - Orders  
  - Units sold  
  - Return rate  

---

## 🛠️ Tools & Technologies
- **SQL Server** → data cleaning, transformation, and modeling  
- **Power BI** → data visualization and dashboard development  

---

## 🧠 Data Preparation (SQL)
A dedicated **Analytics** schema was created on top of the raw data (**Store**) to separate operational data from analytics-ready data.

### Key steps:
- Cleaned and standardized customer data (name, gender, marital status, etc.)  
- Translated coded values (e.g., *M → Married*, *Y → Yes*)  
- Calculated derived metrics such as **Product Profit (Price − Cost)**  
- Combined yearly sales tables (2022–2024) into a single view:  
  `Vw_Fact_Sales` with a `Sales_Year` column  
- Added time attributes:
  - Year  
  - Quarter  
  - Month  
  - Month Name  

👉 Result: a structured dataset optimized for business analysis.

---

## 📊 Dashboard

### Overview
- Key KPIs: Revenue, Profit, Orders, Return Rate  
- Revenue trend over time  
- Orders by product category  
- Top products with return rate indicators  
- Monthly KPIs with comparison to previous month  

### Product Analysis
- Top products by revenue, profit, and units sold  
- Revenue distribution by category  
- Product performance trends over time  
- Highlight card for top-performing product  

### Customer Analysis
- Unique customers and revenue per customer  
- Customer growth over time  
- Top 100 customers by revenue  
- Orders by income segment  
- Payment methods  
- Gender distribution  

---

## 📸 Dashboard Preview

### Overview
![Overview](Images/overview.png)

### Product Analysis
![Product Analysis](Images/product.png)

### Customer Analysis
![Customer Analysis](Images/customer.png)

---

## 💡 Key Insights

📈 Revenue grew consistently from 2022 to 2024, reaching **€4.6M**, indicating strong business expansion  

🚴 The **Equipment category dominates revenue**, highlighting reliance on high-value products and potential concentration risk  

🎯 A small group of products generates most of the sales, reinforcing the need for portfolio diversification  

👥 The **Average income segment** leads in both customer volume and revenue  
➡️ The **High-income segment** contributes strongly to higher value per customer  

💳 **Credit Card** is the dominant payment method, followed by PayPal  

🔁 The overall return rate is low (**2.72%**), although products like **Leggings** show higher return levels  

---

## ⚠️ Limitations
- Dataset is simulated (synthetic data)  
- Does not include external factors (marketing, promotions, seasonality)  
- Return data does not include reasons  

---

## 🚀 Next Steps
- Implement customer segmentation (RFM analysis)  
- Analyze profitability and margins per product  
- Explore geographic performance (region/country)  
- Develop revenue forecasting models  

---

## 📂 Project Structure

    Dataset/
    SQL_Analysis/
    Power_BI/
    ├── SportStore_Sales_Analysis.pbix
    └── Images/
    README.md

---

## 👤 Author
Project developed by João, focused on end-to-end data analysis and data-driven decision making.