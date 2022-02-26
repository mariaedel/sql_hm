create table "language"(
	language_id serial primary key,
	"language" varchar(100) unique not null)
	
create table country(
	country_id serial primary key,
	country varchar(100) unique not null)
	
create table nationality(
	nationality_id serial primary key,
	nationality varchar(100) unique not null)
	
create table country_language(
	country_id int references country(country_id),
	language_id int references "language"(language_id),
	primary key(country_id, language_id))
	
create table nationality_language(
	nationality_id int references nationality(nationality_id),
	language_id int references "language"(language_id),
	primary key(nationality_id, language_id)) 
	
create table country_nationality(
	country_id int references country(country_id),
	nationality_id int references nationality(nationality_id),
	primary key(country_id, nationality_id)) 
	
insert into "language"("language")
values('English'),
	('Russian'), 
	('Italian'),
	('Spanish'),
	('Chinese')
	
insert into country(country)
values('USA'),
	('England'), 
	('Italy'),
	('Spain'),
	('China')
	
insert into nationality(nationality)
values('Russians'),
	('Americans'), 
	('Chinese'),
	('Italians'),
	('British'),
	('Spanish')

insert into nationality_language(nationality_id, language_id)
values(1, 2),
	(2, 1), 
	(3, 5),
	(4, 3),
	(5, 1)
	
insert into country_nationality(country_id, nationality_id)
values(1, 2),
	(2, 5), 
	(3, 4),
	(4, 6),
	(5, 3)