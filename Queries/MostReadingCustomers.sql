SELECT c.Passport, c.FirstName, c.LastName, COUNT(*) AS BorrowCount
FROM customers AS c
JOIN bookhistories AS bh ON c.Passport = bh.CustomerPassport
WHERE bh.Action = 'Borrow'
GROUP BY c.Passport, c.FirstName, c.LastName
ORDER BY BorrowCount DESC
LIMIT 100;