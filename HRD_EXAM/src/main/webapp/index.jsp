<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	*{margin:0; padding:0;}
	
	header{ height: 150px; background-color:blue;
		   color:white; text-align: center;  line-height: 150px;}
		   
    nav{height: 35px; background-color:RoyalBlue; line-height:10px;} 
	nav ul li { float: left;  margin: 0 30px; list-style: none;}
	nav ul li a{text-decoration: none; color: white; line-height:30px;}
 	
	section{ height: 500px; background-color:Gainsboro; }
	section h3{margin: 0 auto; text-align: center; line-height: 100px;}
	
	footer{color: white; height: 65px; background-color: CornflowerBlue; 
			text-align: center; line-height: 60px;} 
</style>
</head>
<body>

	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	
	<nav>
			<ul>
				<li><a href="insert.jsp">회원등록</a></li>
				<li><a href="list.jsp">회원목록 조회/수정</a></li>
				<li><a href="sales.jsp">회원매출조회</a></li>
				<li><a href="index.jsp">홈으로.</a></li>
			</ul>
	</nav>
	
	<section>
	 	<h3>쇼핑몰 회원관리 프로그램</h3><br>
	 	쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
	 	프로그램 작성 순서
	 	<ol>
	 		<li>회원정보 테이블을 생성한다.</li>
	 		<li>매출정보 테이블을 생성한다.</li>
	 		<li>회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
	 		<li>회원정보 입력 회면프로그램을 작성한다.</li>
	 		<li>회원정보 조회 프로그램을 작성한다.</li>
	 		<li>회원매출정보 조회 프로그램을 작성한다.</li>
	 	</ol>
	 	
	</section>
	
	<footer>Copyright © hipenpal.com & ltool.net. All Rights Reserved.</footer>

</body>
</html>