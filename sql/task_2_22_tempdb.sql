-- Создание локальной временной таблицы
CREATE TABLE #TEMP (
    DateField DATETIME,        -- Поле типа дата/время
    LongIntField BIGINT,       -- Поле типа длинное целое (BIGINT)
    StringField NVARCHAR(100)  -- Поле типа строка (Unicode)
);

-- Добавление первой записи
INSERT INTO #TEMP (DateField, LongIntField, StringField)
VALUES ('2023-11-15 14:30:00', 1234567890123, N'Первая запись');

-- Добавление второй записи
INSERT INTO #TEMP (DateField, LongIntField, StringField)
VALUES (GETDATE(), -9876543210987, N'Вторая запись с текущей датой');

SELECT 
    DateField AS [Дата/Время],
    LongIntField AS [Длинное целое],
    StringField AS [Строковое значение]
FROM #TEMP;







