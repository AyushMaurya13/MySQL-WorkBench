/* SQL Date & Time Functions 
1. DATE_ADD () Adds or subtracts a specific time interval to / from a date//////////////////////////////////
Syntax 
      DATE_ADD(part, interval, date)
Exp 
   DATE_ADD(Column_name, 2  Month) add 2 month from actual month
   DATE_ADD(Column_name, INTERVAL -2 Year) less 2 year from actual year
*/
SELECT
OrderID,
OderDate,
DATE_ADD(OrderDate, interval 2 Month) as Extend_month,-- 2025-07-24 add 2 month 2025-09-24
DATE_ADD(OrderDate, interval 3 Year) as Extend_year, -- 2025-07-24 add 2 year 2027 - 09 - 24
DATE_ADD(OrderDate, interval -2 Month) as Later_month,-- 2025-05-24 subtract 2 month 2025-09-24
DATE_ADD(OrderDate, interval -3 Year) as Later_year -- 2025-05-24 subtract 2 year 2023-09-24
From orders;
-- we can also use DATE_SUB///////////////////////////////////////////////////////////////////////////////
SELECT
OrderID,
OderDate,
DATE_SUB(OrderDate, interval 2 Month) as later_month,-- 2025-07-24 add 2 month 2025-05-24
DATE_SUB(OrderDate, interval 3 Year) as later_year -- 2025-07-24 add 2 year 2023 - 09 - 24
From orders;

/* Date Calcultion////////////////////////////////////////////////////////////////
DATEDIFF Find the diffefence between two data

order_date                      shipping date
       2025-08-20                     2026-02-01
 use datediff         
 syntax 
      DATEDIFF(end_date, start_date)  return in days
-- Difference in months:###############################
SELECT TIMESTAMPDIFF(MONTH, '2024-07-24', '2025-07-24');  -- Output: 12

-- Difference in years:###################################
SELECT TIMESTAMPDIFF(YEAR, '2020-07-24', '2025-07-24');   -- Output: 5
*/ 
-- Task Find the average shipping duration in days for each month
SELECT 
   orderID,
   orderDate,
   shipDate,
   datediff(orderDate, shipDate) as dayship
FROM Sales.Orders;



-- MySQL not have ISDATE but alternative is str_to_date/////////////////////////////////////////////////////
-- check if a value is a date 
-- return 1 if the strilng value is a valid date
SELECT
OrderID,
OrderDate, 
  STR_TO_DATE('2025-07-24', '%Y-%m-%d') IS NOT NULL AS IsValidDate
FROM Sale.Orders
-- DONE





















