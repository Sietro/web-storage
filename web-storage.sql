--myoracle.cu7djq0iivgz.ap-northeast-2.rds.amazonaws.com:1521:ORCL
--aws_webstorage
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
insert into users values('admin', 'tnc87409123@', '관리자', 'm', '01075524110', 'tncrja@naver.com', '05707', '서울 송파구 송이로 88(가락대림아파트) 1동');
select * from user_constraints where table_name = 'USERS';

select * from authority;

create table authority(
    role varchar2(20) primary key check(role like 'ROLE#_%' escape '#' )
);
insert into authority values('ROLE_ADMIN');
insert into authority values('ROLE_MANAGER');
insert into authority values('ROLE_USER');
insert into authority values('ROLE_PROUSER');

select * from authorization;

create table authorization(
    id number primary key,
    users_id varchar2(20) constraint FK_users_id references users(id) on delete cascade,
    role varchar2(20) constraint FK_authority_id references authority(role)
);
create sequence seq_authorization_id;

insert into authorization values(seq_authorization_id.nextval, 'admin', 'ROLE_ADMIN');

create table board(
    id number primary key,
    users_id varchar2(20) references users(id),
    title varchar2(100) not null,
    content clob not null,
    hit number,
    ip varchar2(30) not null,
    regdate date
);
create sequence seq_board_id;
insert into board values(seq_board_id.nextval, 'admin', '테스트용', '테스트를 위한 게시물 입니다.', 10, '192.168.0.25', sysdate);