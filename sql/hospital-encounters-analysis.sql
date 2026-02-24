-- ============================================================
-- HOSPITAL ENCOUNTERS ANALYSIS
-- Based on a Maven Analytics guided case study
-- SQL implementation, restructuring, and extensions by Deborah Akhabue
-- Includes data exploration, transformation, and BI semantic modeling
-- ============================================================



-- ============================================================
-- SECTION 1: ANALYSIS QUERIES
-- Exploratory SQL used for insights and dashboard development
-- ============================================================



-- ==============================
-- OBJECTIVE 1: ENCOUNTERS OVERVIEW
-- ==============================

-- Total encounters by year
SELECT YEAR(START) AS yr, 
       COUNT(Id) AS total_encounters
FROM encounters
GROUP BY yr
ORDER BY yr;


-- Encounter class distribution by year (%)
SELECT YEAR(START) AS yr,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'ambulatory' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS ambulatory,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'outpatient' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS outpatient,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'wellness' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS wellness,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'urgentcare' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS urgentcare,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'emergency' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS emergency,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'inpatient' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS inpatient
FROM encounters
GROUP BY yr
ORDER BY yr;


-- Encounter duration split (>24hrs vs <24hrs)
SELECT
    ROUND(SUM(CASE WHEN TIMESTAMPDIFF(HOUR, START, STOP) >= 24 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS over_24_hours,
    ROUND(SUM(CASE WHEN TIMESTAMPDIFF(HOUR, START, STOP) < 24 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS under_24_hours
FROM encounters;



-- ==============================
-- OBJECTIVE 2: COST & COVERAGE INSIGHTS
-- ==============================

-- Encounters with zero payer coverage
SELECT
    SUM(CASE WHEN PAYER_COVERAGE = 0 THEN 1 ELSE 0 END) AS zero_payer_coverage,
    COUNT(*) AS total_encounters,
    ROUND(SUM(CASE WHEN PAYER_COVERAGE = 0 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS pct_zero_payer
FROM encounters;


-- Top 10 most frequent procedures + average base cost
SELECT 
    CODE, DESCRIPTION, 
    COUNT(*) AS num_procedures, 
    AVG(BASE_COST) AS avg_base_cost
FROM procedures
GROUP BY CODE, DESCRIPTION
ORDER BY num_procedures DESC
LIMIT 10;


-- Top 10 procedures with highest average cost
SELECT 
    CODE, DESCRIPTION, 
    AVG(BASE_COST) AS avg_base_cost, 
    COUNT(*) AS num_procedures
FROM procedures
GROUP BY CODE, DESCRIPTION
ORDER BY avg_base_cost DESC
LIMIT 10;


-- Average claim cost by payer
SELECT 
    p.NAME, 
    AVG(e.TOTAL_CLAIM_COST) AS avg_total_claim_cost
FROM payers p
LEFT JOIN encounters e
ON p.Id = e.PAYER
GROUP BY p.NAME
ORDER BY avg_total_claim_cost DESC;



-- ==============================
-- OBJECTIVE 3: PATIENT BEHAVIOR ANALYSIS
-- ==============================

-- Unique patients admitted per quarter
SELECT 
    YEAR(START) AS yr, 
    QUARTER(START) AS qrtr, 
    COUNT(DISTINCT PATIENT) AS num_unique_patients
FROM encounters 
GROUP BY yr, qrtr
ORDER BY yr, qrtr;


-- Patients readmitted within 30 days
WITH cte AS (
    SELECT 
        PATIENT, START, STOP,
        LEAD(START) OVER(PARTITION BY PATIENT ORDER BY START) AS next_start_date
    FROM encounters
)
SELECT COUNT(DISTINCT PATIENT) AS num_patients_readmitted_30d
FROM cte
WHERE DATEDIFF(next_start_date, STOP) < 30;


-- Patients with most readmissions
WITH cte AS (
    SELECT 
        PATIENT, START, STOP,
        LEAD(START) OVER(PARTITION BY PATIENT ORDER BY START) AS next_start_date
    FROM encounters
)
SELECT PATIENT, COUNT(*) AS num_readmissions
FROM cte
WHERE DATEDIFF(next_start_date, STOP) < 30
GROUP BY PATIENT
ORDER BY num_readmissions DESC;



-- =============================================================
-- SECTION 2: AGGREGATED VIEWS FOR POWER BI
-- BI-ready semantic layer used for dashboard creation
-- =============================================================



CREATE VIEW agg_encounters_by_year AS
SELECT YEAR(START) AS yr, COUNT(Id) AS total_encounters
FROM encounters
GROUP BY yr
ORDER BY yr;


CREATE VIEW agg_encounter_class_pct AS
SELECT YEAR(START) AS yr,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'ambulatory' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS ambulatory,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'outpatient' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS outpatient,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'wellness' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS wellness,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'urgentcare' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS urgentcare,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'emergency' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS emergency,
       ROUND(SUM(CASE WHEN ENCOUNTERCLASS = 'inpatient' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS inpatient
FROM encounters
GROUP BY yr
ORDER BY yr;


CREATE VIEW agg_encounter_duration_distribution AS
SELECT
    ROUND(SUM(CASE WHEN TIMESTAMPDIFF(HOUR, START, STOP) >= 24 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS over_24_hours,
    ROUND(SUM(CASE WHEN TIMESTAMPDIFF(HOUR, START, STOP) < 24 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS under_24_hours
FROM encounters;


CREATE VIEW agg_zero_payer_coverage AS
SELECT
    SUM(CASE WHEN PAYER_COVERAGE = 0 THEN 1 ELSE 0 END) AS zero_payer_coverage,
    COUNT(*) AS total_encounters,
    ROUND(SUM(CASE WHEN PAYER_COVERAGE = 0 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS pct_zero_payer
FROM encounters;


CREATE VIEW frequent_procedure_avg_cost AS
SELECT CODE, DESCRIPTION, COUNT(*) AS num_procedures, AVG(BASE_COST) AS avg_base_cost
FROM procedures
GROUP BY CODE, DESCRIPTION
ORDER BY num_procedures DESC
LIMIT 10;


CREATE VIEW frequent_procedures_highest_avg_cost AS
SELECT CODE, DESCRIPTION, AVG(BASE_COST) AS avg_base_cost, COUNT(*) AS num_procedures
FROM procedures
GROUP BY CODE, DESCRIPTION
ORDER BY avg_base_cost DESC
LIMIT 10;


CREATE VIEW agg_claim_cost_by_payer AS
SELECT p.NAME, AVG(e.TOTAL_CLAIM_COST) AS avg_total_claim_cost
FROM payers p
LEFT JOIN encounters e ON p.Id = e.PAYER
GROUP BY p.NAME
ORDER BY avg_total_claim_cost DESC;


CREATE VIEW agg_unique_patient_admitted_per_quarter AS
SELECT YEAR(START) AS yr, QUARTER(START) AS qrtr, COUNT(DISTINCT PATIENT) AS num_unique_patients
FROM encounters 
GROUP BY yr, qrtr
ORDER BY yr, qrtr;


CREATE VIEW agg_readmissions_30d AS
SELECT PATIENT, START, STOP,
       LEAD(START) OVER(PARTITION BY PATIENT ORDER BY START) AS next_start_date
FROM encounters;


CREATE VIEW agg_most_admitted_patient AS
WITH cte AS (
    SELECT PATIENT, START, STOP,
           LEAD(START) OVER(PARTITION BY PATIENT ORDER BY START) AS next_start_date
    FROM encounters
)
SELECT PATIENT, COUNT(*) AS num_readmission
FROM cte
WHERE DATEDIFF(next_start_date, STOP) < 30
GROUP BY PATIENT
ORDER BY num_readmission DESC;



-- =============================================================
-- END OF ANALYSIS
-- Queries + views used for Power BI dashboards
-- =============================================================