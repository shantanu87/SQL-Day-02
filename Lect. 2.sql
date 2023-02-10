-- 28/07/2022 Lect. 2

use training;

 -- And / Or conditions
 
select * from customer1;
select * from customer1 where gender = 'M' and amount < 352310 and city != 'Delhi';

create table customer1 (custid integer, custname varchar(50), gender char(1), age integer, city varchar(50), 
mobile varchar(20), amount decimal(20,2));
insert into customer1 values(1003, 'Deepika Padukone', 'F' , 37, 'Mumbai', '786532412', 2530123);
select * from customer1;

-- Constraints
	-- unique
	-- not null
	-- primary key 
	-- foreign key
	-- default
	-- check

-- Unique Constraint

drop table unique_tbl;
create table unique_tbl( custid int unique, custname varchar(50), gender char(1), city varchar(50), amount decimal(20.2));
insert into unique_tbl values (1000, 'Rajkumar' , 'M' , ' Bangalore', 1000200);
select * from unique_tbl;
insert into unique_tbl values (1001, 'Rajesh' , 'M' , ' Bangalore', 11100200);
insert into unique_tbl values (1002, 'Prerna' , 'F' , 'Hyderabad', 11100200);
insert into unique_tbl (custname, gender, city, amount) values ('Rahul','M','Chennai',300002.250);
insert into unique_tbl (custname, gender, city, amount) values ('Somesh','M','Delhi',30004520);
select * from unique_tbl;

-- Not Null constraints

create table ntnl_tbl( custid int not null, custname varchar(50), gender char(1), city varchar(50), amount decimal(20,2));
insert into ntnl_tbl values (1001, 'Rajesh' , 'M' , ' Bangalore', 11100200);
insert into ntnl_tbl values (1002, 'Prerna' , 'F' , 'Hyderabad', 11100200);
insert into ntnl_tbl (custname, gender, city, amount) values ('Rahul','M','Chennai',300002.250);
insert into ntnl_tbl (custname, gender, city, amount) values ('Somesh','M','Delhi',30004520);
select * from ntnl_tbl;
insert into ntnl_tbl (custid, gender, city, amount) values (1000,'M','Delhi',30004520);

-- Unique + Not null constraints

create table uqntnl_tbl( custid int unique not null, custname varchar(50), gender char(1), city varchar(50), amount decimal(20,2));
insert into uqntnl_tbl values (1001, 'Rajesh' , 'M' , ' Bangalore', 11100200);
insert into uqntnl_tbl values (1002, 'Prerna' , 'F' , 'Hyderabad', 11100200);
select * from uqntnl_tbl;
insert into uqntnl_tbl values (1001, 'Somesh' , 'M' , ' Bangalore', 11100);
insert into uqntnl_tbl values (1011, 'Somesh' , 'M' , ' Bangalore', 11100);
insert into uqntnl_tbl values (1012, 'Shreya' , 'F' , ' Mangalore', 10020);

-- Primary key (unique + not null)   only single column can have it.

create table pk_tbl( custid int primary key, custname varchar(50), gender char(1), city varchar(50), amount decimal(20,2));
insert into pk_tbl values(100, 'Deepika Padukone' , 'F', 'Mumbai', 201323.250);
select * from pk_tbl;
insert into pk_tbl values(102, 'Virat Kohli' , 'M', 'Delhi', 2010023.250);
insert into pk_tbl (custname, gender, city, amount) values ('Rahul','M','Chennai',300002.250);
insert into pk_tbl (custname, gender, city, amount) values ('Somesh','M','Delhi',30004520);

-- Composite primary key

Drop table cpk_tbl;
create table cpk_tbl( custid int, custname varchar(50), gender char(1), city varchar(50), amount decimal(20,2),
Constraint my_prime_key primary key (custid, city));

insert into cpk_tbl values (1000, 'Rohani','F', 'Kanpur',4563210);
insert into cpk_tbl values (1000, 'Rohan','M', 'Nagpur',4563210);
select * from cpk_tbl;
insert into cpk_tbl values(1002,'Manmohan','M', 'Pune', 1230320);
insert into cpk_tbl values(1052,'Manmohani','F', 'Pune', 1230320);
insert into cpk_tbl values(1052,'Mayuri','F', 'Puna', 1230320);
insert into cpk_tbl values(1052,'Mayur','M', 'Poona', 10320);

-- Foreign key

drop table order_tbl;
create table order_tbl( orderid int primary key,custid int, productname varchar(50), city varchar(50), amount decimal(20,2),
foreign key (custid) references pk_tbl(custid));
select * from pk_tbl;
insert into order_tbl values(1, 100, 'Chocolates', 'Mumbai', 1020);
select * from order_tbl;
insert into order_tbl values(2, 100, 'Utensils', 'Mumbai', 1020);
insert into order_tbl values(3, 102, 'Grocerry', 'Delhi', 2220);
