<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.HRD.CourseDAO"/>
<jsp:useBean id="vo" class="com.it.HRD.CourseVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>        
<%
	int rs = dao.insertCourse(vo);
	
	if(rs == 1){
%>
<script>
	alert("교과목이 추가 되었습니다.");
	location.href='index.jsp';
</script>
<%
	}
%>
<%
	if(rs == 0){
%>
<script>
	alert("교과목 추가 실패");
	location.href='insert.jsp';
</script>
<%
	}
%>