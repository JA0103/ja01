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
	Cookie ck [] = null;
	ck = request.getCookies();
		if( ck != null ){
			for(Cookie coo : ck){
				if(coo.getName().equals("username"))
					out.print(coo.getValue());
			}%> 
			님 안녕하세요!<br> 
			<form action="logout.jsp" get="post">
				<input type="submit" value="로그아웃">
			</form>
		<%}else {%>
			<h2> 로그인에 실패했습니다. </h2>
			<p><a href="loginForm.jsp">되돌아가기</a>
		<%}%>
		
		
		
		
</body>
</html>