<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의하기</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section class="section" id="QnA_insert" style="padding-top: 57px;">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-left" style="padding-bottom: 45px;">
					<h3>건의하기</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
			 <div class="form-group row">
			    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">제목</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control form-control-sm" id="colFormLabelSm" placeholder="10자 이내로 입력해주세요.">
			    </div>
			    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">내용 입력</label>
			    <div class="col-sm-10">
				    <div class="textarea_content">
				      <textarea class="form-control" id="colFormLabelSm" placeholder="1000자 이내로 입력해주세요." rows="10" cols="100"></textarea>
				    </div>
			    </div>
			    <label for="colFormLabelLg" class="col-sm-4 col-form-label col-form-label-lg">이미지 파일 첨부</label>
			    <label class="input-file-button" for="input-file">
				  첨부파일 업로드 영역
				</label>
				<input type="file" id="input-file" style="display:none"/> <!--  기존의 input file 태그 숨김 -->
			  	
			  	<br><br>
			  	<div class="buttons">
			  	<button type="button" class="btn btn-danger" style="color:">취소하기</button>&nbsp;
			  	<button type="button" class="btn btn-success" >등록하기</button>&nbsp;
			  	<button type="button" class="btn btn-secondary">오이마켓 건의함으로</button>
			  	</div>
			  </div>
			</div>
		</div>
	</div>
	
	
	
	
</section>

<%@ include file="../includes/footer.jsp" %>