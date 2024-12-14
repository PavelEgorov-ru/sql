-- пример ссоздания БД

CREATE DATABASE testdb
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Удаление БД

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'testdb' 
AND pid <> pg_backend_pid()

DROP DATABASE testdb


-- Создание таблицы

CREATE TABLE publisher
(
  publisher_id INTEGER PRIMARY KEY, -- уникальный ключ в таблице
  org_name VARCHAR(128) NOT NULL, -- NOT NULL нельзя передавать пустое значение
  addres TEXT NOT NULL,
  -- CONSTRAINT pk_publisher_id PRIMARY KEY (publisher_id)
);


CREATE TABLE book
(
  book_id INTEGER PRIMARY KEY, -- уникальный ключ в таблице
  title TEXT NOT NULL, -- NOT NULL нельзя передавать пустое значение
  isbn VARCHAR(32) NOT NULL
)

--удаление таблиц
DROP TABLE publisher;
DROP TABLE book

-- всиавить данные в таблицу

INSERT INTO book
VALUES
(1, 'новое описние книги', '33321231'),
(2, 'второе описание книги', '43928439'),
(3, 'супер классная книга', '77438832'),
(4, 'отличная книга', '33321231'),
(5, 'просто новая книга', '7878393'),
(6, 'эта книга так себе', '894830209'),
(7, 'просто фигня', '4389848899');


INSERT INTO publisher
VALUES
(1, 'Питер', 'SPB'),
(2, 'Феникс', 'MSK'),
(3, 'Новая книга', 'KZN'),
(4, 'Волна', 'EKB')

-- проверка вставки данных
SELECT *
from book