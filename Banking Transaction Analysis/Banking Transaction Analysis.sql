-- 1. Suspicious Transactions (Amount > 100000)
SELECT * FROM Transactions WHERE Amount > 100000;

-- 2. Rapid Transfers (Possible Fraud)
SELECT CustomerID, COUNT(TransactionID) AS TransferCount
FROM Transactions
WHERE TransactionDate >= NOW() - INTERVAL 1 HOUR
GROUP BY CustomerID
HAVING TransferCount > 3;

-- 3. High Monthly Transaction Volume
SELECT CustomerID, SUM(Amount) AS MonthlyTotal
FROM Transactions
WHERE MONTH(TransactionDate) = MONTH(CURDATE())
GROUP BY CustomerID
HAVING MonthlyTotal > 500000;

-- 4. Loan Repayment Progress
SELECT LoanID, CustomerID, LoanAmount, LoanRemaining,
ROUND(((LoanAmount - LoanRemaining) / LoanAmount) * 100, 2) AS RepaymentPercent
FROM Loans;

-- 5. Overdue Loans
SELECT * FROM Loans WHERE DueDate < CURDATE() AND LoanRemaining > 0;

-- 6. Credit Card Upgrade Eligibility
SELECT CustomerID, AVG(Amount) AS AvgSpending
FROM Transactions
GROUP BY CustomerID
HAVING AvgSpending > 20000;

-- 7. Monthly Transaction Volume
SELECT MONTH(TransactionDate) AS Month, COUNT(TransactionID) AS TotalTransactions,
SUM(Amount) AS TotalAmount
FROM Transactions
GROUP BY MONTH(TransactionDate)
ORDER BY Month;

-- 8. Top 10 Customers by Spending
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Transactions
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

-- 9. Dormant Customers (No Activity in 6 Months)
SELECT c.CustomerID, c.Name
FROM Customers c
LEFT JOIN Transactions t ON c.CustomerID = t.CustomerID
WHERE t.TransactionDate IS NULL OR t.TransactionDate < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 10. Average Account Balance by City
SELECT c.City, AVG(a.Balance) AS AvgBalance
FROM Accounts a
JOIN Customers c ON a.CustomerID = c.CustomerID
GROUP BY c.City;

-- 11. Total Loan vs Remaining
SELECT SUM(LoanAmount) AS TotalLoanAmount, SUM(LoanRemaining) AS TotalRemaining,
(SUM(LoanAmount) - SUM(LoanRemaining)) AS TotalRepaid
FROM Loans;

-- 12. Customers With Multiple Accounts
SELECT CustomerID, COUNT(AccountID) AS AccountCount
FROM Accounts
GROUP BY CustomerID
HAVING AccountCount > 1;

-- 13. City-Wise Transaction Report
SELECT c.City, SUM(t.Amount) AS TotalTransaction
FROM Transactions t
JOIN Customers c ON t.CustomerID = c.CustomerID
GROUP BY c.City;

-- 14. High Balance Customers
SELECT CustomerID, Balance
FROM Accounts
WHERE Balance > 500000;

-- 15. Customers Having Both Loan and Savings Accounts
SELECT DISTINCT c.CustomerID, c.Name
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
JOIN Accounts a ON c.CustomerID = a.CustomerID
WHERE a.AccountType = 'Savings';

-- 16. Deposits and Withdrawals per Month
SELECT MONTH(TransactionDate) AS Month,
SUM(CASE WHEN TransactionType = 'Deposit' THEN Amount ELSE 0 END) AS TotalDeposits,
SUM(CASE WHEN TransactionType = 'Withdrawal' THEN Amount ELSE 0 END) AS TotalWithdrawals
FROM Transactions
GROUP BY MONTH(TransactionDate);

-- 17. Dormant Accounts (No Activity in 1 Year)
SELECT a.AccountID, c.Name
FROM Accounts a
JOIN Customers c ON a.CustomerID = c.CustomerID
LEFT JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.TransactionDate IS NULL OR t.TransactionDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 18. Customer Lifetime Value (CLV)
SELECT CustomerID, SUM(Amount) AS TotalSpent, COUNT(TransactionID) AS TotalTransactions
FROM Transactions
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- 19. Loan Default Risk Analysis
SELECT l.CustomerID, c.Name, l.LoanAmount, l.LoanRemaining,
CASE 
    WHEN l.LoanRemaining > (0.8 * l.LoanAmount) THEN 'High Risk'
    WHEN l.LoanRemaining BETWEEN (0.4 * l.LoanAmount) AND (0.8 * l.LoanAmount) THEN 'Medium Risk'
    ELSE 'Low Risk'
END AS RiskLevel
FROM Loans l
JOIN Customers c ON l.CustomerID = c.CustomerID;

-- 20. Average Transaction Value per City
SELECT c.City, AVG(t.Amount) AS AvgTransaction
FROM Transactions t
JOIN Customers c ON t.CustomerID = c.CustomerID
GROUP BY c.City;

-- 21. Top Performing Loan Officers
SELECT LoanOfficerID, COUNT(LoanID) AS TotalLoans, SUM(LoanAmount) AS TotalAmount
FROM Loans
GROUP BY LoanOfficerID
ORDER BY TotalAmount DESC;

-- 22. Customer Retention (Active in Last 6 Months)
SELECT CustomerID, MAX(TransactionDate) AS LastTransactionDate
FROM Transactions
WHERE TransactionDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY CustomerID;
