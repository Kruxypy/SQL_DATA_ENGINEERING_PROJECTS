CREATE DATABASE IF NOT EXISTS  jobs_mart;

SHOW DATABASES;

DROP DATABASE if EXISTS jobs_mart;


SELECT * 
FROM information_schema.schemata;


USE jobs_mart;

CREATE SCHEMA  IF NOT EXISTS staging;

DROP SCHEMA If EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_roles (
     role_id INTEGER,
    role_name VARCHAR
);
   
SELECT * 
FROM information_schema.tables
where table_catalog = 'jobs_mart';


DROP TABLE IF EXISTS main.preferred_roles;