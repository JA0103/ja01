create table course_tbl(
 ID                                        VARCHAR2(5) not null primary key,
 NAME                                               VARCHAR2(40),
 CREDIT                                             NUMBER(6),
 LECTURER                                           VARCHAR2(10),
 WEEK                                               NUMBER(2),
 START_HOUR                                         NUMBER(4),
 END_END                                            NUMBER(4)
);

create SEQUENCE course_seq INCREMENT by 1 start with 1;

insert into COURSE_TBL 
values('10001','프로그래밍', '2', '1', '1', '0900', '1100');
insert into COURSE_TBL 
values('10002','객체지향 프로그래밍', '2', '2', '2', '0900', '1200');
insert into COURSE_TBL 
values('10003','자료구조', '3', '4', '3', '0900', '1200');
insert into cOURSE_TBL 
values('10004','알고리즘', '3', '4', '4', '0900', '1200');
insert into COURSE_TBL 
values('20001','시스템 프로그래밍', '2', '5', '1', '1300', '1600');
insert into COURSE_TBL 
values('20002','운영체제', '3', '5', '2', '1500', '1800');
insert into COURSE_TBL 
values('20003','오토마타와 컴파일러', '3', '5', '3', '1330', '1630');
insert into COURSE_TBL 
values('30001','소프트웨어 공학', '2', '3', '4', '1330', '1530');
insert into COURSE_TBL 
values('30002','시스템 분석 및 설계', '3', '3', '5', '0900', '1200');
insert into COURSE_TBL 
values('40001','데이타베이스', '3', '2', '5', '1300', '1600');

commit;
drop table lecturer_tbl; --insert into LECTURER_TBL

 NAME                                               VARCHAR2(20),
 MAJOR                                              VARCHAR2(40),
 FIELD                                              VARCHAR2(40)
);

create SEQUENCE lecturer_seq 
INCREMENT by 1 
start with 10001
minvalue 1;

insert into LECTURER_TBL
values(lecturer_seq.nextval,'김교수', '소프트웨어공학','알고리즘'); 
insert into LECTURER_TBL
values(lecturer_seq.nextval,'이교수', '소프트웨어공학','인공지능'); 
insert into LECTURER_TBL
values(lecturer_seq.nextval,'박교수', '소프트웨어공학','소프트웨어공학'); 
insert into LECTURER_TBL
values(lecturer_seq.nextval,'우교수', '소프트웨어공학','알고리즘'); 
insert into LECTURER_TBL
values(lecturer_seq.nextval,'최교수', '응용컴퓨터공학','임베이드 시스템'); 
insert into LECTURER_TBL
values(lecturer_seq.nextval,'강교수', '응용컴퓨터공학','멀티미디어'); 
insert into LECTURER_TBL
values(lecturer_seq.nextval,'황교수', '모바일시스템공학','네트워크'); 
commit;

select * from course_tbl;
select * from LECTURER_TBL;
desc course_tbl;
desc lecturer_tbl;
select a.id, a.name, a.credit, b.name as name2, a.week, a.start_hour, a.end_end 
from course_tbl a, lecturer_tbl b 
where a.id = b.idx order by a.id;
