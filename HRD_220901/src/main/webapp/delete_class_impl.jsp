<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.ClassDAO"/>
<jsp:useBean id="vo" class="com.it.hrd.ClassVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	String class_seq = request.getParameter("class_seq");
	int rs = dao.deleteClass(class_seq);
	
	if(rs == 1){
%>
	<script>
		alert('삭제 되었습니다.');
		location.href='classList.jsp';
	</script>
<%
	}else{
%>
	<script>
		alert('삭제 실패했습니다.');
		location.href='classList.jsp';
	</script>
<%}%>