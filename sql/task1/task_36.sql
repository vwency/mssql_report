SELECT 
    AVG(p.cost) AS 'Средняя стоимость поставки',
    AVG(p.amount) AS 'Среднее количество экземпляров'
FROM 
    purchases p
JOIN 
    books b ON p.code_book = b.code_book
JOIN 
    authors a ON b.code_author = a.code_author
WHERE 
    a.name_author LIKE N'%Акунин%';