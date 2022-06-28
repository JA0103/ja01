<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int global_cnt = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 주석문1 -->
	<%-- 주석문2  >> 소스코드 보는 부분에서 나옴 --%>
	<%//주석문3 --> 자바 부분에서 사용가능
		int local_cnt = 0;
		
		out.print("<br> local_cnt : ");
		out.print(++local_cnt);
		
		out.print("<br> global_cnt : ");
		out.print(++global_cnt);
	%>
	<% 
		Calendar c = Calendar.getInstance();
		SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
	%>
	<%= today.format(c.getTime()) %>
</body>
</html>