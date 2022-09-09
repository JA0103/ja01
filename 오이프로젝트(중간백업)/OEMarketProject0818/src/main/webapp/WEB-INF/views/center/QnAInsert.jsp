<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의하기</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section class="section" id="QnA_insert">
<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<p class="h6"><a href="/center/center?us_id=${login.us_id}">고객센터</a>
						>
					<a href="/center/QnAInsert?us_id=${login.us_id}">1:1 문의하기</a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-left" style="padding-bottom: 45px;">
					<h3>1:1 문의하기</h3>
				</div>
			</div>
		</div>
	</div>
<form action="/center/QnAInsert" method="post" enctype="multipart/form-data">
	
	<div class="container">
		<div class="row">
			<div class="col-12">
			 <div class="form-group row">
			 	<input type="hidden" name="ce_id" value="${login.us_id}">
			 	<input type="hidden" name="ce_nickname" value="${login.us_nickname}">
			 	<input type="hidden" name="ce_category" value="QNA">
			 	<input type="hidden" name="ce_status" value="답변 대기중">
				    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">제목</label>
				    <div class="col-sm-10">
				      <input type="text" name="ce_title" class="form-control form-control-sm" id="colFormLabelSm" placeholder="10자 이내로 입력해주세요.">
				    </div>
				    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">이메일</label>
				    <div class="col-sm-10">
				      <input type="text" name="ce_email" class="form-control form-control-sm" id="colFormLabelSm" placeholder="답변 받을 이메일 주소를 정확하게 입력해주세요.">
				    </div>
				    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">내용 입력</label>
				    <div class="col-sm-10">
					    <div class="textarea_content">
					      <textarea name="ce_content" class="form-control" id="colFormLabelSm" placeholder="1000자 이내로 입력해주세요." rows="10" cols="100"></textarea>
					    </div>
				    </div>
				    
				  	<br><br>
			  </div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
	 				<div class="form-group filebox preview-image">
                        <input class="upload-name" value="이미지 파일 첨부" disabled="disabled" style="width: 250px;">
					    <label class="input-file-button" for="input-file"><img src="/resources/assets/images/paper-clip.png"></label>
						<input type="file" name="ce_filename" id="input-file" class="upload-hidden"/>
				    </div>
				 </div>
			</div>
		</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
			  	<div class="QnA_buttons">
				  	<button type="button" class="btn btn-danger" id="resetBtn" style="color:">취소하기</button>&nbsp;
				  	<button type="button" class="btn btn-success" id="submitBtn">등록하기</button>&nbsp;
				  	<button type="button" class="btn btn-secondary">1:1 문의 내역으로</button>
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
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
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

<script type="text/javascript">

//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}

	   $(document).ready(function(){
		      var fileTarget = $('.filebox .upload-hidden');
		   
		       fileTarget.on('change', function(){
		           if(window.FileReader){
		               // 파일명 추출
		               var filename = $(this)[0].files[0].name;
		           } 
		   
		           else {
		               // Old IE 파일명 추출
		               var filename = $(this).val().split('/').pop().split('\\').pop();
		           };
		   
		           $(this).siblings('.upload-name').val(filename);
		       });
		   
		       //preview image 
		       var imgTarget = $('.preview-image .upload-hidden');
		   
		       imgTarget.on('change', function(){
		           var parent = $(this).parent();
		           parent.children('.upload-display').remove();
		   
		           if(window.FileReader){
		               //image 파일만
		               if (!$(this)[0].files[0].type.match(/image\//)) return;
		               
		               var reader = new FileReader();
		               reader.onload = function(e){
		                   var src = e.target.result;
		                   parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
		               }
		               reader.readAsDataURL($(this)[0].files[0]);
		           }
		   
		           else {
		               $(this)[0].select();
		               $(this)[0].blur();
		               var imgSrc = document.selection.createRange().text;
		               parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
		   
		               var img = $(this).siblings('.upload-display').find('img');
		               img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
		           }
		       });
		       
		        
		      //모달-----------------------안내창----------------------------  
		        
		        var modal = $("#myModal");
		        
		       $("#resetBtn").on("click",function(){
			    	   modal.find("p").text("내용을 지우시겠습니까?");
			           $('#modal-ok-btn').prop("type", "reset");
			           $("#myModal").modal("show");
			           $("#modal-ok-btn").on('click',function(){
			           $("#myModal").modal("hide");
		           });
		        });
		       
		       $("#submitBtn").on("click",function(){
			    	   modal.find("p").text("등록 후 수정 및 삭제가 불가능합니다.");
			    	   $('#modal-ok-btn').prop("type", "submit");
			           $("#myModal").modal("show");
			           $("#modal-ok-btn").on('click',function(){
			           $("#myModal").modal("hide");
		           });
		           
		        });
		   });


</script>


<%@ include file="../includes/footer.jsp" %>