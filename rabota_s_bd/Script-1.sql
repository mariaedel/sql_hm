select f.title
from film f
where f.release_year = 2006

select p.payment_id, p.payment_date 
from payment p 
order by p.payment_date desc 
limit 10

select tc.table_name, kcu.column_name
from information_schema.key_column_usage kcu
join information_schema.table_constraints tc on tc.constraint_name = kcu.constraint_name 
where tc.constraint_type = 'PRIMARY KEY'

-- вывести всех неактивных покупателей (доработка)
select customer_id
from customer 
where active = 1