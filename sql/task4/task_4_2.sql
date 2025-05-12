CREATE TRIGGER trg_Employees_SoftDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Обновляем записи, помечая их как удаленные вместо фактического удаления
    UPDATE e
    SET e.Removed = 1
    FROM Employees e
    INNER JOIN deleted d ON e.EmployeeID = d.EmployeeID;
    
    -- Опционально: можно добавить дату удаления, если есть соответствующий столбец
    -- UPDATE e
    -- SET e.Removed = 1,
    --     e.RemovedDate = GETDATE()
    -- FROM Employees e
    -- INNER JOIN deleted d ON e.EmployeeID = d.EmployeeID;
END;
