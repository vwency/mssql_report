IF EXISTS (
    SELECT * FROM sys.server_triggers
    WHERE name = 'trg_LogDatabaseCreation'
)
BEGIN
    DROP TRIGGER trg_LogDatabaseCreation ON ALL SERVER;
END;









