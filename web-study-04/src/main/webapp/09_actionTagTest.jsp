<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String userID = request.getParameter("userID");
    	String userPwd = request.getParameter("userPwd");
    	String loginCheck = request.getParameter("loginCheck");
    	
    	if(loginCheck.equals("user")){
    	%>
    		<jsp:forward page="09_userMain.jsp" >
    		<jsp:param value='<%=URLEncoder.encode("전고객","utf-8") %>' 
    							name="userName" />
    		</jsp:forward>
		<%}else{ %>
	 		<jsp:forward page="09_managerMain.jsp">
	 		<jsp:param value='<%=URLEncoder.encode("성관리","utf-8") %>' 
	 							name="userName" />
			</jsp:forward>
		<%} %>
    	
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>