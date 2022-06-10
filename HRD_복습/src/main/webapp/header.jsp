<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/common.css"/>
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>

<header><h1>쇼핑몰 회원관리 ver1.0</h1></header>

<nav>
	<ul>
		<li><a href="#">회원등록</a></li>
		<li><a href="#">회원목록조회/수정</a></li>
		<li><a href="#">회원매출조회</a></li>
		<li><a href="#">홈으로.</a></li>
	</ul>
	<form action="search.jsp" method="get">
		<div class="search">
			<input type="submit" value="검색">
			<input type="text" name="search">
		</div>
	</form>
</nav>

</body>
</html>