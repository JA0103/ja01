<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section>
	<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p class="h6"><a title="오이마켓 고객센터로" onclick="location.href='/center/center'">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<c:choose>
						<c:when test="${us_id != null }"><a title="공지사항 목록 첫페이지로" href='/center/notice?us_id=<c:out value="${us_id }"/>'>공지사항</a></c:when>
						<c:otherwise><a title="공지사항 목록 첫페이지로" href='/center/notice'>공지사항</a></c:otherwise>
					</c:choose></p>
				</div>
			</div>
		</div>
	</div>
	<div class="container center__body">
		<div class="row">
			<c:choose>
				<c:when test="${us_grade == 0 }">
					<div class="col-10"><p class="h2"><strong>공지사항</strong></p></div>
					<div class="col-2"><button class="btn btn-secondary center__button__top__right"><p>새 공지 등록</p></button></div>
				</c:when>
				<c:otherwise>
					<div class="col-12"><p class="h2"><strong>공지사항</strong></p></div>
				</c:otherwise>
			</c:choose>
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
				<c:forEach items="${listNotice }" var="notice" varStatus="status">
					<tr>
						<td class="text-center"><c:out value="${status.index + 1 }" /></td>
						<td style="padding-left: 15px;"><a href="#" style="text-decoration: none; color: black;"><c:out value="${notice.no_title }" /></a></td>
						<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.no_date }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<%@ include file="../includes/footer.jsp" %>