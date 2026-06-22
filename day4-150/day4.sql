-- 1. Show all records
SELECT * FROM bank_transactions;

-- 2. Show TransactionID and TransactionAmount
SELECT TransactionID, TransactionAmount FROM bank_transactions;

-- 3. Show transactions with amount > 5000
SELECT * FROM bank_transactions WHERE TransactionAmount > 5000;

-- 4. Show transactions with amount < 1000
SELECT * FROM bank_transactions WHERE TransactionAmount < 1000;

-- 5. Show transactions from 'Mumbai'
SELECT * FROM bank_transactions WHERE Location = 'Mumbai';

-- 6. Show transactions where TransactionType = 'Debit'
SELECT * FROM bank_transactions WHERE TransactionType = 'Debit';

-- 7. Show transactions where Channel = 'Online'
SELECT * FROM bank_transactions WHERE Channel = 'Online';

-- 8. Show NULL locations
SELECT * FROM bank_transactions WHERE Location IS NULL;

-- 9. Show NOT NULL locations
SELECT * FROM bank_transactions WHERE Location IS NOT NULL;

-- 10. Sort by amount ASC
SELECT * FROM bank_transactions ORDER BY TransactionAmount;

-- 11. Sort by amount DESC
SELECT * FROM bank_transactions ORDER BY TransactionAmount DESC;

-- 12. First 10 records
SELECT * FROM bank_transactions LIMIT 10;

-- 13. Last 10 records
SELECT * FROM bank_transactions ORDER BY TransactionID DESC LIMIT 10;

-- 14. Total transactions count
SELECT COUNT(*) FROM bank_transactions;

-- 15. Max transaction amount
SELECT MAX(TransactionAmount) FROM bank_transactions;

-- 16. Min transaction amount
SELECT MIN(TransactionAmount) FROM bank_transactions;

-- 17. Avg transaction amount
SELECT AVG(TransactionAmount) FROM bank_transactions;

-- 18. Total transaction amount
SELECT SUM(TransactionAmount) FROM bank_transactions;

-- 19. Unique locations
SELECT DISTINCT Location FROM bank_transactions;

-- 20. Unique transaction types
SELECT DISTINCT TransactionType FROM bank_transactions;

-- 21. Count distinct accounts
SELECT COUNT(DISTINCT AccountID) FROM bank_transactions;

-- 22. Transactions per account
SELECT AccountID, COUNT(*) FROM bank_transactions GROUP BY AccountID;

-- 23. Transactions per location
SELECT Location, COUNT(*) FROM bank_transactions GROUP BY Location;

-- 24. Transactions per channel
SELECT Channel, COUNT(*) FROM bank_transactions GROUP BY Channel;

-- 25. Amount BETWEEN 1000 AND 5000
SELECT * FROM bank_transactions WHERE TransactionAmount BETWEEN 1000 AND 5000;

-- 26. Amount NOT BETWEEN
SELECT * FROM bank_transactions WHERE TransactionAmount NOT BETWEEN 1000 AND 5000;

-- 27. Amount = 2000
SELECT * FROM bank_transactions WHERE TransactionAmount = 2000;

-- 28. TransactionID starts with 'T'
SELECT * FROM bank_transactions WHERE TransactionID LIKE 'T%';

-- 29. Location contains 'Delhi'
SELECT * FROM bank_transactions WHERE Location LIKE '%Delhi%';

-- 30. Channel contains 'ATM'
SELECT * FROM bank_transactions WHERE Channel LIKE '%ATM%';

-- 31. Age > 50
SELECT * FROM bank_transactions WHERE CustomerAge > 50;

-- 32. Age < 25
SELECT * FROM bank_transactions WHERE CustomerAge < 25;

-- 33. LoginAttempts > 3
SELECT * FROM bank_transactions WHERE LoginAttempts > 3;

-- 34. Duration > 300 sec
SELECT * FROM bank_transactions WHERE TransactionDuration > 300;

