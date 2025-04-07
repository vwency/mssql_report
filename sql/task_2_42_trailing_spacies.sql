DECLARE @Text NVARCHAR(MAX) = N'Это   текст  с  лишними    пробелами.    Нужно  их  удалить.';
DECLARE @OriginalLength INT;
DECLARE @NewLength INT;
DECLARE @CorrectionsCount INT;

-- Сохраняем оригинальную длину
SET @OriginalLength = LEN(@Text);

-- Удаляем лишние пробелы (регулярное выражение через REPLACE)
WHILE CHARINDEX('  ', @Text) > 0
BEGIN
    SET @Text = REPLACE(@Text, '  ', ' ');
END

-- Вычисляем новую длину и количество исправлений
SET @NewLength = LEN(@Text);
SET @CorrectionsCount = @OriginalLength - @NewLength;

-- Выводим результаты
SELECT 
    @Text AS [Исправленный текст],
    @CorrectionsCount AS [Количество исправлений];









