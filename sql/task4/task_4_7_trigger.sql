CREATE TRIGGER trg_RejectHighPrice
ON dbo.ProductsWithLimit
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted
        WHERE Price > 10000
    )
    BEGIN
        RAISERROR('Цена не может превышать 10000!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