-- 35. Balance > 100000
SELECT * FROM bank_transactions WHERE AccountBalance > 100000;

-- 36. MerchantID is NULL
SELECT * FROM bank_transactions WHERE MerchantID IS NULL;

-- 37. DeviceID not NULL
SELECT * FROM bank_transactions WHERE DeviceID IS NOT NULL;

-- 38. IP starts with '192'
SELECT * FROM bank_transactions WHERE IP_Address LIKE '192%';

-- 39. Occupation = 'Engineer'
SELECT * FROM bank_transactions WHERE CustomerOccupation = 'Engineer';

-- 40. Sort by Age DESC
SELECT * FROM bank_transactions ORDER BY CustomerAge DESC;

-- 41. Sort by Balance DESC
SELECT * FROM bank_transactions ORDER BY AccountBalance DESC;

-- 42. Count by TransactionType
SELECT TransactionType, COUNT(*) FROM bank_transactions GROUP BY TransactionType;

-- 43. Count by Occupation
SELECT CustomerOccupation, COUNT(*) FROM bank_transactions GROUP BY CustomerOccupation;

-- 44. Count by Channel
SELECT Channel, COUNT(*) FROM bank_transactions GROUP BY Channel;

-- 45. Count by Location
SELECT Location, COUNT(*) FROM bank_transactions GROUP BY Location;

-- 46. Transactions where amount > avg
SELECT * FROM bank_transactions 
WHERE TransactionAmount > (SELECT AVG(TransactionAmount) FROM bank_transactions);

-- 47. Transactions where amount < avg
SELECT * FROM bank_transactions 
WHERE TransactionAmount < (SELECT AVG(TransactionAmount) FROM bank_transactions);

-- 48. Highest amount transaction
SELECT * FROM bank_transactions 
WHERE TransactionAmount = (SELECT MAX(TransactionAmount) FROM bank_transactions);

-- 49. Lowest amount transaction
SELECT * FROM bank_transactions 
WHERE TransactionAmount = (SELECT MIN(TransactionAmount) FROM bank_transactions);

-- 50. Latest transaction
SELECT * FROM bank_transactions 
WHERE TransactionDate = (SELECT MAX(TransactionDate) FROM bank_transactions);

-- 51. Total amount per account
SELECT AccountID, SUM(TransactionAmount) FROM bank_transactions GROUP BY AccountID;

-- 52. Avg amount per account
SELECT AccountID, AVG(TransactionAmount) FROM bank_transactions GROUP BY AccountID;

-- 53. Max amount per account
SELECT AccountID, MAX(TransactionAmount) FROM bank_transactions GROUP BY AccountID;

-- 54. Min amount per account
SELECT AccountID, MIN(TransactionAmount) FROM bank_transactions GROUP BY AccountID;

-- 55. Total per location
SELECT Location, SUM(TransactionAmount) FROM bank_transactions GROUP BY Location;

-- 56. Avg per location
SELECT Location, AVG(TransactionAmount) FROM bank_transactions GROUP BY Location;

-- 57. Accounts with >5 transactions
SELECT AccountID, COUNT(*) FROM bank_transactions 
GROUP BY AccountID HAVING COUNT(*) > 5;

-- 58. Locations with >10 transactions
SELECT Location, COUNT(*) FROM bank_transactions 
GROUP BY Location HAVING COUNT(*) > 10;

-- 59. Occupations with avg amount > 3000
SELECT CustomerOccupation, AVG(TransactionAmount) 
FROM bank_transactions GROUP BY CustomerOccupation
HAVING AVG(TransactionAmount) > 3000;

-- 60. Accounts with total amount > 20000
SELECT AccountID, SUM(TransactionAmount)
FROM bank_transactions GROUP BY AccountID
HAVING SUM(TransactionAmount) > 20000;

-- 61. Top 5 highest transactions
SELECT * FROM bank_transactions ORDER BY TransactionAmount DESC LIMIT 5;

