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
 	ResultSet rs = null;
 	int cnt = 0;
 	int id = Integer.parseInt(request.getParameter("id"));
 	String name = request.getParameter("name");
 	int lecturer = Integer.parseInt(request.getParameter("lecturer"));
 	int credit = Integer.parseInt(request.getParameter("credit"));
 	int week = Integer.parseInt(request.getParameter("week"));
 	int start_hour = Integer.parseInt(request.getParameter("start_hour"));
 	int end_end = Integer.parseInt(request.getParameter("end_end"));
	try{
			Class.forName("oracle.jdbc.OracleDriver");  
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			pstmt = con.prepareStatement("insert into course_tbl values (?,?,?,?,?,?,?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, credit);
			pstmt.setInt(4, lecturer);
			pstmt.setInt(5, week);
			pstmt.setInt(6, start_hour);
			pstmt.setInt(7, end_end);
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