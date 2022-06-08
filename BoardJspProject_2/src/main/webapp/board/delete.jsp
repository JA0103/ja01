<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String no = request.getParameter("no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:960px;
	}
	h1{
		text_align:center;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ 
	$('#delBtn').click(function(){
		let pwd=$('#pwd').val();
		if(pwd.trim()=="") // 비밀번호 입력값 확인 
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'delete_impl.jsp',
			data:{"no":$('#no').val(),"pwd":pwd},
			success:function(res)
			{
				let r=res.trim();
				if(r==0)
				{
					alert("비밀번호가 틀립니다.");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					alert("데이터가 삭제되었습니다.")
					location.href="list.jsp";
				}
			}
		})
	})
	
	
})
</script>
</script>
</head>
<body>
	<div class="container">
		<h1>삭제하기</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
					비밀번호 : <input type="password" name="pwd" size="15" class="input-sm" id="pwd">
					<input type="hidden" name="no" value="<%=no%>" id="no">
					</td>
				</tr>
				<tr>
					<td class="text-center">
					<input type="button" value="삭제" class="btn btn-sm btn-success" id="delBtn">
					<input type="button" value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
					</td>
			</table>
		</div>	
	</div>
</body>
</html>