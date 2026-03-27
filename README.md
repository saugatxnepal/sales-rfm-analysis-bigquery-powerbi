# Sales RFM Analysis (BigQuery + Power BI)

End-to-end customer segmentation project using SQL and Power BI

---

## Project Overview

This project performs **RFM (Recency, Frequency, Monetary) analysis** on sales data to segment customers based on purchasing behavior.

The data is processed using **SQL in BigQuery**, and insights are visualized using **Power BI dashboards**.

The objective is to identify high-value customers, detect churn risks, and support business decision-making.

---

## 🛠 Tech Stack

* Google BigQuery (SQL)
* Power BI (Data Visualization)
* SQL (Data Cleaning & Transformation)
* GitHub

---

## 📁 Project Structure

```
sales-rfm-analysis/
│── README.md
│
├── sql/
│   ├── 01_data_combination.sql
│   ├── 02_rfm_metrics.sql
│   ├── 03_rfm_scores.sql
│   ├── 04_rfm_total.sql
│   ├── 05_rfm_segments.sql
│
├── data/
│   ├── 202501.csv
│   ├── 202502.csv
│   ├── ...
│   ├── 202512.csv
│
├── powerbi/
│   ├── dashboard.pbix
│   ├── dashboard.png
```

---

## Data Pipeline

1. Combined monthly sales data using `UNION ALL`
2. Calculated RFM metrics:

   * Recency (last purchase)
   * Frequency (number of orders)
   * Monetary (total spend)
3. Ranked customers using window functions
4. Assigned scores using `NTILE(10)`
5. Calculated total RFM score
6. Segmented customers using business rules
7. Built interactive dashboard in Power BI

---

## RFM Analysis Explained

* **Recency (R):** Days since last purchase
* **Frequency (F):** Number of purchases
* **Monetary (M):** Total spending

This method helps businesses identify:

* High-value customers
* Loyal customers
* At-risk customers

---

## Key SQL Logic

### RFM Calculation

```sql
SELECT
  CustomerID,
  MAX(OrderDate) AS last_order_date,
  DATE_DIFF(CURRENT_DATE(), MAX(OrderDate), DAY) AS recency,
  COUNT(*) AS frequency,
  SUM(OrderValue) AS monetary
FROM sales
GROUP BY CustomerID;
```

### RFM Scoring

```sql
NTILE(10) OVER(ORDER BY recency DESC) AS r_score,
NTILE(10) OVER(ORDER BY frequency DESC) AS f_score,
NTILE(10) OVER(ORDER BY monetary DESC) AS m_score
```

---

## Customer Segmentation

Customers are grouped into segments:

* Elite Customers
* Premium Loyalists
* Growth Customers
* Emerging Customers
* Active Customers
* Needs Attention
* Churn Risk
* Inactive Customers

---

## Dashboard Features

The Power BI dashboard includes:

* KPI cards (Revenue, Customers, Avg Value)
* Customer segmentation (Donut chart)
* Revenue by segment (Bar chart)
* Sales trends (Line chart)
* Top customers table
* RFM scatter analysis

---

## Key Insights

* A small percentage of customers contribute to a large portion of revenue
* High-frequency customers generate consistent revenue
* Some customers show signs of churn due to inactivity
* Customer segmentation enables targeted marketing strategies

---

## How to Run This Project

1. Upload CSV files to BigQuery
2. Run SQL scripts in the `/sql` folder step-by-step
3. Generate the final `rfm_segments` table
4. Open Power BI file (`dashboard.pbix`)
5. Connect to dataset and refresh

---

## Future Improvements

* Automate data pipeline using scheduled queries
* Deploy dashboard to Power BI Service
* Add real-time data updates
