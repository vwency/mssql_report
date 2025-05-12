SELECT 
    b.title_book AS 'Название книги',
    p.cost AS 'Общая стоимость',
    b.pages AS 'Количество страниц',
    (p.cost / b.pages) AS 'Стоимость одной страницы'
FROM 
    books b
JOIN 
    purchases p ON b.code_book = p.code_book
ORDER BY 
    b.title_book;
    










