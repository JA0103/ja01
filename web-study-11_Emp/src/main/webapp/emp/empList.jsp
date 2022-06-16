<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap" align="center">
		<h1>리스트</h1>
		<table class="list" >
			<tr>
				<td colspan="5" style="border:white; text-align: right;">
					<a href="EmpServlet?command=emp_insert_form">정보등록</a>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>권한</th>
				<th>성별</th>
				<th>전화번호</th>
			</tr>
			<c:forEach var="emp" items="${empList}">
	 			<%
					String lev = "";
	 				String gender="";
				%>
				<c:if test="${emp.lev == 'A'}">
					<% lev = "운영자"; %>
				</c:if>
				<c:if test="${emp.lev == 'B'}">
					<% lev = "일반회원"; %>
				</c:if> 
				<c:if test="${emp.gender == '1'}">
					<% gender="남자"; %>
				</c:if>
				<c:if test="${emp.gender == '2'}">
					<% gender="여자"; %>
				</c:if> 
			<tr class="record">
				<td>${emp.id}</td>
				<td><a href="EmpServlet?command=emp_detail_form&id=${emp.id}">${emp.name}</a></td>
				<td><%=lev%></td>
				<td><%=gender%></td>
				<td>${emp.phone}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>