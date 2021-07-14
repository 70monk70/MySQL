use shop;

-- task 1
select u.id as user_id,
	u.name,
	o.id as order_id,
	op.product_id as product_id,
	(select name from products where id = op.product_id) as product_name,
	op.total
from users as u
join orders as o 
on u.id = o.user_id
join orders_products as op
on o.id = op.order_id
order by u.id;

-- task 2
select p.id as product_id,
	p.name,
	p.price,
	c.id as catalog_id,
	c.name as catalog
from products as p
join catalogs as c
on p.catalog_id = c.id;

-- task 3
Drop table if exists flights;
CREATE TABLE flights (
id SERIAL PRIMARY KEY,
departure VARCHAR(255),
arrival VARCHAR(255));

insert into flights (departure, arrival)
values
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

Drop table if exists cities;
CREATE TABLE cities (
id SERIAL PRIMARY KEY,
label VARCHAR(255),
name VARCHAR(255));

insert into cities (label, name)
values
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');


select * from cities;
select * from flights;

select id as fligt_id,
	(select name from cities where label = departure) as 'from',
	(select name from cities where label = arrival) as 'to'
	from flights
	order by fligt_id;