-- We use how to Filter Data using WHERE clause and Various operator that are below
-- 1.  Comparision operater equal to (=), not equal to(<>, !=), greater than(>), greater than equal to (>=), less than(<),less than equal to(<=)
-- 2. Logical Operators AND, OR, NOT
-- 3. Range Operator BETWEEN
-- 4. Membership operator IN, NOT IN
-- 5. Search Operator LIKE

-- First we create table to work with data
CREATE TABLE customers(
		id INT PRIMARY KEY,
        first_name VARCHAR(20),
        country CHAR(10),
        score INT);
  INSERT INTO customers(id, first_name, country, score)
  VALUES
		(1, 'Maria', 'Germany', 350),
        (2, 'John', 'USA', 900),
        (3, 'Georg', 'UK',750 ),
        (4, 'Martin', 'Germany', 500),
        (5, 'Peter', 'USA',0 );
-- values inserted successfully

-- 1.  Comparision operater equal to (=), not equal to(<>, !=), greater than(>), greater than equal to (>=), less than(<),less than equal to(<=)
-- 1. Comparision Operator = (Equal to)
-- TASk = Retrieve all customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';
-- Done

-- 1. Comparision Operator <>, !=(NOT Equel to)
-- Task <>, != Rwtriev all customers who are not from Germany
SELECT *
FROM customers
WHERE country <> 'Germany'; -- Use !=
-- DONE

-- 1. Comparision Operator > (Greater than)
-- TASK > Retrieve all customers with a score greater than 500
SELECT *
FROM customers
WHERE score > 500;
-- DONE

-- 1. Comparision Operator >= (Greater than Equal to)
-- TASK >=  Retrieve all customers with a score of 500 or more
SELECT*
FROM customers
WHERE score >= 500;
-- DONE

-- 1. Comparision Operator < (Less Than)
-- TASK < Retrieve all customers less than 500 
SELECT*
FROM customers
WHERE score < 500;
-- DONE
-- 1. Comparision Operator <= is same as others


-- 2. Logical Operators AND, OR, NOT
-- 2. Logical Operators AND all condition must be true
-- TASK Retrieve all who are from USA AND have a score greater than 500
SELECT*
FROM customers
WHERE country = 'USA' AND score > 500; -- If both condition not true it show NULL
-- DONE

-- 2. Logical Operators OR, at least one condition must true
-- TASK Retrieve all customers who are either from USA or have score greater than 500
SELECT *
FROM customers
WHERE country = 'USA'  OR score >500; -- True 1 condition in id = 5 so it show in table
-- DONE

-- 2. Logical Operators NOT (Reverse) Excludes Matching values from table
-- TASK Retrieve all customers with a score NOT less than 500
SELECT*
FROM customers
WHERE NOT score >= 500; -- Remove all the value with 500 and more than that
-- DONE

-- 3. Range Operator BETWEEN, use for range like 500(Lower Boundry) BETWEEN 800(Higher Boundry) Both values are include in range
-- TASK Retrieve all customers whose score falls in the range between 100 and 500
SELECT*
FROM customers
WHERE score BETWEEN 100 AND 500;
-- DONE

-- 4. Membership operator IN, NOT IN 
-- 4. Membership operator IN, search element in table 
-- TASK Retrieve all customers from either Germany OR USA
SELECT*
FROM customers
WHERE  country  IN ('Germany', 'USA');  -- Tip use IN insted of OR for mutliple values in the same column
-- DONE
-- 4. Membership operator  NOT IN 
SELECT*
FROM customers
WHERE  country NOT IN ('Germany', 'USA');
-- DONE

-- 5. Search Operator LIKE use to search record similer you remember
-- TASK Find all customers whose name start with M
SELECT*
FROM customers
WHERE  first_name LIKE 'M%;'; -- Modulo in last for you Know 1st letter, %M you know last letter
SELECT*
FROM customers
WHERE  first_name LIKE '%h%'; --  %know middle one% 

SELECT*
FROM customers
WHERE  first_name LIKE '%a'; -- You know last letter

-- DONE
-- All code executed successfully
SELECT*
FROM customers