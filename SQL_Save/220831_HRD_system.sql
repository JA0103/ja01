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

insert into member_tbl_02 values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
insert into member_tbl_02 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
insert into member_tbl_02 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_02 values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

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

-- 회원정보 테이블에 대한 시퀀스 추가
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

select * from member_tbl_02 where address like '%수원%';


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
values(member_seq.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 
values(member_seq.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151202', 'B', '01');
insert into member_tbl_02 
values(member_seq.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151202', 'B', '01');
insert into member_tbl_02 
values(member_seq.nextval, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151202', 'A', '01');
insert into member_tbl_02 
values(member_seq.nextval, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151202', 'B', '01');
insert into member_tbl_02 
values(member_seq.nextval, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151202', 'C', '01');

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














