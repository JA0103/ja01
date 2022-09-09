<%@	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section>
	<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-1">
					<p class="h6"><strong>공지사항</strong></p>
				</div>
				<div class="col-11">
					<p class="h6"><a href="#" style="text-decoration: none; color: black;"><c:out value="${noticeCenter.no_title }" /></a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="container center__body">
		<div>
			<p class="h4"><strong>자주 하는 질문</strong></p>
			<p class="h6" style="padding: 10px 0 40px 0;">오이마켓의 이용자분들께 가장 많이 받은 질문을 통해 만들어진 도움말입니다.</p>
		</div>
		<table class="table table-bordered table-secondary table-hover">
			<thead>
				<tr>
					<th class="center__thead column__width__160" scope="col">조회수</th>
					<th class="center__thead" scope="col">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listCenter }" var="center">
					<tr>
						<td class="text-center"><c:out value="${center.no_readcount }" /></td>
						<td style="padding-left: 15px;"><a href="#" style="text-decoration: none; color: black;"><c:out value="${center.no_title }" /></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="padding-top: 10px;">
			<p class="h6 text-right"><a class="center__hyperlink" onclick="document.getElementById('goToFAQList').submit();">+더보기</a></p>
		</div>
	</div>
	<div class="container center__body">
		<c:choose>
			<c:when test="${us_grade == 0 }">
				<div>
					<p class="h4"><strong>관리자 메뉴</strong></p>
				</div>
				<div class="container" style="padding-top: 15px; padding-bottom: 40px;">
					<div class="row card-group">
						<div class="card mb-3 card__admin" onclick="">
							<div class="card__imgArea"><img src="/resources/assets/images/center_QnA.png" class="card-img" alt="Q&A"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">1:1 문의 내역 확인</h5></div>
						</div>
						<div class="card mb-3 card__admin" onclick="">
							<div class="card__imgArea"><img src="/resources/assets/images/center_suggest.png" class="card-img" alt="Suggest"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">오이마켓 건의함 확인</h5></div>
						</div>
						<div class="card mb-3 card__admin" onclick="">
							<div class="card__imgArea"><img src="/resources/assets/images/center_notice.png" class="card-img" alt="notice"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">새 공지 등록</h5></div>
						</div>
						<div class="card mb-3 card__admin" onclick="">
							<div class="card__imgArea"><img src="/resources/assets/images/center_FAQ.png" class="card-img" alt="FAQ"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">새 도움말 등록</h5></div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<p class="h4"><strong>고객의 소리</strong></p>
				</div>
				<div class="container" style="padding-top: 15px;">
					<div class="row">
						<div class="col-6">
							<div class="card mb-3" style="width: 540px; height: 210px; margin-left: -15px; cursor: pointer;">
								<div class="row no-gutters center-btn" data-oper="goQnAInsertBtn">
									<div class="col-md-4" style="padding: 30px 0 30px 30px;">
										<img src="/resources/assets/images/center_QnA.png" class="card-img" alt="Q&A">
									</div>
									<div class="col-md-8">
										<div class="card-body" style="padding: 30px;">
											<p class="h3 font-weight-bold card-title">1:1 문의하기</p>
											<p class="card-text">도움말로 문제를 해결하지 못하셨나요?<br>1:1 문의를 통해 회원님께서 얼마든지 질문을<br>
											 남겨주시면 저희 오이마켓이 맞춤 해결책을<br>제시해드리겠습니다.</p>
										</div>
									</div>
								</div>
							</div>
							
							<form role="form">
								<input type="hidden" name="us_id" value="<c:out value='${login.us_id}'/>">
								<input type="hidden" name="us_nickname" value="<c:out value='${login.us_nickname}'/>">
							</form>
							
							<div style="padding-top: 10px;" class="center-btn" data-oper="goQnABtn">
								<p class="h6 text-right"><a class="center__hyperlink" style="margin-right: 2px;">＞＞ 1:1 문의 내역 바로가기</a></p>
							</div>
						</div>
						<div class="col-6">
							<div class="card mb-3" style="width: 540px; height: 210px; cursor: pointer;">
								<div class="row no-gutters center-btn" data-oper="goSuggestInsertBtn">
									<div class="col-md-4" style="padding: 20px 0 20px 20px;">
										<img src="/resources/assets/images/center_suggest.png" class="card-img" alt="Suggest">
									</div>
									<div class="col-md-8">
										<div class="card-body" style="padding: 30px;">
											<p class="h3 font-weight-bold card-title">건의하기</p>
											<p class="card-text">오이마켓을 이용하면서 불편하신 점이나<br>개선해야 할 점이 있다고 느끼셨나요?<br>
											 건의하기를 통해 자유롭게 의견을 들려주시면<br>최대한 반영하여 발전하도록 노력하겠습니다.</p>
										</div>
									</div>
								</div>
							</div>
							<div style="padding: 10px 0 40px 0;" class="center-btn" data-oper="goSuggestBtn">
								<p class="h6 text-right"><a class="center__hyperlink" href="#" style="margin-right: -13px;">＞＞ 오이마켓 건의함 바로가기</a></p>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
</section>


<script type="text/javascript">

//폼 실행
$(document).ready(
	function() {
		
		$('.center-btn').on("click",function(e) {
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			var formObj = $("form");
			var us_IdTag = $("input[name='us_id']").val();
			var us_NicknameTag = $("input[name='us_nickname']").val();
			console.log(us_IdTag);
			
			
			if(us_IdTag === ''){
				alert('로그인이 필요한 서비스 입니다.');
				$(location).attr("href","/login");
			}else{
				if(operation === 'goQnAInsertBtn'){
					$(location).attr("href","/center/QnAInsert");
				}else if(operation === 'goSuggestInsertBtn'){
					$(location).attr("href","/center/suggestInsert");
				}else if(operation === 'goQnABtn'){
					formObj.attr("action","/center/QnA").attr("method","get");
					formObj.submit();
				}else if(operation === 'goSuggestBtn'){
					formObj.attr("action","/center/suggest").attr("method","get");
					formObj.submit();
				}
			
			}// else
				
			
		});//$('.card-body')


		
	});//

//뒤로가기가 감지되면 현재 페이지 새로고침
window.onpageshow = function(e) {
	if (e.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
		location.reload();
	}
}
		

</script>



<%@ include file="../includes/footer.jsp" %>