/*Window Functions
Returns a result for each row
aggregation + keep details*/

/* WINDOW FUNCTIONS  -- Perform calculations within a window//////////////////////////////////////////////////////////////////////
1. Aggregate Functions (count(), sum(), avg(), max(), min())

2. Rank Functions(ROW_NUMBER(), RANK(), DESNSE_RANK(),CUME_DIST(), PERCENT_RANK(), NTILE())

3. Value (Analytics) Functions (LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE()) */

-- 2. Rank Functions(ROW_NUMBER(), RANK(), DESNSE_RANK(),CUME_DIST(), PERCENT_RANK(), NTILE())/////////////////////////////////////////////
-- ROW_NUMBER() assing a unique number to  each row , it does not handle ties
-- task  rank the orders based on their sales from highest to lowest
SELECT 
order_id,
product_id,
sales, 
ROW_NUMBER() over(ORDER BY sales DESC) salesRank_row
FROM Sales.orders;

/*  RANK() assing a rank to each row################################
it handles ties(if a value present more than one time it give them same rank)
it leaves gaps in ranking*/

SELECT 
 OrderID,
 ProductID,
 Sales,
    RANK() OVER (ORDER BY Sales DESC) -- 1,2,2,4
FROM Sales.orders;

/* DENSE_RANK() assign a rank to each row.##############################
    it handles ties.
    it doesn't leaves gaps in ranking*/
-- Task  rank the orders based on their sales from highest to lowest
SELECT
 OrderID,
 ProductID,
 Sales,
DENSE_RANK() OVER(ORDER BY sales DESC) SalesRan -- 1,2,2,3
FROM sales.orders;

/* NTILE () Divide the rows into a specified number of approximately equal (Buckets)
Bucket size = number of row/ number of buckets
*/
SELECT
        orderID,
        sales,
        NTILE(2) OVER (ORDER BY ssales DESC) twobicket,
        NTILE(1) OVER (ORDER BY Sales DESC)  OneBucket
        
FROM Sales.orders;
  
/* CUME_DIST() Cumulative Distribution calculates the distribution of data points within a window*/
-- CUME_DIST = position No. / Number of Rows
SELECT
orderID,
productID,
sales,
CUME_DIST() OVER (ORDER BY Sales DESC) 
FROM Sales.Orders; -- Sales is the name of schema


/* PERCENT_RANK Calculates the relative position of each row
*/
-- PERCENT_RANK () OVER (ORDER BY Sales DESC)
-- Percent_rank = (Position NO - 1) / Number of rows -  1 
SELECT 
OrderID,
ProductID,
Sales,
PERCENT_RANK() OVER (ORDER BY Sales DESC)
FROM Sales.orders;

-- DONE














