-- Hausübung vom 26. Februar 2026
-- Thema: SQL-Übungen mit LeetCode (Self-JOIN, Duplikate finden)

-- Aufgabe: Löse zwei weitere SQL-LeetCode-Probleme der Schwierigkeitsstufe EASY

-- Problem 1: 175. Combine Two Tables
-- Write a solution to report the first name, last name, city, and state of each person in the Person table.
-- If the address of a personId is not present in the Address table, report null instead.

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

-- Problem 2: 181. Employees Earning More Than Their Managers
-- Write a solution to find the employees who earn more than their managers.

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;