-- 62. Top 5 lowest transactions
SELECT * FROM bank_transactions ORDER BY TransactionAmount LIMIT 5;

-- 63. Second highest transaction
SELECT * FROM bank_transactions ORDER BY TransactionAmount DESC LIMIT 1 OFFSET 1;

-- 64. Third highest transaction
SELECT * FROM bank_transactions ORDER BY TransactionAmount DESC LIMIT 1 OFFSET 2;

-- 65. Even amounts
SELECT * FROM bank_transactions WHERE TransactionAmount % 2 = 0;

-- 66. Odd amounts
SELECT * FROM bank_transactions WHERE TransactionAmount % 2 != 0;

-- 67. Group by date
SELECT TransactionDate, COUNT(*) FROM bank_transactions GROUP BY TransactionDate;

-- 68. Transactions per account per date
SELECT AccountID, TransactionDate, COUNT(*) 
FROM bank_transactions GROUP BY AccountID, TransactionDate;

-- 69. Avg duration per channel
SELECT Channel, AVG(TransactionDuration) FROM bank_transactions GROUP BY Channel;

-- 70. Max login attempts per account
SELECT AccountID, MAX(LoginAttempts) FROM bank_transactions GROUP BY AccountID;

-- 71. Accounts with high login attempts
SELECT * FROM bank_transactions WHERE LoginAttempts > 5;

-- 72. Transactions above account avg
SELECT * FROM bank_transactions b
WHERE TransactionAmount > (
SELECT AVG(TransactionAmount) FROM bank_transactions 
WHERE AccountID = b.AccountID);

-- 73. Oldest transaction
SELECT * FROM bank_transactions ORDER BY TransactionDate LIMIT 1;

-- 74. Transactions in last date
SELECT * FROM bank_transactions 
WHERE TransactionDate = (SELECT MAX(TransactionDate) FROM bank_transactions);

-- 75. Most used channel
SELECT Channel, COUNT(*) FROM bank_transactions
GROUP BY Channel ORDER BY COUNT(*) DESC LIMIT 1;

-- 76. Most used location
SELECT Location, COUNT(*) FROM bank_transactions
GROUP BY Location ORDER BY COUNT(*) DESC LIMIT 1;

-- 77. Duplicate amounts
SELECT TransactionAmount, COUNT(*) FROM bank_transactions
GROUP BY TransactionAmount HAVING COUNT(*) > 1;

-- 78. Duplicate locations
SELECT Location, COUNT(*) FROM bank_transactions
GROUP BY Location HAVING COUNT(*) > 1;

-- 79. Transactions with same account
SELECT * FROM bank_transactions b1
WHERE EXISTS (
SELECT 1 FROM bank_transactions b2
WHERE b1.AccountID = b2.AccountID
AND b1.TransactionID != b2.TransactionID);

-- 80. Count weekend transactions (approx)
SELECT COUNT(*) FROM bank_transactions;

-- 81. Accounts with max balance
SELECT * FROM bank_transactions
WHERE AccountBalance = (SELECT MAX(AccountBalance) FROM bank_transactions);

-- 82. Accounts with min balance
SELECT * FROM bank_transactions
WHERE AccountBalance = (SELECT MIN(AccountBalance) FROM bank_transactions);

-- 83. Avg age
SELECT AVG(CustomerAge) FROM bank_transactions;

-- 84. Max age
SELECT MAX(CustomerAge) FROM bank_transactions;

-- 85. Min age
SELECT MIN(CustomerAge) FROM bank_transactions;

-- 86. Age group count
SELECT 
CASE 
WHEN CustomerAge < 30 THEN 'Young'
WHEN CustomerAge BETWEEN 30 AND 50 THEN 'Adult'
ELSE 'Senior'
END, COUNT(*)
FROM bank_transactions GROUP BY 1;

-- 87. Occupation with most transactions
SELECT CustomerOccupation, COUNT(*) 
FROM bank_transactions GROUP BY CustomerOccupation
ORDER BY COUNT(*) DESC LIMIT 1;

