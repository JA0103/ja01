<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="QnADetails">
	<div class="center__header__bottom">
		<p class="h6"><c:choose><c:when test="${us_id != null }"><a href='/center/center?us_id=<c:out value="${us_id }"/>'
		>고객센터</a></c:when><c:otherwise><a href='/center/center'>고객센터</a></c:otherwise></c:choose
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href='/center/QnAInsert'>1:1 문의하기</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href='/center/QnA?us_id=${login.us_id}'>1:1 문의 내역</a></p>
	</div>
	<div class="container center__body">
		<div class="row">
			<div class="col-md-auto"><p class="h4"><strong>제목　</strong></p></div>
			<div class="col-md-auto"><p class="h4">| &emsp; ${QnA.ce_title}</p></div>
		</div>
		<div class="row" style="margin-top: 15px">
			<div class="col-md-auto"><p class="h4"><strong>이메일</strong></p></div>
			<div class="col-md-auto"><p class="h4">| &emsp; ${QnA.ce_email}</p></div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="margin: 50px 0 -25px 0;">
			<div class="col-md-auto">
				<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
				<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
				<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/></svg>&nbsp;등록일&nbsp;:&nbsp;
				<fmt:formatDate value="${QnA.ce_date}" pattern="yyyy-MM-dd"/></p>
			</div>
			<div class="col-md-auto">
				<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
				<path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z"/>
				</svg>&nbsp;상태&nbsp;:&nbsp;<c:out value="${QnA.ce_status }" /></p>
			</div>
		</div>
		<hr class="center__hr">
		<div class="center__details__content">
			<div>
				<c:out value="${QnA.ce_content }" />
			</div>
			<div>
				<img src="#여기에 업로드한 이미지 경로 표시" alt="<c:out value="${QnA.ce_num }"/>">
			</div>
		</div>
		<hr class="center__hr">
	</div>
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-auto center__buttonarea center__details__goToList">
				<button type="button" class="btn btn-secondary" id="goQnA_Btn" onclick="location.href='/center/QnA?us_id=${login.us_id}'">1:1 문의 내역으로</button>
				<button type="button" class="btn btn-secondary" id="goQnAAdmin_Btn" onclick="location.href='/center/QnA_admin">1:1 문의 내역으로</button>
				<button type="button" class="btn btn-secondary" id="goQnAOk_Btn">답변 완료 처리</button>
				<input type="hidden" name="us_id" value="${login.us_id }">
				<input type="hidden" name="us_grade" value="${login.us_grade }">
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">

//폼 실행
$(document).ready(
	function() {
		//========================================================
		//로그인 풀린채로 넘어갔을 때 로그인창으로 넘어가게
			var Id = $("input[name='us_id']").val();
			console.log(Id);
			if(Id === ''){
				alert('재로그인 후 이용바랍니다.');
				$(location).attr("href","/login");
			}
		//========================================================
		
		// 회원등급 체크 후 버튼 바꾸기 ====================
		var grade_chk = $("input[name=us_grade]").val();
		console.log(id_chk);
		if(grade_chk === '0'){//관리자
			$("#goQnA_Btn").hide();
		}else{
			$("#goQnAAdmin_Btn").hide();
			$("#goQnAOk_Btn").hide();
		}
		
		
		
	});//
	
	

//뒤로가기가 감지되면 현재 페이지 새로고침
window.onpageshow = function(e) {
	if (e.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
		location.reload();
	}
}



</script>


<%@ include file="../includes/footer.jsp" %>