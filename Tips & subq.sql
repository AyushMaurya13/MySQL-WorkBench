-- =========================================================
-- Tip 1: Select Only what you need
-- ==========================================================
-- Bad Practice 
SELECT * FROM Sales.customers -- No need to all

-- Good Practice 
SELECT CustomerID, FistName, FROM sales.Cutomers only needed part retrieve 


-- =========================================================
-- Tip 2 : Avoid unnecessary DISTINCT & ORDER BY
-- ==========================================================
-- Bad Practice
SELECT DISTINCT
firstName
FROM Sales.Customers
ORDER BY FirstName

-- Good Practice
SELECT FirstName
FROM Salesl.Customers

-- =========================================================
-- Tip 3:  For Explolation Purpose, LIMIT Rows
-- ==========================================================
-- Bad Practice 
SELECT ORDERID,
Sales
FROM Sales.orders

-- Good Practice
SELECT TOP 10 LIMIT 10
OrderID,
Sales
FROM Sales.Orders

-- =========================================================
-- Tip 4: Create nonclustered Index on frequently used columns in WHERE Clause
-- ==========================================================
SELECT* FROM Sales.orders WHERE OrderStatus = 'Delivered'\

-- =========================================================
-- Tip 5: Avoid applying funtions to columns in WHERE clause
-- ==========================================================
-- Bad Practice
SELECT * FROM Sales.Orders
WHERE LOWER (OrderStatus) = 'delivered'

-- Good Practice
SELECT * FROM Sales.Orders
WHERE OrderStatus = 'Delivered' 

-- Bad Practice
SELECT *
FROM Sales.Orders
WHERE YEAR(Orderdate) = 2025

-- Good Practice
SELECT*
FROM Sales.Orders
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-12-31'

-- =========================================================
-- Tip 6: Avoid leading wildcards as they prevent index  usage
-- ==========================================================
-- Bad Practice
SELECT *
FROM Sales.Customers
WHERE LastName LIKE  '%Gold%'

-- Godd Practice 
Select 
FROM Sales.customers
where lastname like'Gold%'

-- =========================================================
-- Tip 7: Use IN instead of multiple OR
-- ==========================================================
-- Bad Practice
SELECT *
FROM Sales.Order
WHERE CustomerID = 1 OR CustomerID = 2 CustomerID =3 

-- Good Practice
SELECT *
FROM Sales.Orders
WHERE CustomerID IN (1,2,3)

-- =========================================================
-- Tip 8: Understand the speed of JOINS & Use INNER JOIN when possible 
-- ==========================================================
-- Best Performence 
SELECT c.firstName, o.OrderID FROM Sales.Customers c INNER JOIN Sales.Orders o ON c.customerID = o.customerID

-- Slightly Slower Performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c RIGHT JOIN Sales.Orders

-- Worst Peformance 
SELECT c. FirstName, o.orderID FROM Sales.customers c Outer JOIN Sales.orders o ON c.CustomerID = o.CustomerID


-- ###########################################################
-- SubQueries  Queries under query there is a main query
-- ###########################################################


CREATE TABLE employee_demographics(
       employee_id INT NOT NULL PRIMARY KEY,
       frist_name VARCHAR(20),
       last_name VARCHAR(20),
       age INT,
       gender CHAR (10),
       birth_date DATE
 );

INSERT INTO employee_demographics (employee_id, frist_name, last_name, age, gender, birth_date)
VALUES
      (1, 'Lesli', 'Knop', 44, 'F', '1979-09-25'),
	  (2, 'Tom', 'Haveford', 36, 'M', '1987-03-04'),
      (3, 'April', 'Ludgate', 29, 'F', '1994-03-27'),
      (4, 'Jerry', 'Gergich', 61, 'M', '1962-08-28'),
      (5, 'Donna', 'Meagle', 46, 'F', '1977-07-30'),
      (6, 'Ann', 'Perkins', 35, 'F', '1988-12-01'),
      (7, 'Chris', 'Traeger', 43, 'M', '1980-11-11'),
      (8, 'Ben', 'Wyatt', 38, 'M', '1985-07-26'),
      (9, 'Andy', 'Dwayer', 34, 'M', '1989-03-25'),
      (10, 'Mark', 'Brendawicz', 40, 'M', '1983-06-14'),
      (11 , 'Craig', 'Middlebrooks', 37, 'M', '1986-07-27'),
      (12, 'Krish', 'Andy', 30, 'M', '1978-09-05')
      
;
SELECT*from employee_demographics;


CREATE TABLE employee_salary(
       employee_id INT NOT NULL PRIMARY KEY,
       frist_name VARCHAR(20),
       last_name VARCHAR(20),
       occupation VARCHAR(50),
       salary INT,
       dept_id INT
 );

INSERT INTO employee_salary (employee_id, frist_name, last_name, occupation, salary, dept_id)
VALUES
      (1, 'Lesli', 'Knop', 'Deputy', 75000, 1),
      (2, 'Ron', 'Swanson', 'Director', 70000, 1),
	  (3, 'Tom', 'Haveford', 'Enterpreneur', 50000, 1),
      (4, 'April', 'Ludgate', 'Assistent', 25000 , 1),
      (5, 'Jerry', 'Gergich', 'office Manager', 50000,1),
      (6, 'Donna', 'Meagle', 'Office Manager', 60000, 1),
      (7, 'Ann', 'Perkins', 'Nurse', 55000, 4),
      (8, 'Chris', 'Traeger',  'city Manager', 90000,3),
      (9, 'Ben', 'Wyatt', 'State Auditor', 70000, 6),
      (10, 'Andy', 'Dwayer', 'Musician', 20000 , Null),
      (11, 'Mark', 'Brendawicz', 'City Planner', 57000,3),
      (12 , 'Craig', 'Middlebrooks', 'Parks Director', 65000, 1)
      ;
      
select * from employee_salary;


create table parks_department(
      department_id INT,
      department_name VARCHAR(50)
      );
INSERT INTO parks_department (department_id, department_name)
VALUES
	  (1, 'Parks And Recreation'),
      (2, 'Anima Control'),
      (3, 'Public Works'),
      (4, 'Healthcare'),
      (5, 'Library'),
      (6, 'Finance')
;


select * from parks_department;
select * from employee_salary;
SELECT*from employee_demographics;


SELECT* -- 🔹 The main query returns all details of employees whose IDs are in that list.
from employee_demographics
WHERE employee_id IN 
                  (SELECT employee_id -- subquery execute first and then main qulery
                  FROM employee_salary
                  WHERE dept_id = 1)
;
SELECT 
frist_name, 
salary,
(select
AVG(salary) as avg_salary
FROM employee_salary)
FROM employee_salary;



select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender; 

select*from(
select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender) as agg_table







