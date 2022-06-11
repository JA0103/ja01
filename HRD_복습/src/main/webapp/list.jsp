<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
    <% 
	    Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String id = "system";
		String pwd = "1234";
		String sql = "select * from member_tbl ";
		
		try{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
	    	conn = DriverManager.getConnection(url,id,pwd);
	    	ps = conn.prepareStatement(sql);
	    	rs = ps.executeQuery();
	    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/common.css"/>
<title>Insert title here</title>
</head>
<body>

<%@include file="header.jsp" %>

<section>
	<h3>회원목록조회/수정</h3>
	<table border="1">
		<tr>
			<th width="10%">회원번호</th>
			<th width="10%">회원성명</th>
			<th width="20%">전화번호</th>
			<th width="30%">주소</th>
			<th width="10%">가입일자</th>
			<th width="10%">고객등급</th>
			<th width="10%">거주지역</th>
		</tr>
		<%
			while(rs.next()){
				String grade="";
				if(rs.getString(6).equals("A")) grade="VIP";
				else if(rs.getString(6).equals("B")) grade="일반";
				else if(rs.getString(6).equals("C")) grade="직원";
		%>
		<tr>
			<td style="text-align:center;"><a href="update.jsp?custno=<%=rs.getInt(1)%>"><%=rs.getInt(1)%></a></td>
			<td style="text-align:center;"><%=rs.getString(2)%></td>
			<td style="text-align:center;"><%=rs.getString(3)%></td>
			<td style="text-align:center;"><%=rs.getString(4)%></td>
			<td style="text-align:center;"><%=rs.getString(5).substring(0,10)%></td>
			<td style="text-align:center;"><%=grade%></td>
			<td style="text-align:center;"><%=rs.getString(7)%></td>
		</tr>
		<%
			} 
		%>
	</table>
	
</section>
	
<%@include file="footer.jsp" %>

</body>
</html>
<%
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