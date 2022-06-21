<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
   font-family: 'yleeMortalHeartImmortalMemory';
   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/yleeMortalHeartImmortalMemory.woff2') format('woff2');
   font-weight: normal;
   font-style: normal;
} 
	body{font-family: 'yleeMortalHeartImmortalMemory'; font-size: 30px;}
</style>
</head>
<body>
<%
	String st = "봄, 여름, 가을, 겨울";
	request.setAttribute("st", st);
%>
	<c:forTokens var="st" items="${st}" delims=",">
		${st},
	</c:forTokens><br><br>
	&nbsp;그리고<br>
	&emsp;&emsp;&emsp;&emsp;&emsp; <b style="color:#ffcc00; font-size: 40px;">봄</b>
</body>
</html>