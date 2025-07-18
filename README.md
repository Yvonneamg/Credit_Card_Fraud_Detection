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
- High-value transactions (>99th percentile) show a higher proportion of fraud.
- Time-based analysis suggests fraud is more common in early morning hoursDSP hours (12 AM–6 AM).
- The Isolation Forest model detected fraud with a precision of 21% (see classification report).
- The dataset is highly imbalanced (0.17% fraud), which may affect model performance.

# Deliverables
- [SQL Queries](SQL%20Scripts/Fraud%20Detection%20SQL%20queries.md)
- [Fraud_detection.ipynb](fraud_detection.ipynb)
- [Visualizations](Visualizations)

# How to run
- Open Fraud_detections.ipynb and run on notebooks, follow the instructions on Fraud_detections.html
- Open SQLite and run SQL Queries
# Future Improvements
- **SMOTE**: Use Synthetic Minority Oversampling Technique to balance the dataset for better model training.
- **Feature Engineering**: Explore additional feature combinations or domain-specific features.
- **Advanced Models**: Try other anomaly detection methods (e.g., Autoencoders) or supervised models.
