DECLARE @NumericVar NUMERIC(10, 2);  -- Число с фиксированной точкой
DECLARE @NvarcharVar NVARCHAR(50);   -- Unicode-строка (поддержка кириллицы)
DECLARE @DateTimeVar DATETIME;       -- Дата и время

-- Присваивание значений
SET @NumericVar = 12345.67;
SET @NvarcharVar = N'Пример текста 123'; -- N перед строкой для Unicode
SET @DateTimeVar = '2023-11-15 14:30:25.123';

-- Преобразование типов и вывод результатов
SELECT 
    @NumericVar AS [Исходное NUMERIC],
    CAST(@NumericVar AS FLOAT) AS [Преобразован в FLOAT],
    
    @NvarcharVar AS [Исходное NVARCHAR],
    CAST(@NvarcharVar AS NCHAR(50)) AS [Преобразован в NCHAR], -- NCHAR для Unicode
    
    @DateTimeVar AS [Исходное DATETIME],
    CAST(@DateTimeVar AS BIGINT) AS [Преобразован в BIGINT];
