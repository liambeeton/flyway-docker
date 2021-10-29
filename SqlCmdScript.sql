IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Payroll')
    CREATE DATABASE Payroll;
GO

-- Create the default dB user
USE [master]
GO

IF NOT EXISTS(SELECT 1 FROM [Payroll].sys.database_principals WHERE name = 'PayrollAdmin')
    CREATE LOGIN [PayrollAdmin] WITH PASSWORD=N'Passw0rd', DEFAULT_DATABASE=[Payroll], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Payroll]
GO

IF NOT EXISTS(SELECT 1 FROM [Payroll].sys.database_principals WHERE name = 'PayrollAdmin') 
BEGIN
    CREATE USER [PayrollAdmin] FOR LOGIN [PayrollAdmin] ALTER USER [PayrollAdmin] WITH DEFAULT_SCHEMA=[dbo] ALTER ROLE [db_owner] ADD MEMBER [PayrollAdmin]
END 
GO