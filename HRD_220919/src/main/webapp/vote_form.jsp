<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/voteCheck.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>

	<h2>투표하기</h2>
	<br>
	
	<div id="table">
		<form action="vote_impl.jsp" method="get" name="frm">
			<table border="1" style="width: 500px; height: 200px;">
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin" style="float:left; margin-left:10px;"> 예 : 8906153154726 </td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name" style="float:left; margin-left:10px;" size="15"></td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td>
						<select name="m_no" style="float:left; margin-left:10px;">
							<option selected="selected"></option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time" style="float:left; margin-left:10px;" size="15"></td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area" style="float:left; margin-left:10px;" size="15"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<div style="float:left; margin-left:10px;">
							<input type="radio" name="v_confirm" value="Y">확인
							<input type="radio" name="v_confirm" value="N">미확인
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
							<input type="submit" value="투표하기" onclick='return voteCheck()'>
							<input type="reset" value="다시하기" onclick='resetBtn()'>
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<script type="text/javascript">
	function resetBtn(){
		alert('정보를 지우고 처음부터 다시 입력합니다!');
		frm.v_jumin.focus();
	}
</script>
<%@include file="footer.jsp" %>
</body>
</html>