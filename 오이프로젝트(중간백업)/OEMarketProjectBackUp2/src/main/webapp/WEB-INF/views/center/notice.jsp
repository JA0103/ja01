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
		<p class="h6"><c:choose>
			<c:when test="${us_id != null }"><a href='/center/center?us_id=<c:out value="${us_id }"/>'>고객센터</a></c:when>
			<c:otherwise><a href='/center/center'>고객센터</a></c:otherwise>
			</c:choose>&nbsp;&nbsp;＞&nbsp;&nbsp;<c:choose>
			<c:when test="${us_id != null }"><a href='/center/notice?us_id=<c:out value="${us_id }"/>'>공지사항</a></c:when>
			<c:otherwise><a href='/center/notice'>공지사항</a></c:otherwise>
		</c:choose></p>
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
						<td class="center__table__widecolumn"><c:choose>
						<c:when test="${us_id != null }"><a href='/center/FAQDetails?us_id=<c:out value="${us_id }"/>&no_num=<c:out value="${notice.no_num }"/>'
						><c:out value="${notice.no_title }" /></a></c:when>
						<c:otherwise><a href='/center/FAQDetails?no_num=<c:out value="${notice.no_num }"/>'
						><c:out value="${notice.no_title }" /></a></c:otherwise></c:choose></td>
						<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.no_date }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<%@ include file="../includes/footer.jsp" %>