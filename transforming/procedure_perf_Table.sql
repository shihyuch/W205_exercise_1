-- Create a new table procedure_perf  by pulling the subset from the table EffectiveCare and Readmissions 

DROP TABLE IF EXISTS procedure_all;
CREATE TABLE procedure_all AS SELECT PROVIDER_ID, MEASURE_ID, MEASURE_NAME, SCORE FROM Readmissions;
INSERT INTO procedure_all SELECT PROVIDER_ID, MEASURE_ID, MEASURE_NAME, SCORE FROM EffectiveCare;

DROP TABLE IF EXISTS procedure_perf;
CREATE TABLE procedure_perf AS SELECT DISTINCT PROVIDER_ID, MEASURE_ID, MEASURE_NAME, Score FROM procedure_all;

SELECT PROVIDER_ID, MEASURE_ID, SCORE FROM procedure_perf Limit 3;
010001  MORT_30_AMI     12.2
010001  MORT_30_CABG    3.7
010001  MORT_30_COPD    8.8
Time taken: 0.135 seconds, Fetched: 3 row(s)

