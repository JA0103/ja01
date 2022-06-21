<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.dao.*"%>
<jsp:useBean id="dao" class="com.it.dao.BoardDAO"/>
<%
	String search = request.getParameter("search");
	int result = dao.boardSearch(search); 
	
	if(result==1){
		response.sendRedirect("searchResult.jsp");
	}else{
%>
		<script>
			alert("검색 결과가 없습니다.")
			history.back();
		</script>
<%
	}
%>