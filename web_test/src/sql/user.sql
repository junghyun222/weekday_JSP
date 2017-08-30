create database jsp;
use jsp;
create table user(
user_no int auto_increment primary key,
id varchar(100) not null,
pwd varchar(100) not null,
name varchar(100) not null,
unique index(id));

select * from user;

insert into user(id,pwd,name)
values('d','d','d');

alter table user
add column hobby varchar(200);

update user
set hobby='영행,수면'
where user_no=3;