<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="searchEngineResult.jsp" method="get">
	
		<h1>검색 엔진 정보 페이지</h1><br>
		검색 엔진을 선택하세요.<br>
		<select name="engine">
			<option value="https://www.naver.com/" >네이버</option>
			<option value="http://www.daum.net">다음</option>
			<option value="https://www.nate.com/">네이트</option>
			<option value="https://www.google.co.kr/">구글</option>
		</select>


<!-- 		<select name="engine">
			<option>네이버</option>,<option>다음</option>,<option>네이트</option>,<option>구글</option>
		</select> -->

	
	
		<input type="submit" value="확인">
	</form>
		
</body>
</html>