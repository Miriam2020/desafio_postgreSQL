CREATE DATABASE my_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1

CREATE SCHEMA app_db
    AUTHORIZATION postgres;