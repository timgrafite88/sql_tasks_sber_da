--task1  (lesson8)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/

--select department, employee, salary
--from (select d.name as department, e.name as employee, salary,
--      dense_rank () over (partition by d.name order by salary desc) as rk
--      from employee e join department d on d.id = e.departmentId) x 
--where rk <= 3


--task2  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/17
--
--SELECT member_name, status, SUM(amount*unit_price) as costs
--from FamilyMembers join Payments on FamilyMembers.member_id=Payments.family_member
--WHERE YEAR(DATE) = 2005
--GROUP BY member_name, status 

--task3  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/13
--
--SELECT name
--from (SELECT name, COUNT(id) as c 
--      from Passenger
--      GROUP BY name) x 
--where c >= 2

--task4  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
--
--SELECT count(first_name) as count 
--from Student
--where first_name = 'Anna'


--task5  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/35
--
--select DISTINCT count(classroom) as count 
--from Schedule
--WHERE date like '2019-09-02'

--task6  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
--
--SELECT count(first_name) as count 
--from Student
--where first_name = 'Anna'


--task7  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/32
--
--SELECT round(avg(2021-YEAR(birthday))) as age
--from FamilyMembers 

--task8  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/27

--SELECT good_type_name, sum(amount*unit_price) as costs
--from GoodTypes gt join goods g on g.type = gt.good_type_id join Payments p ON 
--p.good = g.good_id
--where YEAR(date) = 2005
--GROUP BY good_type_name

--task9  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/37
--
--select min(2021  - YEAR(birthday)) as year 
--from Student


--task10  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/44

--SELECT max(2022 - year(birthday)) as max_year
--from Student s join Student_in_class st on s.id = st.student join Class on class.id = st.class
--WHERE class.name like '%10%'


--task11 (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/20

--SELECT status, member_name, sum(amount*unit_price) as costs
--from FamilyMembers fm JOIN Payments p on p.family_member = fm.member_id JOIN Goods g on g.good_id = p.good join GoodTypes gt on gt.good_type_id = g.type
--where good_type_name = 'entertainment'
--GROUP BY status, member_name


--task12  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/55

--DELETE from Company
--where id in
--(SELECT company 
--from (SELECT company, count(id) as a
--      from Trip
--      GROUP BY  company
--      having a = (SELECT count(id) as c 
--                  from Trip
--                  GROUP BY company
--                  ORDER BY c limit 1)) as b)



--task13  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/45

--select classroom
--from (select classroom,
--      dense_rank () over (ORDER BY c DESC ) as rk
--      from (SELECT classroom, count(id) as c
--            from Schedule
--            GROUP BY classroom) x) p
-- where rk = 1


--task14  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/43
--
--SELECT last_name
--from Teacher t join Schedule s on t.id = s.teacher join  Subject sub on sub.id = s.subject
--where sub.name = 'Physical Culture'
--ORDER BY last_name

--task15  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/63

--SELECT concat (last_name,'.',left(first_name,1),'.',left(middle_name,1),'.') as name
--from Student
--ORDER BY name


