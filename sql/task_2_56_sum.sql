-- Объявляем переменные
DECLARE @a FLOAT = 2.5;  -- Произвольное значение коэффициента
DECLARE @y FLOAT = 0;    -- Результат вычислений
DECLARE @n INT = 1;      -- Счетчик

-- Создаем временную таблицу для значений I_n
DECLARE @Currents TABLE (n INT, I_n FLOAT);

-- Заполняем таблицу произвольными значениями токов
INSERT INTO @Currents (n, I_n)
VALUES 
    (1, 1.2), (2, 2.3), (3, 3.1), (4, 0.8), (5, 1.7),
    (6, 2.0), (7, 1.5), (8, 2.2), (9, 0.9), (10, 1.8);

-- Вычисляем сумму по формуле (4)
SELECT @y = SUM(I_n * @a)
FROM @Currents
WHERE n BETWEEN 1 AND 10;

-- Выводим результат
SELECT 
    @a AS [Коэффициент a],
    (SELECT STRING_AGG(CAST(I_n AS NVARCHAR(10)), ', ') FROM @Currents) AS [Значения I_n],
    @y AS [Результат y];