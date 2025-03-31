SELECT 
    b.title_book AS 'Название книги',
    b.pages AS 'Количество страниц',
    a.name_author AS 'Автор'
FROM 
    books b
JOIN 
    authors a ON b.code_author = a.code_author
ORDER BY 
    b.title_book;
    


	






