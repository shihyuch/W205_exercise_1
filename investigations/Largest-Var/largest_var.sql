# Get the unbiased sample standard deviation of a numeric column in the group of
# hospitals with same MEASURE_ID. Higher standard division represents higher 
# variation among hospitals. 

SELECT MEASURE_ID, stddev_samp(SCORE) AS variation
FROM combined WHERE SCORE >= 1 AND SCORE <= 200
GROUP BY MEASURE_ID
ORDER BY variation DESC LIMIT 10;
