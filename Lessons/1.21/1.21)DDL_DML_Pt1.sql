CREATE DATABASE IF NOT EXISTS  jobs_mart;

SHOW DATABASES;

-- DROP DATABASE if EXISTS jobs_mart;


SELECT * 
FROM information_schema.schemata;


USE jobs_mart;

CREATE SCHEMA  IF NOT EXISTS staging;

-- DROP SCHEMA If EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_roles (
     role_id INTEGER  PRIMARY KEY,
    role_name VARCHAR
);
   
SELECT * 
FROM information_schema.tables
where table_catalog = 'jobs_mart';


-- DROP TABLE IF EXISTS main.preferred_roles;

INSERT INTO staging.preferred_roles (role_id,role_name)
VALUES
    (1,'Data Engineer'),
    (2,'Senior Data Engineer ');
SELECT * FROM staging.preferred_roles;
INSERT INTO staging.preferred_roles (role_id,role_name)
VALUES
    (3,'Software Engineer'),
    (4,'Senior Software Engineer ');

ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_role BOOLEAN;

UPDATE staging.preferred_roles
SET preferred_role = TRUE
WHERE role_id = 1 OR role_id = 2;

UPDATE staging.preferred_roles
SET preferred_role = FALSE
WHERE role_id = 3;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;
SELECT * FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN preferred_role TO priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 3;
SELECT * FROM staging.priority_roles;

UPDATE staging.priority_roles
SET role_name = TRIM(role_name);