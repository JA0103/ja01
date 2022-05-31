<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String pass = "tiger";
	String sql = "select * from item";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	td{background-color: pink;}
</style>
</head>
<body>
<h1>입력 완료된 정보</h1>
<table border="1">

	<tr>
		<th>상품</th>
		<th>가격</th>
		<th>설명</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,uid,pass);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
		
		while(rs.next()){
%>			
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
<%			
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</table>

	<br><a href="itemWriteForm.jsp">상품추가하기</a>
</body>
</html>