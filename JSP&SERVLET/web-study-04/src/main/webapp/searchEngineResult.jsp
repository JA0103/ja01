<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% response.sendRedirect(request.getParameter("engine")); %>
	
	
	
<%-- 	<% 
		response.setContentType("text/html; utf-8");
		
		String engine = request.getParameter("engine");
		
		
			if(engine.equals("네이버")){ 
				response.sendRedirect("https://www.naver.com/"); 
				
			 } else if(engine.equals("다음")){
				response.sendRedirect("http://www.daum.net"); 
				
			}else if(engine.equals("네이트")){
				response.sendRedirect("https://www.nate.com/"); 
			
			}else if(engine.equals("구글")){
				response.sendRedirect("https://www.google.co.kr/"); 
			} %> --%>
		
</body>
</html>