-- 88. Channel usage percentage
SELECT Channel, COUNT(*)*100.0/(SELECT COUNT(*) FROM bank_transactions)
FROM bank_transactions GROUP BY Channel;

-- 89. Location usage percentage
SELECT Location, COUNT(*)*100.0/(SELECT COUNT(*) FROM bank_transactions)
FROM bank_transactions GROUP BY Location;

-- 90. High value transactions (>10000)
SELECT * FROM bank_transactions WHERE TransactionAmount > 10000;

-- 91. Low value transactions (<100)
SELECT * FROM bank_transactions WHERE TransactionAmount < 100;

-- 92. Accounts with both debit and credit
SELECT AccountID FROM bank_transactions
GROUP BY AccountID HAVING COUNT(DISTINCT TransactionType) > 1;

-- 93. Accounts with only debit
SELECT AccountID FROM bank_transactions
GROUP BY AccountID HAVING COUNT(DISTINCT TransactionType)=1;

-- 94. Max duration transaction
SELECT * FROM bank_transactions 
WHERE TransactionDuration = (SELECT MAX(TransactionDuration) FROM bank_transactions);

-- 95. Min duration transaction
SELECT * FROM bank_transactions 
WHERE TransactionDuration = (SELECT MIN(TransactionDuration) FROM bank_transactions);

-- 96. Avg login attempts
SELECT AVG(LoginAttempts) FROM bank_transactions;

-- 97. High login attempts (>avg)
SELECT * FROM bank_transactions
WHERE LoginAttempts > (SELECT AVG(LoginAttempts) FROM bank_transactions);

-- 98. Count per MerchantID
SELECT MerchantID, COUNT(*) FROM bank_transactions GROUP BY MerchantID;

-- 99. Most frequent Merchant
SELECT MerchantID, COUNT(*) FROM bank_transactions
GROUP BY MerchantID ORDER BY COUNT(*) DESC LIMIT 1;

-- 100. Accounts with highest total amount
SELECT AccountID, SUM(TransactionAmount) 
FROM bank_transactions GROUP BY AccountID
ORDER BY SUM(TransactionAmount) DESC;

-- 101 Total transactions per location
SELECT Location, COUNT(*) 
FROM bank_transactions 
GROUP BY Location;

-- 102 Total transaction amount per location
SELECT Location, SUM(TransactionAmount)
FROM bank_transactions
GROUP BY Location;

-- 103 Locations with more than 50 transactions
SELECT Location, COUNT(*) 
FROM bank_transactions
GROUP BY Location
HAVING COUNT(*) > 50;

-- 104 Accounts with total amount > 50000
SELECT AccountID, SUM(TransactionAmount)
FROM bank_transactions
GROUP BY AccountID
HAVING SUM(TransactionAmount) > 50000;

-- 105 Average transaction per account > 5000
SELECT AccountID, AVG(TransactionAmount)
FROM bank_transactions
GROUP BY AccountID
HAVING AVG(TransactionAmount) > 5000;

-- 106 Count transactions by channel
SELECT Channel, COUNT(*)
FROM bank_transactions
GROUP BY Channel;

-- 107 Channels with avg amount > 3000
SELECT Channel, AVG(TransactionAmount)
FROM bank_transactions
GROUP BY Channel
HAVING AVG(TransactionAmount) > 3000;

-- 108 Count transactions by transaction type
SELECT TransactionType, COUNT(*)
FROM bank_transactions
GROUP BY TransactionType;

-- 109 Transaction types with more than 100 records
SELECT TransactionType, COUNT(*)
FROM bank_transactions
GROUP BY TransactionType
HAVING COUNT(*) > 100;

-- 110 Count transactions by occupation
SELECT CustomerOccupation, COUNT(*)
FROM bank_transactions
GROUP BY CustomerOccupation;

