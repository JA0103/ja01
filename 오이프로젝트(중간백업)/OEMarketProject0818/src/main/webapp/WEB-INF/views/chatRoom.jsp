<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="includes/header.jsp" %>
	<div align="center">
	
	<h1>채팅 목록</h1>
		<table>
			<tr>
				<th>프로필 이미지</th>
				<th>Room Name</th>
			</tr>
			<c:forEach items="${room }" var="room">
			<tr>
				<td>이미지 들어갈거다</td>
				<td><c:out value="${room.cr_roomName}"/></td>
				<td><button type="submit" id="roomJoin_btn">참여</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<script>
      $(document).ready(function(){
  		
  		var formObj = $("form");
  		
  		$('button').on("click",function(e){
  			e.preventDefault();
  			
  			var operation = $(this).data('oper');
  			console.log(operation);
  			
  			if(operation === 'sellBoard_btn'){
  				formObj.attr("action","/mypage/sellBoard").attr("method","get");
  				var myIdTag = $("input[name='my_id']").clone();
  				formObj.empty();
  				formObj.append(myIdTag);
  			}
	</script> 
<%@ include file="includes/footer.jsp"%>
</body>
</html>