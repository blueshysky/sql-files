drop database if exists Library;
create database if not exists Library;


use Library;

drop table if exists Customer;
drop table if exists Library;
drop table if exists Item;

create table Item(
Item_ID Int(10) auto_increment,
item_Title varchar(30),
Item_Publisher varchar(30),
Item_Author varchar(20),
Item_Type varchar(10),
Primary key (Item_ID)
);




create table Customer(
Cust_ID int(10),
Cust_name varchar(30),
Cust_address varchar(30),
Cust_status varchar(20),
Item_ID int(10),
Primary key(Cust_ID),
foreign key(Item_ID)
	references Item (Item_ID)
);


create table Library(
department_id int(10),
compartment_id int (10),
shelf_id int(10),
Item_ID int(10),
primary key(department_id),
	foreign key (Item_ID)
		references Item (Item_ID)


);

select * from Item;