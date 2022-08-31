<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.shop.memberDAO"/>    
    
<% String today = new SimpleDateFormat("yyyyMMdd").format(new Date()); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/insertCheck.js"></script>
<title>회원 등록</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>홈쇼핑 회원 등록</h3>
	
	<form action="insert_impl.jsp" method="get" name="frm">
		<table border="1">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno"  value=<%=dao.seqCustno()%>></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text"  name="custname" ></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" ></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" ></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate"  value=<%=today%>></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade" ></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" ></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" onclick="return insertCheck()">
					<button type="button" onclick="location.href='list.jsp'">조회</button>
				</td>
			</tr>
		</table>
	</form>
</section>



<%@include file="footer.jsp" %>
</body>
</html>