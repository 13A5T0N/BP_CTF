create schema crm;

create table crm.roles(
role_id int auto_increment primary key,
role_name char(15)
);

create  table crm.users(
user_id int auto_increment,
user_name varchar(60),
user_phone varchar(20),
user_role int, 
user_password text(255),

constraint PK_user primary key(user_id,user_name),
constraint FK_usr_role foreign key (user_role) references roles(role_id) 
);

create table  crm.client(
client_id int auto_increment,
client_name varchar(50),
client_contact varchar(50),
client_phone varchar(20),
client_email varchar(50),

constraint PK_client Primary Key (client_id,client_name)
);

create table crm.request_type(
request_type_id int auto_increment primary key,
request_type_name varchar(20) 
);

create table crm.request(
request_id int auto_increment primary key,
request_type int,
request_desc text(255),
user int,

constraint FK_request_user foreign key (user) references users(user_id)
);

create table crm.product(
product_id int auto_increment,
product_name varchar(50),
product_size text(15),
product_color varchar(30),
product_material varchar(50),
product_amount int default 0,

constraint PK_product Primary key (product_id,product_name)
);

create table crm.product_disc(
product_id int auto_increment,
product_name varchar(50),
product_size text(15),
product_color varchar(30),
product_material varchar(50),
product_amount int default 0,

constraint PK_product Primary key (product_id,product_name)
);

create table crm.invoice(
invoice_id int auto_increment primary key,
client int,
status varchar(20) default 'sold',
total double,

constraint FK_invoice_client Foreign key (client) references client(client_id)
);

create table crm.invoice_product(
invoice_product_id int auto_increment primary key,
invoice int,
product int,
amount int,

constraint FK_invoice Foreign key (invoice) references invoice(invoice_id),
constraint FK_invoice_product Foreign key (product) references product(product_id)
);
create index client_index
on crm.client(client_id);

create unique index  product_index
on crm.product(product_id);

DELIMITER //

CREATE PROCEDURE roles()
BEGIN
	SELECT *  FROM crm.roles order by role_id desc;
END //

create procedure users()
begin
	select * from crm.users order by user_id desc;
end//

create procedure client()
begin
	select * from crm.client order by client_id desc;
end//


create procedure invoice()
begin
	select client_name as client,invoice_id,client ,status ,total 
    from crm.invoice,crm.client 
    where 
    client_id = client
    order by invoice_id desc;
end//

DELIMITER ;
