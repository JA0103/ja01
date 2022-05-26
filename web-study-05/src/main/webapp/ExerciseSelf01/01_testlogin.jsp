<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = "ezenAca";
		String pwd = "1234";
		String name = "이젠아카데미";
		
		if(id.equals(request.getParameter("id")) && 
				pwd.equals(request.getParameter("pwd"))){
			Cookie c = new Cookie("username2",name);
		}
	%>
</body>
</html>