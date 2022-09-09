<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>찜 목록</title>
<meta charset="UTF-8">
</head>
<%@ include file="../includes/header.jsp" %>
<section class="section" id="board_list" style="padding-top: 150px;">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-center" style="padding-bottom: 45px;">
					<h1><strong>찜 목록</strong></h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${fn:length(heartList) > 0 }">
					<c:forEach items="${heartList}" var="heart" varStatus="status">
						<form action="/mypage/removeHeart" method="post" id="removingForm">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="he_bo_num" value='<c:out value="${heartList[status.index].he_bo_num}" />'>
							<input type="hidden" name="he_id" value='<c:out value="${heartList[status.index].he_id}" />'>
							<div class="col-lg-4">
								<div class="item" style="width:350px;">
									<div class="thumb">
										<div class="hover-content">
											<ul>
												<li><a href="#번호 넘겨서 세부 페이지 받는" title="상품 상세보기"><i class="fa fa-eye"></i></a></li>
												<li><button title="찜 취소하기" onclick="removeChk()"
													 style="border:0; background-color:rgba(0,0,0,0);" ><i class="fa fa-heart"></i></button></li>
												<li><a href="#번호 넘겨서 세부 페이지 받는" title="구매하기"><i class="fa fa-shopping-cart" ></i></a></li>
				 							</ul>
										</div>
										<img src="<spring:url value='/img/${heart.mvo.bo_image }'/>" width="250" height="250">
									</div>
									<div class="down-content">
										<p class="h4"><strong><c:out value="${heart.mvo.bo_title}"/></strong></p>
										<p class="h5 text-muted"><c:out value="${heart.mvo.bo_price}"/>&nbsp;원</p>
										<p class="h6 text-muted"><strong><c:out value="${heart.mvo.bo_address1}"
										/>&nbsp;<c:out value="${heart.mvo.bo_address2}"/></strong></p>
										<br><br><br>
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="container" style="padding: 120px 0 120px 0;">
						<div class="row justify-content-md-center">
							<div class="col-md-auto">
								<p class="h3 text-center">찜한 상품이 존재하지 않습니다.</p>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="pagination justify-content-center">
			<form action="/mypage/heartBoard" method="get" id="pagingForm">
				<ul>
					<c:if test="${pageMaker.prev }">
						<li><a href='/mypage/heartBoard?my_id=<c:out value="${heartList[0].he_id}"/>&pageNum=<c:out value="${pageMaker.startPage-1 }"
						/>'>&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li ${pageMaker.cri.pageNum == num ? ' class="active"' : ' ' }>
						<a href='/mypage/heartBoard?my_id=<c:out value="${heartList[0].he_id}"/>&pageNum=<c:out value="${num }"
						/>'><c:out value="${num }"/></a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li><a href='/mypage/heartBoard?my_id=<c:out value="${heartList[0].he_id}"/>&pageNum=<c:out value="${pageMaker.endPage+1}"
						/>'>&gt;</a></li>
					</c:if>
				</ul>
			</form>
		</div>
	</div>
</section>

<script type="text/javascript">
   function removeChk() {
      if (!confirm("해당 상품을 찜 목록에서 삭제하시겠습니까?")) {
         return;
      } else {
         alert("찜 목록에서 삭제되었습니다.");
         document.getElementById('removingForm').submit();
         document.getElementById('pagingForm').submit();
      }
   }
</script>

<%@ include file="../includes/footer.jsp" %>