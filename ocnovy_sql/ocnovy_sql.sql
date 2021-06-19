-- основная часть 
select store_id, count(customer_id) as customers_count
from customer
group by customer.store_id
having count(customer_id) > 300

select c.customer_id, c2.city 
from customer c
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 

-- дополнительная часть
select concat(s2.first_name, ' ', s2.last_name), c.city_id
from store s
join staff s2 on s2.store_id = s.store_id  
join address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id 
where s.store_id = 1

select distinct concat(a.first_name, ' ', a.last_name)
from film f
join film_actor fa on f.film_id = fa.film_id 
join actor a on fa.actor_id = a.actor_id 
where f.rental_rate = 2.99


