<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#button{float:right; margin:0 500px 0 0; }
</style>
</head>
<body>
<form action="itemWriteResult.jsp" method="post">
	<h2>정보 입력 폼</h2>
	<table>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>설명</td>
			<td><textarea cols="50" rows="5" name="description"></textarea></td>
		</tr>
	</table>
	<div id="button">
		<input type="submit" value="전송">
		<input type="reset" value="취소"><br><br>
	</div>
	
	<a href="itemWrite.jsp">상품목록 조회</a>
</form>
</body>
</html>