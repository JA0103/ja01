<%@page import="com.it.hrd.VoteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.VoteDAO"></jsp:useBean>    
<% List<VoteVO> list = dao.getMemberList(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>

	<h2>후보조회</h2>
	<br>
	
	<div id="table">
		<table border="1">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<% for(VoteVO vo : list){ %>
			<tr>
				<td><%=vo.getM_no()%></td>
				<td><%=vo.getM_name()%></td>
				<td><%=vo.getP_name()%></td>
				<td><%=vo.getP_school()%></td>
				<td><%=vo.getM_jumin().substring(0,6)%>-<%=vo.getM_jumin().substring(6)%></td>
				<td><%=vo.getM_city()%></td>
				<td><%=vo.getP_tel1()%>-<%=vo.getP_tel2()%>-<%=vo.getP_tel3()%></td>
			</tr>
			<%} %>
		</table>
	</div>
</section>

<%@include file="footer.jsp" %>
</body>
</html>