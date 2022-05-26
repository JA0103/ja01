<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{text-decoration: none; color:olive;}
	a:hover{color:orange;}
</style>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("username2"))
					out.print(c.getValue());
			}%>
			님 안녕하세요!<br>
			좋아하는 계절 찾기를 체험해보시겠습니까?<br><br>
			<form action="01_SeasonForm.jsp" get="post">
				<b><a href="01_SeasonForm.jsp">시작하기</a></b><br><br>
			</form>
			
			<form action="01_logout.jsp" get="post">
				<input type="submit" value="로그아웃">
			</form>
		<%}else{%>
			
			<h2>로그인 실패</h2>
			<form action="01_loginForm" get="post">
				<a href="01_loginForm">뒤로가기</a>
			</form>	
			<%} %>
</body>
</html>