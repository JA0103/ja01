<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id="me";
	String pwd="123";
	String name="미미";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(id.equals(request.getParameter("id")) && 
			pwd.equals(request.getParameter("pwd"))){
		Cookie c = new Cookie("username",name);
		c.setMaxAge(24*60*60);
		response.addCookie(c);
%>		
		<h2>성공적으로 로그인 하셨습니다.</h2>
		<p> <a href="main.jsp">들어가기</a>
<%		
	}else{
%>		
		<h2>로그인에 실패 하셨습니다.</h2>
		<p> <a href="loginForm.jsp">돌아가기</a>
<%	}
%>
</body>
</html>