-- 111 Occupations with high avg transaction
SELECT CustomerOccupation, AVG(TransactionAmount)
FROM bank_transactions
GROUP BY CustomerOccupation
HAVING AVG(TransactionAmount) > 5000;

-- 112 Count transactions by age
SELECT CustomerAge, COUNT(*)
FROM bank_transactions
GROUP BY CustomerAge;

-- 113 Ages with more than 20 transactions
SELECT CustomerAge, COUNT(*)
FROM bank_transactions
GROUP BY CustomerAge
HAVING COUNT(*) > 20;

-- 114 Count transactions per device
SELECT DeviceID, COUNT(*)
FROM bank_transactions
GROUP BY DeviceID;

-- 115 Devices used more than 30 times
SELECT DeviceID, COUNT(*)
FROM bank_transactions
GROUP BY DeviceID
HAVING COUNT(*) > 30;

-- 116 Count transactions per IP
SELECT IP_Address, COUNT(*)
FROM bank_transactions
GROUP BY IP_Address;

-- 117 IPs used more than 25 times
SELECT IP_Address, COUNT(*)
FROM bank_transactions
GROUP BY IP_Address
HAVING COUNT(*) > 25;

-- 118 Count transactions per merchant
SELECT MerchantID, COUNT(*)
FROM bank_transactions
GROUP BY MerchantID;

-- 119 Merchants with high revenue (>20000)
SELECT MerchantID, SUM(TransactionAmount)
FROM bank_transactions
GROUP BY MerchantID
HAVING SUM(TransactionAmount) > 20000;

-- 120 Average transaction duration per channel
SELECT Channel, AVG(TransactionDuration)
FROM bank_transactions
GROUP BY Channel;

-- 121 Categorize transaction size
SELECT TransactionID,
CASE 
WHEN TransactionAmount < 1000 THEN 'Low'
WHEN TransactionAmount < 5000 THEN 'Medium'
ELSE 'High'
END AS Transaction_Category
FROM bank_transactions;

-- 122 Categorize login risk
SELECT TransactionID,
CASE 
WHEN LoginAttempts <= 2 THEN 'Safe'
WHEN LoginAttempts <= 5 THEN 'Warning'
ELSE 'Risky'
END AS Login_Risk
FROM bank_transactions;

-- 123 Age group classification
SELECT CustomerAge,
CASE 
WHEN CustomerAge < 25 THEN 'Young'
WHEN CustomerAge < 50 THEN 'Adult'
ELSE 'Senior'
END AS Age_Group
FROM bank_transactions;

-- 124 Channel classification
SELECT Channel,
CASE 
WHEN Channel = 'Online' THEN 'Digital'
ELSE 'Offline'
END AS Channel_Type
FROM bank_transactions;

-- 125 High balance flag
SELECT AccountID,
CASE 
WHEN AccountBalance > 10000 THEN 'High Balance'
ELSE 'Low Balance'
END
FROM bank_transactions;

-- 126 Count transactions by amount category
SELECT 
CASE 
WHEN TransactionAmount < 1000 THEN 'Low'
WHEN TransactionAmount < 5000 THEN 'Medium'
ELSE 'High'
END AS Category,
COUNT(*)
FROM bank_transactions
GROUP BY Category;

-- 127 Average amount by age group
SELECT 
CASE 
WHEN CustomerAge < 25 THEN 'Young'
WHEN CustomerAge < 50 THEN 'Adult'
ELSE 'Senior'
END AS Age_Group,
AVG(TransactionAmount)
FROM bank_transactions
GROUP BY Age_Group;

-- 128 Count risky login per category
SELECT 
CASE 
WHEN LoginAttempts > 5 THEN 'High Risk'
ELSE 'Low Risk'
END,
COUNT(*)
FROM bank_transactions
GROUP BY 1;

-- 129 Total amount per channel type
SELECT 
CASE 
WHEN Channel = 'Online' THEN 'Digital'
ELSE 'Offline'
END,
SUM(TransactionAmount)
FROM bank_transactions
GROUP BY 1;

