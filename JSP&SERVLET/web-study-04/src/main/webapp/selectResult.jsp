<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	당신의 학력, 소속국가 및 관심분야는 다음과 같습니다.<br><br>
	<%
	String edu = request.getParameter("edu"); 
	String na = request.getParameter("na");
	String [] likes = request.getParameterValues("like");
	%>
	
	당신의 학력 : 
	<b><%=edu %></b><br>
	당신의 국가 : 
	<b><%=na %></b> <br>
	
	<%-- <% for (int i =0; i<likes.length;i++){ %> 
		 <b><%=likes[i] %>	</b><br> <%}%>
	 --%>
 	당신의 관심분야 : 
 	<% for(String like : likes) { %>
		<b><%= like %></b>
	<%} %>
</body>
</html>