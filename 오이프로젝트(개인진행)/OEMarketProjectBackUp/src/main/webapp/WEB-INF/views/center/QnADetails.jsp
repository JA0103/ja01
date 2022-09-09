<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="QnA">
<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<p class="h6"><a href="/center/center?us_id=${login.us_id}">고객센터</a>
						>
					<a href="/center/QnA?us_id=${login.us_id}">1:1 문의내역</a>
						> 문의 글</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container center__body">
		<div class="row">
			<div class="col-2">
				<p class="h4"><strong>제목</strong></p>
			</div>
			<div class="col-10">
				<p class="h4">| &emsp; ${QnA.ce_title}</p>
			</div>
		</div>
		<div class="row" style="margin-top: 15px;">
			<div class="col-2">
				<p class="h4"><strong>이메일</strong></p>
			</div>
			<div class="col-10">
				<p class="h4">| &emsp; ${QnA.ce_email}</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-4">
				<div class="read-image">
						<i class="fa-solid fa-clock"></i>등록일
					<fmt:formatDate value="${QnA.ce_date}" pattern="yyyy-MM-dd"/>
				</div>
			</div>
		</div>
	</div>		
	
	
	
	
</section>

<%@ include file="../includes/footer.jsp" %>