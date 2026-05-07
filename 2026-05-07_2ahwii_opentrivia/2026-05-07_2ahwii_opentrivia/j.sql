SELECT a.answer, COUNT(*) AS anzahl FROM Answer a
JOIN _IncorrectAnswers ia ON a.id = ia.A
WHERE a.answer NOT IN ('True', 'False')
GROUP BY a.answer ORDER BY anzahl DESC, a.answer ASC LIMIT 3;