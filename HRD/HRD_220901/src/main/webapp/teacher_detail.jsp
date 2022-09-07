<%@page import="java.util.List"%>
<%@page import="com.it.hrd.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>    
<%
	String teacher_seq = request.getParameter("teacher_seq");
	List<ClassVO> list = dao.getOneTeacherList(teacher_seq);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교사 상세 정보 페이지</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>교사 상세 정보 페이지</h3>
	
		<table border="1">
			<tr>
				<th>과정명</th>
				<th>캠퍼스명</th>
				<th>교사명</th>
				<th>배정금액</th>
			</tr>
			<% for(ClassVO vo : list) {%>		
			<tr>
				<td><%=vo.getClass_name() %></td>
				<td><%=vo.getClass_area() %></td>
				<td><%=vo.getTeacher_name() %></td>
				<td><%=vo.getClass_price() %></td>
			</tr>
			<%} %>
			<tr>		
				<td colspan="4">
					<input type="button" value="목록" onclick="location.href='teacherList.jsp'">
				</td>
			</tr>		
		</table>
		

</section>

<%@include file="footer.jsp" %>
</body>
</html>