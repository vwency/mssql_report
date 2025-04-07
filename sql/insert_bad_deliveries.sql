-- Находим следующий доступный ID
DECLARE @next_id INT;
SELECT @next_id = ISNULL(MAX(code_delivery), 0) + 1 FROM deliveries;

-- Вставляем поставщиков БЕЗ телефонов (phone = NULL)
INSERT INTO deliveries (code_delivery, name_delivery, name_company, address, phone, inn)
VALUES
    (@next_id,     N'Иванов Пётр Сергеевич',       N'ООО "Книжный мир"',          N'г. Москва, ул. Ленина, 10',      NULL, '7701123456'),
    (@next_id + 1, N'Сидорова Анна Викторовна',    N'ИП Сидорова А.В.',           N'г. Санкт-Петербург, Невский пр., 25', NULL, '7809876543'),
    (@next_id + 2, N'Петров Иван Николаевич',      N'ООО "Книготорг"',            N'г. Екатеринбург, ул. Малышева, 15', NULL, '6601234567'),
    (@next_id + 3, N'Книготорговая компания "Литера"', N'ООО "Литера"',           N'г. Новосибирск, ул. Кирова, 5',  NULL, '5409876543'),
    (@next_id + 4, N'Смирнова Ольга Дмитриевна',   N'Книжный склад "Читай-Город"', N'г. Казань, ул. Баумана, 30',     NULL, '1601122334');

-- Проверяем добавленные данные (только поставщики без телефона)
SELECT 
    code_delivery AS 'Код',
    name_delivery AS 'Поставщик',
    name_company AS 'Компания',
    address AS 'Адрес',
    'Нет данных' AS 'Телефон',
    inn AS 'ИНН'
FROM 
    deliveries
WHERE 
    phone IS NULL  -- Только записи без телефона
    AND code_delivery >= @next_id  -- Только что добавленные
ORDER BY 
    code_delivery;
