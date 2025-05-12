-- 1. Выводим название текущего месяца и текущее время в GMT+6
SELECT 
    FORMAT(SYSDATETIMEOFFSET() AT TIME ZONE 'Central Asia Standard Time', 'MMMM', 'ru-ru') AS [Текущий месяц],
    FORMAT(SYSDATETIMEOFFSET() AT TIME ZONE 'Central Asia Standard Time', 'HH:mm') AS [Текущее время GMT+6];

-- 2. Определяем следующий доступный уникальный код заказа
DECLARE @NextPurchaseCode INT;
SELECT @NextPurchaseCode = ISNULL(MAX(code_purchase), 0) + 1 FROM purchases;

-- 3. Вставляем новые записи с фиксированной датой 12.03.2000
INSERT INTO purchases (code_purchase, code_book, date_order, code_delivery, type_purchase, cost, amount)
VALUES
    (@NextPurchaseCode, 302, '2000-03-12', 403, 1, 1500.00, 3),
    (@NextPurchaseCode + 1, 304, '2000-03-12', 404, 0, 600.75, 2),
    (@NextPurchaseCode + 2, 305, '2000-03-12', 405, 1, 900.25, 4);
   