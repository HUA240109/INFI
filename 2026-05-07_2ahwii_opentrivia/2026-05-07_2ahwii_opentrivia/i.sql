SELECT q.question, a.answer, 'correct' AS type FROM Question q
JOIN Answer a ON q.correct_answer_id = a.id
WHERE q.question = 'What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?'

UNION ALL
SELECT q.question, a.answer, 'wrong' AS type FROM Question q
JOIN _IncorrectAnswers ia ON q.id = ia.B
JOIN Answer a ON ia.A = a.id
WHERE q.question = 'What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?'
ORDER BY type ASC, Answer ASC;