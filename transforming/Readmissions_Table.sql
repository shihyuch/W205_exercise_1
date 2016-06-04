-- Create a new table based on readmisions by selecting proper columns 

DROP TABLE IF EXISTS Readmissions;
CREATE TABLE Readmissions AS 
SELECT  PROVIDERID as PROVIDER_ID,
        HOSPITALNAME as HOSPITAL_NAME,
        STATE as STATE,
        MEASUREID as MEASURE_ID,
        MEASURENAME as MEASURE_NAME,
        cast(SCORE as FLOAT) as SCORE
FROM readmissions1;

SELECT PROVIDER_ID, SCORE FROM Readmissions ORDER BY SCORE DESC limit 5;
180050  31.7
310003  28.8
330208  28.2
330169  28.0
330350  27.8
Time taken: 49.826 seconds, Fetched: 5 row(s)
