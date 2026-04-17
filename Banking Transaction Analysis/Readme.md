# Banking Transaction Analysis

## Overview

This project analyzes banking transaction data and provides SQL scripts for day-to-day reporting, fraud detection, loan management, customer activity, and more, using real-world transaction records. It is intended for financial analysts, banking professionals, or data engineers working to better understand transaction patterns and customer behavior.

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Data Sources](#data-sources)
- [SQL Queries & Use Cases](#sql-queries--use-cases)
- [How to Use](#how-to-use)
- [Sample Analysis Topics](#sample-analysis-topics)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

```
Banking Transaction Analysis/
│
├── Banking Transaction Analysis.sql   # Collection of analytics/reporting SQL queries
└── banking_transactions.csv           # Transaction and customer dataset (sample data)
```

## Features

- Transaction fraud detection
- Loan repayment tracking
- Customer segmentation (active, dormant, multi-account, city-wise, etc.)
- Monthly and city-wise spending analyses
- Top performing customers and loan officers
- Average balances and lifetime value reporting

## Data Sources

- **banking_transactions.csv:** Synthetic dataset capturing transaction, account, loan, and customer details across Indian cities.  
  **Columns include:**  
  - Customer ID, Name, Gender, Age, City  
  - Account info (type, balance, account no.)  
  - Transaction details (ID, date, type, amount, receiver account)  
  - Loan info (ID, amount, paid/remaining, etc.)  

## SQL Queries & Use Cases

**Banking Transaction Analysis.sql** contains 22+ ready-to-use SQL queries for:

- Suspicious transactions (amount > 100,000)
- Rapid transfers detection (potential fraud within 1 hour)
- High monthly volume reporting
- Loan progress and overdue loan identification
- Credit card upgrade eligibility
- Dormant customers/accounts identification
- Top customers, city-wise and officer-wise analyses
- Deposits/withdrawals summary and more



## How to Use

1. **Load the dataset**  
   - Import `banking_transactions.csv` into your SQL database.
   - Table structure recommendations:
     - `Customers`
     - `Accounts`
     - `Transactions`
     - `Loans`
   - Use provided columns to design your schema.

2. **Run the SQL queries**  
   - Open `Banking Transaction Analysis.sql`.
   - Execute queries in your SQL environment (MySQL flavor, but easily adaptable).

3. **Customize/Extend**
   - Modify existing queries for more granular reporting.
   - Combine or chain queries for deeper analytics.

## Sample Analysis Topics

- Fraud & risk: rapid transfers, suspicious amounts, loan default risk
- Customer profiling: lifetime value, retention, upgrades eligibility
- Productivity: best loan officers, top spenders
- Regional activity: city-wise transaction volume and analysis
- Operational summaries: average balances, overdue/dormant accounts

## Contributing

1. Fork this repo and make your changes.
2. Add new SQL queries, use cases, or expand the sample data.
3. Submit a pull request with details.

## License

This project is released under the MIT License.

---

**Author:** [PANAKAJ01](https://github.com/PANAKAJ01)
