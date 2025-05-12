SELECT DISTINCT
    ph.publish AS 'Издательство'
FROM 
    publishing_house ph
JOIN 
    books b ON ph.code_publish = b.code_publish
WHERE 
    b.title_book LIKE N'Труды%'
    AND ph.city = N'Новосибирск';
