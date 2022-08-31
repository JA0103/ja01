<%@page import="com.it.shop.memberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.it.shop.memberDAO"></jsp:useBean>    
<%
	List<memberVO> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
<%@include file="header.jsp" %>
	<section>
		<h3>회원목록조회/수정</h3>
		
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<% for(memberVO vo : list) {%>
				<tr>
					<td><a href="update.jsp?custno=<%=vo.getCustno()%>"><%=vo.getCustno() %></a></td>
					<td><%=vo.getCustname() %></td>
					<td><%=vo.getPhone() %></td>
					<td><%=vo.getAddress() %></td>
					<td><%=vo.getJoindate().substring(0,10)%></td>
					<td><%=vo.getGrade() %></td>
					<td><%=vo.getCity() %></td>
				</tr>
			<%} %>	
		</table>
	</section>
<%@include file="footer.jsp" %>
</body>
</html>