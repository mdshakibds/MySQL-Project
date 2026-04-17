# Hospital Management System SQL Project

## Overview

This project provides comprehensive SQL analytics and sample data for a hospital management system. It is designed for healthcare professionals, data analysts, and developers to help manage patient records, appointments, billing, room utilization, department performance, and more within a hospital environment.

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Data Sources](#data-sources)
- [Key SQL Queries](#key-sql-queries)
- [How to Use](#how-to-use)
- [Sample Analysis Topics](#sample-analysis-topics)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

```
Hospital Management/
├── Hospital Management System.sql       # Pre-built SQL analytics/reporting queries
└── Hospital_Management_System.csv       # Sample hospital management data
```

## Features

- Identify currently admitted patients, room/bed occupancy, frequent diagnoses
- Calculate hospital and departmental revenue; analyze average bill per department/gender
- Track admissions per department/month/day; monitor insurance provider trends
- List patients with unpaid/pending bills, and summarize payment status totals
- Report doctor/patient volumes, doctor/department revenue, most frequent treatments
- Analyze stay duration per department and room utilization rates

## Data Sources

- **Hospital_Management_System.csv:**  
  - Realistic sample data: patients, doctors, departments, appointments, medication, billing.
  - Includes: Patient ID, Name, Gender, Age, Doctor, Department, Appointment details, Medication, Billing, Payment status.

## Key SQL Queries

The file [`Hospital Management System.sql`](Hospital%20Management/Hospital%20Management%20System.sql) includes ready-to-run queries for:

- Currently admitted patients / department / room
- Hospital revenue & departmental breakdown
- Unpaid/pending bills and payment status
- Admissions by department/month/day
- Doctor with most patients; doctors with highest revenue
- Most common diagnoses; treatments per department
- Room utilization, average stay per department
- Gender statistics, average bill by gender
- Average revenue per patient and more

See the SQL script for detailed queries covering analytics, management, and reporting needs.

## How to Use

1. **Prepare the data**
    - Import `Hospital_Management_System.csv` into your SQL database.
    - Recommended schema: a single table (e.g., `hospital_management_system`), or normalized tables (Patients, Appointments, Bills, etc.).

2. **Load and run the SQL analytics**
    - Use the queries in `Hospital Management System.sql` to generate reports and analytics.
    - Adapt queries to your schema or database flavor if needed (most are compatible with SQLite/MySQL, minor adjustments may be required).

3. **Extend and customize**
    - Add your own reports, dashboards, or business logic.
    - Use the sample queries as templates for further analytics.

## Sample Analysis Topics

- Operational: Room and bed occupancy, monthly/daily admissions, doctor workload
- Financial: Total revenue, department revenue, payment collection status
- Clinical: Most common diagnoses, average stay, treatment statistics
- Insurance: Patients by insurance provider, bill status, insurance utilization

## Contributing

1. Fork this repo and add your changes (new queries, expanded dataset, improved analytics).
2. Create a pull request with a description of your improvements.

## License

MIT License

---

**Author:** [PANAKAJ01](https://github.com/PANAKAJ01)
