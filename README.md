# Credit Card Fraud Analytics & Anomaly Detection

## Overview

An end-to-end data analytics project investigating transaction patterns
associated with credit card fraud.

The project uses **SQL, Python, statistical analysis and unsupervised
anomaly detection** to answer business questions around transaction
value, transaction timing and unusual transaction behavior.

The dataset contains credit card transactions made by European cardholders over two days in September 2013.

## Key Findings

• Early-morning transactions had a **3.5×** higher observed fraud rate
  than transactions during other hours.

• Transactions in the **top 1%** by amount had approximately **1.9×**
  the fraud rate of other transactions.

• High transaction-volume periods did not show elevated fraud rates.

• Isolation Forest identified **146** anomalous transactions, **30** of
  which were confirmed fraudulent.

## Business Recommendation

Anomaly detection should be used as a supporting signal for
investigation prioritization rather than as a standalone fraud
decisioning model.

---



## Business Problem

Financial institutions need to identify transactions that exhibit unusual behavior and understand the conditions under which fraudulent activity is more likely to occur.

This project investigates three key questions:

1. When are fraudulent transactions more likely to occur?
2. Are high-value or unusually frequent transactions associated with fraud?
3. Can an unsupervised anomaly detection model identify transactions that resemble fraudulent activity?

The objective is to identify interpretable patterns that could support fraud monitoring and investigation.

---

## Dataset

**Source:** Kaggle — Credit Card Fraud Detection

The original dataset contains:

- **284,807 transactions**
- **30 input variables**
- **1 target variable (`Class`)**
- `V1–V28`: anonymized numerical transaction features
- `Time`: seconds elapsed between each transaction and the first transaction
- `Amount`: transaction amount
- `Class`: target variable
  - `0` = legitimate transaction
  - `1` = fraudulent transaction

The dataset is highly imbalanced, with fraudulent transactions representing approximately **0.17%** of all transactions.

---

## Analysis Approach

### 1. SQL Analysis

SQL was used to investigate transaction patterns and identify potentially higher-risk activity.

Key analyses included:

- **Early-morning transactions:** transactions occurring between 12 AM and 6 AM
- **Frequent transaction activity:** identifying periods with more than 5 transactions within one hour
- **High-value transactions:** identifying transactions within the highest transaction-amount percentiles
- **Hourly transaction activity:** examining transaction volume and variation across hourly blocks
- Comparing transaction counts and fraud rates across relevant groups

SQLite was used to execute the SQL analysis.

---

### 2. Python / Jupyter Analysis

Python was used to validate the SQL findings, perform exploratory data analysis, engineer additional features and prepare the dataset for anomaly detection.

Key analyses included:

- Distribution of transaction amounts
- Fraud distribution across transaction characteristics
- Fraud patterns by time of day
- Comparison of fraud rates for high-value transactions
- Scatter plot analysis of anonymized features such as `V1` and `V2`
- Time-based fraud pattern analysis
- Validation of SQL results using SQLite and pandas

---

## Feature Engineering

Additional behavioral features were created to provide the anomaly detection model with additional transaction information.

### Log_Amount

A log transformation was applied to transaction amount:
```python
Log_Amount = np.log1p(Amount)
```

This reduces the effect of highly skewed transaction amounts and makes the distribution more suitable for analysis and modelling.

### `Hour`

The original `Time` variable was converted into the hour of the day to enable time-based behavioral analysis.

### `Is_Early_Morning`

A binary feature was created to identify transactions occurring between **12 AM and 5 AM**:

- `1` = early-morning transaction
- `0` = other transaction

---

## Anomaly Detection

An **Isolation Forest** model was used to identify transactions that appear unusual based on their feature combinations.

The model was trained using **31 features**:

- `V1–V28` → 28 original anonymized features
- `Log_Amount`
- `Hour`
- `Is_Early_Morning`

The fraud label (`Class`) was **not used as a model feature**, allowing the Isolation Forest to perform unsupervised anomaly detection.

The known fraud labels were retained separately for evaluating how well the detected anomalies corresponded with actual fraudulent transactions.

---

## Key Findings

### High-Value Transactions

Transactions in the highest transaction-amount percentile showed a higher concentration of fraudulent activity than the overall dataset.

This suggests that transaction amount can be a useful signal when prioritizing transactions for fraud investigation.

### Time-Based Fraud Patterns

Fraud rates varied across time periods, with **early-morning transactions (12 AM–6 AM)** showing elevated fraud activity compared with the broader transaction population.

This indicates that time of transaction may provide useful behavioral context for fraud monitoring.

### Transaction Activity

Hourly transaction analysis was used to identify periods of unusually high transaction activity and investigate whether transaction frequency provides additional information for fraud detection.

### Anomaly Detection

The Isolation Forest identified a subset of transactions as anomalous.

The model achieved approximately **21% precision** for the fraud class based on the classification report.

Because the dataset is extremely imbalanced, model performance was evaluated using fraud-focused metrics rather than accuracy alone.

---

## Tools & Technologies

- **Python**
- **Pandas**
- **NumPy**
- **Scikit-learn**
- **Matplotlib**
- **SQLite**
- **SQL**
- **Jupyter Notebook**
- **Git / GitHub**

---

## Project Structure

```text
Credit_Card_Fraud_Detection/
│
├── SQL Scripts/
│   └── Fraud Detection SQL queries.md
│
├── Visualizations/
│   └── [visualization files]
│
├── fraud_detection_final.ipynb
│
└── README.md
```

# Deliverables
- [SQL Queries](SQL%20Scripts/fraud_analytics_detection.sql)
- [Fraud_analytics_detection.ipynb](fraud_analytics_detection.ipynb)
- [Visualizations](Visualizations)

## How to Run

1. Clone or download the repository.
2. Open `fraud_analytics_detection.ipynb` in Jupyter Notebook or VS Code.
3. Install the required Python libraries if necessary.
4. Run the notebook cells sequentially.
5. The SQL analysis can be reviewed in the `SQL Scripts` folder.

---

## Limitations

- The dataset contains an extremely small proportion of fraudulent transactions, making fraud detection a highly imbalanced problem.
- `V1–V28` are anonymized features, limiting direct business interpretation of individual variables.
- The analysis covers transactions collected over only two days.
- Isolation Forest identifies statistical anomalies, which do not necessarily correspond to fraudulent activity.
- The analysis is exploratory and should not be interpreted as a production fraud detection system.

---

## Future Improvements

Potential next steps include:

- Compare Isolation Forest with other anomaly detection methods such as **Local Outlier Factor and Autoencoders**.
- Evaluate supervised models such as **Logistic Regression, Random Forest, and XGBoost** using appropriate imbalance-aware metrics.
- Perform hyperparameter tuning for the Isolation Forest.
- Investigate precision-recall trade-offs at different anomaly thresholds.
- Develop additional behavioral features based on transaction frequency, spending patterns and time-based activity.
- Build an interactive dashboard to communicate fraud patterns and investigation priorities to non-technical stakeholders.
