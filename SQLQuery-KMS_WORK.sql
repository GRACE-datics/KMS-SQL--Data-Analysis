create database KMS_DB
SELECT * from 
kms_order
alter table kms_order
alter column sales int

alter table kms_order
alter column Shipping_Cost int

alter table kms_order
alter column Profit int
---------------------------------------------------CASE SCENARIO ONE----------------------------------------------------------------------

-----WHICH PRODUCT CATEGORY HAD THE HIGHEST SALES----
SELECT TOP 1
Product_Category,
sum(sales) as 'Total_Sales'
from
kms_order
group by
Product_Category
order by
'Total_Sales' desc
------what are the top 3 regions in terms of sales---
select top 3
region,
sum(sales) as 'Total_Sales'
from
kms_order
group by
region
order by
'Total_Sales' desc
-----what are the bottom 3 regions in terms of sales----
select top 3
region,
sum(sales) as 'Total_Sales'
from
kms_order
group by
region 
order by
'Total_Sales' asc
----what were the total sales of appliances in Ontario---
select  
sum(sales) as 'Total_Sales_Appliances'
from
kms_order
where Product_Sub_Category='Appliances' and Region='Ontario'
----revenue from bottom 10 customers----
select top 10
customer_name,
sum(sales) as 'Total_Sales'
from kms_order
group by Customer_Name
order by 'Total_Sales' asc
-------advise to management-----
------engage the customers with personalized offers or deals----
------reach out to get feedback in order to understand barriers to increased revenue generation----
------target them with marketing campaigns based on their product interaction----
------offer loyalty rewards or limited-time discounts----

-----kms incurred the most shipping cost using which shipping method-----
select top 1
ship_MODE,
SUM(SHIPPING_COST) as 'Total_Shipping_Cost'
from kms_order
group by ship_MODE
order by 'Total_Shipping_Cost' desc

---------------------------------------------------CASE SCENARIO TWO----------------------------------------------------------------------

----who are the most valuable customers?----
select top 10
customer_name,
sum(sales) as 'Total_Sales'
from kms_order
group by Customer_Name
order by 'Total_Sales' desc
-----what products or services do they typically purchase?----
select 
customer_name,
Product_NAME,
COUNT (*) AS 'Times_Purchased'
from kms_order
where 
Customer_Name in (
select top 10 
customer_name
from kms_order
group by Customer_Name
order by sum(sales) desc
)
group by Customer_Name, Product_Name
order by Customer_Name asc

--------which small business customer had the highest sale?-----
select top 1
Customer_Name,
sum(sales) as 'Total_Sales'
from kms_order
where Customer_Segment='Small Business'
group by Customer_Name
order by 'Total_Sales' desc
-----which corporate customer placed the most number of orders from 2009 to 2012?----
select top 1
customer_name,
count (distinct order_id) as 'Total Orders'
from kms_order
where Customer_Segment='Corporate' and Year(Order_Date) between 2009 and 2012
group by Customer_Name
order by 'Total Orders' desc
------which consumer customer was the most profitable one?-----
select top 1
customer_name,
sum(profit) as 'Total Profit'
from kms_order
where Customer_Segment='Consumer'
group by Customer_Name
order by 'Total Profit' desc
------which customer returned items and what segment do they belong to?----
select
k.Order_id,
k.Customer_Name,
k.Customer_Segment,
count(*) as Occurrence_Count
from kms_order k
group by k.Order_id, k.Customer_Name,k.Customer_Segment
Having Count(*)>'1'
------if the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one,
------do you think the company appropriately spend shipping costs based on the order Priority? Explain your answer?-----
select 
order_priority,
Ship_MODE,
COUNT(*) AS 'NumOrders',
AVG(Shipping_Cost)as 'Avearge_Shipping',
sum(Shipping_Cost)as 'Total_Shipping'
from kms_order
group by order_priority, Ship_MODE
Order by order_priority asc

-----Based on the result of the query, I do not think the company appropriately spent shipping costs based on order priority. For instance 228 orders
-----with critical priority have been delivered through delivery truck resulting to a total shipping cost of 10,703. On the other hand, 190 orders with low priority have been delivered 
-----through express air resulting in a total shipping cost of 1,451. 
---Recommendations to Management
---Express air should be used for Critical/High Priority and Delivery truck for low priority in order to minimize cost.
---System controls should be added to order processing so as to prevent future misaligned shipping selection.
---staff should be trained on matching shipping method with urgency



