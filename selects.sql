-- простая выборка полной таблицы
SELECT *
FROM products

-- отдельные столбцы
SELECT product_id, product_name, unit_price
FROM products

-- имена для атрибутов
SELECT product_id as product, product_name as name, unit_price as price
FROM products

-- некоторые атрибуты можно использовать в матоперациях
SELECT product_id, product_name, unit_price * units_in_stock as value
FROM products

-- вывод ункальных значений в атрибуте
SELECT DISTINCT country
FROM employees

-- число уникальных значений в атрибуте
SELECT COUNT(DISTINCT country)
FROM employees

-- ДЗ

SELECT *
FROM customers

SELECT contact_name, city
FROM customers

SELECT order_id, required_date - shipped_date as date
FROM orders

SELECT DISTINCT ship_city
FROM orders

SELECT DISTINCT ship_city, ship_country
FROM orders

SELECT COUNT(ship_name)
FROM orders

SELECT COUNT(DISTINCT ship_city)
FROM orders
