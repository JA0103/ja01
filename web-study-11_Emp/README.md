*환경****************
1. windows10
2. sts(version: 3.9.17.release)
3. tomcat9.0
4. oracle 11g
lib->
5. lombok
6. jstl.jar
7. standard.jar
8. ojdbc6.jar
9. cos.jar




*DB*********************
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




*특징*********************
dbcp: 
<Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>