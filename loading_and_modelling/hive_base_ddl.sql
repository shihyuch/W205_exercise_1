-- data were stored under the HDFS directory
--/user/w205/hospital_compare/

-- create an external table hospitals
DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
PHONENUMBER string,
HOSPITALTYPE string,
HOSPITALOWNSHIP string,
EMERGENCYSERVICES string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

LOAD DATA LOCAL INPATH '/home/w205/hospital_compare/hospitals.csv' INTO TABLE hospitals;

SELECT STATE,COUNTYNAME,HOSPITALOWNSHIP from hospitals limit 5; 

AK              Voluntary non-profit - Other
AK              Government - Local
AK              Government - Local
AK              Government - Local
AK              Government - Local
Time taken: 0.133 seconds, Fetched: 5 row(s)

-- create an external table effective_care
DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
PHONENUMBER int,
CONDITION string,
MEASUREID string,
MEASURENAME string,
SCORE string,
SAMPLE string,
FOOTNOTE  string,
MEASURESTARTDATE string,
MEASUREENDDATE string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

LOAD DATA LOCAL INPATH '/home/w205/hospital_compare/effective_care.csv' INTO TABLE effective_care;

SELECT SCORE, SAMPLE, MEASURESTARTDATE from effective_care limit 5;
98      589     10/01/2013
99      622     10/01/2013
Not Available   Not Available   10/01/2013
91      47      10/01/2013
286     476     10/01/2013
Time taken: 0.942 seconds, Fetched: 5 row(s)
-- create an external table readmissions
DROP TABLE readmissions1;
CREATE EXTERNAL TABLE readmissions1
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
PHONENUMBER int,
MEASURENAME string,
MEASUREID string,
COMPARETONATIONAL string,
DENOMINATOR string,
SCORE string,
LOWERESTIMATE  string,
HIGHERESTIMATE string,
FOOTNOTE  string,
MEASURESTARTDATE string,
MEASUREENDDATE string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions1';

LOAD DATA LOCAL INPATH '/home/w205/hospital_compare/readmissions.csv' INTO TABLE readmissions1;

SELECT SCORE,LOWERESTIMATE, MEASURESTARTDATE from readmissions limit 5;
12.2    10.2    07/01/2011
3.7     2.2     07/01/2011
8.8     6.9     07/01/2011
12.6    10.7    07/01/2011
11.6    9.1     07/01/2011
Time taken: 0.122 seconds, Fetched: 5 row(s)

-- create an external table Measures
DROP TABLE Measures;
CREATE EXTERNAL TABLE Measures
(MEASURENAME string,
MEASUREID string,
MEASURESTARTQUARTER string,
MEASURESTARTDATE string,
MEASUREENDQUARTER string,
MEASUREENDDATE string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures';

LOAD DATA LOCAL INPATH '/home/w205/hospital_compare/ Measures .csv' INTO TABLE Measures;

SELECT MEASURENAME,MEASUREID, MEASURESTARTQUARTER,MEASURESTARTDATE from Measures limit 5;

ACS Participation data  ACS_REGISTRY    3Q2013  2013-07-01 00:00:00
Statin Prescribed at Discharge  AMI_10  4Q2013  2013-10-01 00:00:00
Aspirin Prescribed at Discharge AMI_2   4Q2013  2013-10-01 00:00:00
Fibrinolytic Therapy Received within 30 Minutes of Hospital Arrival     AMI_7a4Q2013  2013-10-01 00:00:00
Primary PCI Received Within 90 Minutes of Hospital Arrival      AMI_8a  4Q20132013-10-01 00:00:00
Time taken: 0.131 seconds, Fetched: 5 row(s)



-- create an external table surveys_responses
DROP TABLE surveys_responses;
CREATE EXTERNAL TABLE surveys_responses
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
Communication_with_Nurses_Achievement_Points string,
Communication_with_Nurses_Improvement_Points string,
Communication_with_Nurses_Dimension_Score string,
Communication_with_Doctors_Achievement_Points string,
Communication_with_Doctors_Improvement_Points string,
Communication_with_Doctors_Dimension_Score string,
Responsiveness_of_Hospital_Staff_Achievement_Points string,
Responsiveness_of_Hospital_Staff_Improvement_Points string,
Responsiveness_of_Hospital_Staff_Dimension_Score string,
Pain_Management_Achievement_Points string,
Pain_Management_Improvement_Points string,
Pain_Management_Dimension_Score string,
Communication_about_Medicines_Achievement_Points string,
Communication_about_Medicines_Improvement_Points string,
Communication_about_Medicines_Dimension_Score string,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points string,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points string,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score string,
Discharge_Information_Achievement_Points string,
Discharge_Information_Improvement_Points string,
Discharge_Information_Dimension_Score string,
Overall_Rating_of_Hospital_Achievement_Points string,
Overall_Rating_of_Hospital_Improvement_Points string,
Overall_Rating_of_Hospital_Dimension_Score string,
HCAHPS_Base_Score string,
HCAHPS_Consistency_Score string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';

LOAD DATA LOCAL INPATH '/home/w205/hospital_compare/surveys_responses.csv' INTO TABLE surveys_responses;

SELECT HCAHPS_Base_Score, HCAHPS_Consistency_Score from surveys_responses limit 5;
17      16
51      20
9       12
40      17
30      15
Time taken: 0.179 seconds, Fetched: 5 row(s)
