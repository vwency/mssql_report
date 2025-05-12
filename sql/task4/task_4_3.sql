ALTER TRIGGER trg_Employees_SoftDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Обновляем записи, помечая их как удаленные
    UPDATE e
    SET e.Removed = 1
    FROM Employees e
    INNER JOIN deleted d ON e.EmployeeID = d.EmployeeID;

    -- Вставляем запись в таблицу History
    INSERT INTO History (
        EmployeeID,
        FirstName,
        LastName,
        Position,
        Department,
        HireDate,
        Salary,
        Removed,
        DeletionDate
    )
    SELECT 
        d.EmployeeID,
        d.FirstName,
        d.LastName,
        d.Position,
        d.Department,
        d.HireDate,
        d.Salary,
        1,            -- Помечено как удалённое
        GETDATE()     -- Текущая дата/время
    FROM deleted d;
END;
