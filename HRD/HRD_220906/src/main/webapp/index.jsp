<%@page import="com.it.HRD.CourseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.HRD.CourseDAO"/>
<%-- <jsp:useBean id="vo" class="com.it.HRD.CourseVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>     --%>
<% List<CourseVO> list = dao.getList(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>
				총 <%=dao.getCourseCount()%>개의 교과목이 있습니다.
						<table border="1">
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
							<% for(CourseVO vo : list) {
								String week="";
								String time=Integer.toString(vo.getStart_hour());
								if(time.length() == 3)
									time = "0"+Integer.toString(vo.getStart_hour());
								%>
									<tr>
										<td><%=vo.getId() %></td>
										<td><%=vo.getName() %></td>
										<td><%=vo.getCredit() %></td>
										<td><%=vo.getLecturer() %></td>
								<%
								int weeks = vo.getWeek();
								switch(weeks){
									case 1 : week="월"; break;
									case 2 : week="화"; break;
									case 3 : week="수"; break;
									case 4 : week="목"; break;
									case 5 : week="금"; break;
									case 6 : week="토"; break;
								}
								%>										
										<td><%=week %></td>
										<td><%=time %></td>
										<td><%=vo.getEnd_end() %></td>
										<td><a href="update.jsp?id=<%=vo.getId()%>">수정</a>/<a href="delete_impl.jsp?id=<%=vo.getId()%>">삭제</a></td>
									</tr>
							<%} %>
					</table>
					<br>
					<button onclick="location.href='insert.jsp'">작성</button>
</section>

<%@include file="footer.jsp" %>
</body>
</html>