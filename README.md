# Credit_Card_Fraud_Detection

# Overview
Analyzed Credit Card Fraud Detection dataset to detect anolmalies in credit card transactions that occured in 2 days in September 2013 by European credit card holders.

# Problem
The busines needs insight into periods when fraudlent transactions are highly likely within a period of 24 hours, which transactions are likely to be fraudulent and which transactions are anomalies.

# Dataset
- Source: Kaggle Credit Card Fraud Detection
- Features: 31 columns (Time, V1–V28, Amount, Class)

# Approach
- **SQL** : Queried early morning transactions between 12 AM and 6 AM, Frequent transactions more than 5 transactions in 1 hour, Hight transactions customers that is top 1% customers by amount.
- **Jupyter Notebooks** : Ran the SQL Queries on Jupyter notebooks as well by using sqlite3 to verify the dataset. Analyze the results, that is, check fraud distribution among the top 1% customers by amount and compare with results from SQlite. It should be a similar result.

tfguyuh
                        


# Tools
SQlite, Jupyter Notebooks

# Deliverables
- [SQL Queries](SQL%20Scripts/Fraud%20Detection%20SQL%20queries.md)
