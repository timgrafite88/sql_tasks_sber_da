--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task13 (lesson3)
--������������ �����: ������� ������ ���� ��������� � ������������� � ��������� ���� �������� (pc, printer, laptop). 
--�������: model, maker, type

--select *
--from product

--select x.model, maker, type 
--from (select model
--      from pc
--      
--      union all 
--      
--      select model 
--      from printer 
--      
--      union all 
--      
--      select model 
--      from laptop) x left join product on x.model = product.model 



--task14 (lesson3)
--������������ �����: ��� ������ ���� �������� �� ������� printer ������������� ������� ��� ���, 
--� ���� ���� ����� ������� PC - "1", � ��������� - "0"

--select *,
--case when price > (select avg(price) from pc)
--then 1
--else 0
--end flag
--from printer


--task15 (lesson3)
--�������: ������� ������ ��������, � ������� class ����������� (IS NULL)

--select x.name
--from (		select name 
--		from ships 
--		union 
--		select ship 
--		from outcomes
--) x left join ships on ships.name = x.name left join classes s on s.class = x.name or s.class = ships.class 
--where s.class is null 

--task16 (lesson3)
--�������: ������� ��������, ������� ��������� � ����, �� ����������� �� � ����� �� ����� ������ �������� �� ����.


--task17 (lesson3)
--�������: ������� ��������, � ������� ����������� ������� ������ Kongo �� ������� Ships.

--select battle 
--from outcomes join ships on ships.name = outcomes.ship 
--where class = 'Kongo'


--task1  (lesson4)
-- ������������ �����: ������� view (�������� all_products_flag_300) ��� ���� ������� (pc, printer, laptop) � ������, 
--���� ��������� ������ > 300. �� view ��� �������: model, price, flag

--create view all_products_flag_300 as
--select model, price, 
--case when price > 300
--then 1
--else 0
--end flag
--from (  select model, price 
--		from pc 
--		union all 
--		select model, price 
--		from laptop 
--		union all 
--		select model, price 
--		from printer ) x
--		
--select *
--from all_products_flag_300	

--task2  (lesson4)
-- ������������ �����: ������� view (�������� all_products_flag_avg_price) ��� ���� ������� (pc, printer, laptop) � ������, 
--���� ��������� ������ c������ . �� view ��� �������: model, price, flag

--create view all_products_flag_avg_price as
--select model, price,
--case when price > (select avg(price)
--                   from (select model, price 
--		                 from pc 
--						 union all 
--						 select model, price 
--						 from laptop 
--						 union all 
--						 select model, price 
--						 from printer) y)
--then 1
--else 0
--end flag
--from	(select model, price 
--		from pc 
--		union all 
--		select model, price 
--		from laptop 
--		union all 
--		select model, price 
--		from printer) x
--
--select *
--from all_products_flag_avg_price

--task3  (lesson4)
-- ������������ �����: ������� ��� �������� ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'D' � 'C'. 
--������� model

--select a.model
--from printer a join product b on a.model = b.model 
--where maker = 'A' and price > (select avg(price)
--                               from printer p join (select model, maker
--                                                    from product
--                                                    where maker = 'D'
--                                                    union all
--                                                    select model, maker
--                                                    from product
--                                                    where maker = 'C') d 
--                               on d.model = p.model)                     
                               

--task4 (lesson4)
-- ������������ �����: ������� ��� ������ ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'D' � 'C'. 
--������� model

--select x.model 
--from (select model, price 
--      from pc 
--      union all 
--      select model, price 
--      from printer 
--      union all 
--      select model, price 
--      from laptop) x join product p on p.model = x.model 
--where maker = 'A' and price > (select avg(price) 
--                               from (select model, price 
--                                    from pc 
--                                    union all 
--                                    select model, price 
--                                    from printer 
--                                    union all 
--                                    select model, price 
--                                    from laptop) d join product l on d.model = l.model
--                               where maker = 'D' or maker = 'C')     



