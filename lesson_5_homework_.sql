--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task1 (lesson5)
-- ������������ �����: ������� view (pages_all_products), � ������� ����� ������������ �������� ���� ��������� 
--(�� ����� ���� ��������� �� ����� ��������). 
--�����: ��� ������ �� laptop, ����� ��������, ������ ���� �������

sample:
1 1
2 1
1 2
2 2
1 3
2 3

--create view pages_all_products as 
select *, rank () over ()
from laptop


--task2 (lesson5)
-- ������������ �����: ������� view (distribution_by_type), � ������ �������� ����� ���������� ����������� ���� ������� �� ���� ����������. 
--�����: �������������, ���, ������� (%)


--create view distribution_by_type as
--select distinct maker, type, (count(*) over (partition by type)::NUMERIC/count(*) over ()::numeric)*100.00 as perc
--from (select model from pc 
--      union all 
--      select model from laptop 
--      union all 
--      select model from printer) x join product p on p.model = x.model
--order by type 
--
--
--select *
--from distribution_by_type


--task3 (lesson5)
-- ������������ �����: ������� �� ���� ����������� view ������ - �������� ���������. ������ https://plotly.com/python/histograms/



--task4 (lesson5)
-- �������: ������� ����� ������� ships (ships_two_words), �� �������� ������� ������ �������� �� ���� ����

--create table ships_two_words as
--select *
--from ships
--where name like '%_ _%'
--
--select *
--from ships_two_words 

--task5 (lesson5)
-- �������: ������� ������ ��������, � ������� class ����������� (IS NULL) � �������� ���������� � ����� "S"

--select x.name
--from (		select name 
--		from ships 
--		union 
--		select ship 
--		from outcomes
--) x left join ships on ships.name = x.name left join classes s on s.class = x.name or s.class = ships.class 
--where s.class is null and x.name like 'S%'


--task6 (lesson5)
-- ������������ �����: ������� ��� �������� ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'C' � 
--��� ����� ������� (����� ������� �������). ������� model

--select model         
--from (select maker, p.model, price, row_number () over (order by price desc) as rk 
--from product pr join printer p on p.model = pr.model) a
--where (rk <= 3) or (maker = 'A' and price > (select avg(price) 
--                                             from printer p join product pr on pr.model = p.model 
--                                             where maker = 'C') )


