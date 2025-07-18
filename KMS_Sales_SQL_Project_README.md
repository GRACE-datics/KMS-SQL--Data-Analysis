
# 🧾 KMS Sales Data Analysis – SQL Project

## 📌 Overview

This project showcases SQL-based data analysis on the KMS Sales dataset, a fictional sales database that contains detailed information about customer orders, shipping methods, product categories, and profitability across various regions in Canada. The goal is to extract insights that support strategic decision-making in sales, operations, and customer management.

---

## 🗂️ Dataset Description

The dataset is stored in a single table: `KMS_order`, with the following key fields:

- `Order_ID`, `Order_Date`, `Ship_Date`, `Order_Priority`
- `Customer_Name`, `Customer_Segment`, `Province`, `Region`
- `Product_Category`, `Product_Sub_Category`, `Product_Name`
- `Sales`, `Profit`, `Discount`, `Order_Quantity`, `Unit_Price`
- `Shipping_Cost`, `Ship_Mode`, `Product_Base_Margin`

---

## ✅ Project Objectives

This analysis aims to:

1. Identify the **top-performing product categories**
2. Highlight the **best and worst regions** by sales
3. Examine sales and profit trends for specific segments and provinces
4. Recommend ways to increase revenue from **low-performing customers**
5. Assess the effectiveness of **shipping methods vs. order priority**
6. Detect potentially **returned or refunded products** based on data patterns

---

## 🔍 Case Scenarios Solved

### Case Scenario I:
1. Product category with the **highest sales**
2. **Top 3 and bottom 3** regions by total sales
3. Total sales of **Appliances in Ontario**
4. Strategy to increase revenue from the **bottom 10 customers**
5. Shipping method with the **highest total shipping cost**

### Case Scenario II:
6. Most **valuable customers** and what they typically buy
7. Top **small business customer** by sales
8. Corporate customer with the most orders **(2009–2012)**
9. Most **profitable consumer** customer
10. Customers who likely **returned items** (inferred from sales = 0 or negative profit)
11. Evaluation of **shipping cost vs. order priority** for cost-effectiveness

---

## 🛠️ Tools Used

- **SQL Server Management Studio (SSMS)** – for querying and data manipulation
- **Excel (optional)** – for data cleaning and visualizing results or summaries

---

## 📈 Key Insights

- Returns and loss-making orders were inferred using **duplicate order IDs**.
- Some products were shipped using **premium methods** despite having **low priority**, raising cost-efficiency concerns.
- Some products were shipped using **low cost methods** despite having **critical/high priority**, posing a risk to customer satisfaction.
- Significant potential exists in targeting **low-performing customers** with peraonalized/bundled offers or lower-cost shipping.

---

## 📄 Sample Queries

**Find duplicate Order IDs:**

```sql
SELECT Order_ID, COUNT(*) AS Duplicate_Count
FROM KMS_order
GROUP BY Order_ID
HAVING COUNT(*) > 1;
```

## 🚀 Future Work

- Automate return prediction using machine learning
- Integrate the dataset into Power BI for live dashboards
- Perform time series forecasting on seasonal sales trends
  
---

## 📬 Contact

Feel free to connect or reach out via [LinkedIn](Ayomide Oguntodu) or [email](ayomidegrace100@gmail.com) for questions or collaboration.
