#!/bin/bash
# Pre-processing data then place them in HDFS
### Removing first line and change name
###[w205@ip-172-31-30-144 hospital_compare]$, working path
PATH=/home/w205/hospital_compare:
## For Hospital General Information.csv
-n +2 /home/w205/hospital_compare/ Hospital\ General\ Information.csv > /home/w205/hospital_compare/hospitals.csv
## For Timely and Effective Care - Hospital.csv
-n +2 /home/w205/hospital_compare/Timely\ and\ Effective\ Care\ -\ Hospital.csv > /home/w205/hospital_compare/effective_care.csv
## For Readmissions and Deaths - Hospital.csv
-n +2 /home/w205/hospital_compare/Readmissions\ and\ Deaths.csv > /home/w205/hospital_compare/readmissions.csv
## For Measure Dates.csv
-n +2 /home/w205/hospital_compare/Measure\ and\ Dates.csv > /home/w205/hospital_compare/Measures.csv
## For hvbp_hcahps_05_28_2015.csv
-n +2 /home/w205/hospital_compare/ hvbp_hcahps_05_28_2015.csv > /home/w205/hospital_compare/survey_responses.csv

### Make an HDFS folder for each data set and place them in HDFS
###[w205@ip-172-31-30-144]$, working path root at HDFS
PATH=/:
## For hospitals.csv
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals_data
hdfs dfs -put /home/w205/hospital_compare/hospitals.csv  /user/w205/hospital_compare/hospitals_data

## For effective_care.csv
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care_data
hdfs dfs -put /home/w205/hospital_compare/effective_care.csv  /user/w205/hospital_compare/effective_care_data

## For readmissions.csv
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions_data
hdfs dfs -put /home/w205/hospital_compare/ readmissions.csv  /user/w205/hospital_compare/ readmissions _data

## For Measure Dates.csv 
hdfs dfs -mkdir /user/w205/hospital_compare/Measures_data
hdfs dfs -put /home/w205/hospital_compare/Measures.csv  /user/w205/hospital_compare/Measures_data

## For surveys_responses.csv
hdfs dfs -mkdir /user/w205/hospital_compare/ surveys_responses _data
hdfs dfs -put /home/w205/hospital_compare/ surveys_responses.csv  /user/w205/hospital_compare/ surveys_responses _data

