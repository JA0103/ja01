<%@page import="com.it.hrd.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>
<% List<ClassVO> list = dao.getClassList(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정관리</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>과정 목록</h3>
	<table border="1">
		<tr>
			<th>순번</th>
			<th>개강월</th>
			<th>과정번호</th>
			<th>캠퍼스</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		
		<% for(ClassVO vo : list) {%>
		
		<tr>
			<td><%=vo.getClass_seq()%></td>
			<td><%=vo.getRegist_month()%></td>
			<td>
				<a href="class_detail.jsp?class_seq=<%=vo.getClass_seq()%>"><%=vo.getC_no()%></a>
			</td>
			<td><%=vo.getClass_area()%></td>
			<td><a href="update_class_form.jsp?class_seq=<%=vo.getClass_seq()%>">수정</a></td>
			<td><a href="delete_class_impl.jsp?class_seq=<%=vo.getClass_seq()%>">삭제</a></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="6">
				<button onclick="location.href='insert_class_form.jsp'">과정등록</button>
			</td>
		</tr>
	</table>
	<br>
	
</section>


<%@include file="footer.jsp" %>
</body>
</html>