# SQL Data Warehouse & Analytics Project  

This project designs and implements a **modern SQL-based data warehouse** that ingests data from multiple operational systems, applies a **medallion architecture (bronze, silver, gold)** for structured data processing, and serves **analytics-ready datasets** for visualization and reporting.  

---

## 📂 Project Overview  
This project involves the following processes

- **Sources:**  
  - **CRM System** – Customer and sales-related data (e.g., leads, opportunities, accounts).  
  - **ERP System** – Finance, inventory, and order-related data.  

- **Data Warehouse Architecture:**
- Designing a modern data warehouse using medallion architecture

- **ETL Pipelines:**
- Extracting, transforming and loading data from source systems into the warehouse.

- **Data Modelling:**
- Designing fact and dimension tables optimized for analytical queries
  
- **Analyticss and Reporting:**  
  - Creating SQL-based reports and dashboards for actionable insights.  

---

## 🏗️ Data Architecture
The data architecture for this project follows the Medallion Architecture Bronze, Silver and Gold layers.

![Data Architecture](https://github.com/getrudeHarriet/SQL-data-warehouse-project/blob/main/docs/Data%20architect.drawio.png)  
 
  - **Bronze Layer (Raw Zone):** Stores raw ingested data in its original form with minimal transformations.  
  - **Silver Layer (Cleansed Zone):** Cleans, standardizes, and integrates CRM & ERP data into well-structured tables.  
  - **Gold Layer (Business Layer):** Aggregates and models data into fact and dimension tables for analytics and reporting.  



#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.


## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```

## 🌟 Author
Getrude Harriet Isaisi | Aspiring Data Professional

