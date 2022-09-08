<%@page import="com.it.HRD.CourseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.HRD.CourseDAO"/>
<% 
	String id = request.getParameter("id");
	CourseVO vo = dao.getOneCourse(id); 
	List<CourseVO> list = dao.getLecturer();
/* 	String start_hour = String.valueOf(vo.getStart_hour());
	String end_hour = String.valueOf(vo.getEnd_end());
	if(start_hour.length() == 3)
		start_hour = "0"+String.valueOf(vo.getStart_hour());
	if(end_hour.length() == 3)
		end_hour = "0"+String.valueOf(vo.getEnd_end()); */
	int start = vo.getStart_hour();
    String start_hour = String.format("%04d", start);
	int end = vo.getEnd_end();
    String end_hour = String.format("%04d", end);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
				<h3>교과목 수정</h3>
				<form action="update_impl.jsp" method="get">
					<table border="1">
						<tr>
							<td>교과목 코드</td>					
							<td><input type="text" name="id" value=<%=vo.getId()%> readonly="readonly"></td>					
						</tr>
						<tr>
							<td>과목명</td>					
							<td><input type="text" name="name" value="<%=vo.getName()%>"></td>					
						</tr>
						<tr>
							<td>담당강사</td>					
							
							<td><select style="float: left;" name="lecturer">
							<option>담당강사선택</option>
							<%for(CourseVO Lvo : list){ %>
							<%
								String selected ="";
							%>
								<option 
							<%if(vo.getLecturer().equals(String.valueOf(Lvo.getIdx()))) selected="selected"; %>
								<%=selected%> value=<%=Lvo.getIdx()%>><%=Lvo.getName()%></option>
							<%} %>
							</select> </td>					
						</tr>
						<tr>
							<td>교과목 학점</td>					
							<td><input type="text" name="credit" value=<%=vo.getCredit()%>></td>					
						</tr>
						<tr>
							<td>요일</td>	
							<%String checked="";%>				
							<td>
								<input type="radio" name="week" value="1" 
									<%if(vo.getWeek() == 1) checked="checked"; %><%=checked%><%if(checked.equals("checked")) checked=""; %>
								>월
								<input type="radio" name="week" value="2" 
									<%if(vo.getWeek() == 2) checked="checked"; %><%=checked%><%if(checked.equals("checked")) checked=""; %>
								>화
								<input type="radio" name="week" value="3" 
									<%if(vo.getWeek() == 3) checked="checked"; %><%=checked%><%if(checked.equals("checked")) checked=""; %>
								>수
								<input type="radio" name="week" value="4" 
									<%if(vo.getWeek() == 4) checked="checked"; %><%=checked%><%if(checked.equals("checked")) checked=""; %>
								>목
								<input type="radio" name="week" value="5" 
									<%if(vo.getWeek() == 5) checked="checked"; %><%=checked%><%if(checked.equals("checked")) checked=""; %>
								>금
								<input type="radio" name="week" value="6" 
									<%if(vo.getWeek() == 6) checked="checked"; %><%=checked%><%if(checked.equals("checked")) checked=""; %>
								>토
							</td>					
						</tr>
						<tr>
							<td>시작</td>					
							<td><input type="text" name="start_hour" value=<%=start_hour%>></td>					
						</tr>
						<tr>
							<td>종료</td>					
							<td><input type="text" name="end_end" value=<%=end_hour%>></td>					
						</tr>
					</table>
					<div id="button">
						<input type="button" onclick="location.href='index.jsp'" value="목록">
						<input type="reset" value="취소">
						<input type="submit" value="완료">
					</div>
					</form>
</section>

<%@include file="footer.jsp" %>
</body>
</html>