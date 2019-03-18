--myoracle.cu7djq0iivgz.ap-northeast-2.rds.amazonaws.com:1521:ORCL
--aws_webstorage
create user webstorage identified by 1111;
grant dba to webstorage;

create table users(
    id varchar2(20) primary key,
    password varchar2(60) not null,
    name varchar2(20) not null,
    gender char(1) check(gender in('m','f')),
    phone varchar2(11) not null,
    email varchar2(30) not null,
    postcode varchar2(10) not null,
    address varchar2(100) not null
);
select * from users;
insert into users values('admin', 'tnc87409123@', 'ï¿??ë¦¬ì', 'm', '01075524110', 'tncrja@naver.com', '05707', '?ï¿½ï¿½?ï¿½ï¿½ ?ï¿½ï¿½?ï¿½ï¿½ï¿?? ?ï¿½ï¿½?ï¿½ï¿½ï¿?? 88(ï¿???ï¿½ï¿½??ë¦¼ì•„?ï¿½ï¿½?ï¿½ï¿½) 1?ï¿½ï¿½');
select * from user_constraints where table_name = 'USERS';
alter table users modify password varchar2(60);
update users set password = '$2a$10$mulmpBP8.iCG5PT8dQpP3uICKqs5kgGiwjNLIDrQfKYSkWq0dwqde' where id = 'test1';


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
--------------------------------------------------------------------------------- 
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

insert into notice values(seq_notice_id.nextval, 'admin', 'title', 'content.', 10, '192.168.0.25', sysdate);
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
insert into qna values(seq_qna_id.nextval, 'admin', '?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½', '?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½ï¿?? ?ï¿½ï¿½?ï¿½ï¿½ ê²Œì‹œï¿?? ?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½.', 10, '192.168.0.25', sysdate);

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
    fs_uid varchar2(260 BYTE) constraint fs_uid_uk unique,
    fs_pid varchar2(260 BYTE) constraint fs_pid_ref references file_system(fs_uid) on delete cascade,
    name varchar2(30) not null,
    type char(1) constraint fs_type_chk check(type in('f','d')),
    regdate date not null
);

select * from file_system;
select * from file_system where fs_pid is null and name = 'qwe1';
insert into file_system values('admin', 'admin001', null, 'test1', 'd', sysdate);
insert into file_system values('admin', 'admin002', null, 'test2', 'd', sysdate);
insert into file_system values('admin', 'test3', null, 'test3', 'f', sysdate);
insert into file_system values('admin', 'test4', null, 'test4', 'f', sysdate);

insert into file_system values('admin', null, 'admin001', 'test1_1', 'f', sysdate);
insert into file_system values('admin', null, 'admin002', 'test2_2', 'f', sysdate);


select * from file_system where users_id = 'admin' and fs_pid is null;
select * from file_system where users_id = 'admin' and fs_pid = '2fe7b3cef76f46d38601d9ef499c02c7';
select * from user_constraints where table_name = 'FILE_SYSTEM';
delete from file_system where name = 'test4';
update file_system set type = 'f' where type = 'file';

alter table file_system drop constraint fs_pid_ref;
alter table file_system add constraint fs_pid_ref foreign key(fs_pid) references file_system(fs_uid) on delete cascade;

alter table file_system drop constraint fs_type_chk;
alter table file_system modify type char(1);
alter table file_system add constraint fs_type_chk check(type in('f','d'));
alter table file_system modify fs_uid varchar2(260 BYTE);
alter table file_system modify fs_pid varchar2(260 BYTE);
select * from file_system where users_id = 'admin' and fs_uid = 'admin001';
select * from file_system where fs_uid = '53f97c2ade6f4fcc9357d8bdec6f0b97';
delete from file_system;

select * from file_system;
select * from file_system where users_id = 'admin' and fs_pid = 'aecdbc4c328c4be4bb76b7320edce3fa';
update file_system set name = 'before.PNG' where users_id = 'admin' and fs_uid = '2f5a2cca98794c9cb90033112d1c7304' and fs_pid is null;
select * from file_system  where users_id = 'admin' and fs_uid = '2f5a2cca98794c9cb90033112d1c7304' and fs_pid is null;
--------------------------------------------------------------------
select * from users;