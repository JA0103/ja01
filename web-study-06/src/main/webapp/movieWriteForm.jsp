<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#button{text-indent: 385px;}
	th{background-color: #EFEFEF;}
	table{border-collapse:collapse; }
</style>
</head>
<body>

<h2>정보 등록</h2>
<form action="movieWrite.jsp" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td>&nbsp; <input type="text" name="title"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td>&nbsp; <input type="text" name="price">원</td>
		</tr>
		<tr>
			<th>감독</th>
			<td>&nbsp; <input type="text" name="director"></td>
		</tr>
		<tr>
			<th>출연배우</th>
			<td>&nbsp; <input type="text" name="actor"></td>
		</tr>
		<tr>
			<th>시놉시스</th>
			<td>&nbsp; <textarea cols="50" rows="5" name="synopsis"></textarea>&nbsp;</td>
		</tr>
		<tr>
			<th>장르</th>
			<td>&nbsp; <select name="genre">
				<option>로맨스코미디</option>
				<option>스릴러</option>
				<option selected>추리</option>
				<option>액션</option>
				<option>판타지</option>
				<option>애니메이션</option>
			</select></td>
		</tr>
	</table><br>
	<div id="button">
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</div>
</form>

</body>
</html>