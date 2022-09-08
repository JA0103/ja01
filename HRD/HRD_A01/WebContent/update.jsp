<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정폼</title>
<style>
	h2 {text-align:center;}
	h3 {text-align:center;}
	h4 {margin-left:10%; text-weight:400; font-size:20px}
	form {text-align:center}
	header, section, footer {border: 2px solid #333}
	section {margin:10px 0 10px 0 ; height:420px}
	table {text-align:center; border-collapse: collapse; width:80%; margin:0 auto; border:2px solid #333;  clear:both}
	table th, table td {border:1px solid #333}
	th {background-color:rgb(252,245,231); height:40px}
	.button {border:2px solid #333; background-color:#fff; padding:10px 20px 10px 20px; margin-right:10%; margin: 10px}
	select {text-align:left}
</style>
</head>
<body>
 <%@include file="header.jsp" %>
 <section>
 	<form action="updatePro.jsp">
<%
		int id = Integer.parseInt(request.getParameter("id"));
	 	Connection con = null; 	
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null;
		try{
			Class.forName("oracle.jdbc.OracleDriver");  
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			pstmt = con.prepareStatement(" select * from course_tbl where id = ?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){	
%> 
<h3>교과목 수정</h3>
 		<table>
 			<tbody>
 				<tr>
 					<th>교과목 코드</th>
 					<td><input type="text" name="id2" value="<%=rs.getInt("id") %>" size=100>
 						<input type="hidden" name="id" value="<%=rs.getInt("id") %>">
 					</td>
 				</tr>
 				<tr>
 					<th>과목명</th>
 					<td><input type="text" name="name" value="<%=rs.getString("name") %>" size=100></td>
 				</tr>
 				<tr>
 					<th>담당강사</th>
 					<td>
 						<input type="hidden" value="<%=rs.getString("lecturer") %>" id="rec">
 						<select name="lecturer">
							<option value="1" id="rec1">김교수</option>
							<option value="2" id="rec2">이교수</option>
							<option value="3" id="rec3">박교수</option>
							<option value="4" id="rec4">우교수</option>
							<option value="5" id="rec5">최교수</option>
							<option value="6" id="rec6">강교수</option>
							<option value="7" id="rec7">황교수</option>
 						</select>
 					</td>
 				</tr>
 				<tr>
 					<th>학점</th>
 					<td><input type="text" name="credit" value="<%=rs.getInt("credit") %>" size=100></td>
 				</tr>
 				<tr>
 					<th>요일</th>
 					<td>
 						<input type="hidden" value="<%=rs.getInt("week") %>" id="weeks">
 						<input type="radio" value="1" name="week" id="week1">월
 						<input type="radio" value="2" name="week" id="week2">화
 						<input type="radio" value="3" name="week" id="week3">수
 						<input type="radio" value="4" name="week" id="week4">목
 						<input type="radio" value="5" name="week" id="week5">금
 						<input type="radio" value="6" name="week" id="week6">토
 					</td>
 				</tr>
 				<tr>
 					<th>시작</th>
 					<td><input type="text" name="start_hour" value="<%=rs.getInt("start_hour") %>" size=100></td>
 				</tr>
 				<tr>
 					<th>종료</th>
 					<td><input type="text" name="end_end" value="<%=rs.getInt("end_end") %>" size=100></td>
 				</tr> 				
 			</tbody>
 		</table>
 			<input type="button" value="목록" onclick="location.href='index.jsp'" class="button">
 			<input type="button" value="취소" onclick="location.reload()" class="button"> 
 			<input type="submit" value="완료" class="button">
 	</form>
<%
			}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</section>
<script>
	var num = document.getElementById("rec").value;
	var week = document.getElementById("weeks").value;
	if(num == 1){
		document.getElementById("rec1").selected=true;
	} else if (num == 2 ){
		document.getElementById("rec2").selected=true;
	} else if (num == 3 ){
		document.getElementById("rec3").selected=true;
	} else if (num == 4 ){
		document.getElementById("rec4").selected=true;
	} else if (num == 5 ){
		document.getElementById("rec5").selected=true;
	} else if (num == 6 ){
		document.getElementById("rec6").selected=true;
	} else if (num == 7 ){
		document.getElementById("rec7").selected=true;
	}
	
	if(week == 1){
		document.getElementById("week1").checked=true;
	} else if (week == 2){
		document.getElementById("week2").checked=true;
	}else if (week == 3){
		document.getElementById("week3").checked=true;
	}else if (week == 4){
		document.getElementById("week4").checked=true;
	}else if (week == 5){
		document.getElementById("week5").checked=true;
	}else if (week == 6){
		document.getElementById("week6").checked=true;
	}
	
</script>
 <%@include file="footer.jsp" %>
</body>
</html>