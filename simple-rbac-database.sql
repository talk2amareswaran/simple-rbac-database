drop database if exists profile;
create database profile;
use profile;
create table resource (id int primary key auto_increment, resource_name varchar(50) not null);
create table role (id int primary key auto_increment, role_name varchar(50) not null);
create table users (id int primary key auto_increment, user_name varchar(45) not null, password varchar(255) not null);

create table users_role (id int primary key auto_increment, user_id int, foreign key(user_id) references users(id), role_id int, foreign key(role_id) references role(id));
create table resource_role (id int primary key auto_increment, resource_id int, foreign key(resource_id) references resource(id), role_id int, foreign key(role_id) references role(id), can_add char(1), can_edit char(1), can_view char(1), can_delete char(1));

insert into resource (resource_name) values ('MOBILE-SERVICE');
insert into resource (resource_name) values ('TELEPHONE-SERVICE');
insert into resource (resource_name) values ('TELEVISION-SERVICE');

insert into role (role_name) values ('Administrator');
insert into role (role_name) values ('Service Engineer');
insert into role (role_name) values ('Quality Assurance');

insert into users (user_name,password) values ('william_s','william_s');
insert into users (user_name,password) values ('mike_k','mike_k');
insert into users (user_name,password) values ('kane_a','kane_a');
insert into users (user_name,password) values ('lawarance_v','lawarance_v');
insert into users (user_name,password) values ('anderson_w','anderson_w');

insert into users_role (user_id, role_id) values (1,1);
insert into users_role (user_id, role_id) values (2,1);

insert into users_role (user_id, role_id) values (3,2);
insert into users_role (user_id, role_id) values (4,2);

insert into users_role (user_id, role_id) values (5,3);

insert into resource_role (resource_id, role_id, can_add, can_edit, can_view,can_delete) values (1,1,'Y','Y','Y','Y');
insert into resource_role (resource_id, role_id, can_add, can_edit, can_view,can_delete) values (2,1,'Y','Y','Y','Y');
insert into resource_role (resource_id, role_id, can_add, can_edit, can_view,can_delete) values (3,1,'Y','Y','Y','Y');

insert into resource_role (resource_id, role_id, can_add, can_edit, can_view,can_delete) values (2,2,'Y','Y','Y','Y');
insert into resource_role (resource_id, role_id, can_add, can_edit, can_view,can_delete) values (3,2,'Y','Y','Y','Y');

insert into resource_role (resource_id, role_id, can_add, can_edit, can_view,can_delete) values (3,3,'Y','Y','Y','Y');


select r.resource_name, r_role.can_add, r_role.can_edit, r_role.can_view, r_role.can_delete from resource r 
inner join resource_role r_role on r.id=r_role.resource_id
inner join role ro on ro.id=r_role.role_id 
inner join users_role users_r on ro.id=users_r.role_id
inner join users u on u.id=users_r.user_id where u.user_name='anderson_w';