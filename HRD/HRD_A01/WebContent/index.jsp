<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	h2 {text-align:center;}
	h4 {margin-left:10%; text-weight:400; font-size:20px}
	header, section, footer {border: 2px solid #333}
	section {margin:10px 0 10px 0 ; height:420px}
	table {text-align:center; border-collapse: collapse; width:80%; margin:0 auto; border:2px solid #333;  clear:both}
	table th, table td {border:1px solid #333}
	table thead {background-color:rgb(252,245,231); height:40px}
	button {border:2px solid #333; background-color:#fff; padding:10px 20px 10px 20px; float:right; margin-right:10%; margin-top:10px; clear:both}
</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<section>
	<%
	Connection con = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt=0;
	try{
		Class.forName("oracle.jdbc.OracleDriver");  
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		pstmt = con.prepareStatement("select count(*) as cnt from course_tbl");
		rs = pstmt.executeQuery();
		System.out.println("rs : " + rs);
		while(rs.next()){
		cnt = rs.getInt("cnt");		
	%>
		<h4>총 <%=cnt %>개의 교과목이 있습니다.</h4>
	<%
		}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try{
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
		<table>
		<thead>
			<tr>
				<th>과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>담당강사</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
			</tr>
		</thead>
	<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");  
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			pstmt = con.prepareStatement("select a.id, a.name, a.credit, b.name as name2, a.week, a.start_hour, a.end_end from course_tbl a, lecturer_tbl b where a.id = b.idx order by a.id");
			rs = pstmt.executeQuery();
			String weeks ="";
			String time="";
			while(rs.next()){		
			if(rs.getInt("week")==1){
				weeks="월";
			}else if (rs.getInt("week")==2){
				weeks="화";
			}else if (rs.getInt("week")==3){
				weeks="수";
			}else if (rs.getInt("week")==4){
				weeks="목";
			}else if (rs.getInt("week")==5){
				weeks="금";
			}
			if(rs.getString("start_hour").length() < 4){
				time= "0"+rs.getString("start_hour");
			}else{
				time=rs.getString("start_hour");
			}
	%>
			<tr>
				<td><%=rs.getInt("id") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getInt("credit") %></td>
				<td><%=rs.getString("name2") %></td>
				<td><%=weeks %></td>
				<td><%=time %></td>
				<td><%=rs.getString("end_end") %></td>
				<td><a href="update.jsp?id=<%=rs.getInt("id") %>">수정</a>/<a href="delete.jsp?id=<%=rs.getInt("id") %>">삭제</a></td>
			</tr>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try{
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
			</table>
				<button onclick="location.href='addform.jsp'">작성</button>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>