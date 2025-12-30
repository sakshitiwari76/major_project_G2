select * from education limit 5;

--Average marks(Overall)
SELECT AVG(avg_marks) AS average_marks
FROM education

--Attendance Percentage(Average)
SELECT AVG(attendance_percentage) AS avg_attendance
FROM education

--Pass Rate
SELECT (SUM(CASE WHEN overall_score>= 40 THEN 1 ELSE 0 END) * 100.0/COUNT(*)) AS pass_rate_percentage
FROM education

--Top Performing Subject
SELECT subject, avg_score
FROM(
     SELECT 'Math' AS subject,
	 AVG(math_score) AS avg_score FROM education
	 UNION ALL
	 
	 SELECT 'Science' AS subject,
	 AVG(science_score) AS avg_score FROM education
	 UNION ALL
	 
	 SELECT 'English' AS subject,
	 AVG(english_score) AS avg_score FROM education
) t
ORDER BY avg_score DESC
LIMIT 1;

--Gender-wise Average Marks
SELECT gender,
AVG(overall_score) AS avg_marks
FROM education
GROUP BY gender;

--Overall Grade Trend
SELECT final_grade,
COUNT(*) AS total_students
FROM education
GROUP BY final_grade
ORDER BY final_grade;

--Performance Growth(%)
SELECT 
   CASE
       WHEN study_hours < 2 THEN 'Low Study'
	   WHEN study_hours BETWEEN 2 AND 5 THEN 'Medium Study'
	   ELSE 'High Study'
	 END AS study_category,
	 AVG(overall_score) AS avg_score
FROM education
GROUP BY study_category;

--Teacher Impact Index 
SELECT school_type,
AVG(overall_score) AS teacher_impact_index
FROM education
GROUP BY school_type

--Improvement Ratio
SELECT
     SUM(CASE WHEN overall_score >= 60 THEN 1 ELSE 0 END)*1.0/COUNT(*) AS improvement_ratio
FROM education