<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	*{margin: 0; padding: 0;}

	header{
		background-color: blue; height: 150px; color: white;
		text-align: center; line-height: 150px;
	}
	nav{background-color: royalblue; height: 35px; line-height: 35px;}
	nav ul li{float: left; margin:0px 30px 0px 10px; list-style: none;}
	nav ul li a{text-decoration: none; color: white;}
	
	section{height: auto; background-color:Gainsboro; }
	section h3{text-align: center; line-height: 100px;}
	section ol{padding: 20px;}
	
	section table{width: 900px; height: 300px; text-align: center; margin: 0 auto;}
	table a{color: white; text-decoration: none;}
	
	footer{background-color: CornFlowerBlue; height: 65px; line-height: 65px;
		text-align: center; color: white;
	}
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
			<li><a href="#">회원매출 조회</a></li>
			<li><a href="index.jsp">홈으로.</a></li>
		</ul>
	</nav>

	
</body>
</html>