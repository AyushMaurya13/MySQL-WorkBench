/* Set Operations in SQL combine the results of multiple quires into a single result set.
1. UNION 
2. UNION ALL*/
-- Rule 1 SET Operator can be used almost in all clauses WHERE, JOIN, GROUP BY, HAVING
-- ORDER BY is allowed only once at the end of query

-- Rule 2 The number of columns in each query must be the same
-- Rule 3 Data Types of columns in each query must be compatible
-- Rule 4 The order of the columns in each query must be same
 -- Rule 5 The column names in the resuslt set are determined by the culumn names specific in the first query.
 
 -- 1. UNION 
--  Return all district rows form both queries.
-- remove all duplicate
SELECT *
FROM sales.cutomers

UNION

SELECT *
FROM sales.Employees;


-- UNION ALL  
-- Return all rows from both queries including duplicates

SELECT *
FROM sales.customers
UNION ALL 
SELECT *
FROM sales.Employees


