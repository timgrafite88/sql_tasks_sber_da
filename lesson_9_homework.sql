--task1  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
--
--SELECT 
--CASE WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME
--     WHEN GRADES.GRADE < 8 THEN NULL
--END AS NAME, GRADES.GRADE, STUDENTS.MARKS
--FROM STUDENTS LEFT JOIN GRADES ON STUDENTS.MARKS >= MIN_MARK AND STUDENTS.MARKS <= MAX_MARK
--ORDER BY GRADES.GRADE DESC, STUDENTS.NAME ASC, STUDENTS.MARKS ASC;

--task2  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/occupations/problem

--SELECT Doctor, Professor, Singer, Actor 
--FROM ( SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rn, name, occupation FROM occupations) 
--PIVOT 
--(MAX(name) FOR occupation IN ('Doctor' as Doctor,'Professor' as Professor, 'Singer' as Singer, 'Actor' as Actor)) 
--ORDER BY rn;

--task3  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-9/problem

--SELECT DISTINCT city FROM station 
--WHERE city not LIKE 'A%' and city not LIKE 'E%' and city not LIKE 'I%' and city not LIKE 'O%' and city not LIKE 'U%';

--task4  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-10/problem
--
--SELECT DISTINCT city FROM station 
--WHERE city not LIKE '%a' and city not LIKE '%e' and city not LIKE '%i' and city not LIKE '%o' and city not LIKE '%u';

--task5  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-11/problem

--SELECT DISTINCT city FROM station 
--WHERE (city not LIKE 'A%' and city not LIKE 'E%' and city not LIKE 'I%' and city not LIKE 'O%' and city not LIKE 'U%') 
--OR (city not LIKE '%a' and city not LIKE '%e' and city not LIKE '%i' and city not LIKE '%o' and city not LIKE '%u');

--task6  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-12/problem

--SELECT DISTINCT city FROM station 
--WHERE (city not LIKE 'A%' and city not LIKE 'E%' and city not LIKE 'I%' and city not LIKE 'O%' and city not LIKE 'U%') 
--and (city not LIKE '%a' and city not LIKE '%e' and city not LIKE '%i' and city not LIKE '%o' and city not LIKE '%u');

--task7  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/salary-of-employees/problem

--select name
--from Employee
--where months < 10 and salary > 2000;

--task8  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
