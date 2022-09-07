<%@page import="com.it.hrd.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>    
<%
	String member_seq = request.getParameter("member_seq");
	ClassVO vo = dao.getMemberDetail(member_seq);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 상세 정보 페이지</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>수강 상세 정보 페이지</h3>
	
		<table border="1">
			<tr>
				<th>순번</th>
				<td><%=vo.getMember_seq() %></td>
			</tr>		
			<tr>
				<th>수강생명</th>
				<td><%=vo.getC_name() %></td>
			</tr>		
			<tr>
				<th>전화번호</th>
				<td><%=vo.getPhone() %></td>
			</tr>		
			<tr>
				<th>주소</th>
				<td><%=vo.getAddress() %></td>
			</tr>		
			<tr>
				<th>수강등록일</th>
				<td><%=vo.getRegist_date() %></td>
			</tr>
			<tr>
				<th>수강등급</th>
				<td><%=vo.getC_type() %></td>
			</tr>
			<tr>
				<th>과정명</th>
				<td><%=vo.getClass_name() %></td>
			</tr>
			<tr>
				<th>담당교사명</th>
				<td><%=vo.getTeacher_name() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="목록" onclick="location.href='memberList.jsp'">
				</td>
			</tr>		
		</table>
		

</section>

<%@include file="footer.jsp" %>
</body>
</html>