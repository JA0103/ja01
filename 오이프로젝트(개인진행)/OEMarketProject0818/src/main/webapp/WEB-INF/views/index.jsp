<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Header Include -->
<%@ include file="includes/header.jsp"%>

	<!-- 검색 바 -->
	<div class="container">
	    <div class="row">
	        <div class="search-wrapper col-lg-12">
	            <div class="input-holder">
	                <form id="searchForm" action="/board/boardListOrderByHeart" method="get">
	                 <select name="type">
				<option value="" <c:out value="${pageMaker.cri.type==null? 'selected' : ''}"/>></option>
				<option value="T" <c:out value="${pageMaker.cri.type=='T'? 'selected' : ''}"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type=='C'? 'selected' : ''}"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type=='W'? 'selected' : ''}"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type=='TC'? 'selected' : ''}"/>>제목+내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type=='TW'? 'selected' : ''}"/>>제목+작성자</option>
				<option value="TCW" <c:out value="${pageMaker.cri.type=='TCW'? 'selected' : ''}"/>>제목+내용+작성자</option>
			</select>
			
	                 <input type="text" class="search-input" placeholder="검색어를 입력하세요" name="keyword" />
	                 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
	                 <button class="search-icon"><i class="fa fa-search" aria-hidden="true"></i></button>
	             </form>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- //검색 바 -->
	
	<!-- Banner -->
	<div class="main-banner">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="left-content">
						<div class="thumb">
							<div class="inner-content">
								<h3>
									우리 동네, <strong>오이마켓</strong>
								</h3>
								<span>중고 거래부터 동네 정보까지,이웃과 함께해요.<br> 가깝고 따뜻한 당신의 근처를
									만들어요.
								</span>
								<div class="main-border-button">
									<a href="#">오이마켓 보기</a>
								</div>
							</div>
							<img src="/resources/assets/images/background.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--// Banner -->
	
	<!-- Board - popular -->
	<section class="section" id="popular">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h2>인기 상품 순 &nbsp;&nbsp;&nbsp;<a href="board/boardListOrderByHeart.do">더보기 > </a>
						</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<a href="board/boardInsert.do" class="plus-button" id="test"
						onclick="test('${login.us_id}')"><i class="fa fa-plus"></i> 새 글</a>
				</div>
			</div>
		</div>
	
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="popular-item-carousel">
						<div class="owl-popular-item owl-carousel">
	
							<c:forEach items="${he_list}" var="he_list" begin="1" end="6" varStatus="status">
								<!-- 인기 게시글 01 -->
								<div class="item">
									<div class="thumb">
										<div class="hover-content">
											<ul>
												<li><a onclick="location.href='board/boardDetail?bo_num=${he_list.bo_num}&align='"><i class="fa fa-eye"></i></a></li>
											</ul>
										</div>
										
										<c:choose>
											<c:when test="${he_list.bo_category != null}">
												<img src="<spring:url value='/img/${he_list.bo_image}'/>">
											</c:when>
											<c:otherwise>
												<img src="<c:out value="${he_list.bo_image}"/>">
											</c:otherwise>
										</c:choose>
										
									</div>
	
									<div class="down-content">
										<h4>
											<c:out value="${he_list.bo_title}" />
										</h4>
										<span><c:out value="${he_list.bo_price}" />원</span>
										<h5>
											<c:out value="${he_list.bo_address1}" />
										</h5>
									</div>
								</div>
							</c:forEach>
	
	
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--// Board - popular -->
	
	<!-- Board - New -->
	<section class="section" id="new">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h2>
							최근 등록 순 &nbsp;&nbsp;&nbsp;<a
								href="board/boardListOrderByRegdate?align=regdate">더 보기 > </a>
						</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<a href="board/boardInsert.do" class="plus-button" id="test"
						onclick="test('${login.us_id}')"><i class="fa fa-plus"></i> 새 글</a>
				</div>
			</div>
		</div>
	
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="new-item-carousel">
						<div class="owl-new-item owl-carousel">
	
	
							<!-- 새 게시글 01 -->
							<c:forEach items="${rg_list}" var="rg_list" begin="1" end="6"
								varStatus="status">
								<div class="item">
									<div class="thumb">
									
										<div class="hover-content">
											<ul>
												<li><a onclick="location.href='board/boardDetail?bo_num=${rg_list.bo_num}&align=regdate'"><i class="fa fa-eye"></i></a></li>
											</ul>
										</div>
										
										<c:choose>
											<c:when test="${rg_list.bo_category != null}">
												<img src="<spring:url value='/img/${rg_list.bo_image}'/>">
											</c:when>
											<c:otherwise>
												<img src="<c:out value="${rg_list.bo_image}"/>">
											</c:otherwise>
										</c:choose>
										
									</div>
	
									<!-- <img src="/resources/assets/images/board-05.jpg" alt="게시판 / 상품 등록 시 그림이 src에 올라가야한다."> -->
									<div class="down-content">
										<h4>
											<c:out value="${rg_list.bo_title}" />
										</h4>
										<span><c:out value="${rg_list.bo_price}" />원</span>
										<h5>
											<c:out value="${rg_list.bo_address1}" />
										</h5>
									</div>
								</div>
							</c:forEach>
	
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--// Board - New -->
	
	<!-- Customer Center -->
	<div class="customer">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="section-heading">
						<h2>고객센터</h2>
						<span>오이님, 무엇을 도와드릴까요?</span>
					</div>
					<form action="" method="GET" id="customer">
						<div class="row">
							<div class="col-lg-5">
								<fieldset>
									<input type="text" name="name" placeholder="당신의 닉네임" required="">
								</fieldset>
							</div>
							<div class="col-lg-5">
								<fieldset>
									<input type="text" name="eamil" id="email" placeholder="당신의 이메일"
										required="">
								</fieldset>
							</div>
							<div class="col-lg-2">
								<fieldset>
									<button type="submit" id="form-submit" class="main-dark-button">
										<i class="fa fa-paper-plane"></i>
									</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
	
				<div class="col-lg-4">
					<div class="row">
						<div class="col-12">
							<ul>
								<li><span>사용자들이 자주 묻는 질문을 확인해보세요.</span><br> Q. 오이마켓에서
									지켜야할 매너<br> Q. 중고거래 운영정책<br> Q. 판매 금지 물품<br> Q.
									광고 소재 수정 메뉴가 궁금해요.<br></li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<ul>
								<li><span>그래도 해결이 안되시나요?</span><br> <a href="#고객센터 페이지">고객센터에
										문의하기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--// Customer Center -->
	
	
	
	<!-- Script -->
	<script>
		/* 새 글 등록 클릭 시 회원/비회원 구분 스크립트 */
		function test(us_id) {
			if (us_id != "") {
				return true;
			} else {
				alert("로그인이 필요한 서비스입니다.")
				$("#test").attr("href", "${contextPath}/login.do");
				$("#new #test").attr("href", "${contextPath}/login.do");
			}
		}
		
	</script>

<!-- Footer Include -->
<%@ include file="includes/footer.jsp"%>