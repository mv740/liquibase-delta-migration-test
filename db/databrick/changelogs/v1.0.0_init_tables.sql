--liquibase formatted sql

--changeset yourname:1
CREATE TABLE default.employees (
    id INT,
    name STRING,
    role STRING
) USING DELTA;
--rollback DROP TABLE default.employees;
