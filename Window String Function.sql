/* SQL  Function 
1.  A Built-in sql code
2. acccepts an input value 
3. process it
4. return an output value

1. String Functions
a. Manipulation (CONCAT, UPPER, LOWER, TRIM, REPLACE)
b. Calculation (LENGTH)
c. String Extraction (LEFT, RIGHT, SUBSTRING)

*/
CREATE TABLE customers(
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    country CHAR(10),
    score INT
    );
 INSERT INTO customers(id, first_name, country, score)
  VALUES
        (1, 'Maria', 'Germany',350),
        (2, 'John', 'USA', 900),
        (3, 'Georg', 'UK', 750),
        (4, 'Martin', 'USA', 500),
        (5, 'Peter', 'USA', 0);

-- 1. CONCAT combine multiple string into one
-- TASK Concatenate first name and country into one column
SELECT 
first_name,
country,
CONCAT(first_name,'', country) AS name_country -- for space between name and country
FROM customers;


-- 2. UPPER 
-- convert all charecters to uppercase
SELECT 
first_name,
country,
UPPER(first_name) AS uppercase
FROM customers;
-- 3. LOWER 
-- convert all charecters to lowercase
SELECT 
first_name,
country,
LOWER(country) AS lower_name
FROM customers;

-- 3. TRIM
-- Removes leading and trailing spaces
-- '_john', '____ john' 

SELECT 
first_name
FROM customers
WHERE first_name != TRIM(first_name);

-- 5. REPLACE
-- replace specifice charecter with a new charecter
-- old value = '-'
-- new value = '/'
-- task remove  dashes (-) from a phone number
SELECT
'123-456-7890'as phone,
REPLACE ('123-456-7890', '-','/') as clean_phone;

-- Replace file formate
SELECT 
'report.txr' AS old_filename,
REPLACE('report.txt', '.txt', '.csv') AS new_filename;

-- DONE


-- b. Calculation (LENNGHT)
-- Use to counts how many charectes 
SELECT
first_name,
LENGTH(first_name) AS total_len -- we can also use char_length
FROM customers;
-- DONE

-- c. String Extraction (LEFT, RIGHT, SUBSTRING)
-- LEFT()
-- Extract specific Number of charecters from the Start
SELECT
first_name,
LEFT(TRIM(first_name), 2) first_2_char,
-- RIGHT()
-- Right Extracts specific Number of characters from the End
RIGHT(first_name, 2) last_2_char
FROM customers;


-- SUBSTRING
-- SUBSTRING(Value, start, length)
-- Extract a part of string a specific position
SELECT 
first_name,
SUBSTRING(first_name, 2, 3) AS sub_name,
length(SUBSTRING(first_name, 2, 3) ) as sub_name -- we can do it also
FROM customers
-- DONE



















