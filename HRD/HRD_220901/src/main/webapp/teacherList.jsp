<%@page import="com.it.hrd.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>
<% List<ClassVO> list = dao.getTeacherList(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교사정보</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>교사 목록</h3>
	<table border="1">
		<tr>
			<th>순번</th>
			<th>교사코드</th>
			<th>담당과정명</th>
			<th>교사명</th>
			<th>배정금액</th>
			<th>등록일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		
		<% for(ClassVO vo : list) {%>
		
		<tr>
			<td><a href="teacher_detail.jsp?teacher_seq=<%=vo.getTeacher_seq()%>"><%=vo.getTeacher_seq()%></a></td>
			<td><%=vo.getTeacher_code()%></td>
			<td><%=vo.getClass_name()%></td>
			<td><%=vo.getTeacher_name()%></td>
			<td><%=vo.getClass_price()%></td>
			<td><%=vo.getTeacher_regist_date()%></td>
			<td><a href="update_teacher_form.jsp?teacher_code=<%=vo.getTeacher_code()%>">수정</a></td>
			<td><a href="delete_teacher_impl.jsp?teacher_code=<%=vo.getTeacher_code()%>">삭제</a></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="8">
				<button onclick="location.href='insert_teacher_form.jsp'">교사등록</button>
			</td>
		</tr>
	</table>
	<br>
	
</section>


<%@include file="footer.jsp" %>
</body>
</html>