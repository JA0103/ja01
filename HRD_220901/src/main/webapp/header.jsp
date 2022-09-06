<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	*{margin: 0; padding: 0;}
	
	header{background-color: blue; height: 100px; line-height: 100px; text-align: center; color: white;}

	nav{background-color: olive; height: 50px; line-height: 50px;}
	nav ul li{float: left; margin: 0px 10px 0px 10px; list-style: none;}
	nav ul li a{color: white; text-decoration: none;}
	
	section{height: auto; background-color: Gainsboro;}
	section ol{padding: 30px;}
	section h3{text-align: center; line-height: 60px;} 
	section table{width: 900px; text-align: center; margin: 0 auto;}
	section table a{text-decoration: none; color: maroon;}
	section button{}
	
	footer{background-color: blue; height: 50px; line-height: 50px; 
			text-align: center; color: white;}
	
	
</style>
<title>홈</title>
</head>
<body>

	<header><h1>수강관리 프로그램 ver 1.0</h1></header>
	
	<nav>
		<ul>
			<li><a href="classList.jsp">과정관리</a></li>
			<li><a href="memberList.jsp">수강생 정보</a></li>
			<li><a href="teacherList.jsp">교사정보</a></li>
			<li><a href="index.jsp">홈으로..</a></li>
		</ul>
	</nav>



</body>
</html>