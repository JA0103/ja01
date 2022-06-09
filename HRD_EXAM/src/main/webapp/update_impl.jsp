<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.shop.*"%>
    <jsp:useBean id="dao" class="com.it.shop.memberDAO"/>
    <jsp:useBean id="vo" class="com.it.shop.memberVO">
    	<jsp:setProperty property="*" name="vo"/>
    </jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	int result = dao.memberUpdate(vo);
	
	if(result==1){
%>
		<script>
			alert("데이터가 수정되었습니다.")
			location.href="list.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("데이터 수정 실패")
			history.back();
		</script>
<%
	}
%>