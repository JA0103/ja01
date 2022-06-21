<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<h1>글쓰기</h1>
		<div class="rorw">
			<form action="insert_impl.jsp" method="get">
				<table class="table">
					<tr>
						<th class="text-right" width=15%>이름</th>
						<td><input type="text" name="name" size="15" class="input-sm"></td>
					</tr>
					<tr>
						<th class="text-right" width=15%>제목</th>
						<td><input type="text" name="subject" size="55" class="input-sm"></td>
					</tr>
					<tr>
						<th class="text-right" width=15%>내용</th>
						<td><textarea cols="60" rows="10" name="content"></textarea></td>
					</tr>
					<tr>
						<th class="text-right" width=15%>비밀번호</th>
						<td><input type="password" name="pwd" size="15" class="input-sm"></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="확인" class="btn btn-sm btn-primary">
							<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>