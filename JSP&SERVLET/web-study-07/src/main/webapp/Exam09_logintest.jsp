<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.login  == 1}" >
		<%-- <jsp:forward page="Exam09_userLogin.jsp"/> --%>
		<c:redirect url="Exam09_userLogin.jsp?id=${param.id}"/>
	</c:when>
	<c:when test="${param.login  == 2}" >
		<jsp:forward page="Exam09_managerlogin.jsp"/>
	</c:when> 
</c:choose>
</body>
</html>