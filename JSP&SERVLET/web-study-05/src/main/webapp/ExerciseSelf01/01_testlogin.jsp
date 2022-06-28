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
		String id = "jina";
		String pwd = "1234";
		String name = "김진아";
		
		if(id.equals(request.getParameter("id")) && 
				pwd.equals(request.getParameter("pwd"))){
			Cookie c = new Cookie("username2",name);
			c.setMaxAge(24*60*60);
			response.addCookie(c);
			%>
			<h2> 로그인 성공 </h2>
			<form action="01_main.jsp" get="post">
				<a href="01_main.jsp">들어가기</a>
			</form>
		<%}else{%>
			<h2> 로그인 실패 </h2>
			<form action="01_loginForm.jsp" get="post">
				<a href="01_loginForm.jsp">뒤로가기</a>
			</form>
			<%} %>
	
	
</body>
</html>