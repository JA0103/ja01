<%@page import="com.it.hrd.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>
<% List<ClassVO> list = dao.getMemberList(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강목록</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>수강 목록</h3>
	<table border="1">
		<tr>
			<th>순번</th>
			<th>수강생명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>과정코드</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		
		<% for(ClassVO vo : list) {%>
		<tr>
			<td>
				<a href="class_detail.jsp?member_seq=<%=vo.getMember_seq()%>"><%=vo.getMember_seq()%></a>
			</td>
			<td><%=vo.getC_name()%></td>
			<td>
				<%=vo.getPhone()%>
			</td>
			<td><%=vo.getAddress()%></td>
			<td><%=vo.getC_no()%></td>
			<td><a href="update_member_form.jsp?member_seq=<%=vo.getMember_seq()%>">수정</a></td>
			<td><a href="delete_member_impl.jsp?member_seq=<%=vo.getMember_seq()%>">삭제</a></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="7">
				<button onclick="location.href='insert_member_form.jsp'">과정등록</button>
			</td>
		</tr>
	</table>
	<br>
	
</section>


<%@include file="footer.jsp" %>
</body>
</html>