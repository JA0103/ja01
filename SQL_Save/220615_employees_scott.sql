create table employees(
    id VARCHAR2(10) not null,
    pass VARCHAR2(10) not null,
    name VARCHAR2(24),
    lev char(1) DEFAULT 'A',    --운영자:'A', 일반회원:'B'
    enter date DEFAULT sysdate,
    gender char(1) DEFAULT '1',  --남자:1, 여자:2
    phone varchar2(30),
    primary key(id)
);

select * from EMPLOYEES;

insert into EMPLOYEES(id, pass, name, lev, gender, phone)
values( 'pinksung', '3333', '성윤정', 'A', '2', '010-2222-2222');
insert into EMPLOYEES(id, pass, name, lev, gender, phone)
values( 'subin', '1234', '전원지', 'B', '1', '010-9999-9999');
insert into EMPLOYEES(id, pass, name, lev, gender, phone)
values( 'admin', '1111', '정운영', 'A', '2', '010-1111-1111');

commit;