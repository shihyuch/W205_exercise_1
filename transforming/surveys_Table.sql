-- Create a new table survey by pulling the subset from the raw hospitals table and 
-- copy all data.
DROP TABLE IF EXISTS surveys;
CREATE TABLE surveys AS 
SELECT  PROVIDERID as PROVIDER_ID,
        HOSPITALNAME as HOSPITAL_NAME,
        Overall_Rating_of_Hospital_Achievement_Points as Achievement_Points,
        Overall_Rating_of_Hospital_Improvement_Points as Improvement_Points,
        Overall_Rating_of_Hospital_Dimension_Score as Dimension_Score,
        HCAHPS_Base_Score as Base_Score,
        HCAHPS_Consistency_Score as Consistency_Score
FROM surveys_responses;

SELECT PROVIDER_ID, Achievement_Points, Base_Score from surveys limit 5;
010001  3 out of 10     17
010005  5 out of 10     51
010006  0 out of 10     9
010007  2 out of 10     40
010008  0 out of 10     30
Time taken: 0.088 seconds, Fetched: 5 row(s)

