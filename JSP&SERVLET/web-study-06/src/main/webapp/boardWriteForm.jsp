<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th{background-color:#EFEFEF; }
	form #button{float:right; margin: 0 435px 0 0; } 
</style>
</head>
<body>
<h3>게시판 글쓰기</h3>
<div id="F">
	<form action="boardWrite.jsp" method="post">
		<table border="1" >
			<tr>
				<th>작성자 </th>
				<td><input type="text" name="name">
			</tr>
			<tr>
				<th>비밀번호 </th>
				<td><input type="password" name="pass"> (게시물 수정 삭제시 필요합니다.)
			</tr>
			<tr>
				<th>이메일 </th>
				<td><input type="text" name="email">
			</tr>
			<tr>
				<th>글 제목 </th>
				<td><input type="text" name="title">
			</tr>
			<tr>
				<th>글 내용 </th>
				<td><textarea cols="50" rows="10" name="content"></textarea></td>
			</tr>
		</table><br>
		<div id="button">
			<input type="submit" value="등록" >
			<input type="reset" value="다시 작성">
		</div>
	</form>
</div>
</body>
</html>