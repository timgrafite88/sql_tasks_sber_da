--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task1  (lesson7)
-- sqlite3: ������� �������� ������ � �� (sqlite3, project name: task1_7). 
--� ������� table1 �������� 1000 ����� � ���������� ���������� (3 �������, ��� int) �� 0 �� 1000.
-- ����� ��������� ����������� ������������� ���� ���� �������

--task2  (lesson7)
-- oracle: https://leetcode.com/problems/duplicate-emails/

--select email
--from (select email, count(id) as count
--      from person
--      group by email) t1
--where count >= 2

--task3  (lesson7)
-- oracle: https://leetcode.com/problems/employees-earning-more-than-their-managers/

--select t1.name as employee
--from employee t1 join employee t2 on t1.managerid = t2.id
--where t1.salary > t2.salary


--task4  (lesson7)
-- oracle: https://leetcode.com/problems/rank-scores/

--select score,
--dense_rank () over (order by score desc) as rank
--from scores


--task5  (lesson7)
-- oracle: https://leetcode.com/problems/combine-two-tables/

--select firstName, lastName, city, state 
--from Person p left join Address a on a.personID = p.personID