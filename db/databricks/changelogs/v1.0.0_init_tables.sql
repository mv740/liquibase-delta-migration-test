--liquibase formatted sql

--changeset yourname:1
CREATE TABLE test_nprod.liquid_base_test.employees (
    id INT,
    name STRING,
    role STRING,
    value INT
) USING DELTA
TBLPROPERTIES ('delta.columnMapping.mode' = 'id');
--rollback DROP TABLE test_nprod.liquid_base_test.employees;
