<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 내역</title>
</head>
<body>

<div align="center">
	<h3>판매 내역</h3>
	<table border="1">
		<tr>
			<th>사진</th>
			<th>판매상태</th>
			<th>상품명</th>
			<th>가격</th>
			<th>최근 등록일</th>
		</tr>
		<c:forEach items="${sell}" var="sell">
		<tr>
			<th><c:out value="${bo_image}"/></th>
			<th><c:out value="기욱이고민즁><"/></th>
			<th><c:out value="${sell.sel_title}"/></th>
			<th><c:out value="${sell.sel_price}"/></th>
			<th><fmt:formatDate pattern="yyyy/MM/dd" value="${sell.sel_selldate}"/></th>
		</tr>
		</c:forEach>	
	</table>
</div>
</body>
</html>