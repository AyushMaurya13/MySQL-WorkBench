-- This is Data Manipulation Language
-- INSERT
-- UPDATE
-- DELETE

-- INSERT is use to insert data in table but first we CREATE table
CREATE TABLE customers(
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    country CHAR(10),
    score INT
    );
  -- table is created
  -- NOW WE INSERT the data in TABLE
  INSERT INTO customers(id, first_name, country, score)
  VALUES
        (1, 'Maria', 'Germany',350),
        (2, 'John', 'USA', 900),
        (3, 'Georg', 'UK', 750),
        (4, 'Martin', 'USA', 500),
        (5, 'Peter', 'USA', 0);
  -- VALUES are INSERTED into table customers
  -- we can insert data to selected column like
  INSERT INTO customers(id , first_name)
  VALUES
		(6, 'Krish');
  -- now see the table
  SELECT*
  FROM customers;
 -- tabel show correct   

-- UPDATE 
-- we update data with WHERE clause
  
  UPDATE  customers
  SET country = 'India', -- we can update one or more values
	score = 950
  WHERE id = 6;
-- update done sussecfully
SELECT *
FROM customers;

-- DELETE 
-- delete is use  to remove a row from TABLE
DELETE FROM customers
WHERE id = 5;
-- delete is sussecfully perform
SELECT *
FROM customers;

-- TRUNCATE 
-- Truncate is use to remove all rows in table but not table
-- TRUNCATE TABLE customers;

    -- END
    
    
    
    
    
    
    
    
    
    
    