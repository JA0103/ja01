<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 리스트</h1>
		
			<table class="list">
				<tr>
					<td colspan="5" style="border:white; text-align:right;">
						<a href="BoardServlet?command=board_write_form">게시글 등록</a> 
					</td>
				</tr>
				<tr class="record">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
				<c:forEach items="${boardList}" var="board">
					<tr>
						<td>${board.num}</td>
						<td><a href="BoardServlet?command=board_view&num=${board.num}">${board.title}</a></td>
						<td>${board.name}</td>
						<td><fmt:formatDate value="${board.writedate}" /></td>
						<td>${board.readcount}</td>
					</tr>
				</c:forEach>
			</table>
		
	</div>
</body>
</html>