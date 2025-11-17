Create database kms;

use kms;

Select * from kmsss;
Select count(*) from kmsss;

-- Product category with the highest sales 
SELECT Product_Category, Sales
FROM kmsss
ORDER BY Sales DESC
LIMIT 1;

-- Top 3 and bottom 3 region in terms of sales
-- Top 3
Select Region, Sales from kmsss
Order by Sales DESC
Limit 3;

-- Bottom 3
Select Region, Sales from kmsss
Order by Sales
Limit 3;


-- What were the total sales of appliances in Ontario?
Select * from kmsss where Province = "Ontario";
Select Sum(Sales) from kmsss where Product_Sub_Category = "Appliances" and Region = "Ontario";

-- Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
Select * from kmsss;
SELECT Customer_Name,
       SUM(Sales) AS Total_Sales
FROM kmsss
GROUP BY Customer_Name
ORDER BY Total_Sales
LIMIT 10;


-- KMS incurred the most shipping cost using which shipping method?
SELECT Ship_Mode,
       ROUND(SUM(Shipping_Cost), 2) AS Total_Shipping_Cost
FROM kmsss
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost DESC
Limit 1;

-- Case Scenario II
-- Who are the most valuable customers, and what products or services do they typically purchase?
Select * from kmsss;
Select Customer_Name, Round(Sum(Sales), 2) as Total_Sales
	from kmsss
    Group by Customer_Name
    Order by Total_Sales
    DESC
    Limit 10;


-- Which small business customer had the highest sales?
Select * from kmsss;
Select Customer_Segment, Round(Sum(Sales), 2) as Total_Sales 
	from kmsss  where Customer_Segment = "Small Business" 
    order by Total_Sales DESC 
    Limit 1;
    
-- Which Corporate Customer placed the most number of orders in 2009 – 2012?
Select Order_ID, Customer_Segment, Sum(Order_Quantity) as Sum_of_Orders 
	from kmsss where Customer_Segment = "Corporate" and Order_Date between "2009-01-01" and "2012-12-31"
    group by Order_ID, Customer_Segment
    order by Sum_of_Orders DESC 
    Limit 1;
    
    
-- Which consumer customer was the most profitable one?
Select * from kmsss;
Select Customer_Name, Customer_Segment, Sum(Profit) as Total_Profit 
	from kmsss where Customer_Segment = "Consumer" 
    group by Customer_Name, Customer_Segment 
    Order by Total_Profit DESC
    Limit 1;
    
-- Which customer returned items, and what segment do they belong to?
Select * from kmsss;
Select Customer_Name Customer_Segment;


-- If the delivery truck is the most economical but the slowest shipping method and 
-- Express Air is the fastest but the most expensive one, do you think the company
-- appropriately spent shipping costs based on the Order Priority? Explain your answer
Select * from kmsss;
Select Order_Priority, Round(Sum(Shipping_Cost), 2) As Total_Cost_of_Shipping from kmsss where Order_Priority = "High" 
	Group by Order_Priority 
    Order by Total_Cost_of_Shipping DESC;
    
Select Order_Priority, Round(Sum(Shipping_Cost), 2) As Total_Cost_of_Shipping from kmsss where Order_Priority = "Low" 
	Group by Order_Priority 
    Order by Total_Cost_of_Shipping DESC;
    
Select Order_Priority, Round(Sum(Shipping_Cost), 2) As Total_Cost_of_Shipping from kmsss where Order_Priority = "Medium" 
	Group by Order_Priority 
    Order by Total_Cost_of_Shipping DESC;

Select Order_Priority, Round(Sum(Shipping_Cost), 2) As Total_Cost_of_Shipping from kmsss where Order_Priority = "Critical" 
	Group by Order_Priority 
    Order by Total_Cost_of_Shipping DESC;
    

SELECT 
    Order_Priority,
    Ship_Mode,
    COUNT(*) AS Total_Orders,
    Round(AVG(Shipping_Cost), 2) AS Avg_Shipping_Cost
FROM kmsss
GROUP BY Order_Priority, Ship_Mode
ORDER BY Avg_Shipping_Cost DESC;


