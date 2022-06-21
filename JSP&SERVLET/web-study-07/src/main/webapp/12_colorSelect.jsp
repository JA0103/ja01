<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.color == 1 }">
		<span style="color: red;">빨강</span>
	</c:when>
	<c:when test="${param.color == 2 }">
		<span style="color: green;">초록</span>
	</c:when>
	<c:when test="${param.color == 3 }">
		<span style="color: blue;">파랑</span>
	</c:when>
</c:choose>
</body>
</html>