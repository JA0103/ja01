<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<form action="#"  method="post" name="frm">
		<input type="button" onclick="goPopup()" value="주소검색" class="btn btn-primary btn-xs btn-info">
		주소 : <input type="text" name="address" id="address" size="100px">
		
	</form>
<script language="javascript">

function goPopup(){
	var pop = window.open("./jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
}


function jusoCallBack(roadFullAddr){
		document.frm.address.value = roadFullAddr;
		
}

</script>	

</body>
</html>