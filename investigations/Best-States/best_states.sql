### Consider procedures by joint (combined) table
SELECT STATE, AVG(SCORE) AS performance
FROM combined WHERE SCORE >= 1 AND SCORE <= 200
GROUP BY STATE
ORDER BY performance ASC LIMIT 10;

### Consider by Readmissions table
SELECT STATE, AVG(SCORE) AS performance
FROM Readmissions WHERE SCORE >= 1
GROUP BY STATE
ORDER BY performance ASC LIMIT 10;

### Consider by EffectiveCare table
SELECT STATE, AVG(SCORE) AS performance
FROM EffectiveCare WHERE SCORE >= 1
GROUP BY STATE
ORDER BY performance ASC LIMIT 10;


#### > 1 to avoid null value, < 200, to avoid outliers
