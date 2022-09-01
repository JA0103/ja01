create table member_tbl_02(
    custno NUMBER(6) not null,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2),
    PRIMARY KEY (custno)
);

--drop table member_tbl_02;
--drop table money_tbl_02;
--drop sequence member_seq;
select * from member_tbl_02;

desc MEMBER_TBL_02;
delete from MEMBER_TBL_02 where custno = 100016;
create table money_tbl_02(
    custno number(6) not null,
    salenol number(8) not null,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    primary key (custno,salenol)
);

select * from money_tbl_02;
desc MONEY_TBL_02;

insert into member_tbl_02 values(100001, '���ູ', '010-1111-2222', '���� ���빮�� �ְ�1��', '20151202', 'A', '01');
insert into member_tbl_02 values(100002, '���ູ', '010-1111-3333', '���� ���빮�� �ְ�2��', '20151206', 'B', '01');
insert into member_tbl_02 values(100003, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', '20151001', 'B', '30');
insert into member_tbl_02 values(100004, '�ֻ��', '010-1111-5555', '�︪�� �︪�� ����2��', '20151113', 'A', '30');
insert into member_tbl_02 values(100005, '����ȭ', '010-1111-6666', '���ֵ� ���ֽ� �ܳ�����', '20151225', 'B', '60');
insert into member_tbl_02 values(100006, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '20151211', 'C', '60');

insert into money_tbl_02 values(100001,20160001,500,5,2500,'A001','20160101');
insert into money_tbl_02 values(100001,20160002,1000,4,4000,'A002','20160101');
insert into money_tbl_02 values(100001,20160003,500,3,1500,'A008','20160101');
insert into money_tbl_02 values(100002,20160004,2000,1,2000,'A004','20160102');
insert into money_tbl_02 values(100002,20160005,500,1,500,'A001','20160103');
insert into money_tbl_02 values(100003,20160006,1500,2,3000,'A003','20160103');
insert into money_tbl_02 values(100004,20160007,500,2,1000,'A001','20160104');
insert into money_tbl_02 values(100004,20160008,300,1,300,'A005','20160104');
insert into money_tbl_02 values(100004,20160009,600,1,600,'A006','20160104');
insert into money_tbl_02 values(100004,20160010,3000,1,3000,'A007','20160106');
DELETE FROM MONEY_TBL_02;
commit;

-- ȸ������ ���̺� ���� ������ �߰�
create sequence member_seq
start with 10001 
increment by 1 
minvalue 10001 
cache 10;

select * from money_tbl_02;


select m1.custno, custname, grade, sum(price)
from member_tbl_02 m1 inner join money_tbl_02 m2
on m1.custno=m2.custno
group by m1.custno, m1.custname, m1.grade order by sum(price) desc;

select max(custno) from member_tbl_02;

select m1.custno, m1.custname, m1.grade, sum(m2.PRICE)
from member_tbl_02 m1, money_tbl_02 m2
where m1.custno = m2.CUSTNO
group by m1.custno, m1.custname, m1.grade
order by sum(price) desc;

commit;

select * from member_tbl_02 where address like '%����%';


---------------------------------------------------------------------------

create table member_tbl_02(
    custno number(6) not null primary key,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)
);
select max(custno) from member_tbl_02;



--drop table member_tbl_02;
--drop sequence member_seq;
create SEQUENCE member_seq
start with 100001
increment by 1
minvalue 100001
cache 10;

