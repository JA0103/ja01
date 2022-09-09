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
<section class="section">
<div class="center__header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<p class="h6"><a href="/center/center?us_id=${login.us_id}">고객센터</a>
						>
					<a href="/center/SuggestInsert">건의하기</a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-left" style="padding-bottom: 16px;">
					<h4>오이마켓 건의함</h4>
				</div>
				<div class="text-left" style="padding-bottom: 45px;">
					<h6>오이마켓의 이용자분들께서 남겨주신 소중한 의견들입니다.</h6>
				</div>
			</div>
		</div>
	</div>
	
	<form id="suggest_form">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="us_id" value="${login.us_id}">
		<%
			String category = request.getParameter("category");
		%>
		<input type="hidden" name="category" id="category" value="<%=category%>">
		
	<div class="container" id="inner-content" >
		<div class="row">
			<div class="board_list_category">
				<div class="col-lg-12">
					<div class="inner-content">
						<span class="filter frm" data-oper="all">전체보기</span> <span>|</span>&nbsp;&nbsp;
						<span class="filter n frm" data-oper="onlyme">내가 작성한 게시글</span>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		
		<%-- <select name="category" id="category">
			<option value="" <c:out value="${category == null ? 'selected' : ''}"/>>전체 게시글</option>
			<option value="onlyme" <c:out value="${category == 'onlyme' ? 'selected' : ''}"/>>내가 작성한 게시글만</option>
		</select> --%>
	</form>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
				<c:choose>
					<c:when test="${fn:length(suggest) > 0}">
						<table class="table table-hover">
							<thead>
							    <tr>
							      <th scope="col">No.</th>
							      <th scope="col">등록일</th>
							      <th scope="col">제목</th>
							      <th scope="col">아이디</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:forEach items="${suggest}" var="suggest">
							  	<input type="hidden" name="ce_id" id="ce_id" value="${suggest.ce_id}">
								    <tr>
								      <td>${suggest.ce_num }</td>
								      <th scope="row">
								      	<fmt:formatDate value="${suggest.ce_date}" pattern="yyyy-MM-dd"/>
								      </th>
								      <td class="td-title">
									      <div class="QnA-title" onclick="location.href='/center/suggestDetails?ce_num=${suggest.ce_num}'" >
									      	<c:out value="${suggest.ce_title}"/>
									      </div>
								      </td>
								      <td id="change_id">
									      <input type="text" name="ce_id" onclick="return " id="change_id" value=" ${suggest.ce_id }">
								      </td>
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
	<!-- 페이지 처리 Start -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="pagination">
								<ul>
									<c:if test="${pageMaker.prev }">
										<li class="frm paginate_button previous"><a href="${pageMaker.startPage-1 }">
										<i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
										<li class="frm paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
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
				</div> <!-- 페이지 처리 End -->
</section>



<script type="text/javascript">

//========================================================
    //change_id = change_id.replace(/(?<=.{1})./gi, "*");
    
    var change_id = $("#change_id").val();
    function masking(change_id) {
    console.log(change_id);
        if (change_id == undefined || change_id === "") {
            return "";
        }
        var pattern = /.{3}$/; // 정규식
        return change_id.replace(pattern, "***");
    }
//========================================================
    
//폼 실행
	$(document).ready(
		function() {
			
			//페이징========================================================
			var formObj = $("#suggest_form");
			var category = $("input[name='category']");
			var operation = $(this).data('oper');
			console.log(operation);			
			
			$(".paginate_button a").on("click", function(e){
				e.preventDefault(); //페이지가 바로 넘어가는것을 방지하기 위한 코드
				console.log('click');
				formObj.find("input[name='pageNum']").val($(this).attr("href"));
				
				formObj.submit();
			});
			
			$('.frm').on("click",function(e) {
				e.preventDefault();
				var operation = $(this).data('oper');
				console.log(operation);
				if (operation === 'all') {
					formObj.attr("action","/center/suggest").attr("method", "get");
					category.val('');
					formObj.submit();
				}else if(operation === 'onlyme'){
					formObj.attr("action","/center/suggest").attr("method", "get");
					category.val('onlyme');
					formObj.submit();
				}
			});
			
			
			
			// 로그인 체크 후 카테고리 유무 ====================
			var id_chk = $("input[name=us_id]").val();
			console.log(id_chk);
			if(id_chk == ""){
				$("#inner-content").hide();
			}
			
			
			
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