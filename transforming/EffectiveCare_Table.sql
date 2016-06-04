-- Create a new table based on effective_care by selecting proper columns for 
-- questions requirements

DROP TABLE IF EXISTS EffectiveCare;
CREATE TABLE EffectiveCare AS 
SELECT  PROVIDERID as PROVIDER_ID,
        HOSPITALNAME as HOSPITAL_NAME,
        STATE as STATE,
        MEASUREID as MEASURE_ID,
        MEASURENAME as MEASURE_NAME,
    cast(SCORE as FLOAT) as SCORE
FROM effective_care;


SELECT PROVIDER_ID, SCORE FROM EffectiveCare WHERE SCORE >= 1 ORDER BY SCORE ASC limit 5;
100128  1.0
450788  1.0
450788  1.0
440084  1.0
100130  1.0
Time taken: 51.337 seconds, Fetched: 5 row(s)
