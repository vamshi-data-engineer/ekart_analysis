
-- =========================================================
-- 1. Create role and assign to user
-- =========================================================
USE ROLE ACCOUNTADMIN;
CREATE ROLE IF NOT EXISTS DATA_ENGINEER;
GRANT ROLE DATA_ENGINEER TO USER VAMSHI;
-- Best practice: nest under SYSADMIN so it shows up in the role hierarchy
GRANT ROLE DATA_ENGINEER TO ROLE SYSADMIN;

-- =========================================================
-- 2. Warehouse privileges
-- =========================================================
GRANT USAGE ON WAREHOUSE EKART_WH TO ROLE DATA_ENGINEER;
GRANT CREATE WAREHOUSE ON ACCOUNT TO ROLE DATA_ENGINEER;
GRANT OPERATE ON WAREHOUSE EKART_WH TO ROLE DATA_ENGINEER;

-- =========================================================
-- 3. Database-level privileges
-- =========================================================
GRANT USAGE ON DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 4. Schema-level privileges (current + future schemas)
-- =========================================================
GRANT USAGE, CREATE TABLE, CREATE VIEW, CREATE STAGE, CREATE FILE FORMAT,
       CREATE SEQUENCE, CREATE PROCEDURE, CREATE FUNCTION,
       CREATE STREAM, CREATE TASK, CREATE PIPE
    ON ALL SCHEMAS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

GRANT USAGE, CREATE TABLE, CREATE VIEW, CREATE STAGE, CREATE FILE FORMAT,
       CREATE SEQUENCE, CREATE PROCEDURE, CREATE FUNCTION,
       CREATE STREAM, CREATE TASK, CREATE PIPE
    ON FUTURE SCHEMAS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;


-- =========================================================
-- 5. Table privileges (current + future tables)
-- =========================================================
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES
    ON ALL TABLES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES
    ON FUTURE TABLES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 6. View privileges (current + future views)
-- =========================================================
GRANT SELECT ON ALL VIEWS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT SELECT ON FUTURE VIEWS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 7. Stage privileges (current + future stages)
-- =========================================================
GRANT READ, WRITE ON ALL STAGES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT READ, WRITE ON FUTURE STAGES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 8. File format privileges
-- =========================================================
GRANT USAGE ON ALL FILE FORMATS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT USAGE ON FUTURE FILE FORMATS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 9. Sequence privileges
-- =========================================================
GRANT USAGE ON ALL SEQUENCES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT USAGE ON FUTURE SEQUENCES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 10. Stream privileges (for CDC pipelines)
-- =========================================================
GRANT SELECT ON ALL STREAMS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

GRANT CREATE DATABASE ON ACCOUNT TO ROLE DATA_ENGINEER;
GRANT SELECT ON FUTURE STREAMS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 11. Task privileges (for orchestration / DAGs)
-- =========================================================
GRANT MONITOR, OPERATE ON ALL TASKS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT MONITOR, OPERATE ON FUTURE TASKS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 12. Procedure & Function privileges
-- =========================================================
GRANT USAGE ON ALL PROCEDURES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT USAGE ON FUTURE PROCEDURES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

GRANT USAGE ON ALL FUNCTIONS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT USAGE ON FUTURE FUNCTIONS IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

-- =========================================================
-- 13. Pipe privileges (for Snowpipe ingestion)
-- =========================================================
GRANT MONITOR, OPERATE ON ALL PIPES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;
GRANT MONITOR, OPERATE ON FUTURE PIPES IN DATABASE EKART_ANALYSIS_DB TO ROLE DATA_ENGINEER;

GRANT CREATE INTEGRATION ON ACCOUNT TO ROLE DATA_ENGINEER;

GRANT CREATE SCHEMA ON DATABASE