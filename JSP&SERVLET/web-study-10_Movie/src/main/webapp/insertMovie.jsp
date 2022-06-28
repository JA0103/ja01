<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/movie.css">
</head>
<body>
<div id="box" align="center">
	<h1>정보 등록</h1>
<form method="post" enctype="multipart/form-data"  >
	<table border="1" style="padding:5px">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" size="80px"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" size="80px"></td>
		</tr>	
		<tr>
			<th>감독</th>
			<td><input type="text" name="director" size="80px"></td>
		</tr>	
		<tr>
			<th>배우</th>
			<td><input type="text" name="actor" size="80px"></td>
		</tr>	
		<tr>
			<th>설명</th>
			<td><textarea cols="80" rows="10" name="synopsis"></textarea></td>
		</tr>	
		<tr>
			<th>사진</th>
			<td><input type="file" name="poster"></td>
		</tr>	
	</table>
			<div class="button">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
				<input type="button" value="목록" onclick="location.href='movieList.do'">
			</div>
</form>
</div>
</body>
</html>