<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/class.js"></script>
<title>수강등록</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
<h3>수강 등록</h3>
	<form action="insert_member_impl.jsp" method="get" name="frm">
		<table border="1">
			<tr>
				<th>순번</th>
				<td><input type="text" name="member_seq" value=<%=dao.getMemberSeqNo()%> readonly="readonly"></td>
			</tr>		
			<tr>
				<th>과정코드</th>
				<td><input type="text" name="c_no" readonly="readonly"></td>
			</tr>		
			<tr>
				<th>수강생명</th>
				<td><input type="text" name="c_name"></td>
			</tr>		
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"></td>
			</tr>		
			<tr>
				<th>주소</th>
				<td><input type="text" name="address"></td>
			</tr>		
			<tr>
				<th>수강등록일</th>
				<td><input type="text" name="regist_date"></td>
			</tr>
			<tr>
				<th>수강등급</th>
				<td><input type="text" name="c_type"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" onclick="return InsetClassCheck()">
				</td>
			</tr>		
		</table>
		
	</form>
</section>

<%@include file="footer.jsp" %>
</body>
</html>