select * from MEMBER_TBL_02;
insert into member_tbl_02 
values(member_seq.nextval, '���ູ', '010-1111-2222', '���� ���빮�� �ְ�1��', '20151202', 'A', '01');
insert into member_tbl_02 
values(member_seq.nextval, '���ູ', '010-1111-3333', '���� ���빮�� �ְ�2��', '20151202', 'B', '01');
insert into member_tbl_02 
values(member_seq.nextval, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', '20151202', 'B', '01');
insert into member_tbl_02 
values(member_seq.nextval, '�ֻ��', '010-1111-5555', '�︪�� �︪�� ����2��', '20151202', 'A', '01');
insert into member_tbl_02 
values(member_seq.nextval, '����ȭ', '010-1111-6666', '���ֵ� ���ֽ� �ܳ�����', '20151202', 'B', '01');
insert into member_tbl_02 
values(member_seq.nextval, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '20151202', 'C', '01');

commit;

create table money_tbl_02(
    custno number(6) not null,
    salenol number(8) not null,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
     primary key (custno,salenol)
);

insert into money_tbl_02 values(100001,20160001,500,5,2500,'A001','20160101');
insert into money_tbl_02 values(100001,20160002,1000,4,4000,'A002','20160101');
insert into money_tbl_02 values(100001,20160003,500,3,1500,'A008','20160101');
insert into money_tbl_02 values(100002,20160004,2000,1,2000,'A004','20160102');
insert into money_tbl_02 values(100002,20160005,500,1,500,'A001','20160103');
insert into money_tbl_02 values(100003,20160006,1500,2,3000,'A003','20160103');
insert into money_tbl_02 values(100004,20160007,500,2,1000,'A001','20160104');
insert into money_tbl_02 values(100004,20160008,300,1,300,'A005','20160104');
insert into money_tbl_02 values(100004,20160009,600,1,600,'A006','20160104');
insert into money_tbl_02 values(100004,20160010,3000,1,3000,'A007','20160106');




commit;


--------------------------------------------------------------------------------
--0901
create table tbl_class_202201(
    class_seq number(4) not null,
    regist_month char(8) not null,
    c_no char(5) not null,
    class_area varchar2(15),
    tution number(8),
    teacher_code char(3),
    primary key(regist_month,c_no)
);
select * from tbl_class_202201;
delete tbl_class_202201 where CLASS_SEQ=7;
select * from tbl_class_202201 where class_seq= 1;
commit;
create SEQUENCE class_seq
start with 1
increment by 1
minvalue 1;

update tbl_class_202201 set class_seq=1, regist_month='202204', 
				c_no=10001, class_area='ff', tution=10000, teacher_code='100' 
				where class_seq = 1; 

insert into tbl_class_202201 
values(class_seq.nextval,'202203', '10001', '���ﺻ��', 100000, '100');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '10002', '�����п�', 100000, '100');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '10003', '�λ�п�', 200000, '200');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '20001', '���ֺп�', 150000, '300');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '20002', '�����п�', 200000, '400');

select * from tbl_class_202201;


create table tbl_member_202201(
    member_seq number(4) not null primary key,
    c_no char(5) not null,
    c_name varchar2(12),
    phone varchar2(11),
    address varchar2(50),
    regist_date char(8),
    c_type varchar2(12)
);

create SEQUENCE member_seq
start with 1
increment by 1
minvalue 1;

--drop sequence member_seq;

insert into tbl_member_202201 
values(member_seq.nextval, '10001', '������', '01011112222', '����� ������', '20220101', '�Ϲ�');
insert into tbl_member_202201 
values(member_seq.nextval, '10002', '�Ӽ���', '01022223333', '������ �д籸', '20220102', '�Ϲ�');
insert into tbl_member_202201 
values(member_seq.nextval, '10003', '�輺��', '01033334444', '�λ�� ����', '20220103', '�Ϲ�');
insert into tbl_member_202201 
values(member_seq.nextval, '20001', '������', '01044445555', '���ֽ� ����', '20220104', 'VIP');
insert into tbl_member_202201 
values(member_seq.nextval, '20002', '�̱�ȣ', '01055556666', '������ ������', '20220105', 'VIP');


create table tbl_teacher_202201(
    teacher_seq number (4) not null,
    teacher_code char(3) not null primary key,
    class_name varchar2(12),
    teacher_name varchar2(12),
    class_price number(8),
    teacher_regist_date char(8)
);
create SEQUENCE teacher_seq
start with 1
increment by 1
minvalue 1;

insert into tbl_teacher_202201 
values(teacher_seq.nextval, '100', '�ʱ޹�', '���ʱ�', 100000, '20220101');
insert into tbl_teacher_202201 
values(teacher_seq.nextval, '200', '�߱޹�', '���߱�', 200000, '20220102');
insert into tbl_teacher_202201 
values(teacher_seq.nextval, '300', '��޹�', '�ڰ��', 300000, '20220103');
insert into tbl_teacher_202201 
values(teacher_seq.nextval, '400', '��ȭ��', '����ȭ', 400000, '20220104');

commit;
select  D.custno, D.custname, D.grade, sum(price)
						from MONEY_TBL_02 N , MEMBER_TBL_02 D
						where N.custno = D.custno
						group by D.CUSTNO, D.custname, D.grade
						order by sum(price) desc ;



select C.regist_month,C.c_no,C.class_area,C.tution,C.teacher_code,
        T.teacher_name,T.class_name
from tbl_class_202201 C, tbl_teacher_202201 T
where C.teacher_code = T.teacher_code
and class_seq = 1
group by C.regist_month,C.c_no,C.class_area,C.tution,C.teacher_code,
        T.teacher_name,T.class_name;
        




