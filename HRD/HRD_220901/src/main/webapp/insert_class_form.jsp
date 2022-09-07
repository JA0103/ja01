<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/class.js"></script>
<title>과정등록</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
<h3>과정 등록</h3>
	<form action="insert_class_impl.jsp" method="get" name="frm">
		<table border="1">
			<tr>
				<th>순번</th>
				<td><input type="text" name="class_seq" value=<%=dao.getClassSeqNo()%> readonly="readonly"></td>
			</tr>		
			<tr>
				<th>개강월</th>
				<td><input type="text" name="regist_month" placeholder="YYYYMM"></td>
			</tr>		
			<tr>
				<th>과정번호</th>
				<td><input type="text" name="c_no"></td>
			</tr>		
			<tr>
				<th>캠퍼스</th>
				<td><input type="text" name="class_area"></td>
			</tr>		
			<tr>
				<th>수강료</th>
				<td><input type="text" name="tution"></td>
			</tr>		
			<tr>
				<th>교사코드</th>
				<td><input type="text" name="teacher_code"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" onclick="return InsetClassCheck()">
					<input type="button" value="목록" onclick="location.href='classList.jsp'">
				</td>
			</tr>		
		</table>
		
	</form>
</section>

<%@include file="footer.jsp" %>
</body>
</html>