<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<%@ include file="../includes/header.jsp"%>


<!-- BoardList -->

<div class="container">
	<div class="row">
		<div class="admin_board_list">
			<div class="col-lg-12">
				<div class="inner-content">
					<table>
						<thead>
							<th class="admin_head_">제목</th>
							<th class="admin_head_">작성자</th>
							<th class="admin_head_">작성일</th>
							<th class="admin_head_">버튼</th>
							<th class="admin_head_">버튼
						</thead>
						<tbody>
							<c:forEach items="${ad_board}" var="ad_board">
								<tr>
									<th><c:out value="${ad_board.bo_title}" /></th>
									<th><c:out value="${ad_board.bo_nickname}" /></th>
									<th><c:out value="${ad_board.bo_regdate}" /></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>



	<div class="container board-list-margintop">
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6 plus">
				<a href="boardInsert.do" class="plus-button" id="test"
					onclick="test('${login.us_id}')"><i class="fa fa-plus"></i>&nbsp;&nbsp;
					새 글</a>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">


			<!-- pagination 페이징 -->
			<div class="col-lg-12">
				<div class="pagination">
					<ul>
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage-1}"><i
									class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage+1}"><i class="fa fa-chevron-right"
									aria-hidden="true"></i></a></li>
						</c:if>
					</ul>
				</div>
			</div>

			<form id="actionForm" action="/board/boardListOrderByHeart"
				method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>

			<!-- Modal 창 추가 -->
			<div id="myModal" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- //Modal 창 추가 -->

		</div>
	</div>
</section>
<!--// BoardList -->

