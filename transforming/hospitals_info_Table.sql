-- Create a new table hospitals_info by pulling the subset from the raw hospitals table and 
-- copy all data.
DROP TABLE IF EXISTS hospitals_info;
CREATE TABLE hospitals_info AS 
SELECT  PROVIDERID as PROVIDER_ID,
        HOSPITALNAME as HOSPITAL_NAME,
        STATE as STATE
FROM hospitals;

SELECT PROVIDER_ID, HOSPITAL_NAME FROM hospitals Limit 3;
020024  CENTRAL PENINSULA GENERAL HOSPITAL
021301  PROVIDENCE VALDEZ MEDICAL CENTER
021302  PROVIDENCE SEWARD HOSPITAL
Time taken: 0.135 seconds, Fetched: 3 row(s)

