create user webstorage identified by 1111;
grant dba to webstorage;

create table users(
    id varchar2(20) primary key,
    password varchar2(20) not null,
    name varchar2(20) not null,
    gender char(1) check(gender in('m','f')),
    phone varchar2(11) not null,
    email varchar2(30) not null,
    postcode varchar2(10) not null,
    address varchar2(100) not null
);
select * from users;
insert into users values('admin', '1111');
select * from user_constraints where table_name = 'USERS';

select * from authority;

create table authority(
    role varchar2(20) primary key check(role like 'ROLE#_%' escape '#' )
);
insert into authority values('ROLE_ADMIN');
insert into authority values('ROLE_MANAGER');
insert into authority values('ROLE_USER');
insert into authority values('ROLE_PROUSER');


create table authorization(
    id number primary key,
    users_id varchar2(20) constraint FK_users_id references users(id) on delete cascade,
    role varchar2(20) constraint FK_authority_id references authority(role)
);
create sequence seq_authorization_id;