<%@page import="com.it.HRD.CourseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.HRD.CourseDAO"/>
<% List<CourseVO> list = dao.getLecturer(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
				<h3>교과목 추가</h3>
				<form action="insert_impl.jsp" method="get">
					<table border="1">
						<tr>
							<td>교과목 코드</td>					
							<td><input type="text" name="id"></td>					
						</tr>
						<tr>
							<td>과목명</td>					
							<td><input type="text" name="name"></td>					
						</tr>
						<tr>
							<td>담당강사</td>					
							<td><select style="float: left;" name="lecturer">
							<option selected>담당강사선택</option>
							<%for(CourseVO vo : list){ %>
								<option value=<%=vo.getIdx()%>><%=vo.getName()%></option>
							<%} %>
							</select> </td>					
						</tr>
						<tr>
							<td>교과목 학점</td>					
							<td><input type="text" name="credit"></td>					
						</tr>
						<tr>
							<td>요일</td>					
							<td>
								<input type="radio" name="week" value="1">월
								<input type="radio" name="week" value="2">화
								<input type="radio" name="week" value="3">수
								<input type="radio" name="week" value="4">목
								<input type="radio" name="week" value="5">금
								<input type="radio" name="week" value="6">토
							</td>					
						</tr>
						<tr>
							<td>시작</td>					
							<td><input type="text" name="start_hour"></td>					
						</tr>
						<tr>
							<td>종료</td>					
							<td><input type="text" name="end_end"></td>					
						</tr>
					</table>
					<br>
					<div class="button" style="text-align: center;">
						<input type="button" onclick="location.href='index.jsp'" value="목록">
						<input type="submit" value="완료">
					</div>
					</form>
</section>

<%@include file="footer.jsp" %>
</body>
</html>