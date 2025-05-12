SELECT 
    code_book AS 'Код книги',
    title_book AS 'Название книги',
    pages AS 'Количество страниц'
FROM 
    books
ORDER BY 
    title_book ASC,  -- Сортировка по названию книги по возрастанию (А-Я)
    pages DESC;      -- Затем по количеству страниц по убыванию (большие значения сначала)
   
   