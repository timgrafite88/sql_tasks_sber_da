--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

-- ������� 1: ������� name, class �� ��������, ���������� ����� 1920
--
--select name, class
--from ships
--where launched > 1920;


-- ������� 2: ������� name, class �� ��������, ���������� ����� 1920, �� �� ������� 1942
--
--select name, class
--from ships
--where launched > 1920 and launched <= 1942;


-- ������� 3: ����� ���������� �������� � ������ ������. ������� ���������� � class
--
--select class, count(name) as qty
--from ships
--group by class;


-- ������� 4: ��� ������� ��������, ������ ������ ������� �� ����� 16, ������� ����� � ������. (������� classes)
--
--select class, country 
--from classes
--where bore >= 16;


-- ������� 5: ������� �������, ����������� � ��������� � �������� ��������� (������� Outcomes, North Atlantic). �����: ship.
--
--select ship 
--from outcomes
--where result = 'sunk' and battle = 'North Atlantic';


-- ������� 6: ������� �������� (ship) ���������� ������������ �������
--
--select ship
--from outcomes join battles 
--on battles.name = outcomes.battle
--where result = 'sunk' and date = (select max(date) 
--                                  from battles join outcomes
--                                  on battles.name = outcomes.battle
--                                  where result = 'sunk');



-- ������� 7: ������� �������� ������� (ship) � ����� (class) ���������� ������������ �������
--
--select outcomes.ship as ship, ships.class as class
--from outcomes join battles 
--on battles.name = outcomes.battle left join ships 
--on ships.name = outcomes.ship
--where result = 'sunk' and date = (select max(date) 
--                                  from battles join outcomes
--                                  on battles.name = outcomes.battle
--                                  where result = 'sunk')

                                  

-- ������� 8: ������� ��� ����������� �������, � ������� ������ ������ �� ����� 16, � ������� ���������. �����: ship, class
--

--select ship, classes.class as class
--from outcomes left join ships on ships.name = outcomes.ship left join 
--classes on classes.class = ships.class
--where (result = 'sunk' and bore >= 16) or (result = 'sunk')


-- ������� 9: ������� ��� ������ ��������, ���������� ��� (������� classes, country = 'USA'). �����: class
--
--select distinct class 
--from classes
--where country = 'USA'


-- ������� 10: ������� ��� �������, ���������� ��� (������� classes & ships, country = 'USA'). �����: name, class
--select ships.name as name, classes.class as class 
--from ships join classes on 
--ships.class = classes.class
--where country = 'USA'

