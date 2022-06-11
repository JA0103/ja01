<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	
	String sql = "insert into member_tbl values(?,?,?,?,?,?,?) ";
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,id,pwd);
		ps = conn.prepareStatement(sql);
		ps.setInt(1, custno);
		ps.setString(2,custname);
		ps.setString(3,phone);
		ps.setString(4,address);
		ps.setString(5,joindate);
		ps.setString(6,grade);
		ps.setString(7,city);
		ps.executeUpdate();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>
<script>
	alert("회원등록이 완료 되었습니다.");
	location.href="list.jsp";
</script>