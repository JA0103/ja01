<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Header Include -->
   <%@include file="../includes/header.jsp" %>
   <form role="form">
      <input type="text" name="bo_num" value="${mb_list.bo_num}">
      <input type="text" name="my_nickname" value="${login.us_nickname}">
      <input type="text" name="cr_seller" value="${mb_list.bo_nickname}"> 
   </form>
    <!-- 상세 페이지 시작 -->
    <section class="section" id="detail-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="col-lg-3"></div>
                    <div class="col-lg-8 detail-center">
                        <div class="detail-item-carousel">
                            <div class="owl-detail-item owl-carousel owl-theme">
                            
                                <!-- 상세 페이지 그림 부분 -->
                                <c:forEach items="${file_list}" var="file_list">
                                    <c:choose>
                                       <c:when test="${file_list.file_category == 0}">    
                                         <div class="item content">
                                             <div class="thumb">
                                                    <img src="<c:out value="${file_list.file_original}"/>">
                                             </div>
                                         </div>
                                       </c:when>
                                        <c:otherwise>
                                         <div class="item content">
                                                    <img src="<spring:url value='/img/${file_list.file_original}'/>">
                                             <div class="thumb">
                                             </div>
                                         </div>
                                        </c:otherwise>
                                     </c:choose>
                                 </c:forEach>
                                
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
                                <button type="button" data-oper='chat_btn'>채팅하기</button>
                            </div>
                        </div>

                        <!-- 제목 및 버튼 부분 -->
                        <div class="row detail-inner">
                            <div class="col-lg-6">
                                <h3>${mb_list.bo_title}</h3>
                            </div>
   
                     <c:if test="${login.us_id == mb_list.bo_id}">   
                               <div class="col-lg-6 detail-inner-btn">
                                  <form id="deleteForm" action="/board/boardDelete" method="post">
                                     <input type="hidden" name="bo_num" value="<c:out value='${mb_list.bo_num}'/>">
                              
                                      <button type="button" class="detail-btn-bl">판매완료</button>
                                      <button type="submit" class="detail-btn-gr">수정</button>
                                      <button type="submit" class="detail-btn-re">삭제</button>
                                   </form>
                               </div>
                           </c:if>
                         
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
                                <textarea readonly>${mb_list.bo_content}</textarea>
                            </div>
                            
                            <!-- 목록으로 갈 때 값 넘겨주는 부분 -->
                            <div class="col-lg-12 txt-right">
                               <form id="listForm" action="/board/boardListOrderByHeart" method="get">
                           <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                           <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                           <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                           <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
   
                                  <button class="detail-btn-gr go-list-btn">목록으로</button>
                        </form>
                            </div>
                        </div>

                        <!-- 지도 부분 -->
                        <div class="row detail-map">
                            <div class="col-lg-12 detail-map-span">
                                <img src="/resources/assets/images/maps-and-flags.png">
                                <span>동네 위치</span>
                            </div>
                            <div class="col-lg-12 map">
                                <%@include file="../includes/map.jsp" %>
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
                                <div data-re_num="1">
                                    <div class="comment-show-detail">
                                        <a href="#프로필로"><img src="/resources/assets/images/woman.png"></a>
                                        <h4>당근님</h4>
                                        <span>2022.08.04</span>
                                    </div>
                                    <div class="comment-show-comment">
                                        <span>오이님 왜 저희 따라하세요?</span>
                                    </div>
                                </div>
                            </div>
                            <!-- //댓글 표시 부분 -->
                            
                            
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- // 상세 페이지 끝 -->
    

<script type="text/javascript" src="/resources/assets/js/reply.js"></script>

<script>
    $(documnet).ready(function(){
        var bo_numValue = '<c:out value="${mb_list.bo_num}"/>';
        var replyUL = $(".comment-show");

        showList(1);  // 함수 호출
        function showList(page){
            replyService.getList(
                {bo_num:bo_numValue, page:page || 1},
                function(list){
                    var str="";
                    if(list == null || list.length == 0){
                        replyUL.html("");
                        return ;
                    }
                    for(var i=0, len=list.length ||0 ; i<len; i++){
                        str += "<div data-re_num='"+list[i].re_num+"'><div class='comment-show-detail'>";
                        str += "<a href='#프로필로'><img src='"+ list[i].re_profile+"'></a>";
                        str += "<h4>" + list[i].re_name+ "</h4>";
                        str += "<span>"+ replyService.displayTime(list[i].re_regdate)  +"/span></div>";
                        str += "<div class='comment-show-comment'><span>"+ list[i].re_reply +"</span></div></div>";
                    }

                    console.log(str);
      replyUL.html(str);
                }
            ) // end for Service
        }
    });
</script>


<%@ include file="../includes/footer.jsp" %>

