<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="dto" class="org.zerock.domain.SampleDTO"></jsp:useBean>    
    
<%
	String name = request.getParameter(dto.getName());
	//int age = Integer.parseInt(request.getParameter(dto.getAge()));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Sample Test!</h1>
	${model}
</body>
</html>