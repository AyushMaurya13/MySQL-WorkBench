/* Case statement
 Evaluate a list of condition and return a value when the first condition is met
 
 Syntax ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
 CASE -- start logic
     WHEN condition1 THEN result1
     WHEN condition2 THEN result2
     ELSE result
 END -- end logic
 //////////////////////////////////////////////////////////////////////////////////////////////////
*/
 -- Main Purpose is data Transformation
 -- Driven New information 
 -- Create New based on existing data
 -- CATEGORIZING DATA group the data into different categories based on certain condition,
 
/* Task Generate a report showing the total sales for each category
- High if the sales higher than 50
- Medium if the sales betweent 20 to 50
- Low if the sales equel or lower than 20
sort result from lowest to highest*/
 
 SELECT 
 Order_ID,
 sales,
 CASE 
     WHEN Sales > 50 THEN 'High'
     WHEN Sales > 20 THEN 'Medium'
     ELSE 'Low'
END Category     -- END and create a new column name category
FROM Sales.Orders;
 -- DONE
 
 /* USE CASE (MAPPING VALUES)///////////////////////////////////////////////////////////////////////////
 Transform the values from one form to another*/
 SELECT 
 employeeID,
 first_name,
 last_name,
 Gender,
 CASE 
      WHEN Gender = 'F' THEN Gender = 'Female'
      WHEN Gender = 'M' THEN Gender = 'Female'
      ELSE 'Nor Available'
END GenderFullText
FROM Sales.Employees;


 -- Task Retrive customers detaila with abbreviated country code/////////////////////////////
 SELECT 
    customerID,
    First_name,
    last_name,
    country,
    CASE  -- country as column name
       WHEN country = 'Germany' THEN 'DE'
       WHEN country = 'USA' THEN 'US'
       ELSE 'n/a'
       
     END countryAbbr
FROM Sales.customer;
 
 -- Handling NUlls   ////////////////////////////////////////////////////////////////////////////////
 -- Replace Nulls with a specific values
 -- Find the average score of customers and treat nulls as O
 -- Additionally provides details such customersID and Lastname
 SElECT
 CustomerID,
 LastName,
 Score,
     CASE
         WHEN Score IS NULL THEN 0 ###################
         ELSE Score
	 END ScoreClean,
     AVG(Score) OVER() AvgCustomer
FROM Sales.cutomers;
 
 -- CONDITIONAL AGGREGATION ////////////////////////////////////////////////////////////////////////////////////
 -- Apply aggregate function only on subsets of data that fulfill certain conditions.
 -- Count how many times each customers has made an order with sales greater than 30.
 SELECT
     OrderID,
     customerID,
     Sales,
     CASE 
         WHEN sales > 30 THEN 1
         ELSE 0
	END SalesFlag
FROM Sales.customers
WHERE Sales > 30
ORDER BY customerID
-- DONE
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 