<%@ include file="../includes/footer.jsp"%>

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

	/* ================================================================================== */
	// 새로고침해서 등록이 계속 되는것을 방지
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';
						console.log("result" + result);

						checkModal(result);

						//뒤로가기 모달창 문제 해결
						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body")
										.html(
												"게시글" + parseInt(result)
														+ "번이 등록됐습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							self.location = "/board/boardRegister";
						});

						// <<,>> 페이지 값 넘기기 처리 ============================================================================================

						var actionForm = $("#actionForm");
						var order = '<c:out value="${order}"/>';
						var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';

						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									actionForm.find("input[name='bo_num']")
											.remove();
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.attr("action",
											"/board/boardListOrderByHeart");
									actionForm.submit();
								});

						if (order === "regdate") {
							$(".paginate_button a")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												actionForm.find(
														"input[name='bo_num']")
														.remove();
												actionForm
														.find(
																"input[name='pageNum']")
														.val(
																$(this).attr(
																		"href"));
												actionForm.append(align);
												actionForm
														.attr("action",
																"/board/boardListOrderByRegdate");
												actionForm.submit();
											});
						}
						if (order === "lowPrice") {
							$(".paginate_button a")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												actionForm.find(
														"input[name='bo_num']")
														.remove();
												actionForm
														.find(
																"input[name='pageNum']")
														.val(
																$(this).attr(
																		"href"));
												actionForm.append(align);
												actionForm
														.attr("action",
																"/board/boardListOrderByLowPrice");
												actionForm.submit();
											});
						}
						if (order === "highPrice") {
							$(".paginate_button a")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												actionForm
														.find(
																"input[name='pageNum']")
														.val(
																$(this).attr(
																		"href"));
												actionForm.append(align);
												actionForm
														.attr("action",
																"/board/boardListOrderByHighPrice");
												actionForm.submit();
											});
						}

						// <<,>> 페이지 값 넘기기 처리 끝============================================================================================

						// boardList 게시글 눈 모양 눌렀을 때 상세보기로 이동
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();

											actionForm.find(
													"input[name='bo_num']")
													.remove();
											actionForm.find(
													"input[name='align']")
													.remove();
											actionForm.find(
													"input[name='bo_id']")
													.remove();

											actionForm
													.append("<input type = 'hidden' name = 'bo_num' value='"
															+ $(this).attr(
																	"href")
															+ "'>");

											var bo_id = '<input type="hidden" name="bo_id" value="<c:out value="${login.us_id}"/>" >';
											actionForm.append(bo_id);

											var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
											actionForm.append(align);

											actionForm.attr("action",
													"/board/boardDetail");
											actionForm.submit();
										});

						// 검색처리 =============================================================================================================

						var searchForm = $("#searchForm");
						var order = '<c:out value="${order}"/>';
						var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
						if (order === "") {

							$("#searchForm button")
									.on(
											"click",
											function(e) {
												e.preventDefault();

												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요.")
													return false;
												}
												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요.")
													return false;
												}
												searchForm
														.find(
																"input[name='pageNum']")
														.val(1);
												searchForm.submit();
											});
						}
						if (order === "regdate") {
							$("#searchForm button")
									.on(
											"click",
											function(e) {
												e.preventDefault();

												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요.")
													return false;
												}
												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요.")
													return false;
												}
												searchForm
														.find(
																"input[name='pageNum']")
														.val(1);
												searchForm.append(align);
												searchForm
														.attr("action",
																"/board/boardListOrderByRegdate");
												searchForm.submit();
											});
						}
						if (order === "lowPrice") {
							$("#searchForm button")
									.on(
											"click",
											function(e) {
												e.preventDefault();

												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요.")
													return false;
												}
												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요.")
													return false;
												}
												searchForm
														.find(
																"input[name='pageNum']")
														.val(1);
												searchForm.append(align);
												searchForm
														.attr("action",
																"/board/boardListOrderByLowPrice");
												searchForm.submit();
											});
						}
						if (order === "highPrice") {
							$("#searchForm button")
									.on(
											"click",
											function(e) {
												e.preventDefault();

												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요.")
													return false;
												}
												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요.")
													return false;
												}
												searchForm
														.find(
																"input[name='pageNum']")
														.val(1);
												searchForm.append(align);
												searchForm
														.attr("action",
																"/board/boardListOrderByHighPrice");
												searchForm.submit();
											});

						}
						// 검색처리 =============================================================================================================

						// 0815 카테고리 색상 토글
						var keyword = '<c:out value="${pageMaker.cri.keyword}"/>';
						if (keyword === "도서/티켓/문구") {
							$("#categoryForm a.book").toggleClass("active");
						}
						if (keyword === "음반/악기") {
							$("#categoryForm a.music").toggleClass("active");
						}
						if (keyword === "예술/수집품") {
							$("#categoryForm a.art").toggleClass("active");
						}
						if (keyword === "여성의류") {
							$("#categoryForm a.woman").toggleClass("active");
						}
						if (keyword === "남성의류") {
							$("#categoryForm a.man").toggleClass("active");
						}
						if (keyword === "신발") {
							$("#categoryForm a.shoes").toggleClass("active");
						}
						if (keyword === "가방") {
							$("#categoryForm a.bag").toggleClass("active");
						}
						if (keyword === "시계") {
							$("#categoryForm a.watch").toggleClass("active");
						}
						if (keyword === "쥬얼리") {
							$("#categoryForm a.jewelry").toggleClass("active");
						}
						if (keyword === "가구/인테리어") {
							$("#categoryForm a.funiture").toggleClass("active");
						}
						if (keyword === "차량/오토바이") {
							$("#categoryForm a.car").toggleClass("active");
						}
						if (keyword === "키덜트") {
							$("#categoryForm a.kidult").toggleClass("active");
						}
						if (keyword === "생활용품") {
							$("#categoryForm a.food").toggleClass("active");
						}
						if (keyword === "반려동물용품") {
							$("#categoryForm a.pet").toggleClass("active");
						}
						if (keyword === "기타") {
							$("#categoryForm a.etc").toggleClass("active");
						}

						// 0815 카테고리 페이징 처리
						var categoryForm = $("#categoryForm");
						var order = '<c:out value="${order}"/>';
						var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';

						categoryForm.find("input[name='type']").val("G");
						categoryForm.append(align);

						$("#categoryForm a.book").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("도서/티켓/문구");
									categoryForm.submit();
								});

						$("#categoryForm a.music").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("음반/악기");
									categoryForm.attr("action",
											"/board/categoryMusic");
									categoryForm.submit();
								});

						$("#categoryForm a.art").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("예술/수집품");
									categoryForm.attr("action",
											"/board/categoryArt");
									categoryForm.submit();
								});

						$("#categoryForm a.woman").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("여성의류");
									categoryForm.attr("action",
											"/board/categoryWoman");
									categoryForm.submit();
								});

						$("#categoryForm a.man").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("남성의류");
									categoryForm.attr("action",
											"/board/categoryMan");
									categoryForm.submit();
								});

						$("#categoryForm a.shoes").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("신발");
									categoryForm.attr("action",
											"/board/categoryShoes");
									categoryForm.submit();
								});

						$("#categoryForm a.bag").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("가방");
									categoryForm.attr("action",
											"/board/categoryBag");
									categoryForm.submit();
								});

						$("#categoryForm a.watch").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("시계");
									categoryForm.attr("action",
											"/board/categoryWatch");
									categoryForm.submit();
								});

						$("#categoryForm a.jewelry").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("쥬얼리");
									categoryForm.attr("action",
											"/board/categoryJewelry");
									categoryForm.submit();
								});

						$("#categoryForm a.funiture").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("가구/인테리어");
									categoryForm.attr("action",
											"/board/categoryFuniture");
									categoryForm.submit();
								});

						$("#categoryForm a.car").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("차량/오토바이");
									categoryForm.attr("action",
											"/board/categoryCar");
									categoryForm.submit();
								});

						$("#categoryForm a.kidult").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("키덜트");
									categoryForm.attr("action",
											"/board/categoryKidult");
									categoryForm.submit();
								});

						$("#categoryForm a.food").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("생활용품");
									categoryForm.attr("action",
											"/board/categoryFood");
									categoryForm.submit();
								});

						$("#categoryForm a.pet").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("반려동물용품");
									categoryForm.attr("action",
											"/board/categoryPet");
									categoryForm.submit();
								});

						$("#categoryForm a.etc").on(
								"click",
								function(e) {
									e.preventDefault();

									categoryForm.find("input[name='keyword']")
											.val("기타");
									categoryForm.attr("action",
											"/board/categoryEtc");
									categoryForm.submit();
								});

						// //0815 카테고리 페이징 처리

					});//end
</script>
