<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="board" class="com.mission.javabeans.BoardBean"/>
    <jsp:setProperty property="*" name="board"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>입력 완료된 정보</h2>
<table>
	<tr>
		<td>작성자 </td>
		<td><%= board.getName() %>
	</tr>
	<tr>
		<td>비밀번호 </td>
		<td><%= board.getPass() %>
	</tr>
	<tr>
		<td>이메일 </td>
		<td><%= board.getEmail() %>
	</tr>
	<tr>
		<td>글제목 </td>
		<td><%= board.getTitle() %>
	</tr>
	<tr>
		<td>글내용 </td>
		<td><pre><%= board.getContent() %></pre></td>
	</tr>
</table>
</body>
</html>