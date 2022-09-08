<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	Connection con = null; 	
 	PreparedStatement pstmt = null;
 	int cnt = 0;
 	int id = Integer.parseInt(request.getParameter("id"));
	try{
			Class.forName("oracle.jdbc.OracleDriver");  
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			pstmt = con.prepareStatement("delete course_tbl where id = ?");
			pstmt.setInt(1, id);
			cnt = pstmt.executeUpdate();	
			response.sendRedirect("index.jsp");
	%>
	<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	%>
</body>
</html>