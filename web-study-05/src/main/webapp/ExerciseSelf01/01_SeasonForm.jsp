<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="01_SeasonResult.jsp" get="post">
		<h3>가장 좋아하는 것부터 차례로 골라주세요!</h3><br><br>
		<select name="Season1">
			<option selected>꽃</option>, <option>바람</option>, 
			<option>낙엽</option>, <option>눈</option>
		</select>
		
		<select name="Season2">
			<option>꽃</option>, <option selected>바람</option> ,
			<option>낙엽</option>, <option>눈</option>
		</select>
		
		<select name="Season3">
			<option>꽃</option>, <option>바람</option> ,
			<option selected>낙엽</option>, <option>눈</option>
		</select>
		
		<select name="Season4">
			<option>꽃</option> ,<option>바람</option> ,
			<option>낙엽</option> ,<option selected>눈</option>
		</select>
		
		<input type="submit" value="확인">
	</form>
</body>
</html>