<script>
$(document).ready(function(){
      
      var formObj = $("form");
      
      $('button').on("click",function(e){
         e.preventDefault();
         
         var operation = $(this).data('oper');
         console.log(operation);
         
         if(operation === 'chat_btn'){
            formObj.attr("action","/room").attr("method","post");
          var bo_numTag =  formObj.find("input[name='bo_num']");
          var NicknameTag =  formObj.find("input[name='my_nickname']");
          var cr_sellerTag =  formObj.find("input[name='cr_seller']");
          formObj.empty();
          formObj.append(bo_numTag);
          formObj.append(NicknameTag);
          formObj.append(cr_sellerTag); 
           /*  var cr_buyerTag =  formObj.find("input[name='cr_buyer']");
            var cr_sellerTag =  formObj.find("input[name='cr_seller']");
            formObj.empty();
            formObj.append(bo_numTag);
            formObj.append(cr_buyerTag);
            formObj.append(cr_sellerTag);    */
         }
         formObj.submit();
      });
   });

$(document).ready(function() {
       // 목록으로 갈 때 값 넘겨주는 부분
         var listForm = $("#listForm");
         var order = '<c:out value="${order}"/>';
         var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
         
         var pageNumTag = $("input[name='pageNum']").clone();  
        var amountTag = $("input[name='amount']").clone();
        var typeTag = $("input[name='type']").clone();
        var keywordTag = $("input[name='keyword']").clone();
         
         if(order === ""){
            $("#listForm button").on("click",function(e) {
                 e.preventDefault();
               
                 listForm.empty();
                  listForm.append(pageNumTag);
               listForm.append(amountTag);
               listForm.append(typeTag);
               listForm.append(keywordTag);
               listForm.append(align);
                listForm.submit();
            });
         }
         if(order ===  "regdate") {
             $("#listForm button").on("click",function(e) {
                  e.preventDefault();
                
                 listForm.empty();
                 listForm.attr("action","/board/boardListOrderByRegdate");
               listForm.append(pageNumTag);
               listForm.append(amountTag);
               listForm.append(typeTag);
               listForm.append(keywordTag);
               listForm.append(align);
                 listForm.submit();
             });
         } 
         if(order ===  "lowPrice") {
            $("#listForm button").on("click",function(e) {
                e.preventDefault();
                
                 listForm.empty();
                 listForm.attr("action","/board/boardListOrderByLowPrice");
                 listForm.append(pageNumTag);
               listForm.append(amountTag);
               listForm.append(typeTag);
               listForm.append(keywordTag);
               listForm.append(align);
                 listForm.submit();
            });
         } 
         if(order ===  "highPrice") {
            $("#listForm button").on("click",function(e) {
                 e.preventDefault();
                 
                 listForm.empty();
                 listForm.attr("action","/board/boardListOrderByHighPrice");
                   listForm.append(pageNumTag);
                   listForm.append(amountTag);
                   listForm.append(typeTag);
                   listForm.append(keywordTag);
                   listForm.append(align);
                 listForm.submit();
             });
         }
         
      // 0814 삭제 시 목록으로 갈 때 값 넘겨주는 부분
         var deleteForm = $("#deleteForm");
         var bo_NumTag = $("input[name='bo_num']").clone();
         
         // 수정 부분
         $("#deleteForm button.detail-btn-gr").on("click",function(e) {
            e.preventDefault();
       
               deleteForm.empty();
               deleteForm.attr("action", "/board/boardUpdateForm").attr("method","get");

               deleteForm.append(pageNumTag);
               deleteForm.append(amountTag);
               deleteForm.append(typeTag);
               deleteForm.append(keywordTag);
               deleteForm.append(align);
               deleteForm.append(bo_NumTag);
               deleteForm.submit();
        });
         
          // 삭제 부분
         if(order === ""){
            $("#deleteForm button.detail-btn-re").on("click",function(e) {
                 e.preventDefault();
               
                deleteForm.empty();
                deleteForm.append(pageNumTag);
                deleteForm.append(amountTag);
                deleteForm.append(typeTag);
                deleteForm.append(keywordTag);
                deleteForm.append(align);
                deleteForm.append(bo_NumTag);
                deleteForm.submit();
            });
         }
         if(order ===  "regdate") {
             $("#deleteForm button.detail-btn-re").on("click",function(e) {
                  e.preventDefault();
                
                  deleteForm.empty();
                 deleteForm.append(pageNumTag);
               deleteForm.append(amountTag);
               deleteForm.append(typeTag);
               deleteForm.append(keywordTag);
               deleteForm.append(align);
               deleteForm.append(bo_NumTag);
               deleteForm.submit();
             });
         } 
         if(order ===  "lowPrice") {
            $("#deleteForm button.detail-btn-re").on("click",function(e) {
                   e.preventDefault();
                
                 deleteForm.empty();
                 deleteForm.append(pageNumTag);
                 deleteForm.append(amountTag);
               deleteForm.append(typeTag);
               deleteForm.append(keywordTag);
               deleteForm.append(align);
               deleteForm.append(bo_NumTag);
               deleteForm.submit();
            });
         } 
         if(order ===  "highPrice") {
            $("#deleteForm button.detail-btn-re").on("click",function(e) {
                 e.preventDefault();
                 
                 deleteForm.empty();
                 deleteForm.append(pageNumTag);
                 deleteForm.append(amountTag);
                 deleteForm.append(typeTag);
                 deleteForm.append(keywordTag);
                 deleteForm.append(align);
                 deleteForm.append(bo_NumTag);
                 deleteForm.submit();
             });
         }
         
         
         
          
}); // end for $(document)
</script>