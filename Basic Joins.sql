-- Join Basics
-- join is used For
-- 1.  Recombine Data
-- 2. Data enruchment "Getting Extra data"
-- 3. Check for Existence "Filtering"

-- To work with table first create table or import
CREATE TABLE customers(
     id INT NOT NULL PRIMARY KEY,
     first_name CHAR(20),
     country CHAR(15),
     score INT
     );
INSERT INTO customers(id, first_name, country, score)
VALUES
      (1, 'Maria', 'Germany', 350),
      (2, 'John', 'USA', 900),
      (3, 'Georg', 'UK', 750),
      (4, 'Martin', 'Germany', 500),
      (5, 'Peter', 'USA', 0)
      ;
CREATE TABLE orders(
     order_id INT,
     customer_id INT,
     order_date DATE,
     sales INT
     );
     
INSERT INTO orders(order_id, customer_id, order_date, sales)
VALUES
      (1001, 1, '2021-01-11', 35),
      (1002, 2, '2021-04-05', 15),
      (1003, 3, '2021-06-18', 20),
      (1004, 6, '2021-08-31', 10)
   ;
SELECT *
FROM customers;
SELECT *
FROM orders;
-- Both table create successfully

/* Basic Join Types 
 1. No Join
 2. Inner Join
 3. Left Join
 4. Right Join
 5. Full Join */

-- 1. No Join 
-- Return data from table without combinig them
-- TASK Retrive all data from customers and orders in two different results
SELECT*
FROM customers;

SELECT*
FROM orders;

-- 2. Inner Join
-- Return only matching row from both table A and B
/* SELECT * 
FROM <Table A>
INNER JOIN <Table B> -- we found same result  if we swap TABLE name
ON <condition>*/ -- The condition is A.key = B.Key

-- TASk Get all customers along with their orders, but only for customers who have placed an order
SELECT*
FROM customers
INNER JOIN orders
ON id = customer_id; -- Return id match data

SELECT
      customers.id, -- to tell sql this id is from customers table
      first_name,
      orders.order_id, -- this id comes from order_id
      sales
FROM customers
INNER JOIN orders
ON id = customer_id;

 -- Make it more clear 
 SELECT
      customers.id, -- to tell sql this id is from customers table
      first_name,
      orders.order_id, -- this id comes from order_id
      sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;
 -- id is come from customers table and customer_id comes from orders table

 -- 3. Left Join
-- Return All rows from left and only matching from right
-- TASK Get all customers along with their orders, including those without orders
SELECT 
      id,
      first_name, -- NO need to execute all column.
      order_id,
      sales
      order_date
FROM customers -- Be carefull about left table must be in From clause// this is primary table
LEFT JOIN orders -- JOIN is secondry table 
ON customers.id = orders.customer_id ;
-- DONE
-- If we swap table it get result according to orders table

-- 4. Right Join
-- Return all Rows from RIGHT and only matching form left 
-- TASK  Get all custmers along with their orders, including orders without matching cusmtomers
SELECT 
     c.id,
     c. first_name,
     o.order_id,
     o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON o.customer_id = c.id; -- it give same result after swaping
-- DONE

 -- 5. Full Join     
 -- Return all row from both table
 -- TASK Get all customers and orders, even if there no match
 SELECT
       c.id,
       c.first_name,
       o.order_id,
       o.sales
 FROM customers AS c
 FULL JOIN orders AS o -- occurs error because MySQL not support full join use UNION
 ON c.id = o.customers.id
 -- DONE









