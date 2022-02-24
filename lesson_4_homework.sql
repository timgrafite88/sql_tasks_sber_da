--схема БД: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task13 (lesson3)
--Компьютерная фирма: Вывести список всех продуктов и производителя с указанием типа продукта (pc, printer, laptop). 
--Вывести: model, maker, type

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
--Компьютерная фирма: При выводе всех значений из таблицы printer дополнительно вывести для тех, 
--у кого цена вышей средней PC - "1", у остальных - "0"

--select *,
--case when price > (select avg(price) from pc)
--then 1
--else 0
--end flag
--from printer


--task15 (lesson3)
--Корабли: Вывести список кораблей, у которых class отсутствует (IS NULL)

--select x.name
--from (		select name 
--		from ships 
--		union 
--		select ship 
--		from outcomes
--) x left join ships on ships.name = x.name left join classes s on s.class = x.name or s.class = ships.class 
--where s.class is null 

--task16 (lesson3)
--Корабли: Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.


--task17 (lesson3)
--Корабли: Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.

--select battle 
--from outcomes join ships on ships.name = outcomes.ship 
--where class = 'Kongo'


--task1  (lesson4)
-- Компьютерная фирма: Сделать view (название all_products_flag_300) для всех товаров (pc, printer, laptop) с флагом, 
--если стоимость больше > 300. Во view три колонки: model, price, flag

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
-- Компьютерная фирма: Сделать view (название all_products_flag_avg_price) для всех товаров (pc, printer, laptop) с флагом, 
--если стоимость больше cредней . Во view три колонки: model, price, flag

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
-- Компьютерная фирма: Вывести все принтеры производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. 
--Вывести model

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
-- Компьютерная фирма: Вывести все товары производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. 
--Вывести model

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
-- Компьютерная фирма: Какая средняя цена среди уникальных продуктов производителя = 'A' (printer & laptop & pc)


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
-- Компьютерная фирма: Сделать view с количеством товаров (название count_products_by_makers) по каждому производителю. Во view: maker, count

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
-- По предыдущему view (count_products_by_makers) сделать график в colab (X: maker, y: count)

--график сделан в colab

--task8 (lesson4)
-- Компьютерная фирма: Сделать копию таблицы printer (название printer_updated) и удалить из нее все принтеры производителя 'D'

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
-- Компьютерная фирма: Сделать на базе таблицы (printer_updated) view с дополнительной колонкой производителя (название printer_updated_with_makers)

--create view printer_updated_with_makers as 
--select pu.code, pu.color, pu.type, pu.price, p.maker
--from product p join printer_updated pu on pu.model = p.model 
--
--select *
--from printer_updated_with_makers

--task10 (lesson4)
-- Корабли: Сделать view c количеством потопленных кораблей и классом корабля (название sunk_ships_by_classes). 
--Во view: count, class (если значения класса нет/IS NULL, то заменить на 0)

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
-- Корабли: По предыдущему view (sunk_ships_by_classes) сделать график в colab (X: class, Y: count)



--task12 (lesson4)
-- Корабли: Сделать копию таблицы classes (название classes_with_flag) и добавить в нее flag: 
--если количество орудий больше или равно 9 - то 1, иначе 0

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
-- Корабли: Сделать график в colab по таблице classes с количеством классов по странам (X: country, Y: count)

--select country, count(class)
--from classes 
--group by country 
--order by count

--task14 (lesson4)
-- Корабли: Вернуть количество кораблей, у которых название начинается с буквы "O" или "M".

--select count(*)
--from (select name 
--      from ships 
--      union 
--      select ship 
--      from outcomes) x
--where (name like 'O%') or (name like 'M%')      

--task15 (lesson4)
-- Корабли: Вернуть количество кораблей, у которых название состоит из двух слов.

--select count(*)
--from (select name 
--      from ships 
--      union 
--      select ship 
--      from outcomes) x
--where name like '% %' and name not like '% % %'

--task16 (lesson4)
-- Корабли: Построить график с количеством запущенных на воду кораблей и годом запуска (X: year, Y: count)

--select launched as year, count(name) as count 
--from ships
--group by launched
--order by launched


