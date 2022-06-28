<%@page import="java.io.PrintWriter"%>
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
			int num = Integer.parseInt(request.getParameter("num")); 
			int sum=0;	
			%>
			<h1>1 부터 <%=num %>까지의 자연수 합 구하기</h1> 
		<% 
			for( int i=1; i<=num;i++){
				sum += i;
				if(i==num)
					out.print(i + " = " + sum);
				else
					out.print(i + " + ");
			}
	
		%>  
	
	
	
</body>
</html>