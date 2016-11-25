-- join homework.sql

create SEQUENCE seq_user increment by 1 start with 1000;

create table user_data(
user_id number(4) primary key,
gender number(1) check(gender in (1,2)) not null,
age number(3) not null,
house_type number(1) check(house_type between 1 and 4) not null,
resident varchar(10) not null,
job number(1) check(job between 1 and 6) not null
);

insert into user_data values(seq_user.nextval,1,35,1,'전북',6);
insert into user_data values(seq_user.nextval,2,45,3,'경남',2);
insert into user_data values(seq_user.nextval,1,55,3,'경기',6);
insert into user_data values(seq_user.nextval,1,43,3,'대전',1);
insert into user_data values(seq_user.nextval,2,55,4,'경기',2);
insert into user_data values(seq_user.nextval,1,45,1,'대구',1);
insert into user_data values(seq_user.nextval,2,39,4,'경남',1);
insert into user_data values(seq_user.nextval,1,55,2,'경기',6);
insert into user_data values(seq_user.nextval,1,33,4,'인천',3);
insert into user_data values(seq_user.nextval,2,55,3,'서울',6);

select * from user_data;

create table pay_data(
user_id number(4) not null,
product_type number(1) check(product_type between 1 and 5) not null,
pay_method varchar(10) not null,
price number(8) not null,
foreign key(user_id)
references user_data(user_id)
);

insert into pay_data values(1001,1,'1.현금',153000);
insert into pay_data values(1002,2,'2.직불카드',120000);
insert into pay_data values(1003,3,'3.신용카드',780000);
insert into pay_data values(1003,4,'3.신용카드',123000);
insert into pay_data values(1003,5,'1.현금',79000);
insert into pay_data values(1003,1,'3.신용카드',125000);
insert into pay_data values(1007,2,'2.직불카드',150000);
insert into pay_data values(1007,3,'4.상품권',78879);

select * from pay_data;

create table return_data(
user_id number(4) not null,
return_code number(1) check(return_code between 1 and 4) not null,
foreign key (user_id)
references user_data(user_id)
);

insert into return_data values(1003,1); 
insert into return_data values(1003,4); 
insert into return_data values(1007,1); 
insert into return_data values(1009,2); 

select * from return_data;
