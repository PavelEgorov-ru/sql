SELECT company_name, contact_name, phone
FROM customers
WHERE country = 'USA'; 

SELECT*
FROM products
WHERE unit_price > 20;

-- уникальные значения
SELECT DISTINCT city
FROM customers

SELECT COUNT(*)
FROM products
WHERE unit_price < 20;

SELECT COUNT(*)
FROM products
WHERE discontinued = 1;

-- кольичество уникальных городов в таблице
-- сначала находим уникальные города
-- потом считаем их с помощью COUNT
SELECT COUNT(DISTINCT city)
FROM customers

SELECT order_date
FROM orders
WHERE order_date >= '1996-08-01' and order_date < '1996-09-01';

SELECT product_name, unit_price as price, units_in_stock as stock
FROM products
WHERE unit_price > 30 AND units_in_stock > 20;

SELECT contact_name, city
FROM customers 
WHERE city = 'Berlin' OR city = 'London' OR city = 'Madrid'

-- Диапазон включает в себя значения указанных дат
SELECT order_date
FROM orders
WHERE order_date BETWEEN '1996-08-01' and '1996-09-01';

SELECT contact_name, city
FROM customers 
WHERE city IN('Berlin', 'London', 'Madrid');

SELECT contact_name, city
FROM customers 
WHERE city NOT IN('Berlin', 'London', 'Madrid');