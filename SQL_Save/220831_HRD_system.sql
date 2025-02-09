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
values(class_seq.nextval,'202203', '10001', '서울본원', 100000, '100');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '10002', '성남분원', 100000, '100');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '10003', '부산분원', 200000, '200');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '20001', '광주분원', 150000, '300');
insert into tbl_class_202201 
values(class_seq.nextval,'202203', '20002', '대전분원', 200000, '400');

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
select * from tbl_member_202201;
create SEQUENCE member_seq
start with 1
increment by 1
minvalue 1;

--drop sequence member_seq;

insert into tbl_member_202201 
values(member_seq.nextval, '10001', '길정훈', '01011112222', '서울시 강남구', '20220101', '일반');
insert into tbl_member_202201 
values(member_seq.nextval, '10002', '임소희', '01022223333', '성남시 분당구', '20220102', '일반');
insert into tbl_member_202201 
values(member_seq.nextval, '10003', '김성민', '01033334444', '부산시 서구', '20220103', '일반');
insert into tbl_member_202201 
values(member_seq.nextval, '20001', '정우희', '01044445555', '광주시 남구', '20220104', 'VIP');
insert into tbl_member_202201 
values(member_seq.nextval, '20002', '이규호', '01055556666', '대전시 유성구', '20220105', 'VIP');


create table tbl_teacher_202201(
    teacher_seq number (4) not null,
    teacher_code char(3) not null primary key,
    class_name varchar2(12),
    teacher_name varchar2(12),
    class_price number(8),
    teacher_regist_date char(8)
);

select T.class_name, C.class_area, T.teacher_name, T.class_price
from tbl_teacher_202201 T, tbl_class_202201 C
where T.teacher_code = C.teacher_code
and T.teacher_code = 200;



create SEQUENCE teacher_seq
start with 1
increment by 1
minvalue 1;

insert into tbl_teacher_202201 
values(teacher_seq.nextval, '100', '초급반', '김초급', 100000, '20220101');
insert into tbl_teacher_202201 
values(teacher_seq.nextval, '200', '중급반', '이중급', 200000, '20220102');
insert into tbl_teacher_202201 
values(teacher_seq.nextval, '300', '고급반', '박고급', 300000, '20220103');
insert into tbl_teacher_202201 
values(teacher_seq.nextval, '400', '심화반', '조심화', 400000, '20220104');

commit;
select  D.custno, D.custname, D.grade, sum(price)
						from MONEY_TBL_02 N , MEMBER_TBL_02 D
						where N.custno = D.custno
						group by D.CUSTNO, D.custname, D.grade
						order by sum(price) desc ;

select * from tbl_member_202201 where member_seq=1;
select M.member_seq,M.c_name,M.phone,M.address,M.regist_date,M.c_type,
        T.class_name,T.teacher_name
from tbl_class_202201 C, tbl_teacher_202201 T, tbl_member_202201 M
where   M.c_no = C.c_no 
        and C.teacher_code = T.teacher_code
        and member_seq = 1;
        
        
-------------------------------------------------------------------------------
--0906 수강신청 도우미

select C.id,C.name,C.credit,L.name,C.week,C.start_hour,C.end_end
from course_tbl C, lecturer_tbl L
where C.lecturer = L.idx;

create table course_tbl(
    id varchar2(5) not null primary key, --교과목아이디
    name varchar2(80),--교과목 명
    credit number(6),--학점
    lecturer varchar2(10),--강사
    week number(2),--요일
    start_hour number(4),--시작시간
    end_end number(4)--종료시간
);

create table lecturer_tbl(
    idx number(6) not null primary key,--번호
    name varchar2(20),--강사명
    major varchar2(40),--전공
    field varchar2(40)--연구분야
);

select * from course_tbl order by id;

select count(id) from course_tbl;

select C.id, C.name, C.credit, L.name, C.week, C.start_hour, C.end_end
from course_tbl C, lecturer_tbl L
where C.lecturer = L.idx
order by id;


insert into course_tbl values('10001','프로그래밍', 2, '1', 1, '0900', '1100');
insert into course_tbl values('10002','객체지향 프로그래밍', 2, '1', 2, '0900', '1200');
insert into course_tbl values('10003','자료구조', 3, '4', 3, '0900', '1200');
insert into course_tbl values('10004','알고리즘', 3, '4', 4, '0900', '1200');
insert into course_tbl values('20001','시스템 프로그래밍', 2, '5', 1, '1300', '1600');
insert into course_tbl values('20002','운영체제', 3, '5', 2, '1500', '1800');
insert into course_tbl values('20003','오토마타와 컴파일러', 3, '5', 3, '1330', '1630');
insert into course_tbl values('30001','소프트웨어 공학', 2, '3', 4, '1330', '1530');
insert into course_tbl values('30002','시스템 분석 및 설계', 3, '3', 5, '0900', '1200');
insert into course_tbl values('40001','데이터베이스', 3, '2', 5, '1300', '1600');


create table lecturer_tbl(
    idx number(6) not null primary key,--번호
    name varchar2(20),--강사명
    major varchar2(40),--전공
    field varchar2(40)--연구분야
);
select * from lecturer_tbl;


create sequence lecturer_seq
start with 1
increment by 1
minvalue 1;


insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '김교수', '소프트웨어공학', '알고리즘');
insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '이교수', '소프트웨어공학', '인공지능');
insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '박교수', '소프트웨어공학', '소프트웨어공학');
insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '우교수', '소프트웨어공학', '알고리즘');
insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '최교수', '응용컴퓨터공학', '임베디드 시스템');
insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '강교수', '응용컴퓨터공학', '멀티미디어');
insert into LECTURER_TBL values(LECTURER_SEQ.NEXTVAL, '황교수', '모바일시스템공학', '네트워크');

select * from LECTURER_TBL;
select * from COURSE_TBL;

commit;

