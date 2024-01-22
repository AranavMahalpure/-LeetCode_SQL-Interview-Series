# Write your MySQL query statement below
SELECT DISTINCT teacher_id ,COUNT(DISTINCT subject_id) as CNT
FROM Teacher 
GROUP BY teacher_id;