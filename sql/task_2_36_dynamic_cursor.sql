-- Проверка существования таблицы и данных
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'deliveries')
BEGIN
    SELECT N'Ошибка: Таблица deliveries не существует!' AS ErrorMessage;
    RETURN;
END

DECLARE @RecordCount INT = (SELECT COUNT(*) FROM deliveries);
IF @RecordCount = 0
BEGIN
    SELECT N'Ошибка: Таблица deliveries пуста!' AS ErrorMessage;
    RETURN;
END

-- Основной код курсора
DECLARE @DeliveryName NVARCHAR(100);
DECLARE @CompanyName NVARCHAR(100);
DECLARE @ResultText NVARCHAR(MAX) = N'';

-- Формирование заголовка (все строки с префиксом N для Unicode)
SET @ResultText = @ResultText + N'===============================================' + CHAR(13);
SET @ResultText = @ResultText + N'ОТЧЕТ О ПОСТАВЩИКАХ (всего: ' + CAST(@RecordCount AS NVARCHAR(10)) + N')' + CHAR(13);
SET @ResultText = @ResultText + N'===============================================' + CHAR(13);
SET @ResultText = @ResultText + N'Поставщик (контактное лицо)      | Компания' + CHAR(13);
SET @ResultText = @ResultText + N'-----------------------------------------------' + CHAR(13);

-- Создание и использование курсора
DECLARE SupplierCursor CURSOR DYNAMIC SCROLL FOR 
    SELECT name_delivery, name_company FROM deliveries ORDER BY name_delivery;

OPEN SupplierCursor;
FETCH NEXT FROM SupplierCursor INTO @DeliveryName, @CompanyName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @ResultText = @ResultText + 
        LEFT(@DeliveryName + SPACE(30), 30) + N' | ' +
        ISNULL(@CompanyName, N'Н/Д') + CHAR(13);
    
    FETCH NEXT FROM SupplierCursor INTO @DeliveryName, @CompanyName;
END

CLOSE SupplierCursor;
DEALLOCATE SupplierCursor;

-- Добавление итогов
SET @ResultText = @ResultText + N'-----------------------------------------------' + CHAR(13);
SET @ResultText = @ResultText + N'Обработка завершена' + CHAR(13);
SET @ResultText = @ResultText + N'===============================================' + CHAR(13);

-- Вывод результата
SELECT @ResultText AS SupplierReport;
