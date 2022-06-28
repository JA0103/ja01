<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/movie.css">
</head>
<body>
	<h1>리스트</h1>
	<hr>
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="code" value="${movie.code}">
		<table>
			<tr>
				<td>
					<c:choose>
						<c:when test="${empty movie.poster}">
							<img src="images/noimage.gif">
						</c:when>
						<c:otherwise>
							<img src="images/${movie.poster}">
						</c:otherwise>
					</c:choose>
				<td>
				<td>
				<div class="left">
					<table>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" size="80px" value="${movie.title}"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" size="80px" value="${movie.price}"></td>
						</tr>
						<tr>
							<th>감독</th>
							<td><input type="text" name="director" size="80px" value="${movie.director}"></td>
						</tr>
						<tr>
							<th>배우</th>
							<td><input type="text" name="actor" size="80px" value="${movie.actor}"></td>
						</tr>
						<tr>
							<th>설명</th>
							<td><textarea cols="80" rows="10" name="synopsis">${movie.synopsis}</textarea></td>
						</tr>
						<tr>
							<th>사진</th>
							<td><input type="file" name="poster" size="80px" value="${movie.poster}"></td>
						</tr>						
					</table>
				</div>
				<td>
			</tr>		
		</table>
		<div class="button" style="text-align: center;">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='movieList.do'">
		</div>
	</form>
</body>
</html>