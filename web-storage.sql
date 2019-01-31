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


create table authority(
    role varchar2(20) primary key check(role like 'ROLE#_%' escape '#' )
);

select * from authority;
insert into authority values('ROLE_ADMIN');
insert into authority values('ROLE_MANAGER');
insert into authority values('ROLE_USER');
insert into authority values('ROLE_PROUSER');


create table authorization(
    id number primary key,
    users_id varchar2(20) constraint FK_users_id references users(id) on delete cascade,
    role varchar2(20) constraint FK_authority_id references authority(role)
);

select * from authorization;
create sequence seq_authorization_id;

insert into authorization values(seq_authorization_id.nextval, 'admin', 'ROLE_ADMIN');
insert into authorization values(seq_authorization_id.nextval, 'test1', 'ROLE_USER');
--------------------------------------------------------------------------------- 1월 23 이전
create table notice(
    id number primary key,
    users_id varchar2(20) references users(id),
    title varchar2(100) not null,
    content clob not null,
    hit number,
    ip varchar2(30) not null,
    regdate date
);
create sequence seq_notice_id;

drop sequence seq_board_id;
drop table board;
select * from board;

insert into notice values(seq_notice_id.nextval, 'admin', '테스트용', '테스트를 위한 게시물 입니다.', 10, '192.168.0.25', sysdate);
---------------------------------------------------------------------------------
create table qna(
    id number primary key,
    users_id varchar2(20) references users(id),
    title varchar2(100) not null,
    content clob not null,
    hit number,
    ip varchar2(30) not null,
    regdate date
);
create sequence seq_qna_id;

select * from qna;
insert into qna values(seq_qna_id.nextval, 'admin', '테스트용', '테스트를 위한 게시물 입니다.', 10, '192.168.0.25', sysdate);

------------------------------------------------------------------------------------
create table notice_reply(
    id number primary key,
    board_id number references notice(id) on delete cascade,
    users_id varchar2(20) references users(id),
    content varchar2(300) not null,
    regdate date,
    ref number, 
    depth number, 
    step number
);
create sequence seq_notice_reply_id;
select * from notice_reply;

------------------------------------------------------------------------------------
create table qna_reply(
    id number primary key,
    board_id number references qna(id) on delete cascade,
    users_id varchar2(20) references users(id),
    content varchar2(300) not null,
    regdate date,
    ref number, 
    depth number, 
    step number
);
create sequence seq_qna_reply_id;
select * from qna_reply;
select * from user_constraints where table_name = 'QNA_REPLY';
------------------------------------------------------------ 2019/01/29
create table file_system(
    users_id varchar2(20) constraint fs_user_id_fk references users(id),
    fs_uid varchar2(23) constraint fs_uid_uk unique,
    fs_pid varchar2(23) constraint fs_pid_ref references file_system(fs_uid),
    name varchar2(30) not null,
    type char(1) constraint fs_type_chk check(type in('f','d'))
);

select * from file_system;
insert into file_system values('admin', 'admin001', null, 'test1', 'd');
insert into file_system values('admin', 'admin002', null, 'test2', 'd');
insert into file_system values('admin', null, null, 'test3', 'f');
insert into file_system values('admin', null, null, 'test4', 'f');

insert into file_system values('admin', null, 'admin001', 'test1_1', 'f');
insert into file_system values('admin', null, 'admin002', 'test2_2', 'f');


select * from file_system where users_id = 'admin' and fs_pid is null;
select * from user_constraints where table_name = 'FILE_SYSTEM';
update file_system set type = 'f' where type = 'file';

alter table file_system drop constraint fs_type_chk;
alter table file_system modify type char(1);
alter table file_system  add constraint fs_type_chk check(type in('f','d'));
select * from file_system where users_id = 'admin' and fs_uid = 'admin001';
commit;

--------------------------------------------------------------------2019/01/30