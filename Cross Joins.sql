/* This is Advance Joins
 MySQL are not support anti Joins
 Corss Join
 combine Every Row from left with every row from right.
 All Possible combination - cartersian join
  you get everythin from A and everything from B
  if in A 2 row in B 3 row then total row is 2 * 3 = 6 */
 CREATE TABLE customers(
		id INT,
        first_name VARCHAR(20),
        country CHAR(10),
        score INT
);

 -- Now we can insert data into table
  INSERT INTO customers(id, first_name, country, score)
  VALUES
		(1, 'Maria', 'Germany', 350),
        (2, 'John', 'USA', 900),
        (3, 'Georg', 'UK',750 ),
        (4, 'Martin', 'Germany', 500),
        (5, 'Peter', 'USA',0 );
        
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
   
 -- TASK Generate all Possible combination of customers and orders
 SELECT *
 FROM customers
 CROSS JOIN orders
 