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
create table board(
    num number(5) PRIMARY KEY,
    pass VARCHAR2(30),
    name VARCHAR2(30),
    email VARCHAR2(30),
    title VARCHAR2(50),
    content VARCHAR2(1000),
    readcount number(4) DEFAULT 0,
    writedate date DEFAULT sysdate
);

create SEQUENCE board_seq start with 1 INCREMENT by 1;

insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '성윤정', 'pinksung@nate.com', '1234', '첫방문', '반갑습니다.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '성윤정', 'pinksung@nate.com', '1234', '김밥', '맛있어요.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '전수빈', 'raccon@nate.com', '1234', '고등애', '일식입니다.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '전원지', 'one@nate.com', '1234', '갯골마을', '돼지삼겹살이 맛있습니다.');




*특징*********************
dbcp: 
<Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>