CREATE TRIGGER trg_LogTableCreation
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EventData XML = EVENTDATA();

    INSERT INTO History_Tables (TableName, CreatedDate)
    VALUES (
        @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(128)'),
        GETDATE()
    );
END;









