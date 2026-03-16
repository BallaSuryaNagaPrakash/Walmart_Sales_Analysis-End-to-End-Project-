Create Database Walmart_Sales;

Use Walmart_Sales;

-- 1. Select Dataset 
SELECT *
FROM walmart_sales
LIMIT 10;

-- 2. Describe walmart_sales dataset 
DESCRIBE walmart_sales;

-- 3. Remove Duplicates
SELECT Store, Date, COUNT(*)
FROM walmart_sales
GROUP BY Store, Date
HAVING COUNT(*) > 1;

-- 4. Check Missing Values
SELECT
COUNT(*) AS total_rows,
COUNT(Weekly_Sales) AS sales_values
FROM walmart_sales;

-- 5. Basic Business KPIs
    -- 1. Total Revenue
    SELECT SUM(Weekly_Sales) AS Total_Revenue
FROM walmart_sales;

  -- 2. Average Weekly Sales 
     SELECT AVG(Weekly_Sales) AS Avg_Weekly_Sales
FROM walmart_sales;
  
    -- 3. Total Stores
    SELECT COUNT(DISTINCT Store) AS Total_Stores
FROM walmart_sales;

-- 6. Store Performance Analysis

   -- 1. Top Performing Stores
   SELECT Store,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales DESC
LIMIT 10;

-- 2. Lowest Performing Stores
SELECT Store,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales ASC
LIMIT 10;

-- 7. Monthly Sales Analysis
    -- 1. Convert date to month.
    SELECT
    MONTH(Date) AS Month,
    SUM(Weekly_Sales) AS Monthly_Sales
    FROM walmart_sales
	GROUP BY Month
    ORDER BY Monthly_Sales DESC;
    
-- 8.  Holiday Sales Impact
SELECT
Holiday_Flag,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart_sales
GROUP BY Holiday_Flag;
 
 -- 9. Yearly Sales Trend
 SELECT
YEAR(Date) AS Year,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart_sales
GROUP BY Year
ORDER BY Year;

-- 10. Temperature Impact on Sales
SELECT
ROUND(Temperature) AS Temp_Range,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart_sales
GROUP BY Temp_Range
ORDER BY Temp_Range;
 
 -- 11. Economic Indicators vs Sales
 SELECT
AVG(Fuel_Price) AS Avg_Fuel,
AVG(Unemployment) AS Avg_Unemployment,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart_sales;
 
 -- 12 Store Ranking (Advanced SQL)
 -- Use window functions.
 SELECT
Store,
SUM(Weekly_Sales) AS Total_Sales,
RANK() OVER(ORDER BY SUM(Weekly_Sales) DESC) AS Sales_Rank
FROM walmart_sales
GROUP BY Store;

-- 13.Holiday Store Performance
SELECT
Store,
SUM(CASE WHEN Holiday_Flag = 1 THEN Weekly_Sales END) AS Holiday_Sales,
SUM(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END) AS Normal_Sales
FROM walmart_sales
GROUP BY Store;

-- 14. Peak Sales Weeks
SELECT
Date,
SUM(Weekly_Sales) AS Weekly_Total
FROM walmart_sales
GROUP BY Date
ORDER BY Weekly_Total DESC
LIMIT 10;