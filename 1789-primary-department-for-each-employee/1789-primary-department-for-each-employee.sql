# Write your MySQL query statement below
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y' #it eliminates duplicates and gives the 'Y' assigned emoplyee_id only
UNION 
SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1;