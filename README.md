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
  - Plot of Distribution of Transactions amounts
  - Scatter plot of V1 vs V2 by fraud class
  - Time based fraud pattern
                        
# Tools
SQlite, Jupyter Notebooks

# Findings
- Fraudulent transactions are more likely in high-value transactions (>99th percentile).
- Early morning transactions (12 AM–6 AM) show a higher fraud rate.
- Isolation forest detected 0.17% of transactions as anomalies, aligning with the dataset's fraud rate

# Deliverables
- [SQL Queries](SQL%20Scripts/Fraud%20Detection%20SQL%20queries.md)
- [Fraud_detection.ipynb](fraud_detection.ipynb)
- [Visualizations](Visualizations)
