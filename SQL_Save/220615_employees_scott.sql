create table employees(
    id VARCHAR2(10) not null,
    pass VARCHAR2(10) not null,
    name VARCHAR2(24),
    lev char(1) DEFAULT 'A',    --���:'A', �Ϲ�ȸ��:'B'
    enter date DEFAULT sysdate,
    gender char(1) DEFAULT '1',  --����:1, ����:2
    phone varchar2(30),
    primary key(id)
);

select * from EMPLOYEES;

insert into EMPLOYEES(id, pass, name, lev, gender, phone)
values( 'pinksung', '3333', '������', 'A', '2', '010-2222-2222');
insert into EMPLOYEES(id, pass, name, lev, gender, phone)
values( 'subin', '1234', '������', 'B', '1', '010-9999-9999');
insert into EMPLOYEES(id, pass, name, lev, gender, phone)
values( 'admin', '1111', '���', 'A', '2', '010-1111-1111');

commit;