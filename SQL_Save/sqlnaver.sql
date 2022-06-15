show databases;
create database naver character set utf8 collate utf8_general_ci;

use naver;

create table news(
	id int(20) not null auto_increment,
	title varchar(100) not null,
	content text,
	primary key(id)
);
select * from news;
select content from news;
select count(*) from news;
desc news;

insert into news(title, content)
values('xkdlxmd','zhsxpscm');

commit;