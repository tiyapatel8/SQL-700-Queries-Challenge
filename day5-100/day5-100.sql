-- 1 Show all records
SELECT * FROM transactions;

-- 2 Show Transaction_ID and Amount
SELECT Transaction_ID, Amount FROM transactions;

-- 3 Count total transactions
SELECT COUNT(*) FROM transactions;

-- 4 Total revenue
SELECT SUM(Amount) FROM transactions;

-- 5 Average transaction amount
SELECT AVG(Amount) FROM transactions;

-- 6 Maximum transaction amount
SELECT MAX(Amount) FROM transactions;

-- 7 Minimum transaction amount
SELECT MIN(Amount) FROM transactions;

-- 8 Distinct categories
SELECT DISTINCT Category FROM transactions;

-- 9 Distinct payment methods
SELECT DISTINCT Payment_Method FROM transactions;

-- 10 Transactions above 5000
SELECT * FROM transactions WHERE Amount > 5000;

-- 11 Transactions below 1000
SELECT * FROM transactions WHERE Amount < 1000;

-- 12 Transactions between 2000 and 4000
SELECT * FROM transactions WHERE Amount BETWEEN 2000 AND 4000;

-- 13 Transactions for Food category
SELECT * FROM transactions WHERE Category='Food';

-- 14 Transactions for UPI
SELECT * FROM transactions WHERE Payment_Method='UPI';

-- 15 Sort by Amount descending
SELECT * FROM transactions ORDER BY Amount DESC;

-- 16 Sort by Date ascending
SELECT * FROM transactions ORDER BY Date ASC;

-- 17 Top 5 highest transactions
SELECT * FROM transactions ORDER BY Amount DESC LIMIT 5;

-- 18 Lowest 5 transactions
SELECT * FROM transactions ORDER BY Amount ASC LIMIT 5;

-- 19 Count transactions per category
SELECT Category, COUNT(*) FROM transactions GROUP BY Category;

-- 20 Count transactions per payment method
SELECT Payment_Method, COUNT(*) FROM transactions GROUP BY Payment_Method;

-- 21 Total revenue per category
SELECT Category, SUM(Amount) FROM transactions GROUP BY Category;

-- 22 Total revenue per payment method
SELECT Payment_Method, SUM(Amount) FROM transactions GROUP BY Payment_Method;

-- 23 Average amount per category
SELECT Category, AVG(Amount) FROM transactions GROUP BY Category;

-- 24 Average amount per payment method
SELECT Payment_Method, AVG(Amount) FROM transactions GROUP BY Payment_Method;

-- 25 Month-wise transaction count
SELECT MONTH(Date), COUNT(*) FROM transactions GROUP BY MONTH(Date);

-- 26 Month-wise total revenue
SELECT MONTH(Date), SUM(Amount) FROM transactions GROUP BY MONTH(Date);

-- 27 Highest revenue category
SELECT Category, SUM(Amount) total FROM transactions GROUP BY Category ORDER BY total DESC LIMIT 1;

-- 28 Lowest revenue category
SELECT Category, SUM(Amount) total FROM transactions GROUP BY Category ORDER BY total ASC LIMIT 1;

-- 29 Highest used payment method
SELECT Payment_Method, COUNT(*) total FROM transactions GROUP BY Payment_Method ORDER BY total DESC LIMIT 1;

-- 30 Lowest used payment method
SELECT Payment_Method, COUNT(*) total FROM transactions GROUP BY Payment_Method ORDER BY total ASC LIMIT 1;

-- 31 Transactions above average
SELECT * FROM transactions WHERE Amount > (SELECT AVG(Amount) FROM transactions);

-- 32 Transactions below average
SELECT * FROM transactions WHERE Amount < (SELECT AVG(Amount) FROM transactions);

-- 33 Second highest transaction
SELECT MAX(Amount) FROM transactions WHERE Amount < (SELECT MAX(Amount) FROM transactions);

-- 34 Third highest transaction
SELECT Amount FROM transactions ORDER BY Amount DESC LIMIT 1 OFFSET 2;

-- 35 Daily total revenue
SELECT Date, SUM(Amount) FROM transactions GROUP BY Date;

-- 36 Daily average amount
SELECT Date, AVG(Amount) FROM transactions GROUP BY Date;

-- 37 Categories with avg > 5000
SELECT Category, AVG(Amount) FROM transactions GROUP BY Category HAVING AVG(Amount) > 5000;

-- 38 Payment methods with revenue > 6000000
SELECT Payment_Method, SUM(Amount) FROM transactions GROUP BY Payment_Method HAVING SUM(Amount) > 6000000;

