<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Header Include -->
	<%@include file="../includes/header.jsp" %>

    <!-- 상세 페이지 시작 -->
    <section class="section" id="detail-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="col-lg-3"></div>
                    <div class="col-lg-8 detail-center">
                        <div class="detail-item-carousel">
                            <div class="owl-detail-item owl-carousel owl-theme">
                            <form role="form">
                            <input type="hidden" name="bo_num" value="${mb_list.bo_num}">
                            <input type="hidden" name="cr_buyer" value="${login.us_nickname}">
                            <input type="hidden" name="cr_seller" value="${mb_list.bo_nickname}">
                                <!-- 상세 페이지 그림 부분 -->
                                <c:forEach items="${file_list}" var="file_list">
	                                 <c:choose>
	                                    <c:when test="${file_list.file_category == 1}">    
	                                      <div class="item content">
	                                          <div class="thumb">
	                                                 <img src="<spring:url value='/img/${file_list.file_original}'/>">
	                                          </div>
	                                      </div>
	                                    </c:when>
	                                     <c:otherwise>
	                                      <div class="item content">
	                                          <div class="thumb">
	                                                 <img src="<c:out value="${file_list.file_original}"/>">
	                                          </div>
	                                      </div>
	                                     </c:otherwise>
	                                  </c:choose>
                              	</c:forEach>
                            </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="section" id="detail">
        <!-- 상세페이지 내용 부분 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-8 detail-center">
                        <div class="row detail-content">
                            <div class="col-lg-6 fll">
                                <a href="#a"><img src="/resources/assets/images/man.png" alt="프로필"></a>
                                <h4>${mb_list.bo_nickname}님</h4>
                                <span>${mb_list.bo_address1} ${mb_list.bo_address2}</span>
                            </div>

                            <div class="col-lg-6 flr align_he_ch">
                                <a href="#a"><img src="/resources/assets/images/like.png">80</a>
                                
                                <a href="#a"><img src="/resources/assets/images/bubble-chat.png"></a>
                                <button type="submit" data-oper='chat_btn'>채팅하기</button>
                            </div>
                        </div>

                        <!-- 제목 및 버튼 부분 -->
                        <div class="row detail-inner">
                            <div class="col-lg-6">
                                <h3>${mb_list.bo_title}</h3>
                            </div>

                            <div class="col-lg-6 detail-inner-btn">
                                <button type="button" class="detail-btn-bl">판매완료</button>
                                <button type="button" class="detail-btn-gr">수정</button>
                                <button type="button" class="detail-btn-re">삭제</button>
                            </div>
                        </div>

                        <!-- 조회수, 날짜, 카테고리 내용 부분 -->
                        <div class="row detail-info">
                            <div class="col-lg-12">
                                <img src="/resources/assets/images/calendar.png">
                                <span><fmt:formatDate pattern="yyyy-MM-dd" value="${mb_list.bo_regdate}"/></span>
                                <img src="/resources/assets/images/view.png">
                                <span>${mb_list.bo_count}0회</span>
                                <span>${mb_list.bo_category}</span>
                            </div>
                            <div class="col-lg-12 detail-info-pr"><span>${mb_list.bo_price}원</span></div>
                            <div class="col-lg-12 detail-info-co">
                                <p>${mb_list.bo_content}</p>
                            </div>
                        </div>

                        <!-- 지도 부분 -->
                        <div class="row detail-map">
                            <div class="col-lg-12 detail-map-span">
                                <img src="/resources/assets/images/maps-and-flags.png">
                                <span>동네 위치</span>
                            </div>
                            <div class="col-lg-12 map">
                                <img src="/resources/assets/images/map.png">
                            </div>
                        </div>

                        <!-- 댓글 부분 -->
                        <div class="row detail-comment">
                            <div class="col-lg-12 detail-comment-span">
                                <img src="/resources/assets/images/chat.png">
                                <span>상품 문의(<b>52</b>)</span>
                            </div>
                            <div class="col-lg-12">
                                <table border="1">
                                    <tr>
                                        <td><textarea placeholder="상품 문의 등록"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="comment-btn"><button type="submit" class="btn btn-primary">등록</button></td>
                                    </tr>
                                </table>
                            </div>

                            <!-- 댓글 표시 부분 -->
                            <div class="col-lg-12 comment-show">
                                <div class="comment-show-detail">
                                    <a href="#프로필로"><img src="/resources/assets/images/woman.png"></a>
                                    <h4>당근님</h4>
                                    <span>2022.08.04</span>
                                </div>
                                <div class="comment-show-comment">
                                    <span>오이님 왜 저희 따라하세요?</span>
                                </div>
                            </div>

                            <div class="col-lg-12 comment-show">
                                <div class="comment-show-detail">
                                    <a href="#프로필로"><img src="/resources/assets/images/man.png"></a>
                                    <h4>오이님</h4>
                                    <span>2022.08.04</span>
                                </div>
                                <div class="comment-show-comment">
                                    <span>조금 다른데요.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- // 상세 페이지 끝 -->
            
<script>/* ==================================================================================================================== */

   var operForm = $("#operForm");
   
   $("button[data-oper='modify']").on("click", function(){
      operForm.attr("action","/board/modify").submit();
   });

   $("button[data-oper='list']").on("click", function(){
      operForm.find("#bno").remove();
      operForm.attr("action","/board/list").submit();
   });

/*    
   window.onpageshow = function(e) {
       if (e.persisted || (window.performance && window.performance.navigation.type == 2)) { //뒤로가기 감지
          location.reload(); //현재 페이지 새로고침
       }
    }
    */ 
    
    $(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click",function(e){
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			if(operation === 'chat_btn'){
				formObj.attr("action","/chat/chat").attr("method","get");
				var cr_sellerTag = $("input[name='cr_seller']").clone();
				formObj.empty();
				formObj.append(cr_sellerTag);
			}else if(operation === 'buyBoard_btn'){
				formObj.attr("action","/mypage/buyBoard").attr("method","get");
				var myIdTag = $("input[name='my_id']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}
			formObj.submit();
		});
	});
</script>       


<%@ include file="../includes/footer.jsp" %>