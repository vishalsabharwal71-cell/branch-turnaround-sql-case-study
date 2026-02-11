# Branch Turnaround SQL Case Study

Real-world branch turnaround analysis using SQL Server and Power BI.

This repository documents an end-to-end analytical case study based on a
single-branch performance improvement, focusing on **SQL-driven insights**
and **business outcome attribution**.

---

## 🎯 Objective

- Analyze year-over-year (YoY) performance using SQL Server
- Correctly handle ordinal metrics such as Branch Rank
- Attribute ranking improvement to measurable business actions
- Present validated results through a minimal, executive-ready Power BI dashboard

---

## 🗄️ Data & SQL Analysis

All core analysis is performed in SQL Server.

📂 **`sql/`**
- YoY analysis with same-day & same-month alignment
- Rank movement logic (ordinal metric handling)
- Final analytical views designed for BI consumption
- Anonymized branch identifiers for confidentiality

---

## 📊 Dashboard Proof (Power BI)

The SQL outputs feed directly into a Power BI dashboard for visual validation.

📂 **`dashboard/`**
- Core Advances YoY Growth KPI
- Branch Rank improvement (330 → 90, lower is better)
- Turnaround summary table (2025 vs 2026)

These visuals serve as **proof of outcome**, not exploratory BI.

---

## 🧱 Data Model & Outputs

📂 **`er-diagram/`**
- Reserved for ER diagrams illustrating the analytical data model  
- Omitted here to keep the repository concise and focused on execution

📂 **`outputs/`**
- Reserved for derived query outputs or exports if required
- Final results are instead demonstrated via Power BI visuals

---

## 🔒 Notes

- This is a **case study**, not a tutorial
- Emphasis is on correctness, attribution logic, and business clarity
- The repository is structured to reflect real-world analytical delivery

