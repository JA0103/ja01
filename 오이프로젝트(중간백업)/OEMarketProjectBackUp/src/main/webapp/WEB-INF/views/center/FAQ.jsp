<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 하는 질문</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section>
	<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p class="h6"><a title="오이마켓 고객센터로" onclick="location.href='/center/center'">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<c:choose>
						<c:when test="${us_id != null }"><a title="자주 하는 질문 첫페이지로" href='/center/FAQ?us_id=<c:out value="${us_id }"/>&keyword='>자주 하는 질문</a></c:when>
						<c:otherwise><a title="자주 하는 질문 첫페이지로" href='/center/FAQ?keyword='>자주 하는 질문</a></c:otherwise>
					</c:choose></p>
				</div>
			</div>
		</div>
	</div>
	<div class="container center__body">
		<div class="row">
			<div class="col-8"><p class="h2"><strong>자주 하는 질문</strong></p></div>
			<div class="col-3">
				<select class="form-control center__select__form">
					<option selected>최신 등록 순</option>
					<option>조회수 순</option>
				</select>
			</div>
			<div class="col-1"><p class="h4 text-right center__select__text">으로 보기</p></div>
		</div>
	</div>
	<div class="container center__body center__table">
		<table class="table table-bordered table-secondary table-hover">
			<thead>
				<tr>
					<th class="center__thead column__width__80" scope="col">No.</th>
					<th class="center__thead" scope="col">제목</th>
					<th class="center__thead column__width__160" scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listFAQ }" var="faq" varStatus="status">
					<tr>
						<td class="text-center"><c:out value="${status.index + 1 }" /></td>
						<td style="padding-left: 15px;"><a href="#" style="text-decoration: none; color: black;"><c:out value="${faq.no_title }" /></a></td>
						<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${faq.no_date }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pagination justify-content-center">
					<ul>
						<c:if test="${pageMaker.prev }">
							<li class="frm paginate_button previous"><a href="${pageMaker.startPage-1 }">
							<i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
								<a href="${num }">${num }</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="frm paginate_button next"><a href="${pageMaker.endPage+1 }">
								<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<form role="form" id="pagingForm">
	<c:if test="${us_id != null }"><input type="hidden" id="faq_us_id" name="us_id" value='<c:out value="${us_id }" />'></c:if>
	<c:if test="${pageMaker.cri.pageNum != null }"><input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'></c:if>
	<c:if test="${pageMaker.cri.amount != null }"><input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'></c:if>
</form>

<script>
//페이징 폼
$(document).ready(function() {
	var formObj = $("#pagingForm");

	$(".paginate_button a").on("click",function(e) {
		e.preventDefault();

		formObj.attr("action", "/center/FAQ").attr("method", "get");
		var my_IdTag = $("input[id='faq_us_id']").clone();
		var pageNumTag = formObj.find("input[name='pageNum']").val($(this).attr("href"));
		formObj.empty();
		formObj.append(my_IdTag);
		formObj.append(pageNumTag);

		formObj.submit();
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>