-- 39 Running total revenue
SELECT Date, SUM(Amount) OVER (ORDER BY Date) FROM transactions;

-- 40 Rank transactions by amount
SELECT Transaction_ID, Amount, RANK() OVER (ORDER BY Amount DESC) FROM transactions;

-- 41 Dense rank transactions
SELECT Transaction_ID, Amount, DENSE_RANK() OVER (ORDER BY Amount DESC) FROM transactions;

-- 42 NTILE 4 buckets
SELECT Transaction_ID, NTILE(4) OVER (ORDER BY Amount DESC) FROM transactions;

-- 43 Top transaction per category
SELECT * FROM (
SELECT *, RANK() OVER (PARTITION BY Category ORDER BY Amount DESC) rnk
FROM transactions) t WHERE rnk=1;

-- 44 Revenue percentage by category
SELECT Category,
SUM(Amount)*100/(SELECT SUM(Amount) FROM transactions)
FROM transactions GROUP BY Category;

-- 45 Usage percentage by payment method
SELECT Payment_Method,
COUNT(*)*100/(SELECT COUNT(*) FROM transactions)
FROM transactions GROUP BY Payment_Method;

-- 46 Weekend transactions
SELECT * FROM transactions WHERE DAYOFWEEK(Date) IN (1,7);

-- 47 Weekday transactions
SELECT * FROM transactions WHERE DAYOFWEEK(Date) NOT IN (1,7);

-- 48 Create view monthly revenue
CREATE VIEW monthly_revenue AS
SELECT MONTH(Date) m, SUM(Amount) total
FROM transactions GROUP BY m;

-- 49 Create index on Date
CREATE INDEX idx_date ON transactions(Date);

-- 50 Create temp table high transactions
CREATE TEMP TABLE high_txn AS
SELECT * FROM transactions WHERE Amount>8000;

-- 51 Update payment method
UPDATE transactions SET Payment_Method='UPI' WHERE Transaction_ID=10;

-- 52 Delete small transactions
DELETE FROM transactions WHERE Amount<100;

-- 53 Insert new record
INSERT INTO transactions VALUES (7001,'2026-03-25','Food','UPI',4500);

-- 54 Case classify high/low
SELECT Transaction_ID,
CASE WHEN Amount>5000 THEN 'High' ELSE 'Low' END
FROM transactions;

-- 55 Case digital vs card
SELECT Payment_Method,
CASE WHEN Payment_Method IN ('UPI','Net Banking') THEN 'Digital'
ELSE 'Card' END
FROM transactions;

-- 56 Month name
SELECT Date,
CASE MONTH(Date)
WHEN 1 THEN 'Jan'
WHEN 2 THEN 'Feb'
WHEN 3 THEN 'Mar'
END
FROM transactions;

-- 57 Category revenue sorted desc
SELECT Category, SUM(Amount) total
FROM transactions GROUP BY Category ORDER BY total DESC;

-- 58 Payment revenue sorted asc
SELECT Payment_Method, SUM(Amount) total
FROM transactions GROUP BY Payment_Method ORDER BY total ASC;

-- 59 Count per day sorted desc
SELECT Date, COUNT(*) total
FROM transactions GROUP BY Date ORDER BY total DESC;

-- 60 Max transaction per month
SELECT MONTH(Date), MAX(Amount)
FROM transactions GROUP BY MONTH(Date);

-- 61 Min transaction per month
SELECT MONTH(Date), MIN(Amount)
FROM transactions GROUP BY MONTH(Date);

-- 62 Avg transaction per month
SELECT MONTH(Date), AVG(Amount)
FROM transactions GROUP BY MONTH(Date);

-- 63 Total transactions per month
SELECT MONTH(Date), COUNT(*)
FROM transactions GROUP BY MONTH(Date);

-- 64 Transactions in Jan
SELECT * FROM transactions WHERE MONTH(Date)=1;

-- 65 Transactions in Feb
SELECT * FROM transactions WHERE MONTH(Date)=2;

-- 66 Transactions in Mar
SELECT * FROM transactions WHERE MONTH(Date)=3;

-- 67 Revenue Jan
SELECT SUM(Amount) FROM transactions WHERE MONTH(Date)=1;

-- 68 Revenue Feb
SELECT SUM(Amount) FROM transactions WHERE MONTH(Date)=2;

-- 69 Revenue Mar
SELECT SUM(Amount) FROM transactions WHERE MONTH(Date)=3;

