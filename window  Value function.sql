/* Value Window Functions
1. LEAD() Access a value from the next row within a window
2. LAG() Access a value from the previous row within a window
3. FIRST_VALUE()
4. LAST_VALUE()*/
-- 1. LEAD() Access a value from the next row within a window
-- LEAD(Sales, 2, 10 ) OVER (PARTITION BY productID order BY OrderDate)
-- Task ANALYZE the month over month (MoM) Performance by finding the percentage chane in sales
-- between the current and previos month
SELECT
orderID,
orderDate,
Sales,
month(orderDate) orderMOnth,
sum(sales) currentMOnthsales,
lag(sum(sales)) over (ORDER BY month(orderDate)) PreviousMonthSales
FROM Sales.orders
group by 
month(orderdate);

-- 2. LAG() Access a value from the previous row within a window
-- LAG(Sales, 2, 10 ) OVER (PARTITION BY productID order BY OrderDate)
-- task cutomer retention analysis
-- Measure customers bahaviour and loyalty to help businesses build strong relation wihtcustomers
SELECT 
orderID,
customeid,
orderDate currentOrder,
LEAD(orderDate) over (partition by customerid order BY orderDate))  dayuntilnextorder
FROM Sales.orders
ORDER BY customersID, orderDate



-- 3. FIRST_VALUE()/////////////////////////////////////////
-- Access a value from the first row within a window
-- task find the lowest and highest sales for each product
Select
 orderID,
  productID,
  sales,
  FIRST_VALUE(Sales) over (Partition BY productID order bY sales) lowestsales
  LAST_VALUE(Sales) OVER (Partition  BY productID order by sales) highest
  from sales. orders
-- 4. LAST_VALUE()////////////////////////////////////////////////
-- Access a value from the last row within a window.