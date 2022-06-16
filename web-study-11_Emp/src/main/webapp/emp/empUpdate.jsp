<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript" src="script/insertCheck.js"></script>
</head>
<body>

	<div id="wrap" align="center">
		<h1>리스트</h1>
		<form action="EmpServlet" method="post" name="frm">
		<input type="hidden" name="preID" value="${emp.id}">
		<input type="hidden" name="command" value="emp_update">
		<table class="list" style="border:white;">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size="80px" value="${emp.id}"></td>
			</tr>			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" size="80px" value="${emp.pass}"></td>
			</tr>			
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="80px" value="${emp.name}"></td>
			</tr>			
			<tr>
				<th>권한</th>
				<%String manager="";
				  String member="";%>
				<c:if test="${emp.lev == 'A'}">
					<%manager="selected"; %>
				</c:if>
				<c:if test="${emp.lev == 'B'}">
					<%member="selected"; %>
				</c:if>
				<td>
					<select name="lev">
						<option <%=manager%> value="A">운영자</option> <option <%=member%> value="B">일반회원</option>
					</select>
				</td>
			</tr>			
			<tr>
				<th>성별</th>
					<%String man="";
					  String woman="";%>
					<c:if test="${emp.gender == '1'}">
						<%man="selected"; %>
					</c:if>
					<c:if test="${emp.gender == '2'}">
						<%woman="selected"; %>
					</c:if>
				<td>
					<select name="gender">
						<option <%=man%> value="1">남자</option> <option <%=woman%> value="2">여자</option>
					</select>
				</td>
			</tr>			
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" size="20px" value="${emp.phone}"></td>
			</tr>			
		</table>
		<br><br>
		<input type="submit" value="확인" onclick="return insertCheck()">
		<input type="reset" value="다시작성">
		<input type="button" value="목록" onclick="location.href='EmpServlet?command=emp_list'">
		</form>
	</div>
</body>
</html>