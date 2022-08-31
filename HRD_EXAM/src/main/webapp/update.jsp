<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.shop.*"%>
    <jsp:useBean id="dao" class="com.it.shop.memberDAO"/>
    <%
    	String custno = request.getParameter("custno");
    	memberVO vo = dao.memberUpdateData(Integer.parseInt(custno));  

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">

	section{ height: 500px; background-color: Gainsboro; margin: 0 auto; }
	section h3{margin :0; text-align: center; line-height: 100px;}
	section table{margin : 0 auto; width: 800px; height: 300px;  }
	
	footer{color: white; height: 65px; background-color: CornflowerBlue; 
			text-align: center; line-height: 60px;} 
</style> -->
</head>
<body>
<%@ include file="header.jsp" %>
	
	<section>
	 	<form action="update_impl.jsp" method="get">
			<h3>홈쇼핑 회원 정보 수정</h3>
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" value=<%=vo.getCustno()%>></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value=<%=vo.getCustname()%>></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value=<%=vo.getPhone()%>></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%=vo.getAddress() %>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value=<%=vo.getJoindate()%>></td>
				</tr>
				<tr>
					<th>고객등급[A,B,C]</th>
					<td><input type="text" name="grade" value=<%=vo.getGrade()%>></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value=<%=vo.getCity()%>></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="수정" onclick="return insertCheck()">
						<button type="button" onclick="location.href='list.jsp';">조회</button>

					</td>
				</tr>
			</table>
		</form>
	 	
	</section>
	
	<%@include file="footer.jsp" %>
</body>
</html>