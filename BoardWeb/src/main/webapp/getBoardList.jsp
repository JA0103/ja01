<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="com.springbook.biz.board.impl.BoardDAO" %>    
<%@page import="com.springbook.biz.board.BoardVO" %>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- <%
	List<BoardVO> boardList =(List) session.getAttribute("boardList");
%>
 --%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<!-- Link -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/basic.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
</head>
<body>
<center>
	<h1><spring:message code="message.board.list.mainTitle"/></h1>
	<h3><spring:message code="message.board.list.welcomeMsg"/><a href="logout.do">Log-out</a></h3>
	
	<!-- 검색 시작 -->
	<form action="getBoardList.do" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
					<select name="searchCondition">
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}
						</c:forEach>
					</select>			
					<input name="searchKeyword" type="text"/>
					<input type="submit" value="<spring:message code="message.board.list.search.condition.btn"/>"/>
				</td>	
			</tr>
		</table>
	</form>
	
	<!-- 검색 종료 -->
	
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<tr>
		 	<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.seq"/></th>
		 	<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.title"/></th>
		 	<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.writer"/></th>
		 	<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.regDate"/></th>
		 	<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.cnt"/></th>
		</tr>
		
		<%-- <% for(BoardVO board : boardList){ %> --%>
		
		<c:forEach items="${boardList }" var="board">
		<tr>
			<td>${board.seq }</td>
			<td align="left"><a href="getBoard.do?seq=${board.seq }">
				${board.title }</a></td>
			<td>${board.writer }</td>
			<td>${board.regDate }</td>
			<td>${board.cnt }</td>
		</tr>
		</c:forEach>
	
		<%-- <%} %> --%>
	
	</table>
	<br>
	<a href="insertBoard.jsp"><spring:message code="message.board.list.link.insertBoard"/></a>

</center>
</body>
</html>