-- 130 Accounts with more than 10 transactions
SELECT AccountID, COUNT(*)
FROM bank_transactions
GROUP BY AccountID
HAVING COUNT(*) > 10;

-- 131 Accounts with avg balance > 10000
SELECT AccountID, AVG(AccountBalance)
FROM bank_transactions
GROUP BY AccountID
HAVING AVG(AccountBalance) > 10000;

-- 132 Locations with avg duration > 200
SELECT Location, AVG(TransactionDuration)
FROM bank_transactions
GROUP BY Location
HAVING AVG(TransactionDuration) > 200;

-- 133 Channels with high login attempts
SELECT Channel, AVG(LoginAttempts)
FROM bank_transactions
GROUP BY Channel
HAVING AVG(LoginAttempts) > 3;

-- 134 Occupations with more than 100 transactions
SELECT CustomerOccupation, COUNT(*)
FROM bank_transactions
GROUP BY CustomerOccupation
HAVING COUNT(*) > 100;

-- 135 Transactions by location & channel
SELECT Location, Channel, COUNT(*)
FROM bank_transactions
GROUP BY Location, Channel;

-- 136 Amount by occupation & channel
SELECT CustomerOccupation, Channel, SUM(TransactionAmount)
FROM bank_transactions
GROUP BY CustomerOccupation, Channel;

-- 137 Avg amount by age & type
SELECT CustomerAge, TransactionType, AVG(TransactionAmount)
FROM bank_transactions
GROUP BY CustomerAge, TransactionType;

-- 138 Count by merchant & channel
SELECT MerchantID, Channel, COUNT(*)
FROM bank_transactions
GROUP BY MerchantID, Channel;

-- 139 Top 5 locations by transactions
SELECT Location, COUNT(*) 
FROM bank_transactions
GROUP BY Location
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 140 Top 5 merchants by revenue
SELECT MerchantID, SUM(TransactionAmount)
FROM bank_transactions
GROUP BY MerchantID
ORDER BY SUM(TransactionAmount) DESC
LIMIT 5;

-- 141 Percentage of transactions per channel
SELECT Channel,
COUNT(*)*100/(SELECT COUNT(*) FROM bank_transactions)
FROM bank_transactions
GROUP BY Channel;

-- 142 Percentage contribution per merchant
SELECT MerchantID,
SUM(TransactionAmount)*100/(SELECT SUM(TransactionAmount) FROM bank_transactions)
FROM bank_transactions
GROUP BY MerchantID;

-- 143 Find most common location
SELECT Location, COUNT(*)
FROM bank_transactions
GROUP BY Location
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 144 Find least used channel
SELECT Channel, COUNT(*)
FROM bank_transactions
GROUP BY Channel
ORDER BY COUNT(*) ASC
LIMIT 1;

-- 145 Find most active account
SELECT AccountID, COUNT(*)
FROM bank_transactions
GROUP BY AccountID
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 146 Find least active account
SELECT AccountID, COUNT(*)
FROM bank_transactions
GROUP BY AccountID
ORDER BY COUNT(*) ASC
LIMIT 1;

-- 147 Find highest avg transaction location
SELECT Location, AVG(TransactionAmount)
FROM bank_transactions
GROUP BY Location
ORDER BY AVG(TransactionAmount) DESC
LIMIT 1;

-- 148 Find lowest avg transaction location
SELECT Location, AVG(TransactionAmount)
FROM bank_transactions
GROUP BY Location
ORDER BY AVG(TransactionAmount)
LIMIT 1;

-- 149 Find channel with highest total amount
SELECT Channel, SUM(TransactionAmount)
FROM bank_transactions
GROUP BY Channel
ORDER BY SUM(TransactionAmount) DESC
LIMIT 1;

-- 150 Final grouped summary by type
SELECT TransactionType,
COUNT(*),
SUM(TransactionAmount),
AVG(TransactionAmount)
FROM bank_transactions
GROUP BY TransactionType;