--task5 (lesson4)
-- ������������ �����: ����� ������� ���� ����� ���������� ��������� ������������� = 'A' (printer & laptop & pc)


--select avg(price)
--from (select model, price 
--      from pc 
--      union
--      select model, price 
--      from laptop 
--      union
--      select model, price 
--      from printer) a join product p on p.model = a.model 
--where maker = 'A'


--task6 (lesson4)
-- ������������ �����: ������� view � ����������� ������� (�������� count_products_by_makers) �� ������� �������������. �� view: maker, count

--create view count_products_by_makers as
--select maker, count(l.model)
--from (	select model 
--	    from pc 
--	    union all 
--	    select model 
--	    from printer
--	    union all 
--	    select model 
--	    from laptop) l join product p on p.model = l.model
--group by maker
--order by maker
----
----
--select *
--from count_products_by_makers


--task7 (lesson4)
-- �� ����������� view (count_products_by_makers) ������� ������ � colab (X: maker, y: count)

--������ ������ � colab

--task8 (lesson4)
-- ������������ �����: ������� ����� ������� printer (�������� printer_updated) � ������� �� ��� ��� �������� ������������� 'D'

--create table printer_updated as
--table printer
--
--delete
--from printer_updated
--where model in (select p.model
--                from printer p join product c on p.model = c.model
--                where maker = 'D')
--                
--select *
--from printer_updated 


--task9 (lesson4)
-- ������������ �����: ������� �� ���� ������� (printer_updated) view � �������������� �������� ������������� (�������� printer_updated_with_makers)

--create view printer_updated_with_makers as 
--select pu.code, pu.color, pu.type, pu.price, p.maker
--from product p join printer_updated pu on pu.model = p.model 
--
--select *
--from printer_updated_with_makers

--task10 (lesson4)
-- �������: ������� view c ����������� ����������� �������� � ������� ������� (�������� sunk_ships_by_classes). 
--�� view: count, class (���� �������� ������ ���/IS NULL, �� �������� �� 0)

--create view sunk_ships_by_classes as
--select count(ship) as count, 
--case 
--when class is null 
--then '0'
--else class 
--end class_count
--from (select  s.class, ship 
--      from outcomes p join ships s on s.name = p.ship left join classes c on c.class = s.class
--      where result = 'sunk'
--      union
--      select class, ship 
--      from outcomes p left join classes c on c.class = p.ship
--      where result = 'sunk') a
--group by class 
--
--select *
--from sunk_ships_by_classes

--task11 (lesson4)
-- �������: �� ����������� view (sunk_ships_by_classes) ������� ������ � colab (X: class, Y: count)



--task12 (lesson4)
-- �������: ������� ����� ������� classes (�������� classes_with_flag) � �������� � ��� flag: 
--���� ���������� ������ ������ ��� ����� 9 - �� 1, ����� 0

--create table classes_with_flag as 
--select *,
--case when numguns >= 9
--then 1
--else 0
--end flag
--from classes
--
--select *
--from classes_with_flag 

--task13 (lesson4)
-- �������: ������� ������ � colab �� ������� classes � ����������� ������� �� ������� (X: country, Y: count)

--select country, count(class)
--from classes 
--group by country 
--order by count

--task14 (lesson4)
-- �������: ������� ���������� ��������, � ������� �������� ���������� � ����� "O" ��� "M".

--select count(*)
--from (select name 
--      from ships 
--      union 
--      select ship 
--      from outcomes) x
--where (name like 'O%') or (name like 'M%')      

--task15 (lesson4)
-- �������: ������� ���������� ��������, � ������� �������� ������� �� ���� ����.

--select count(*)
--from (select name 
--      from ships 
--      union 
--      select ship 
--      from outcomes) x
--where name like '% %' and name not like '% % %'

--task16 (lesson4)
-- �������: ��������� ������ � ����������� ���������� �� ���� �������� � ����� ������� (X: year, Y: count)

--select launched as year, count(name) as count 
--from ships
--group by launched
--order by launched


