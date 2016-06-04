-- CREATE TABLE
DROP TABLE IF EXISTS score_survey;
CREATE TABLE score_survey AS SELECT  
procedure_perf.PROVIDER_ID,
hospitals_info.HOSPITAL_NAME,
AVG(procedure_perf.SCORE) AS Avg_Proc_Score,
COUNT(DISTINCT procedure_perf.Measure_ID) AS Num_Distinct_Procs,
AVG(surveys.Base_Score + surveys.Consistency_Score) AS Total_Survey_Score
FROM procedure_perf
JOIN hospitals_info ON (procedure_perf.PROVIDER_ID = hospitals_info.PROVIDER_ID) 
JOIN surveys ON (procedure_perf.PROVIDER_ID = surveys.PROVIDER_ID) 
GROUP BY procedure_perf.PROVIDER_ID, hospitals_info.HOSPITAL_NAME
ORDER BY Total_Survey_Score DESC;


-- SHOW TOP TEN
SELECT * FROM score_survey LIMIT 10;

-- CALCULATE CORRELATIONS
SELECT 
CORR(Avg_Proc_Score, Total_Survey_Score) AS Quality_Survey_CORR,
CORR(Num_Distinct_Procs, Total_Survey_Score) AS Variability_Survey_CORR
FROM score_survey;
