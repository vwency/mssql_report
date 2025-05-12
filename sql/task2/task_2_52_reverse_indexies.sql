DECLARE @Text NVARCHAR(MAX) = N'SQL Server - мощная система управления базами данных';
DECLARE @FirstWord NVARCHAR(100);
DECLARE @LastWord NVARCHAR(100);
DECLARE @ResultText NVARCHAR(MAX);

-- Извлекаем первое слово
SELECT @FirstWord = 
    CASE 
        WHEN CHARINDEX(' ', @Text) > 0 
        THEN LEFT(@Text, CHARINDEX(' ', @Text) - 1) 
        ELSE @Text 
    END;

-- Извлекаем последнее слово
SELECT @LastWord = 
    REVERSE(
        CASE 
            WHEN CHARINDEX(' ', REVERSE(@Text)) > 0 
            THEN LEFT(REVERSE(@Text), CHARINDEX(' ', REVERSE(@Text)) - 1) 
            ELSE REVERSE(@Text) 
        END
    );

-- Формируем результат
IF CHARINDEX(' ', @Text) > 0
BEGIN
    SET @ResultText = @LastWord + 
                     SUBSTRING(@Text, LEN(@FirstWord) + 1, LEN(@Text) - LEN(@FirstWord) - LEN(@LastWord)) + 
                     @FirstWord;
END
ELSE
BEGIN
    SET @ResultText = @Text;
END

-- Выводим результат
SELECT 
    @Text AS [Исходный текст],
    @ResultText AS [Текст после замены],
    CASE WHEN @FirstWord <> @LastWord AND CHARINDEX(' ', @Text) > 0 THEN 1 ELSE 0 END AS [Изменения];
