# Sales-Data-Engineering-BI-Pipeline
# 📊 Sales Data Engineering & Business Intelligence Pipeline

## 🚀 Project Overview
This is an **End-to-End Data Engineering** project designed to transform raw, unorganized sales data into a fully interactive and automated Business Intelligence dashboard. The project demonstrates a complete data lifecycle: from Python-based ETL to SQL Server data modeling and Power BI visualization.

## 🛠️ Technical Stack
* **Language:** Python (Pandas) for Data Cleaning & ETL.
* **Database:** SQL Server (Transact-SQL) for Data Warehousing.
* **Schema:** Star Schema (Fact & Dimension Tables).
* **BI Tool:** Power BI (DAX & Interactive Visualization).

## 🏗️ Architecture & Workflow

### 1. Data Transformation (ETL)
* Used **Python** to clean raw datasets, handle missing values, and standardize data formats.
* Ensured data integrity before loading into the warehouse.

### 2. Data Modeling (SQL Server)
* Designed a **Star Schema** to optimize query performance.
* Developed **SQL Views** to serve as a clean reporting layer:
    * `v_Master_Sales`: Combined view for general reporting.
    * `v_KPI_Regional_Sales`: Insights by city (Cairo, Alexandria, Giza).
    * `v_KPI_Product_Performance`: Analysis of top-selling products.

### 3. Business Intelligence (Power BI)
* Connected Power BI to SQL Server via **DirectQuery/Import** for real-time-like updates.
* Created an interactive dashboard featuring:
    * **KPI Cards:** Total Revenue, Order Count, and Customer Reach.
    * **Trend Analysis:** Monthly sales growth charts.
    * **Geographic Distribution:** Sales split by region using Donut charts.
    * **Top Performers:** Bar charts for product rankings.

## 📈 Key Insights
* Achieved a total revenue of **3.14K** (based on sample data).
* Identified **Cairo** as the top-performing region.
* Analyzed product demand trends to optimize inventory management.

## 📂 Project Structure
```text
├── ETL-Scripts/        # Python cleaning scripts
├── SQL-Scripts/        # Table & View creation scripts
├── Dashboard/          # Power BI (.pbix) and PDF Export
└── README.md           # Project documentation
