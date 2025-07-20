-- There are 3 Data Definitio Language
-- CREATE
-- ALTER
-- DROP

-- Here we use CREATE to create a table
CREATE TABLE customers(
     id INT NOT NULL PRIMARY KEY,
     person_name VARCHAR(50),
     birth_date DATE,
     phone VARCHAR(30)
);
-- use select for see the table
SELECT *
FROM customers;

-- Now we use ALTER to add or remove columns
-- that is use to Add by ADD keyword to remove coulumn use DROP
ALTER TABLE customers
  ADD email VARCHAR(50);  
SELECT *
FROM customers;
-- Now delete a column
ALTER TABLE customers
     DROP COLUMN phone;
SELECT *
FROM customers;
-- Email column succesfully added and deleted

  
-- DROP
 -- Drop is use to delete a table from database
 -- DROP a table first we create a dummy table
 CREATE TABLE persons(
        id INT,
        name_ char(55),
        location varchar(50));
  -- table create succesfully
 DROP TABLE persons
 -- table deleted succesfully
 