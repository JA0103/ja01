1. 롬복
2. ojdbc8
3. mybatis
4. mybatis spring	


*
create table board(
    id number(5) PRIMARY KEY,
    name VARCHAR(20),
    phone VARCHAR2(20),
    address VARCHAR2(50)
);
	
	
		<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
		<dependency>
		    <groupId>org.projectlombok</groupId>
		    <artifactId>lombok</artifactId>
		    <version>1.18.24</version>
		    <scope>provided</scope>
		</dependency>
		<!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc8 -->
		<dependency>
		    <groupId>com.oracle.database.jdbc</groupId>
		    <artifactId>ojdbc8</artifactId>
		    <version>21.5.0.0</version>
		</dependency>
	    <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
		<dependency>
		    <groupId>org.mybatis</groupId>
		    <artifactId>mybatis</artifactId>
		    <version>3.5.10</version>
		</dependency>
		  <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
		<dependency>
		    <groupId>org.mybatis</groupId>
		    <artifactId>mybatis-spring</artifactId>
		    <version>2.0.7</version>
		</dependency>