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

-- BETWEEN включает в себя указанные границы
-- если одна или обе границы не включаются, тогда уже описывать
-- диапозон с помощью x > 1 AND x < 10 
SELECT order_date
FROM orders
WHERE order_date BETWEEN '1996-08-01' and '1996-09-01';

SELECT contact_name, city
FROM customers 
WHERE city IN('Berlin', 'London', 'Madrid');

SELECT contact_name, city
FROM customers 
WHERE city NOT IN('Berlin', 'London', 'Madrid');

--сортировка по возрастанию поля
-- неявно происходит сортировка по возрастанию
SELECT DISTINCT country
FROM customers
ORDER BY country

-- идентичный запрос
SELECT DISTINCT country
FROM customers
ORDER BY country ASC

-- по убыванию
SELECT DISTINCT country
FROM customers
ORDER BY country DESC

-- Ппо убываю страны, по возрастанию города
-- внутри каждой страны, которыеидут по убыванию
-- города отсортированы по возрастанию
SELECT DISTINCT country, city
FROM customers
ORDER BY country DESC, city ASC


-- все заказы из лодно в период с по
SELECT ship_city, order_date
FROM orders
WHERE ship_city='London' AND (order_date BETWEEN '1996-01-01' and '1998-09-01')
ORDER BY order_date DESC

-- минимальная дата заказа из этого периода в городе Лондон
-- аналогично максимальна дата MAX(order_date)
SELECT MIN(order_date)
FROM orders
WHERE ship_city='London' AND (order_date BETWEEN '1996-01-01' and '1998-09-01')


-- средняя цена товаров
SELECT AVG(unit_price)
FROM products
WHERE discontinued <> 1