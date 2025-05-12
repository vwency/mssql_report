-- Создаём серверный триггер на создание базы данных
CREATE TRIGGER trg_LogDatabaseCreation
ON ALL SERVER
FOR CREATE_DATABASE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EventData XML = EVENTDATA();
    DECLARE @DBName NVARCHAR(128) = @EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'NVARCHAR(128)');

    -- Вставка через динамический SQL в task4.dbo.history_tables_date
    EXEC('INSERT INTO task4.dbo.history_tables_date (DatabaseName, CreatedDate)
          VALUES (''' + @DBName + ''', GETDATE())');
END;
