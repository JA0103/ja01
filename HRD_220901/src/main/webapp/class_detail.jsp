<%@page import="com.it.hrd.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>    
<%
	String class_seq = request.getParameter("class_seq");
	ClassVO vo = dao.getDetail(class_seq);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>상세 정보 페이지</h3>
	
		<table border="1">
			<tr>
				<th>개강월</th>
				<td><%=vo.getRegist_month() %></td>
			</tr>		
			<tr>
				<th>과정번호</th>
				<td><%=vo.getC_no() %></td>
			</tr>		
			<tr>
				<th>캠퍼스</th>
				<td><%=vo.getClass_area() %></td>
			</tr>		
			<tr>
				<th>수강료</th>
				<td><%=vo.getTution() %></td>
			</tr>		
			<tr>
				<th>교사코드</th>
				<td><%=vo.getTeacher_code() %></td>
			</tr>
			<tr>
				<th>교사명</th>
				<td><%=vo.getTeacher_name() %></td>
			</tr>
			<tr>
				<th>과정명</th>
				<td><%=vo.getClass_name() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="목록" onclick="location.href='classList.jsp'">
				</td>
			</tr>		
		</table>
		

</section>

<%@include file="footer.jsp" %>
</body>
</html>