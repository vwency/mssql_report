-- Проверяем количество записей до удаления
SELECT 'Before delete - Employees' AS TableName, COUNT(*) AS RecordCount FROM Employees
UNION ALL
SELECT 'Before delete - History' AS TableName, COUNT(*) AS RecordCount FROM History;

-- Удаляем одну запись
DELETE FROM Employees WHERE EmployeeID = 2; -- Удаляем Peter Johnson

-- Проверяем результат
SELECT 'After delete - Employees' AS TableName, COUNT(*) AS RecordCount FROM Employees
UNION ALL
SELECT 'After delete - History' AS TableName, COUNT(*) AS RecordCount FROM History;

-- Проверяем данные в таблице History
SELECT * FROM History WHERE EmployeeID = 2;

-- Удаляем несколько записей
DELETE FROM Employees WHERE Department = 'IT';

-- Проверяем результат
SELECT 'After second delete - Employees' AS TableName, COUNT(*) AS RecordCount FROM Employees
UNION ALL
SELECT 'After second delete - History' AS TableName, COUNT(*) AS RecordCount FROM History;

-- Проверяем данные в таблице History
SELECT * FROM History ORDER BY DeletionDate;
