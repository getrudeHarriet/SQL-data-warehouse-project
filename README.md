# SQL Data Warehouse & Analytics Project  

This project demonstrates how to design and implement a **modern SQL-based data warehouse** that ingests data from multiple operational systems, applies a **medallion architecture (bronze, silver, gold)** for structured data processing, and serves **analytics-ready datasets** for visualization and reporting.  

---

## 📂 Project Overview  

- **Sources:**  
  - **CRM System** – Customer and sales-related data (e.g., leads, opportunities, accounts).  
  - **ERP System** – Finance, inventory, and order-related data.  

- **Data Warehouse Architecture:**  
  - **Bronze Layer (Raw Zone):** Stores raw ingested data in its original form with minimal transformations.  
  - **Silver Layer (Cleansed Zone):** Cleans, standardizes, and integrates CRM & ERP data into well-structured tables.  
  - **Gold Layer (Business Layer):** Aggregates and models data into fact and dimension tables for analytics and reporting.  

- **Consumers:**  
  - Visualization and BI tools (Power BI, Tableau, or Looker).  
  - SQL-based ad-hoc analysis for stakeholders.  

---

## 🏗️ Data Flow  

```mermaid
flowchart LR
    CRM[CRM Data] --> Bronze[Bronze Layer: Raw]
    ERP[ERP Data] --> Bronze
    Bronze --> Silver[Silver Layer: Cleansed & Joined]
    Silver --> Gold[Gold Layer: Business-Ready Models]
    Gold --> Reports[Dashboards & Reports]
    Gold --> SQL[Ad-hoc SQL Queries]

