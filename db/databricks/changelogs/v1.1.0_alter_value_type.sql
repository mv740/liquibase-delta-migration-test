--liquibase formatted sql

--changeset yourname:2a
-- 1. Create a temporary column with the target BIGINT type
ALTER TABLE test_nprod.liquid_base_test.employees ADD COLUMN temp_value BIGINT;

-- 2. Backfill the new column with data from the old column
UPDATE test_nprod.liquid_base_test.employees SET temp_value = CAST(value AS BIGINT);

-- 3. Drop the original integer column
ALTER TABLE test_nprod.liquid_base_test.employees DROP COLUMN value;

-- 4. Rename the temporary column back to the original name
ALTER TABLE test_nprod.liquid_base_test.employees RENAME COLUMN temp_value TO value;

--rollback ALTER TABLE test_nprod.liquid_base_test.employees ADD COLUMN temp_value INT;
--rollback UPDATE test_nprod.liquid_base_test.employees SET temp_value = CAST(value AS INT);
--rollback ALTER TABLE test_nprod.liquid_base_test.employees DROP COLUMN value;
--rollback ALTER TABLE test_nprod.liquid_base_test.employees RENAME COLUMN temp_value TO value;
