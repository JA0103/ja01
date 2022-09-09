<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section class="section" id="QnA">
<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<p class="h6"><a href="/center/center?us_id=${login.us_id}">고객센터</a>
						>
					<a href="/center/QnA?us_id=${login.us_id}">1:1 문의내역</a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-left" style="padding-bottom: 16px;">
					<h4>${login.us_nickname}님의 1:1 문의 내역</h4>
				</div>
				<div class="text-left" style="padding-bottom: 45px;">
					<h6>${login.us_nickname}님이 1:1 문의하기를 통해 남겨주신 질문 내역입니다.</h6>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<c:choose>
					<c:when test="${fn:length(QnAList) > 0}">
						<table class="table table-hover">
							<thead>
							    <tr>
							      <th scope="col">등록일</th>
							      <th scope="col">제목</th>
							      <th scope="col">답변상태</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:forEach items="${QnAList}" var="QnA">
								    <tr>
								      <th scope="row">
								      	<fmt:formatDate value="${QnA.ce_date}" pattern="yyyy-MM-dd"/>
								      </th>
								      <td><c:out value="${QnA.ce_title}"/></td>
								      <td><c:out value="${QnA.ce_status}"/></td>
								    </tr>
							  	</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<div class="text-left" style="padding-bottom: 16px;">
							<h4>문의 내역이 없습니다.</h4>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	
	
</section>

<%@ include file="../includes/footer.jsp" %>