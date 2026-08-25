--- Selecting top 5 rows from the transactions table to check the database connection and data
SELECT * 
FROM transactions 
LIMIT 5;

--- Counting the total number of transactions, the number of fraudulent transactions and calculating the fraud rate
SELECT 
    COUNT(*) AS Transactions,
    SUM(Class) AS Fraud_Count,
    AVG(Class) * 100 AS Fraud_Rate
FROM transactions;

--- Analyzing the distribution of transactions by amount and calculating the fraud rate for each amount percentile
WITH ranked_transactions AS (
    SELECT
        Amount,
        Class,
        NTILE(100) OVER (ORDER BY Amount DESC) AS amount_percentile
    FROM transactions
)

SELECT
    CASE
        WHEN amount_percentile = 1 THEN 'Top 1% by Amount'
        ELSE 'Other 99%'
    END AS Transaction_Group,
    COUNT(*) AS Transactions,
    SUM(Class) AS Fraud_Count,
    AVG(Class) * 100 AS Fraud_Rate,
    AVG(Amount) AS Average_Amount
FROM ranked_transactions
GROUP BY Transaction_Group;

--- Analyzing the distribution of transactions by hour of the day and calculating the fraud rate for each hour
SELECT
    CAST(strftime('%H', time, 'unixepoch') AS INTEGER) AS Hour,
    COUNT(*) AS Transactions,
    SUM(Class) AS Fraud_Count,
    AVG(Class) * 100 AS Fraud_Rate
FROM transactions
GROUP BY Hour
ORDER BY Hour;

--- Analyzing the distribution of transactions by time of day (Early Morning vs Other Hours) and calculating the fraud rate for each group
SELECT
    CASE
        WHEN CAST(strftime('%H', time, 'unixepoch') AS INTEGER)
             BETWEEN 0 AND 5
        THEN 'Early Morning'
        ELSE 'Other Hours'
    END AS Time_Group,
    
    COUNT(*) AS Transactions,
    SUM(Class) AS Fraud_Count,
    AVG(Class) * 100 AS Fraud_Rate

FROM transactions

GROUP BY Time_Group;

--- Analyzing the distribution of transactions by hour of the day and calculating the fraud rate for each hour block
WITH hourly_activity AS (
    SELECT
        CAST(time / 3600 AS INTEGER) AS Hour_Block,
        COUNT(*) AS Transaction_Count,
        SUM(Class) AS Fraud_Count,
        AVG(Class) * 100 AS Fraud_Rate
    FROM transactions
    GROUP BY Hour_Block
)

SELECT
    Hour_Block,
    Transaction_Count,
    Fraud_Count,
    Fraud_Rate
FROM hourly_activity
ORDER BY Transaction_Count DESC;

--- Analyzing the distribution of transactions by hour of the day and calculating the fraud rate for each hour block
SELECT
    CAST(time / 3600 AS INTEGER) AS Hour_Block,
    COUNT(*) AS Transaction_Count,
    SUM(Class) AS Fraud_Count,
    AVG(Class) * 100 AS Fraud_Rate
FROM transactions
GROUP BY Hour_Block
ORDER BY Transaction_Count DESC;
