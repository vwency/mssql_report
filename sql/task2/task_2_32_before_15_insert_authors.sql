DECLARE @RecordCount INT;
DECLARE @NextID INT;

-- Начинаем транзакцию для безопасного выполнения
BEGIN TRANSACTION;

-- Определяем текущее количество записей
SELECT @RecordCount = COUNT(*) FROM authors;

-- Получаем следующее значение ID (максимальный существующий + 1)
SELECT @NextID = ISNULL(MAX(code_author), 0) + 1 FROM authors;

-- Цикл добавления записей, пока их меньше 15
WHILE @RecordCount < 15
BEGIN
    -- Вставляем новую запись
    INSERT INTO authors (code_author, name_author, birthday)
    VALUES (
        @NextID, 
        N'Автор не известен', 
        DATEADD(DAY, -@NextID, GETDATE()) -- Генерируем разные даты для наглядности
    );
    
    -- Увеличиваем счетчики
    SET @NextID = @NextID + 1;
    SET @RecordCount = @RecordCount + 1;
END

SELECT COUNT(*) AS [Текущее количество записей] FROM authors;
SELECT * FROM authors ORDER BY code_author;

COMMIT TRANSACTION;










