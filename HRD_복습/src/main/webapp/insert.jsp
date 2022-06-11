<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
    <%
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
    	String id = "system";
    	String pwd = "1234";
    	String sql = "select max(custno) from member_tbl ";
    	int custno = 0;
    	String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
    	
    	try{
    	
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
	    	conn = DriverManager.getConnection(url,id,pwd);
	    	ps = conn.prepareStatement(sql);
	    	rs = ps.executeQuery();
	    	
    		if(rs.next()) custno = rs.getInt(1)+1;
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/common.css"/>
<title>Insert title here</title>
<script type="text/javascript" src="./script/insertCheck.js"></script>
</head>
<body>
	<%@include file="header.jsp" %>
		
		<section>
		<h3>홈쇼핑 회원 등록</h3>
			<form action="insert_impl.jsp" method="post" name="frm">
				<table border="1">
					<tr>
						<th width="20%">회원번호</th>
						<td width="30%"><input type="text" name="custno" id="custno" size="15" value=<%=custno%>></td> 
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" size="15" id="custname"></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name="phone" size="25"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address" size="35"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="text" name="joindate" size="15" value=<%=today%>></td>
					</tr>
					<tr>
						<th>고객등급[A:VIP,B:일반,C:직원]</th>
						<td><input type="text" name="grade" size="15"></td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td><input type="text" name="city" size="15"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" value="등록" onclick="return insertCheck()">
							<input type="button" value="조회" onclick="location.href='list.jsp'">
						</td>
					</tr>
				</table>
			</form>
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