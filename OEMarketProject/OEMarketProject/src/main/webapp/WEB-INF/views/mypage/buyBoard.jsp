<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
</head>
<body>

<div align="center">
	<h3>구매 내역</h3>
	<table border="1">
		<tr>
			<th>사진</th>
			<th>상품명</th>
			<th>가격</th>
			<th>판매자</th>
			<th>거래 완료일</th>
		</tr>
		<c:forEach items="${buy}" var="buy">
		<tr>
			<th><c:out value="대표사진1장"/></th>
			<th><c:out value="${buy.buy_title}"/></th>
			<th><c:out value="${buy.buy_price}"/></th>
			<th><c:out value="${buy.buy_seller}"/></th>
			<th><fmt:formatDate pattern="yyyy/MM/dd" value="${buy.buy_buydate}"/></th>
		</tr>
		</c:forEach>	
	</table>
</div>
</body>
</html>