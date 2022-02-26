-- 1
select last_name || ' ' || first_name as customer_name, address, city, country
from customer c
join address a using(address_id)
join city using(city_id) 
join country using(country_id)

-- 2
select store_id, count(customer_id)
from customer c
group by store_id 

select store_id, count(customer_id)
from customer c
group by store_id
having count(customer_id) > 300

select s.store_id as "ID ��������", 
	count(c.customer_id) as "���-�� �����������",
	city.city as "�����",
	staff.last_name || ' ' || staff.first_name as "��� ����������"
from customer c
join store s using(store_id)
join address a on s.address_id = a.address_id 
join city using(city_id)
join staff on staff.staff_id = s.manager_staff_id 
group by s.store_id, city.city, staff.last_name || ' ' || staff.first_name 
having count(c.customer_id) > 300

-- 3
select last_name || ' ' || first_name "������� � ��� ����������", count(rental_id) "���-�� �������" 
from rental
join customer c using(customer_id)
group by customer_id 
order by count(rental_id) desc 
limit 5

-- 4
select 
	last_name || ' ' || first_name "������� � ��� ����������", 
	count(rental_id) "���-�� �������", 
	round(sum(amount)) "����� ��������� ��������", 
	min(amount) "����������� ��������� �������", 
	max(amount) "������������ ��������� �������"
from customer c 
join rental r using(customer_id)
join payment using(rental_id)
group by c.customer_id 

-- 5
select �1.city "1", c2.city "2"
from city �1
cross join city c2
where �1.city != c2.city

-- 6
select 
	customer_id, 
	round((extract(day from avg(return_date - rental_date)) + 
			extract(hour from avg(return_date - rental_date)) / 24 + 
			extract(min from avg(return_date - rental_date)) / 24 / 60)::numeric, 2)
from rental r 
group by customer_id 
order by customer_id 
