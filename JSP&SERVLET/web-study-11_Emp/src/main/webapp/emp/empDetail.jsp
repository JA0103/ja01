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
		<h1>정보 보기</h1>
		<table class="list" >
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
			<tr>
				<th>아이디</th>
				<td>${emp.id}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${emp.pass}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${emp.name}</td>
			</tr>
			<tr>
				<th>권한</th>
				<td><%=lev%></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=gender%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${emp.phone}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${emp.enter}</td>
			</tr>
		</table>
		<br><br>
		<input type="button" value="수정" onclick="location.href='EmpServlet?command=emp_update_form&id=${emp.id}'">
		<input type="button" value="삭제" onclick="location.href='EmpServlet?command=emp_delete&id=${emp.id}'">
		<input type="button" value="목록" onclick="location.href='EmpServlet?command=emp_list'">
		<input type="button" value="등록" onclick="location.href='EmpServlet?command=emp_insert_form'">
	</div>
</body>
</html>