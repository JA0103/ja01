<%@page import="com.it.hrd.VoteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.VoteDAO"></jsp:useBean>    
<% List<VoteVO> list = dao.getRank(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
	
	<h2>후보자등수</h2>
		<br>
		
	<div id="table">
		<table border="1">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			<% for(VoteVO vo : list){ %>
			<tr>
				<td><%=vo.getM_no() %></td>
				<td><%=vo.getM_name() %></td>
				<td><%=vo.getV_total() %></td>
			</tr>
			<%} %>
		</table>
	</div>

</section>

<%@include file="footer.jsp" %>
</body>
</html>