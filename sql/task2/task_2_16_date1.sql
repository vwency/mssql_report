DECLARE @Date1 DATETIME;
SET @Date1 = CONVERT(DATETIME, '31.12.2006', 104); -- 104 - код формата dd.mm.yyyy

-- Проверка
SELECT @Date1 AS ResultDate;









