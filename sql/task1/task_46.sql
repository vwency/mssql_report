SELECT DISTINCT
    a.name_author AS 'Автор'
FROM 
    authors a
JOIN 
    books b ON a.code_author = b.code_author
JOIN 
    publishing_house ph ON b.code_publish = ph.code_publish
WHERE 
    ph.publish IN (N'Мир', N'Питер Софт', N'Наука')
ORDER BY 
    a.name_author;
 