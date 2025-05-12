-- Используем базу task4
USE [task4];

-- Создаём таблицу в схеме dbo
CREATE TABLE dbo.history_tables_date (
    DatabaseName NVARCHAR(128),
    CreatedDate DATETIME
);
