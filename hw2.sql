--1
select distinct city from city c

--2
select distinct city 
from city c
where c.city like 'L%a' and c.city not like '% %'

--3
select payment_id, payment_date, amount
from payment p 
where payment_date < '2005-06-19 23:59:59' and payment_date > '2005-06-17 00:00:00' and amount > 1.00
order by payment_date 

--4
select payment_id, payment_date, amount
from payment
order by payment_date desc
limit 10

-- 5
select first_name || ' ' || last_name as "Фамилия и имя", email as "Электронная почта", character_length(email) as "Длина email", last_update::date "Дата" 
from customer c 

-- 6
select lower(last_name), lower(first_name), active from customer c 
where active = 1 and first_name = 'KELLY' or first_name = 'WILLIE'

-- доп
-- 1
select film_id, title, description, rating, rental_rate from film
where rating = 'R' and rental_rate <= 3 or rating = 'PG-13' and rental_rate >= 4

-- 2
select film_id, description 
from film 
order by character_length(description) desc
limit 3

-- 3
select customer_id, email, regexp_match(email, '.+(?=@)')::varchar(100), regexp_match(email, '(?<=@).+')::varchar(100) 
from customer c 

-- 4
select 
	customer_id, 
	email, 
	substring(btrim((regexp_match(email, '.+(?=@)'))::varchar(100), '{}') for 1) ||
	lower(substring(btrim((regexp_match(email, '.+(?=@)'))::varchar(100), '{}') from 2)), 
	upper(substring(btrim(regexp_match(email, '(?<=@).+')::varchar(100), '{}') for 1)) ||
	substring(btrim(regexp_match(email, '(?<=@).+')::varchar(100), '{}') from 2)
from customer c 


 