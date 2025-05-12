DECLARE @Perem1 NVARCHAR(30);  -- Unicode-строка
DECLARE @Perem2 DECIMAL(13, 3);

SET @Perem1 = N'Пример текстовой строки';  -- Обратите внимание на N перед строкой
SET @Perem2 = 1234567.890;

SELECT @Perem1 AS StringVariable, @Perem2 AS NumericVariable;
