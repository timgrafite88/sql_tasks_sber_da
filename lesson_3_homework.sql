--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing

--task1
--�������: ��� ������� ������ ���������� ����� �������� ����� ������, ����������� � ���������. �������: ����� � ����� ����������� ��������.

--select classes.class, count(ship)
--from classes left join 
--     (select ships.class, ship, result 
--      from ships left join outcomes on outcomes.ship = ships.name
--      where result = 'sunk'
--      union 
--      select classes.class, ship, result 
--      from classes left join outcomes on outcomes.ship = classes.class
--      where result = 'sunk'
--      ) x on classes.class = x.class    
--group by classes.class



--task2
--�������: ��� ������� ������ ���������� ���, ����� ��� ������ �� ���� ������ ������� ����� ������. 
--���� ��� ������ �� ���� ��������� ������� ����������, ���������� ����������� ��� ������ �� ���� �������� ����� ������. �������: �����, ���.

--select ships.class as class, min(launched)
--from ships
--group by ships.class
--union 
--select classes.class, min(launched)
--from classes left join ships on classes.class = ships.class
--group by classes.class


--task3
--�������: ��� �������, ������� ������ � ���� ����������� �������� � �� ����� 3 �������� � ���� ������, 
--������� ��� ������ � ����� ����������� ��������.

--select z.class, count(ship)
--from (select class
--      from (select class, count(name) as count_name
--            from (select class, name as name, result 
--                  from ships left join outcomes on outcomes.ship = ships.name
--                  union 
--                  select class, ship as name, result 
--                  from ships join outcomes on outcomes.ship = ships.name) x
--            group by class) y
--      where y.count_name >= 3) z join ships on z.class = ships.class join 
--outcomes on outcomes.ship = ships.name
--where result = 'sunk'
--group by z.class


--task4
--�������: ������� �������� ��������, ������� ���������� ����� ������ ����� ���� �������� ������ �� ������������� 
--(������ ������� �� ������� Outcomes).

--select name
--from (select max(numguns) as maxguns, bore 
--      from (select ships.name as name, bore, numGuns
--            from ships join classes on classes.class = ships.class
--            union 
--            select outcomes.ship as name, bore, numGuns
--            from outcomes join classes on classes.class = outcomes.ship) x 
--      group by bore) y join 
--            (select ships.name as name, bore, numGuns
--            from ships join classes on classes.class = ships.class
--            union 
--            select outcomes.ship as name, bore, numGuns
--            from outcomes join classes on classes.class = outcomes.ship) z 
--      on z.bore = y.bore and y.maxguns = z.numGuns
      


--task5
--������������ �����: ������� �������������� ���������, ������� ���������� �� � ���������� ������� RAM � 
--� ����� ������� ����������� ����� ���� ��, ������� ���������� ����� RAM. �������: Maker

--select t1.maker
--from product t1 join pc t2 on t1.model = t2.model
--join (select distinct maker from product where type = 'Printer') t3
--on t1.maker = t3.maker
--where ram = (select min(ram) from pc) and speed = (select max(speed)
--                                                   from pc
--                                                   where ram = (select min(ram) from pc))