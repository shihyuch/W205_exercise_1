SELECT HOSPITAL_NAME, Achievement_Points, Improvement_Points, Dimension_Score, (Base_Score+Consistency_Score) as Total_Score From surveys ORDER BY Total_Score DESC LIMIT 10;