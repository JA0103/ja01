<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성폼</title>
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
 	<form action="addformPro.jsp">
 	<h3>교과목 추가</h3>
	 		<table>	 				
	 		<tbody>
	 				<tr>
	 					<th>교과목 코드</th>
	 					<td><input type="text" name="id" size="100"></td>
	 				</tr>
	 				<tr>
	 					<th>과목명</th>
	 					<td><input type="text" name="name" size="100"></td>
	 				</tr>
	 				<tr>
	 					<th>담당강사</th>
	 					<td>
	 						<select name="lecturer">
	 							<option>담당강사선택</option>
	 <%
	 	Connection con = null; 	
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null;
		try{
				Class.forName("oracle.jdbc.OracleDriver");  
				con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				pstmt = con.prepareStatement(" select name from lecturer_tbl");
				rs = pstmt.executeQuery();
				int num = 1;
				while(rs.next()){			
	%>
								<option value="<%=num%>"><%=rs.getString("name") %></option>
	<%
				num+=1;
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
	 						</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<th>학점</th>
	 					<td><input type="text" name="credit" size="100"></td>
	 				</tr>
	 				<tr>
	 					<th>요일</th>
	 					<td>
	 						<input type="radio" value="1" name="week">월
	 						<input type="radio" value="2" name="week">화
	 						<input type="radio" value="3" name="week">수
	 						<input type="radio" value="4" name="week">목
	 						<input type="radio" value="5" name="week">금
	 						<input type="radio" value="6" name="week">토
	 					</td>
	 				</tr>
	 				<tr>
	 					<th>시작</th>
	 					<td><input type="text" name="start_hour" size="100"></td>
	 				</tr>
	 				<tr>
	 					<th>종료</th>
	 					<td><input type="text" name="end_end" size="100"></td>
	 				</tr> 				
	 			</tbody>
	 		</table>
	 			<input type="button" value="목록" onclick="location.href='index.jsp'" class="button">
	 			<input type="submit" value="완료" class="button">
	 	</form>
	 </section>
 <%@include file="footer.jsp" %>
</body>
</html>