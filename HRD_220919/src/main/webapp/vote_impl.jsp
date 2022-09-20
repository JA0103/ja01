<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.VoteDAO"/>
<jsp:useBean id="vo" class="com.it.hrd.VoteVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	int result = dao.insertVote(vo);

	if(result == 1){
%>
<script>
	alert('투표하기 정보가 정상적으로 등록 되었습니다!');
	location.href='index.jsp';
</script>
<%
	}
%>
<%
	if(result == 0){
%>
<script>
	alert('투표하기 정보 등록에 실패하였습니다!');
	location.href='vote_form.jsp';
</script>
<%
	}
%>