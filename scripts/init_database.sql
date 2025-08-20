/*
Create Database and Schemas

Script Purpose:
Thi script creates a new database 'DataWarehouse' after checking if it already exists.
If the database exists it is dropped and recreated. Additionally, the script sets up three schemas within the database: 'bronze', 'silver',
'gold'.

WARNING: 
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently proceed with caution and ensure you have proper backup before the running the script.
*/

USE master;
GO

-- Drop and recreate the 'datawarehouse' database
  IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO;

-- Create the 'datawarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
