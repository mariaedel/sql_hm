create table language_edel(
id serial primary key,
language_name varchar(30) unique not null)

create table nationality_edel(
id serial primary key,
nationality_name varchar(50) unique not null)

create table country_edel(
id serial primary key,
country_name varchar(50) unique not null)

insert into language_edel(language_name)
values ('русский'), ('английский'), ('немецкий'), ('французский')

insert into nationality_edel(nationality_name)
values ('славяне'), ('англосаксы'), ('немцы'), ('французы'), ('англоавстралийцы')

insert into country_edel(country_name)
values ('Россия'), ('Германия'), ('Франция'), ('Австралия'), ('Англия'), ('Америка'), ('Канада')

create table language_country_edel(
country_id int unique not null,
language_id int,
foreign key (country_id) references country_edel(id))

insert into language_country_edel(country_id)
select id from country_edel

update language_country_edel
set language_id = 1
where country_id = 1

update language_country_edel
set language_id = 2
where country_id = 4 or country_id = 5 or country_id = 6 or country_id = 7

update language_country_edel
set language_id = 3
where country_id = 2

update language_country_edel
set language_id = 4
where country_id = 3

create table language_nationality_edel(
nationality_id int unique not null,
language_id int,
foreign key (nationality_id) references nationality_edel(id))

insert into language_nationality_edel(nationality_id)
select id from nationality_edel

update language_nationality_edel
set language_id = 1
where nationality_id = 1

update language_nationality_edel
set language_id = 2
where nationality_id = 2 or nationality_id = 5

update language_nationality_edel
set language_id = 3
where nationality_id = 3

update language_nationality_edel
set language_id = 4
where nationality_id = 4

alter table country_edel add column note text

alter table country_edel add column european_country boolean

alter table country_edel add column last_update timestamp

update country_edel
set note = 'примечание1'
where country_name = 'Канада'

update country_edel
set european_country = true
where country_name = 'Россия' or country_name = 'Германия' or country_name = 'Франция' or country_name = 'Англия'

update country_edel
set european_country = false
where european_country is not true

update country_edel
set last_update = current_timestamp 

select * from country_edel