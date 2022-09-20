<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	*{margin:0; padding:0;}
	header{background-color: blue; height: 80px;}
	header h3{text-align: center; line-height: 80px; color: white;}
	
	nav{height: 40px; background-color: RoyalBlue;}
	nav ul li{float: left; list-style: none; margin: 0px 15px 0px 15px;}
	nav ul li a{color: white; line-height: 40px; text-decoration: none;}
	
	section{height: auto; background-color: #b1b1b1;}
	section h2{text-align: center; line-height: 100px;}
	.indextext{padding: 20px;}
	section table{text-align: center; margin: 0 auto; width: 900px; border-collapse: collapse; border: black;}
	#table{padding-bottom: 100px;}
	footer{height: 50px; background-color: blue; color: white; text-align: center; line-height: 50px;}

</style>
<title>Insert title here</title>
</head>
<body>
	<header><h3>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h3></header>
	
	<nav>
		<ul>
			<li><a href="member_list.jsp">후보조회</a></li>
			<li><a href="vote_form.jsp">투표하기</a></li>
			<li><a href="vote_list.jsp">투표검수조회</a></li>
			<li><a href="member_rank.jsp">후보자등수</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	
</body>
</html>