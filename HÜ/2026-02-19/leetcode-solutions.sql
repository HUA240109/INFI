-- Hausübung vom 19. Februar 2026
-- Thema: SQL-Praxis mit LeetCode

-- Aufgabe: Suche dir zwei SQL-Probleme aus und löse sie.

-- Problem 1: 183. Customers Who Never Order
-- Write a solution to find all customers who never order anything.

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;

-- Problem 2: 511. Game Play Analysis I
-- Write a solution to find the first login date for each player.

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;