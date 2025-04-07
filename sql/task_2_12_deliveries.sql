DECLARE @SupplierCount INT;

-- Подсчитываем количество уникальных поставщиков из таблицы deliveries
SELECT @SupplierCount = COUNT(*) 
FROM deliveries;

-- Выводим результат
SELECT @SupplierCount AS TotalBookSuppliers;









