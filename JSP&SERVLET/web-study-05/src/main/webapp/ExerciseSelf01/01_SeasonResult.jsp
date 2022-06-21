<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<% response.setCharacterEncoding("utf-8"); %>
	
	
		<% 
			String s1 = request.getParameter("Season1"); 
		
			if(s1.equals("꽃")) {%>
					당신이 가장 좋아하는 계절은 <br>
					<b style="color:#FF7A85;">봄</b>입니다. <br><br>
			<%}else if(s1.equals("바람")) {%>
					당신이 가장 좋아하는 계절은 <br>
					<b style="color:#64CD3C;">여름</b>입니다. <br><br>
			<%}else if(s1.equals("낙엽")) {%>
					당신이 가장 좋아하는 계절은 <br>
					<b style="color:#F4A460;">가을</b>입니다. <br><br>
			<%}else if(s1.equals("눈")) {%>
					당신이 가장 좋아하는 계절은 <br>
					<b style="color:#BECDFF;">겨울</b>입니다. <br><br>
			<%}%>
		<% 
			String s2 = request.getParameter("Season2"); 
		
			if(s2.equals("꽃")) {%>
					당신이 두번째로 좋아하는 계절은 <br>
					<b style="color:#FF7A85;">봄</b>입니다. <br><br>
			<%}else if(s2.equals("바람")) {%>
					당신이 두번째로 좋아하는 계절은 <br>
					<b style="color:#64CD3C;">여름</b>입니다. <br><br>
			<%}else if(s2.equals("낙엽")) {%>
					당신이 두번째로 좋아하는 계절은 <br>
					<b style="color:#F4A460;">가을</b>입니다. <br><br>
			<%}else if(s2.equals("눈")) {%>
					당신이 두번째로 좋아하는 계절은 <br>
					<b style="color:#BECDFF;">겨울</b>입니다. <br><br>
			<%}%>
		<% 
			String s3 = request.getParameter("Season3"); 
		
			if(s3.equals("꽃")) {%>
					당신이 세번째로 좋아하는 계절은 <br>
					<b style="color:#FF7A85;">봄</b>입니다. <br><br>
			<%}else if(s3.equals("바람")) {%>
					당신이 세번째로 좋아하는 계절은 <br>
					<b style="color:#64CD3C;">여름</b>입니다. <br><br>
			<%}else if(s3.equals("낙엽")) {%>
					당신이 세번째로 좋아하는 계절은 <br>
					<b style="color:#F4A460;">가을</b>입니다. <br><br>
			<%}else if(s3.equals("눈")) {%>
					당신이 세번째로 좋아하는 계절은 <br>
					<b style="color:#BECDFF;">겨울</b>입니다. <br><br>
			<%}%>
		<% 
			String s4 = request.getParameter("Season4"); 
		
			if(s4.equals("꽃")) {%>
					당신이 네번째 좋아하는 계절은 <br>
					<b style="color:#FF7A85;">봄</b>입니다. <br><br>
			<%}else if(s4.equals("바람")) {%>
					당신이 네번째 좋아하는 계절은 <br>
					<b style="color:#64CD3C;">여름</b>입니다. <br><br>
			<%}else if(s4.equals("낙엽")) {%>
					당신이 네번째 좋아하는 계절은 <br>
					<b style="color:#F4A460;">가을</b>입니다. <br><br>
			<%}else if(s4.equals("눈")) {%>
					당신이 네번째 좋아하는 계절은 <br>
					<b style="color:#BECDFF;">겨울</b>입니다. <br><br>
			<%}%>
			
		
		<form action="01_loginForm.jsp" get="post">
			<input type="submit" value="끝내기">
			
		</form>
</body>
</html>