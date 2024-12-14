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
  isbn VARCHAR(32) NOT NULL,
  -- пример создания внешнего ключа
  fk_publisher_id INTEGER  REFERENCES publisher(publisher_id) NOT NULL
)

--удаление таблиц
DROP TABLE publisher;
DROP TABLE book

-- всиавить данные в таблицу

INSERT INTO book
VALUES
(1, 'новое описние книги', '33321231', 2),
(2, 'второе описание книги', '43928439', 3),
(3, 'супер классная книга', '77438832', 3),
(4, 'отличная книга', '33321231', 3),
(5, 'просто новая книга', '7878393', 1),
(6, 'эта книга так себе', '894830209', 4),
(7, 'просто фигня', '4389848899', 4);


INSERT INTO publisher
VALUES
(1, 'Питер', 'SPB'),
(2, 'Феникс', 'MSK'),
(3, 'Новая книга', 'KZN'),
(4, 'Волна', 'EKB')

-- проверка вставки данных
SELECT *
from book


-- Добавление колл=онки в таблицу
ALTER TABLE book
ADD COLUMN fk_publisher_id INTEGER;

ALTER TABLE book
ADD CONSTRAINT fk_book_publisher_id FOREIGN KEY(fk_publisher_id) REFERENCES publisher(publisher_id);

CREATE TABLE person
(
  person_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT not NULL
);

CREATE TABLE passport
(
  passport_id INTEGER PRIMARY KEY,
  serias VARCHAR(10) NOT NULL,
  regirstration TEXT NOT NULL,
  fk_person_id INTEGER REFERENCES person(person_id) NOT NULL
);

INSERT INTO person 
VALUES
(1, 'Павел', 'Егоров'),
(2, 'Иван', 'Иввнов'),
(3, 'Пётр', 'Петров'),
(4, 'Степан', 'Степанов'),
(5, 'Павел', 'Рожков');

INSERT INTO passport
VALUES
(1, '1212121212', 'MSK', 2),
(2, '1313131313', 'CHB', 3),
(3, '1414141414', 'MSK', 4),
(4, '1111111111', 'SPB', 1),
(1, '1212121212', 'MSK', 5),