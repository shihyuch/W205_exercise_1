#### Combine two tables, 

 
DROP TABLE IF EXISTS combined;
CREATE TABLE combined AS
SELECT unioned.PROVIDER_ID, unioned. HOSPITAL_NAME, unioned.STATE, unioned.MEASURE_ID, unioned. MEASURE_NAME, unioned.SCORE
FROM (
  SELECT a.PROVIDER_ID, a. HOSPITAL_NAME, a.STATE, a.MEASURE_ID, a. MEASURE_NAME, a.SCORE 
  FROM EffectiveCare a  
  UNION ALL  
  SELECT b.PROVIDER_ID, b.HOSPITAL_NAME, b.STATE, b.MEASURE_ID, b.MEASURE_NAME, b.SCORE 
  from Readmissions b
) unioned;
### Consider procedures by joint (combined) table
SELECT HOSPITAL_NAME, AVG(SCORE) AS performance
FROM combined WHERE SCORE >= 1 AND SCORE <= 200
GROUP BY HOSPITAL_NAME, PROVIDER_ID
ORDER BY performance ASC LIMIT 10;

### Consider by Readmissions table 
SELECT HOSPITAL_NAME, AVG(SCORE) AS performance
FROM Readmissions WHERE SCORE >=1
GROUP BY HOSPITAL_NAME, PROVIDER_ID 
ORDER BY performance ASC LIMIT 10;

### Consider by EffectiveCare table 
SELECT HOSPITAL_NAME, AVG(SCORE) AS performance
FROM EffectiveCare WHERE SCORE >=1
GROUP BY HOSPITAL_NAME, PROVIDER_ID
ORDER BY performance ASC LIMIT 10;

