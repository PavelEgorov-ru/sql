# пример ссоздания БД

CREATE DATABASE testdb
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


# Удаление БД

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'testdb' 
AND pid <> pg_backend_pid()

DROP DATABASE testdb