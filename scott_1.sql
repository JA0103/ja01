create table member(
    name varchar2(10) not null,
    userid varchar2(10),
    pwd varchar2(10) not null,
    email VARCHAR2(20),
    phone char(13),
    admin number(1) DEFAULT 0,
    PRIMARY key(userid)
    ); 
    
alter table member MODIFY(name varchar2(20));
desc member;

insert into MEMBER (name, userid, pwd, email, phone, admin)
values('이소미', 'somi', '1234', 'somi@naver.com', '010-1111-2222', 0);

insert into MEMBER (name, userid, pwd, email, phone, admin)
values('하상오', 'sang12', '1234', 'ha12@naver.com', '010-3333-4444', 0);

insert into MEMBER (name, userid, pwd, email, phone, admin)
values('김윤승', 'light', '1234', 'youn1004@naver.com', '010-5555-6666', 0);

SELECT * FROM MEMBER;

insert into member(name, userid, pwd)
values('홍길동','hong','1234');

update MEMBER set ADMIN ='1'
where USERID ='sang12';

update member set phone='011-765-4321'
where userid='somi';

update member set email='gmd@naver.com'
where userid='somi';

SELECT * FROM MEMBER;

commit;



create table employee (
    name VARCHAR2(20),
    address varchar2(100),
    ssn varchar2(15)
    );

desc EMPLOYEE;

insert into EMPLOYEE(name,address,ssn)
values('duke','seoul','970224-1039234');

insert into EMPLOYEE(name,address,ssn)
values('pororo','pusan','001222-1038782');

insert into EMPLOYEE(name,address,ssn)
values('candy','daejeon','981221-1829192');
select name,address,ssn from employee;

SELECT * FROM EMPLOYEE;

commit;


create table item(
    name varchar2(20),
    price number(8),
    description varchar2(100)
    );

desc item;
SELECT * FROM ITEM;

commit;

create table emp_ddl(
    empno number(4),
    ename varchar2(10),
    job varchar(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
    );

desc EMP_DDL;
SELECT * FROM EMP_DDL;


--           복사해서 테이블 생성
create table dept_ddl as select * from dept;
select * from dept;
select * from dept_ddl;

create table emp_ddl_30 as select * from emp
where deptno = 30;

SELECT * FROM EMP_DDL_30;


  --     구조만 복사해서 테이블 생성
create table empdept_ddl as 
    select e.EMPNO, e.ENAME, e.JOB, e.MGR, e.HIREDATE, e.SAL, e.COMM, 
            d.DEPTNO, d.DNAME, d.LOC
    from emp e, dept d
    where 1 <> 1;

SELECT * FROM EMPDEPT_DDL;
desc EMPDEPT_DDL;

create table emp_alter
    as select * from emp;
    
select * from EMP_ALTER;

--          추가 : add
alter table emp_alter
    add hp varchar2(20);

--          이름바꾸기 : rename
alter table emp_alter
    rename column hp to tel;

--          구조 수정 : modify 
alter table emp_alter
    MODIFY empno number(5);

desc emp_alter;

alter table emp_alter
    drop column  tel;

rename emp_alter to emp_rename;

select * from EMP_RENAME;
desc emp_rename;

--     데이터 지우기
delete from emp_rename;

--     커밋전엔 롤백 됨
ROLLBACK;

--     얘는 커밋 안해도 롤백 안됨!!
truncate table emp_rename;
--     얘도 롤백 안됨!!!
drop table emp_rename;

select * from member;
delete from member
where USERID = 'somi3';

