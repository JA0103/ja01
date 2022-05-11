show databases;
create database naver character set utf8 collate utf8_general_ci;

use naver;

create table news(
no integer auto_increment,
title varchar(3),
content varchar(3),
primary key(no)
);
select * from member ;

select * from member where no = no;


commit;