DECLARE @Text NVARCHAR(MAX) = N'Пример текста  :с ошибками , и пропущенными пробелами .Или лишними !  Вот так;';
DECLARE @OriginalText NVARCHAR(MAX) = @Text;
DECLARE @Corrections INT = 0;
DECLARE @PunctuationMarks NVARCHAR(10) = N'.,!?:;';
DECLARE @i INT;

-- 1. Удаляем пробелы ПЕРЕД знаками препинания
SET @i = 1;
WHILE @i <= LEN(@PunctuationMarks)
BEGIN
    DECLARE @Mark NCHAR(1) = SUBSTRING(@PunctuationMarks, @i, 1);
    
    -- Удаляем все пробелы перед текущим знаком препинания
    WHILE CHARINDEX(' ' + @Mark, @Text) > 0
    BEGIN
        SET @Text = REPLACE(@Text, ' ' + @Mark, @Mark);
        SET @Corrections = @Corrections + 1;
    END
    
    SET @i = @i + 1;
END

-- 2. Добавляем пробелы ПОСЛЕ знаков препинания (если их нет)
SET @i = 1;
WHILE @i <= LEN(@PunctuationMarks)
BEGIN
    DECLARE @CurrentMark NCHAR(1) = SUBSTRING(@PunctuationMarks, @i, 1);
    
    -- Ищем места, где после знака препинания нет пробела
    DECLARE @pos INT = PATINDEX('%' + @CurrentMark + '[^ ]%', @Text);
    
    WHILE @pos > 0 AND @pos < LEN(@Text)
    BEGIN
        -- Вставляем пробел после знака препинания
        SET @Text = STUFF(@Text, @pos + 1, 0, ' ');
        SET @Corrections = @Corrections + 1;
        
        -- Ищем следующее вхождение
        SET @pos = PATINDEX('%' + @CurrentMark + '[^ ]%', @Text);
    END
    
    SET @i = @i + 1;
END

-- Выводим результаты
SELECT 
    @OriginalText AS [Исходный текст],
    @Text AS [Исправленный текст],
    @Corrections AS [Количество исправлений];
