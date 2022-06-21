<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie[] c = request.getCookies();
	if(c != null){
		for(Cookie ck : c)
			if(ck.getName().equals("username"))
				out.print(ck.getValue());%>님 안녕하세요!<br>
				
				<form method="post" action="logout.jsp">
					<input type="submit" value="로그아웃">
				</form>
<%			
		
	}else{%>
		<h2>로그인 실패<h2>
		<p> <a href="loginForm.jsp">돌아가기</a>
<%	}
%>
</body>
</html>