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
	.search{float:right; margin:5px 10px ;}
 	
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
			<div class="search">
				<form action="search.jsp" method="get">
					<input type="submit" value="검색(주소)">
					<input type="text" name="search">
				</form>
			</div>
	</nav>

</body>
</html>