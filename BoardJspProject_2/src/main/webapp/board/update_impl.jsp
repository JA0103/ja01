<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.dao.*"%>
<jsp:useBean id="dao" class="com.it.dao.BoardDAO"></jsp:useBean>
<jsp:useBean id="vo" class="com.it.dao.BoardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>



<%
	boolean chk = dao.boardUpdate(vo);
	
	if(chk==true){
%>
		<script>
			alert("수정되었습니다.")
			location.href="list.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("비밀번호가 맞지 않습니다.")
			history.back();
		</script>
<%		
	}
	
%>