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
					<p class="h6"><a title="오이마켓 고객센터로" onclick="document.getElementById('goToCenterMain').submit();"
					>고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<a title="자주 하는 질문 첫페이지로" onclick="document.getElementById('goToFAQList').submit();"
					>자주 하는 질문</a></p>
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
</section>

<%@ include file="../includes/footer.jsp" %>