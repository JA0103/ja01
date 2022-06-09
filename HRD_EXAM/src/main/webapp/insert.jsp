<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.shop.*"%>
    <jsp:useBean id="dao" class="com.it.shop.memberDAO"></jsp:useBean>
    <jsp:useBean id="vo" class="com.it.shop.memberVO"></jsp:useBean>
<%
	String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript" src="script/insertChk.js"></script>
<style type="text/css">
	*{margin:0; padding:0;}
	
	header{ height: 150px; background-color:blue;
		   color:white; text-align: center;  line-height: 150px;}
		   
    nav{height: 35px; background-color:RoyalBlue; line-height:10px;} 
	nav ul li { float: left;  margin: 0 30px; list-style: none;}
	nav ul li a{text-decoration: none; color: white; line-height:30px;}
 	
	section{ height: 500px; background-color: Gainsboro; margin: 0 auto; }
	section h3{margin :0; text-align: center; line-height: 100px;}
	section table{margin : 0 auto; width: 800px; height: 300px;  }
	
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
	 	<form action="insert_impl.jsp" method="get" name=frm>
			<h3>홈쇼핑 회원등록</h3>
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value=<%=dao.seqCustno(vo)%>></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value=<%=today%>></td>
				</tr>
				<tr>
					<th>고객등급[A,B,C]</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="등록" onclick="return insertCheck()">
						<button type="button" onclick="location.href='list.jsp';">조회</button>

					</td>
				</tr>
			</table>
		</form>
	 	
	</section>
	
	<footer>Copyright © hipenpal.com & ltool.net. All Rights Reserved.</footer>



</body>
</html>