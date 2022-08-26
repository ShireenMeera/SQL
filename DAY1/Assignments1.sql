
-- create database 
create database if not exists inventory;

-- create Table Supplier

create table inventory.supplier (
supplier_id int,
supplier_name varchar(5),
supplier_amount_balance numeric
);

-- Alter table supplier
alter table inventory.supplier modify supplier_name varchar(20);

-- 4. Add 10 supplier details to the table

insert into inventory.supplier values (101, 'walmart', 1000);
insert into inventory.supplier values (102, 'target', 2000);
insert into inventory.supplier values (103, 'sams', 3000);
insert into inventory.supplier values (104, 'kroger', 4000);
insert into inventory.supplier values (105, 'aldi', 5000);

insert into inventory.supplier values (106, 'costco', 60000);
insert into inventory.supplier values (107, 'Sprouts', 70000);
insert into inventory.supplier values (108, 'Tom', 80000);
insert into inventory.supplier values (109, 'Kmart', 90000);
insert into inventory.supplier values (110, 'HEB', 100000);

-- 5. Alter the supplier id with primary key
alter table inventory.supplier modify supplier_id int primary key;

-- 6 . Get count of suppliers
select count(supplier_id) from inventory.supplier;

-- 7. List supplier with balance over 10000
select * from inventory.supplier where supplier_amount_balance > 10000;

-- 8. Get supplier with name having "holding
select * from inventory.supplier where supplier_name = 'holding';

-- 9. Get total of supplier balance
select sum(supplier_amount_balance) from inventory.supplier;

-- 10. Get supplier balance in descending order
select * from inventory.supplier order by supplier_name desc;







