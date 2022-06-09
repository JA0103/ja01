create table member_tbl_02(
    custno number(6) not Null,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2),
    primary key(custno)
    );

insert into MEMBER_TBL_02 (CUSTNO, custname, phone, address, joindate, grade, city)
values(100001, '���ູ', '010-1111-2222', '���� ���빮�� �ְ�1��', '20151202', 'A', '01');

select * from MEMBER_TBL_02;

insert into MEMBER_TBL_02 (CUSTNO, custname, phone, address, joindate, grade, city)
values(100006, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '20151211', 'C', '60');

create table money_tbl_02(
    custno number(6) NOT NULL,
    salenol number(8) NOT NULL,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    primary key(custno,salenol)
    );
 
 -- ȸ������ ���̺� ���� ������ �߰�
create sequence member_seq
start with 10001 
increment by 1 
minvalue 10001 
cache 10;
-- ������ ���� �߰�
grant alter, select on member_seq to system; 
-- Ŀ��
commit;


    
insert into MONEY_TBL_02 (custno, salenol, pcost, amount, price, pcode, sdate)
values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select * from MONEY_TBL_02;

commit;

-------------------------------------------------------------------------------------

drop table member_tbl_02;
drop table money_tbl_02;
drop sequence member_seq;

-- ȸ������ ���̺� ����
create table member_tbl_02 ( 
custno number(6), -- ȸ�� ��ȣ
custname varchar2(20), -- �̸�
phone varchar2(13), -- ����ó
address varchar2(60), -- �ּ�
joindate date, -- �����
grade char(1), city char(2), -- ���, ������
primary key(custno) -- �⺻Ű
);

-- ���� �� CRUD ���Ѻο�
grant insert, update, delete, select on member_tbl_02 to system;

-- ȸ������ ���̺� ���� ������ �߰�
create sequence member_seq
start with 10001 
increment by 1 
minvalue 10001 
cache 10;

-- ������ ���� �߰�
grant alter, select on member_seq to system; 
-- Ŀ��
commit;

 -- ȸ�� ���� �߰�
insert into member_tbl_02 values(member_seq.nextval, '���ູ', '010-1111-2222', 
'���� ���빮�� �ְ�1��', '20151202', 'A', '01');
insert into member_tbl_02 values(member_seq.nextval, '���ູ', '010-1111-3333', 
'���� ���빮�� �ְ�2��', '20151206', 'B', '01');
insert into member_tbl_02 values(member_seq.nextval, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', 
'20151001', 'B', '30');
insert into member_tbl_02 values(member_seq.nextval, '�ֻ��', '010-1111-5555', 
'�︪�� �︪�� ����2��', '20151113', 'A', '30');
insert into member_tbl_02 values(member_seq.nextval, '����ȭ', '010-1111-6666', 
'���ֵ� ���ֽ� �ܳ�����', '20151225', 'B', '60');
insert into member_tbl_02 values(member_seq.nextval, '������', '010-1111-7777', 
'���ֵ� ���ֽ� ��������', '20151211', 'C', '60') ;
 -- Ŀ��
commit;

-- ȸ�� ���� ���� ����
create table money_tbl_02 ( 
custno number(6), -- ����ȣ
salenol number(8), -- �ǸŹ�ȣ
pcost number(8), -- �ܰ�
amount number(4), -- ����
price number(8), -- ����/����
pcode varchar2(4), -- ��ǰ�ڵ�
sdate date, -- �Ǹ�����
primary key(custno, salenol) ); --�⺻Ű
-- ���� �ο�
grant insert, update, delete, select on money_tbl_02 to system; 
commit;

-- ���� ���� �߰�
insert into money_tbl_02 values(10001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl_02 values(10001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_tbl_02 values(10001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_tbl_02 values(10002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl_02 values(10002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_tbl_02 values(10003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl_02 values(10004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into money_tbl_02 values(10004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_tbl_02 values(10004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_tbl_02 values(10004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select custno, D.custno, D.custname, D.grade, N.price
from MONEY_TBL_02 N , MEMBER_TBL_02 D
where N.custno = D.custno 

order by D.custno ;

select  D.custno, D.custname, D.grade, sum(price)
from MONEY_TBL_02 N , MEMBER_TBL_02 D
where N.custno = D.custno
group by D.CUSTNO, D.custname, D.grade
order by sum(price) desc;


select sum(price)
from MONEY_TBL_02
where custno = 10001;

select sum(price) 
from money_tbl_02
where CUSTNO=10001;

commit;

select * from member_tbl_02;
select * from money_tbl_02;
select ceil(count(*)/10.0) from MEMBER_TBL_02;
select custno, custname, phone, address, joindate, grade, city ;

delete from member_tbl_02 where custno = 0;

SELECT * FROM MEMBER_TBL_02WHERE 
WHERE ROWNUM >= 1 AND ROWNUM <= 20 
order by custno desc;

selet custno, custname, phone, address, joindate, grade, city 
from MEMBER_TBL_02 where custno =10001;
    



select custno from money_tbl_02;
select price from money_tbl_02 where custno =10001; 
select sum(price) from money_tbl_02 where custno =10001;