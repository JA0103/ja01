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
values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');

select * from MEMBER_TBL_02;

insert into MEMBER_TBL_02 (CUSTNO, custname, phone, address, joindate, grade, city)
values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

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
 
 -- 회원정보 테이블에 대한 시퀀스 추가
create sequence member_seq
start with 10001 
increment by 1 
minvalue 10001 
cache 10;
-- 시퀀스 권한 추가
grant alter, select on member_seq to system; 
-- 커밋
commit;


    
insert into MONEY_TBL_02 (custno, salenol, pcost, amount, price, pcode, sdate)
values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select * from MONEY_TBL_02;

commit;

-------------------------------------------------------------------------------------

drop table member_tbl_02;
drop table money_tbl_02;
drop sequence member_seq;

-- 회원정보 테이블 생성
create table member_tbl_02 ( 
custno number(6), -- 회원 번호
custname varchar2(20), -- 이름
phone varchar2(13), -- 연락처
address varchar2(60), -- 주소
joindate date, -- 등록일
grade char(1), city char(2), -- 등급, 거주지
primary key(custno) -- 기본키
);

-- 생성 후 CRUD 권한부여
grant insert, update, delete, select on member_tbl_02 to system;

-- 회원정보 테이블에 대한 시퀀스 추가
create sequence member_seq
start with 10001 
increment by 1 
minvalue 10001 
cache 10;

-- 시퀀스 권한 추가
grant alter, select on member_seq to system; 
-- 커밋
commit;

 -- 회원 정보 추가
insert into member_tbl_02 values(member_seq.nextval, '김행복', '010-1111-2222', 
'서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values(member_seq.nextval, '이축복', '010-1111-3333', 
'서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values(member_seq.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', 
'20151001', 'B', '30');
insert into member_tbl_02 values(member_seq.nextval, '최사랑', '010-1111-5555', 
'울릉군 울릉읍 독도2리', '20151113', 'A', '30');
insert into member_tbl_02 values(member_seq.nextval, '진평화', '010-1111-6666', 
'제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_02 values(member_seq.nextval, '차공단', '010-1111-7777', 
'제주도 제주시 감나무골', '20151211', 'C', '60') ;
 -- 커밋
commit;

-- 회원 매출 정보 명세서
create table money_tbl_02 ( 
custno number(6), -- 고객번호
salenol number(8), -- 판매번호
pcost number(8), -- 단가
amount number(4), -- 수량
price number(8), -- 가격/매출
pcode varchar2(4), -- 상품코드
sdate date, -- 판매일자
primary key(custno, salenol) ); --기본키
-- 권한 부여
grant insert, update, delete, select on money_tbl_02 to system; 
commit;

-- 매출 정보 추가
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