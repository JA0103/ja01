<%@page import="com.it.shop.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.shop.memberDAO"/>
<% 
	int custno = Integer.parseInt(request.getParameter("custno"));
	memberVO vo = dao.getOne(custno); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<%@include file="header.jsp" %>

<section>
	<h3>홈쇼핑 회원 등록</h3>
	
	<form action="update_impl.jsp" method="get" name="frm">
		<table border="1">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno"  value=<%=vo.getCustno()%>></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text"  name="custname" value=<%=vo.getCustname()%>></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" value=<%=vo.getPhone()%>></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value=<%=vo.getAddress()%>></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate"  value=<%=vo.getJoindate()%>></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade" value=<%=vo.getGrade()%>></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" value=<%=vo.getCity()%>></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" onclick="return insertCheck()">
					<button type="button" onclick="location.href='list.jsp'">조회</button>
				</td>
			</tr>
		</table>
	</form>
</section>



<%@include file="footer.jsp" %>
</body>
</html>