-- 70 Find duplicate Transaction_ID
SELECT Transaction_ID, COUNT(*)
FROM transactions GROUP BY Transaction_ID HAVING COUNT(*)>1;

-- 71 Transactions equal to max
SELECT * FROM transactions WHERE Amount=(SELECT MAX(Amount) FROM transactions);

-- 72 Transactions equal to min
SELECT * FROM transactions WHERE Amount=(SELECT MIN(Amount) FROM transactions);

-- 73 Cumulative by category
SELECT Category, Amount,
SUM(Amount) OVER (PARTITION BY Category ORDER BY Date)
FROM transactions;

-- 74 Lag previous amount
SELECT Transaction_ID, Amount,
LAG(Amount) OVER (ORDER BY Date)
FROM transactions;

-- 75 Lead next amount
SELECT Transaction_ID, Amount,
LEAD(Amount) OVER (ORDER BY Date)
FROM transactions;

-- 76 Difference from previous
SELECT Transaction_ID, Amount -
LAG(Amount) OVER (ORDER BY Date)
FROM transactions;

-- 77 Top 3 per category
SELECT * FROM (
SELECT *, RANK() OVER (PARTITION BY Category ORDER BY Amount DESC) r
FROM transactions) t WHERE r<=3;

-- 78 Categories with more than 800 transactions
SELECT Category, COUNT(*)
FROM transactions GROUP BY Category HAVING COUNT(*)>800;

-- 79 Payment methods avg > overall avg
SELECT Payment_Method, AVG(Amount)
FROM transactions GROUP BY Payment_Method
HAVING AVG(Amount)>(SELECT AVG(Amount) FROM transactions);

-- 80 Std deviation
SELECT STDDEV(Amount) FROM transactions;

-- 81 Variance
SELECT VARIANCE(Amount) FROM transactions;

-- 82 Median (approx)
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Amount) FROM transactions;

-- 83 7-day rolling avg
SELECT Date,
AVG(Amount) OVER (ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
FROM transactions;

-- 84 Revenue growth per day
SELECT Date,
SUM(Amount) - LAG(SUM(Amount)) OVER (ORDER BY Date)
FROM transactions GROUP BY Date;

-- 85 Highest revenue day
SELECT Date, SUM(Amount) total
FROM transactions GROUP BY Date ORDER BY total DESC LIMIT 1;

-- 86 Lowest revenue day
SELECT Date, SUM(Amount) total
FROM transactions GROUP BY Date ORDER BY total ASC LIMIT 1;

-- 87 Count high value >8000
SELECT COUNT(*) FROM transactions WHERE Amount>8000;

-- 88 Revenue high value >8000
SELECT SUM(Amount) FROM transactions WHERE Amount>8000;

-- 89 Percent high value
SELECT COUNT(*)*100/(SELECT COUNT(*) FROM transactions)
FROM transactions WHERE Amount>8000;

-- 90 Digital payment revenue
SELECT SUM(Amount) FROM transactions
WHERE Payment_Method IN ('UPI','Net Banking');

-- 91 Card payment revenue
SELECT SUM(Amount) FROM transactions
WHERE Payment_Method IN ('Credit Card','Debit Card');

-- 92 Revenue Food Jan
SELECT SUM(Amount) FROM transactions
WHERE Category='Food' AND MONTH(Date)=1;

-- 93 Revenue Travel Feb
SELECT SUM(Amount) FROM transactions
WHERE Category='Travel' AND MONTH(Date)=2;

-- 94 Revenue Shopping Mar
SELECT SUM(Amount) FROM transactions
WHERE Category='Shopping' AND MONTH(Date)=3;

-- 95 Count Food UPI
SELECT COUNT(*) FROM transactions
WHERE Category='Food' AND Payment_Method='UPI';

-- 96 Count Travel Card
SELECT COUNT(*) FROM transactions
WHERE Category='Travel' AND Payment_Method IN ('Credit Card','Debit Card');

-- 97 Avg Food amount
SELECT AVG(Amount) FROM transactions WHERE Category='Food';

-- 98 Avg Travel amount
SELECT AVG(Amount) FROM transactions WHERE Category='Travel';

-- 99 Max per payment method
SELECT Payment_Method, MAX(Amount)
FROM transactions GROUP BY Payment_Method;

-- 100 Final KPI summary
SELECT COUNT(*) total_txn,
SUM(Amount) total_revenue,
AVG(Amount) avg_amount,
MAX(Amount) max_amount,
MIN(Amount) min_amount
FROM transactions;
