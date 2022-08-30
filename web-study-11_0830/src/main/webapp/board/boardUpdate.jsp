<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 수정</h1>
		<form action="BoardServlet" name="frm" method="post">
			<input type="hidden" name="command" value="board_update">
			<input type="hidden" name="num" value="${board.num}">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" value="${board.name}">*필수</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass">*필수 (게시물 수정 삭제 시 필요합니다.)</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="${board.email}"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${board.title}">*필수</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" cols="50" rows="10">${board.content}</textarea></td>
				</tr>
			</table>
			<br><br>
			<input type="submit" value="등록" onclick="return boardCheck()">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록" onclick="location.href='BoardServlet?command=board_list'">
		</form>
	</div>
</body>
</html>