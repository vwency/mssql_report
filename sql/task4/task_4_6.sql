CREATE TRIGGER trg_LogProductUpdate
ON dbo.Products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.history_tables_mutations (MutationDate, TableName, RowId, OldName, OldPrice)
    SELECT 
        GETDATE(),
        'Products',
        d.Id,
        d.Name,
        d.Price
    FROM deleted d;
END;









