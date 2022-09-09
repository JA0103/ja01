<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="noticeUpdate">
	<form action="/center/noticeUpdate" method="post">
		<input type="hidden" name="no_num" value="${notice.no_num }">
		<input type="hidden" name="no_title" value="${notice.no_title }">
		<input type="hidden" name="no_content" value="${notice.no_content }">
		<div class="center__header__bottom">
			<p class="h6"><a href="/center/center">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/notice">공지사항</a></p>
		</div>
		<div class="container center__insert__title">
			<div class="row"><div class="col-auto"><p class="h2"><strong>공지 수정</strong></p></div></div>
		</div>
		<div class="container">
			<div class="row form-group">
				<div class="col-md-auto center__insert__label"><p class="h4 font-weight-bold"><label for="no_title">제목　</label></p></div>
				<div class="col-md-auto">
					<input type="text" name="no_title" class="form-control center__insert__input" id="no_title" placeholder="100자 이내로 입력해주세요.">
				</div>
			</div>
				<div class="center__insert__label">
					<p class="h4 font-weight-bold"><label for="no_content">내용 입력</label>
					<small class="center__insert__textCount">0자/1000자</small></p>
				</div>
			<div class="col-md-auto form-group">
				<textarea name="no_content" class="form-control center__insert__textarea" id="no_content" placeholder="1000자 이내로 입력해주세요." rows="14" cols="100"></textarea>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-end">
				<div class="col-auto">
					<div class="col-auto center__buttonarea center__admin__buttonarea">
						<button type="button" class="btn btn-danger" id="resetBtn">취소하기</button>&nbsp;&nbsp;
						<button type="submit" class="btn btn-success" id="submitBtn">수정 완료하기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary" onclick="location.href='/center/suggest'">공지 사항 목록으로</button>
				  	</div>
				</div>
			</div>
		</div>
	</form>
</section>

<script>
//내용 입력 영역 글자수 체크
$('.center__insert__textarea').keyup(function (e) {
	let content = $(this).val();
	
	if (content.length == 0 || content == '') {
		$('.center__insert__textCount').text('0' + '자/1000자');
	}else{
		$('.center__insert__textCount').text(content.length + '자/1000자');
	}
	if (content.length > 1000) {
		$(this).val($(this).val().substring(0, 1000));
		alert('내용은 최대 1000자까지 입력 가능합니다.');
	};
});
</script>

<%@ include file="../includes/footer.jsp" %>