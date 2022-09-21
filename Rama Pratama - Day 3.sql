--- Create Table customers 
create table if not exists customers(
	id int primary key,
	customer_name char(50) not null
);

--- insert value customers
insert into customers (id, customer_name) values (123, 'jamal');
insert into customers (id, customer_name) values (1, 'jamal');
insert into customers (id, customer_name) values (2, 'asep');


--- Update customers 
update customers set customer_name = 'Samsudin' where id = 1;

---delete customers
delete from customers where customer_name ='jamal';


--- Create Table Product
create table if not exists products(
	id int primary key,
	name char(50) not null
);

--- insert value products
insert into products (id, name) values (100, 'laptop');
insert into products (id, name) values (1, 'pc');
insert into products (id, name) values (2, 'keyboard');
insert into products (id, name) values (3, 'mouse');

---update products 
update products set name ='monitor' where id = 3;

---delete products
delete from products where name='laptop';

--- create table orders
create table if not exists orders(
id int primary key,
customers_id int not null references customers(id),
products_id int not null references products(id),
order_date date not null,
total int not null
);

insert into orders (id,customers_id,products_id,order_date,total) values (1,1,2,now(),1);


select o.id , o.order_date , c.customer_name , p.name , o.total as semua from orders o
inner join customers c on o.customers_id =c.id
right join products p  on o.products_id = p.id;