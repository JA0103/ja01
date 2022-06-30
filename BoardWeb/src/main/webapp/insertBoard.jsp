<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="com.springbook.biz.board.impl.BoardDAO" %>    
<%@page import="com.springbook.biz.board.BoardVO" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
	<h1>글 수정</h1>
	<a href="logout.do">Log-out</a>
	<hr>
	<form action="insertBoard.do" method="post">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input name="title" type="text" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left"><input name="writer" type="text" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="getBoardList.jsp">글 목록</a>
	
</center>	

</body>
</html>