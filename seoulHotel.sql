

create table seoul_hotel(
	no int,
    name varchar(100),
    score double,
    address varchar(200),
    poster varchar(200),
    images varchar(1000),
    primary key(no)
	
);

desc seoul_hotel;

create table seoul_location(
	no int,
    name varchar(100),
    address varchar(200),
    poster varchar(200),
    msg varchar(1000),
    primary key(no)
);

desc seoul_location;

create table seoul_nature(
	no int,
    name varchar(100),
    address varchar(200),
    poster varchar(200),
    msg varchar(1000),
    primary key(no)
);

desc seoul_nature;

select * from seoul_location;
select * from seoul_nature;
select * from seoul_hotel;

