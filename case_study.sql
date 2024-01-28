CREATE DATABASE case_study;
-- table is directly imported
SELECT * FROM customer;
-- show table
SHOW TABLES;
-- schema of the table
DESC customer;
-- alter
ALTER TABLE customer
CHANGE email emailId VARCHAR(40);
-- change datatype of column
ALTER TABLE customer
MODIFY COLUMN gender VARCHAR(5);
-- insert
INSERT INTO customer()
VALUES
(1001,'Tejas','Jagtap','F',21,64852,'tejas123@gmail.com','Pune','N',CURDATE());
SELECT * FROM customer;
-- update
UPDATE customer
SET id =969
WHERE first_name = 'Tejas';
-- delete
DELETE FROM customer
WHERE last_name = 'Jagtap';
-- primary key
ALTER TABLE customer
ADD PRIMARY KEY (id);
-- order by
SELECT * FROM customer
ORDER BY bill_amount;
SELECT * FROM customer
ORDER BY age;
-- descending order
SELECT * FROM customer
ORDER BY age DESC;
-- distinct
SELECT DISTINCT(age) FROM customer;
SELECT DISTINCT(age) FROM customer
ORDER BY age;
-- group by
SELECT balance,SUM(bill_amount) 
FROM customer
GROUP BY balance
ORDER BY SUM(bill_amount);

SELECT age,AVG(bill_amount)
FROM customer
GROUP BY age
ORDER BY age;

-- IN/List operators
SELECT * FROM customer
WHERE city IN('Kite','Denmark','Chester');
-- AND
SELECT * FROM customer
WHERE city = 'Denmark' AND gender ='F';
SELECT * FROM customer
WHERE age=27 AND balance = 'Y';
-- OR
SELECT * FROM customer
WHERE age = 27 OR balance = 'N';
-- BETWEEN
SELECT * FROM customer
WHERE bill_amount BETWEEN 40000 AND 50000;
-- LIMT
SELECT * FROM customer
ORDER BY bill_amount DESC
LIMIT 3;
-- AGGREGATE
SELECT COUNT(age) FROM customer;
SELECT MAX(bill_amount) FROM customer;
SELECT MIN(age) FROM customer;
SELECT SUM(bill_amount) FROM customer;
SELECT AVG(id) FROM customer;
-- HAVING
-- max bill amount agewise in increasing order 
SELECT age,MAX(bill_amount) 
FROM customer
GROUP BY age
HAVING age>50
ORDER BY age;
-- avg bill amount of ages betweeen 18 and 30 in decreasing order
SELECT age,AVG(bill_amount)
FROM customer 
GROUP BY age
HAVING age BETWEEN 18 AND 30
ORDER BY age DESC;
-- LIKE
-- name starting with t
SELECT first_name AS Tname FROM customer
WHERE first_name LIKE 'T%';
-- distinct city ending with k
SELECT DISTINCT(city) FROM customer
WHERE city LIKE '%k';
-- distinct city having second last letter as o
SELECT DISTINCT(city) FROM customer
WHERE city LIKE '%o_';
-- names having first letter t and last letter e
SELECT first_name AS namess FROM customer
WHERE first_name LIKE 'T%E';
-- CONCAT
SELECT first_name,last_name, CONCAT(first_name,' ',last_name) as full_name FROM customer;
-- LOWER
SELECT LOWER(last_name) FROM customer;
-- UPPER
SELECT UPPER(first_name) FROM customer;
-- REPLACE
SELECT REPLACE(city,'Denmark','DM') FROM customer;
-- REVERSE
SELECT REVERSE(emailId) FROM customer;
-- SUBSTR
SELECT SUBSTR(first_name,2,3) FROM customer;
-- LENGTH
SELECT emailId,LENGTH(emailId) FROM customer;
-- POSITION
SELECT POSITION('@' IN emailId) FROM customer;
-- CURRENT_DATE()
SELECT CURRENT_DATE();
-- new table product created in database
SELECT * FROM product;
-- INNER JOIN
SELECT * 
FROM customer
INNER JOIN product
ON customer.id = product.cust_id;
-- LEFT JOIN
SELECT * 
FROM customer
LEFT JOIN product
ON customer.id = product.cust_id
WHERE customer.id>100;
-- RIGHT JOIN
SELECT * 
FROM customer AS c
RIGHT JOIN product AS p
ON c.id = p.cust_id;
-- CROSS JOIN
SELECT *
FROM customer
CROSS JOIN product;
-- UNION
SELECT *
FROM customer AS c
LEFT JOIN product AS p
ON c.id=p.cust_id
UNION
SELECT *
FROM customer AS c
RIGHT JOIN product AS p
ON c.id = p.cust_id;

SELECT * FROM customer;
SELECT * FROM product;
-- SUBQUERY
SELECT * FROM customer
WHERE id IN
(SELECT cust_id FROM product);

SELECT first_name,age,bill_amount FROM customer
WHERE id IN
(SELECT cust_id FROM product
WHERE cust_id >=500);

-- find the average bill amount of female customers who live in denmark or albany
SELECT AVG(bill_amount) FROM customer
WHERE gender = 'F' 
AND city = 'Denmark' OR city = 'Albany';

-- query to find the name and email of customer who have balance as yes and bill amount is greater than 50000
SELECT first_NAME,emailId FROM customer
WHERE balance = 'Y' AND bill_amount>50000;

-- find the product id that was purchased by the most customer
SELECT product_id,COUNT(product_id) FROM product
GROUP BY product_id
ORDER BY COUNT(product_id) DESC
LIMIT 1;
















