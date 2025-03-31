SELECT 
    title_book AS 'Название книги',
    pages AS 'Количество страниц'
FROM 
    books
WHERE 
    pages BETWEEN 200 AND 300
ORDER BY 
    title_book;
