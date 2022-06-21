<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TextForm 처리</title>
</head>
<body bgcolor="pink">
	당신이 입력한 정보입니다.<br/>
	<b>ID</b> : <%= request.getParameter("id") %><br/>
	<b>Password</b> : <%= request.getParameter("pw") %><br/>
	<b>자기소개</b><br/>
	<pre><%= request.getParameter("desc") %></pre>
</body>
</html>