SELECT COUNT(*) AS BooksBorrowedCount
FROM bookhistories
WHERE Action = 'Borrow'
AND DateTime >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);