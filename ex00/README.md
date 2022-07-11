*DB

create user book IDENTIFIED by 1234
default tablespace users
temporary tablespace temp;

grant connect, dba to book;

select dbms_xdb.gethttpport() from dual;  -- 사용 포트번호 확인

exec dbms_xdb.sethttpport (9090);  -- 포트번호 변경


*pom
+ 추가
<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		
+ lombok		
+ ojdbc8

변경 ->		
<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.17</version>
		</dependency>	(밑에 속한거 지우기)	
		
