<%@page import="com.it.hrd.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>  
<% 
	String class_seq = request.getParameter("class_seq");
	ClassVO vo = dao.getOneClass(class_seq); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/class.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>과정 정보 수정</h3>
	
	<form action="update_class_impl.jsp" method="get" name="frm">
		<table border="1">
			<tr>
				<th>순번</th>
				<td><input type="text" name="class_seq" value="<%=vo.getClass_seq()%>" readonly="readonly"></td>
			</tr>		
			<tr>
				<th>개강월</th>
				<td><input type="text" name="regist_month" value="<%=vo.getRegist_month()%>"></td>
			</tr>		
			<tr>
				<th>과정번호</th>
				<td><input type="text" name="c_no" value="<%=vo.getC_no()%>" readonly="readonly"></td>
			</tr>		
			<tr>
				<th>캠퍼스</th>
				<td><input type="text" name="class_area" value="<%=vo.getClass_area()%>"></td>
			</tr>		
			<tr>
				<th>수강료</th>
				<td><input type="text" name="tution" value="<%=vo.getTution()%>"></td>
			</tr>		
			<tr>
				<th>교사코드</th>
				<td><input type="text" name="teacher_code" value="<%=vo.getTeacher_code()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" onclick="return InsetClassCheck()">
					<input type="button" value="삭제" onclick="location.href='delete_class_impl.jsp?c_no=<%=vo.getC_no()%>'">
					<input type="button" value="목록" onclick="location.href='classList.jsp'">
				</td>
			</tr>		
		</table>
		
	</form>
</section>

<%@include file="footer.jsp" %>
</body>
</html>