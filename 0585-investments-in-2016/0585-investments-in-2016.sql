# Write your MySQL query statement below
WITH temp AS(
    SELECT pid
    FROM Insurance
    WHERE tiv_2015 IN (SELECT DISTINCT tiv_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(tiv_2015) > 1)

    INTERSECT 

    SELECT pid
    FROM Insurance
    WHERE CONCAT(lat, lon) NOT IN (SELECT DISTINCT CONCAT(lat, lon) FROM Insurance GROUP BY CONCAT(lat, lon) HAVING COUNT(CONCAT(lat, lon)) > 1)
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE pid IN (SELECT * FROM temp)