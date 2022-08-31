<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.shop.memberDAO"/>    
<jsp:useBean id="vo" class="com.it.shop.memberVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>    
<% 
	request.setCharacterEncoding("utf-8");

	int result = dao.insert(vo);
	
	if(result == 1){
		
%>
	<script>
		alert("회원등록이 완료 되었습니다!");
		location.href="index.jsp";
	</script>
<%		
	}else{
%>
	<script>
		alert("회원등록에 실패 되었습니다!");
		location.href="insert.jsp";
	</script>
<%			
	}
%>