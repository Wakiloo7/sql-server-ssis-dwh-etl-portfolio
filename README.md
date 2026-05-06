# Microsoft SSIS Data Warehouse ETL Pipeline

This project demonstrates an end-to-end Data Warehouse ETL pipeline built with SQL Server Integration Services (SSIS), Microsoft SQL Server, T-SQL, Star Schema modelling, and Power BI reporting. The main theme of this project is to show how raw business data can be extracted from source systems, loaded into a staging area, cleaned, transformed, and then loaded into a structured data warehouse for reporting and analytics.

The solution follows a layered data warehouse architecture: Source Layer, Staging Layer, Data Warehouse Layer, and Presentation Layer. The Source Layer contains the raw input data used by the ETL process. This may include flat files, CSV files, Excel files, or database tables. The Staging Layer works as an intermediate landing area where data is first loaded before business rules, validation, and transformations are applied. The Data Warehouse Layer stores cleaned and transformed data using a Star Schema model, including dimension tables and fact tables designed for analytical queries. The Presentation Layer is used for reporting and visualization, where the warehouse data can be connected to Power BI to create dashboards, KPIs, and business reports.

The ETL process contains three main phases: Extract, Transform, and Load. In the Extract phase, data is extracted from source files and/or source database tables using SSIS connection managers and data flow tasks. In the Transform phase, the data is cleaned and prepared by applying data quality rules and business logic, including data type conversion, null handling, duplicate handling, lookup transformations, derived columns, data validation, and mapping source fields to warehouse columns. In the Load phase, the cleaned and transformed data is loaded into SQL Server warehouse tables, including dimension tables, fact tables, and reporting-ready tables or views.

The project folder structure is organized as follows: WakilAhmad-SSIS-DWH-ETL-Portfolio/ contains DataSources/ for source files used by the ETL pipeline, SSISPackages/ for SSIS project files and .dtsx packages, SQLScripts/ for SQL scripts related to schema creation, staging tables, warehouse tables, and validation queries, Reporting/ for Power BI reports and reporting assets, Documentation.pdf for project documentation, and README.md for the project overview and instructions.

The tools and technologies used in this project include SQL Server Integration Services for ETL development, Microsoft SQL Server as the database platform, T-SQL for querying and database scripting, Star Schema for data modelling, Power BI for reporting and visualization, Visual Studio / SQL Server Data Tools for SSIS development, and Git and GitHub for version control.

This project demonstrates key data engineering and business intelligence skills, including SSIS package development, ETL pipeline design, SQL Server database development, data warehouse modelling, fact and dimension table design, staging layer implementation, T-SQL scripting, data cleaning and transformation, error handling and validation, and Power BI reporting integration.

To use this project, first open the SQL scripts from the SQLScripts folder and create the required SQL Server database, schemas, and tables. Then open the SSIS solution or project from the SSISPackages folder in Visual Studio, configure the connection managers according to your local SQL Server environment, and run the SSIS packages to load source data into staging and warehouse tables. After the ETL process is complete, open the reporting files from the Reporting folder and connect Power BI to the warehouse database for reporting and analysis.

After running the ETL process, the expected output includes loaded staging tables, cleaned dimension tables, populated fact tables, a structured SQL Server data warehouse, and data ready for Power BI dashboards and business analysis.

## Author

**Wakil Ahmad**