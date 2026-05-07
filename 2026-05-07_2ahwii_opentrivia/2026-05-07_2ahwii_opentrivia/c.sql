SELECT COUNT(*) AS anzahl FROM Question q 
JOIN Type t ON q.typeId = t.id WHERE t.type = 'boolean';