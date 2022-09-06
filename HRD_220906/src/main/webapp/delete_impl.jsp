<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.HRD.CourseDAO"/>
<jsp:useBean id="vo" class="com.it.HRD.CourseVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>        
<%
	String id= request.getParameter("id");
	int rs = dao.deleteCourse(id);
	
	if(rs == 1){
%>
<script>
	alert("교과목이 삭제 되었습니다.");
	location.href='index.jsp';
</script>
<%
	}
%>
<%
	if(rs == 0){
%>
<script>
	alert("교과목 삭제 실패");
	location.href='index.jsp';
</script>
<%
	}
%>