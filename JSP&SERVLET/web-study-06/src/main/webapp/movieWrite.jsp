<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="movieError.jsp" %>
    <% request.setCharacterEncoding("utf-8"); %>  
    <jsp:useBean id="movie" class="com.mission.javabeans.MovieBean"/>
    <jsp:setProperty property="*" name="movie"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 처리 페이지</title>
<style type="text/css">
	th{background-color: #FFF0F0;}
</style>
</head>
<body>
<table >
		<tr>
			<th>제목</th>
			<td><%=movie.getTitle() %></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><%=movie.getPrice() %>원</td>
		</tr>
		<tr>
			<th>감독</th>
			<td><%=movie.getDirector() %></td>
		</tr>
		<tr>
			<th>출연배우</th>
			<td><%=movie.getActor() %></td>
		</tr>
		<tr>
			<th>시놉시스</th>
			<td><textarea cols="50" rows="5" name="synopsis"><%=movie.getSynopsis() %></textarea></td>
		</tr>
		<tr>
			<th>장르</th>
			<td><%=movie.getGenre()%></td>
		</tr>
	</table>
</body>
</html>