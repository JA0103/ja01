<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="noticeInsert">
	<div class="center__header__bottom">
		<p class="h6"><a href="/center/center">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/notice">공지사항</a></p>
	</div>
	<div class="container center__insert__title">
		<div class="row"><div class="col-auto"><p class="h2"><strong>공지 등록</strong></p></div></div>
	</div>
	<form action="/center/noticeInsert" method="post">
	<div class="container">
		<div class="row form-group">
			<div class="col-md-auto center__insert__label"><p class="h4 font-weight-bold"><label for="ce_title">제목　</label></p></div>
			<div class="col-md-auto">
				<input type="text" name="ce_title" class="form-control center__insert__input" id="ce_title" placeholder="100자 이내로 입력해주세요.">
			</div>
		</div>
			<div class="center__insert__label">
				<p class="h4 font-weight-bold"><label for="ce_content">내용 입력</label>
				<small class="center__insert__textCount">0자/1000자</small></p>
			</div>
		<div class="col-md-auto form-group">
			<textarea name="ce_content" class="form-control center__insert__textarea" id="ce_content" placeholder="1000자 이내로 입력해주세요." rows="14" cols="100"></textarea>
		</div>
	</div>
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-auto">
				<div class="col-auto center__buttonarea center__admin__buttonarea">
					<button type="button" class="btn btn-danger" id="resetBtn">취소하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-success" id="submitBtn">등록하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary" onclick="location.href='/center/notice'">공지 사항 목록으로</button>
			  	</div>
			</div>
		</div>
	</div>
	<!-- 모달 시작 -->
		<div id="myModal" class="modal fade" role="dialog" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">!</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body text-center">
						<p>내용을 지우시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary modal-btn" id="modal-ok-btn">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 끝 -->
	</form>
</section>

<script>

$(document).ready(function(){
      
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
     
    //모달-----------------------안내창----------------------------  
      
      var modal = $("#myModal");
      
     $("#resetBtn").on("click",function(){
	    	   modal.find("p").text("내용을 취소 하시겠습니까?");
	           $('#modal-ok-btn').prop("type", "reset");
	           $("#myModal").modal("show");
	           $("#modal-ok-btn").on('click',function(){
	           $("#myModal").modal("hide");
         });
      });
     
     $("#submitBtn").on("click",function(){
	    	   modal.find("p").text("공지를 등록하시겠습니까?");
	    	   $('#modal-ok-btn').prop("type", "submit");
	           $("#myModal").modal("show");
	           $("#modal-ok-btn").on('click',function(){
	           $("#myModal").modal("hide");
         });
         
      });
 });






</script>

<%@ include file="../includes/footer.jsp" %>