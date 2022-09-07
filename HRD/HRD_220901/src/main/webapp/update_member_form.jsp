<%@page import="com.it.hrd.ClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>  
<% 
	String member_seq = request.getParameter("member_seq");
	ClassVO vo = dao.getOneMember(member_seq); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/class.js"></script>
<title>수강 정보 수정</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	<h3>수강 정보 수정</h3>
	
	<form action="update_member_impl.jsp" method="get">
		<table border="1">
			<tr>
				<th>순번</th>
				<td><input type="text" name="member_seq" value="<%=vo.getMember_seq()%>" readonly="readonly"></td>
			</tr>		
			<tr>
				<th>과정코드</th>
				<td><input type="text" name="c_no" value="<%=vo.getC_no()%>"></td>
			</tr>		
			<tr>
				<th>수강생명</th>
				<td><input type="text" name="c_name" value="<%=vo.getC_name()%>"></td>
			</tr>		
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="<%=vo.getPhone()%>"></td>
			</tr>		
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" value="<%=vo.getAddress()%>"></td>
			</tr>		
			<tr>
				<th>수강등록일</th>
				<td><input type="text" name="regist_date" value="<%=vo.getRegist_date()%>"></td>
			</tr>		
			<tr>
				<th>수강등급</th>
				<td><input type="text" name="c_type" value="<%=vo.getC_type()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="삭제" onclick="location.href='delete_member_impl.jsp?member_seq=<%=vo.getMember_seq()%>'">
					<input type="button" value="목록" onclick="location.href='memberList.jsp'">
				</td>
			</tr>		
		</table>
		
	</form>
</section>

<%@include file="footer.jsp" %>
</body>
</html>