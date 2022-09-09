<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Header Include -->
   <%@include file="../includes/header.jsp" %>
   <form role="form">
      <input type="hidden" name="bo_num" value="${mb_list.bo_num}">
      <input type="hidden" name="my_nickname" value="${login.us_nickname}">
      <input type="hidden" name="cr_buyer_id" value="${login.us_id}">
      <input type="hidden" name="cr_seller" value="${mb_list.bo_nickname}"> 
      <input type="hidden" name="cr_seller_id" value="${mb_list.bo_id}"> 
      <input type="hidden" name="us_id" value="${login.us_id}"> 
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
                                <c:if test="${mb_list.bo_image1 != null}">
                                    <c:choose>
                                       <c:when test="${mb_list.bo_category == null}">    
                                         <div class="item content">
                                             <div class="thumb">
                                                    <img src="<c:out value="${mb_list.bo_image1}"/>">
                                             </div>
                                         </div>
                                       </c:when>
                                       <c:otherwise>
                                         <div class="item content">
                                                    <img src="<spring:url value='/img/${mb_list.bo_image1}'/>">
                                             <div class="thumb">
                                             </div>
                                         </div>
                                        </c:otherwise>
                                     </c:choose>
                                  </c:if>
                                
                                <c:if test="${mb_list.bo_image2 != null}">

                                         <div class="item content">
                                                    <img src="<spring:url value='/img/${mb_list.bo_image2}'/>">
                                             <div class="thumb">
                                             </div>
                                         </div>
                                  </c:if>
                               
                                <c:if test="${mb_list.bo_image3 != null}">

                                         <div class="item content">
                                                    <img src="<spring:url value='/img/${mb_list.bo_image3}'/>">
                                             <div class="thumb">
                                             </div>
                                         </div>
                                  </c:if>
                                <!-- //상세 페이지 그림 부분 -->
                                
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
                            
	                            <c:choose>
	                            	<c:when test = "${color}">
	                                	<a id="heartToggle" class="clicked test" onclick="test('${login.us_id}')" href="/board/heartCount.do?bo_num=${mb_list.bo_num}&bo_id=${login.us_id}&bo_nickname=${login.us_nickname}&align=${order}"><i class="fa fa-heart"></i>&nbsp; ${heart_count}</a>
	                                </c:when>
	                                <c:otherwise>
	                                	<a id="heartToggle" class="test" onclick="test('${login.us_id}')" href="/board/heartCount.do?bo_num=${mb_list.bo_num}&bo_id=${login.us_id}&bo_nickname=${login.us_nickname}&align=${order}"><i class="fa fa-heart-o" aria-hidden="true"></i></i>&nbsp; ${heart_count}</a>
	                                </c:otherwise>
	                            </c:choose>
                                
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
                                <span><fmt:formatDate pattern="yyyy-MM-dd" value="${mb_list.bo_updatedate}"/></span>
                                <img src="/resources/assets/images/view.png">
                                <span>${mb_list.bo_count}회</span>
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
                                        <td class="comment-btn"><button id="addReplyBtn" class="btn btn-primary">등록</button></td>
                                    </tr>
                                </table>
                            </div>

                            <!-- 댓글 표시 부분 -->
                            <div class="col-lg-12">
                                <div class="comment-show">
                                	
                                </div>
                            </div>
                            <!-- //댓글 표시 부분 -->
                            <!-- 댓글 페이징 표시 -->
                            <div class="panel-footer">
                        		
                        	</div>
                            <!-- //댓글 페이징 표시 -->
                            
                        </div>
                        
                        <!-- 댓글모달창 시작 -->
						<!-- Modal -->
						 <div id="myModal" class="modal fade" role="dialog" tabindex ="-1">
						    <div class="modal-dialog">
						 
						       <!-- Modal content-->
						       <div class="modal-content">
						          <div class="modal-header">
						             <button type="button" class="close" data-dismiss="modal">&times;</button>
						             <h4 class="modal-title">댓글 작성</h4>
						          </div>
						          <div class="modal-body">
						             <div class="form-group">
						                <label>댓글 내용</label>
						                <input class="form-control" name="re_reply" value="댓글">
						             </div>
						             <input type="hidden" name="re_name" value="${mypage.my_nickname}">
						             <input type="hidden" name="re_profile" value="${mypage.my_image}" >
						          </div>
						          <div class="modal-footer">
						             <button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
						             <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
						             <button id="modalRegisterBtn" type="button" class="btn btn-info">등록</button>
						             <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						          </div>
						       </div>
						 
						    </div>
						</div>
 						<!-- 댓글모달창 끝 -->
 						
 						
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- // 상세 페이지 끝 -->
    

<%@ include file="../includes/footer.jsp" %>

<script src="/resources/assets/js/reply.js"></script>


<!-- 댓글 -->
<script>
    $(document).ready(function(){
        var bo_numValue = '<c:out value="${mb_list.bo_num}"/>';
        var replyUL = $(".comment-show");

        showList(pageNum);  // 함수 호출
        
        var modal = $("#myModal");   
        var modalInputReply = modal.find("input[name='re_reply']");
        var modalInputRename = modal.find("input[name='re_name']");
        var modalInputReplyDate = modal.find("input[name='re_regdate']");
        var modalReprofileInput = modal.find("input[name='re_profile']"); 
        
        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");
        
     // 0817 - remove
        modalRemoveBtn.on("click", function(e){
       	 let re_num = modal.data("re_num");
       	 replyService.remove(re_num, function(result){
       		 alert("result : " + result);
       		 modal.modal("hide");
       		
       		 showList(pageNum);
       		
       	 });
        }); // 삭제하기
        
        // 0817 - update
        modalModBtn.on("click", function(e){
       	 var re_reply = {
       			re_num : modal.data("re_num"),  // data-rno 값을 쓰겠다.
       			re_reply : modalInputReply.val()
       	 };
       	 
       	 replyService.update(re_reply, function(result){
       		 alert("result : " + result);
       		 modal.modal("hide");
       		 showList(pageNum);
       	 });
        }); // 수정하기
        
     	// Register 등록하기
        $("#addReplyBtn").on("click",function(){
           modalInputReply.val("");
           modalInputReplyDate.val("");

           modalInputReplyDate.closest("div").hide();
           modal.find("button[id !='modalCloseBtn']").hide();
           
           modalRegisterBtn.show();
           $("#myModal").modal("show");
        }); 
       
        modalRegisterBtn.on("click",function(e){
           var replys = {
        	re_reply : modalInputReply.val(),
        	re_name : modalInputRename.val(),
        	bo_num : bo_numValue,
        	re_profile : modalReprofileInput.val()
           }
           
           replyService.add(replys, function(result){
               alert(result);
               modal.modal("hide");
               showList(-1);
           })
           
        }); //Register 등록하기
        
        <!-- 이벤트 위임 시작 -->
        $(".comment-show").on("click","div", function(){
       	 var re_num = $(this).data("re_num");
       	 
       	 replyService.get(re_num, function(reply){
       		modalInputReply.val(reply.re_reply);
       		modalInputRename.val(reply.re_name).attr("readonly", "readonly");
       		modalInputReplyDate.val(
     		replyService.displayTime(reply.re_regdate)).attr("readonly", "readonly");
       		modal.data("re_num",reply.re_num);
       		
       		modal.find("button[id != 'modalClassBtn']").hide();
       		modalModBtn.show();
       		modalRemoveBtn.show();
       		
       		$("#myModal").modal("show");
       	 });
        });
        <!-- //이벤트 위임 끝 -->
        
        <!-- 0818 댓글 수업 -->
        function showList(page){
        	
            replyService.getList(
                {bo_num:bo_numValue, page:page || 1},
                
                function(replyCnt, list){
                	if(page == -1){
                 	   pageNum = 1;
                 	   showList(pageNum);
                 	   return;
                    }
                	
                	if(page == -2){
                  	   return false;
                    }
                	
                	var str="";
                    if(list == null || list.length == 0){
                        replyUL.html("");
                        showReplyPage(replyCnt);
                        if(replyCnt == 0){
	                        showList(-2);                    	
                        }else{
                        	showList(-1);
                        }
                        return;
                    }
                    
                    
                    for(var i=0, len=list.length || 0; i<len; i++){
                        str += "<div data-re_num='"+list[i].re_num+"'><div class='comment-show-detail'>";
                        str += "<a href='#프로필로'><img src='<spring:url value='/img/"+list[i].re_profile+"'/>'></a>";
                        str += "<h4>" + list[i].re_name+ "</h4>";
                        str += "<span>"+ replyService.displayTime(list[i].re_regdate) +"</span></div>";
                        str += "<div class='comment-show-comment'><span>"+ list[i].re_reply +"</span></div></div>";
                    }

                    console.log(str);
      				replyUL.html(str);
      				
      				showReplyPage(replyCnt); // 아래 showReplyPage 함수 호출
                }
            ); // end for Service
        } //end showList
        
     // 댓글 페이지 출력 부분
        var pageNum = 1;
        var replyPageFooter = $(".panel-footer");
        
        function showReplyPage(replyCnt){
       	 var endNum = Math.ceil(pageNum/10.0)*10;
       	 var startNum = endNum - 9;
       	 
       	 var prev = startNum != 1;
       	 var next = false;
       	 
       	 if((endNum*10) >= replyCnt){
       		endNum = Math.ceil(replyCnt/10.0);
     	 }
       	 if(endNum * 10 < replyCnt){
            next = true;
         }
       	 
       	 var str = "<ul class='pagination pull-right'>";
       	 if(prev){
       		 str += "<li class='page-item'><a class='page-link' href='"+ (startNum - 1) +"'>Previous</a></li>";
       	 }
       	 
       	 for(var i = startNum; i <= endNum; i++){
       		 var active = pageNum == i ? "active":"";
       		 
       		 str += "<li class='page-item "+ active +"'><a class='page-link' href='"+ i +"'>"+ i +"</a></li>";
       	 }
       	 
       	 if(next){
       		 str += "<li class='page-item'><a class='page-link' href='"+ (endNum + 1) +"'>Next</a></li>";
       	 }
       	 
       	 str += "</ul>";
   	 
	   	 console.log("str : " + str);
	   	 
	   	 replyPageFooter.html(str);
	   	 
        }// end showReplyPage
        
        replyPageFooter.on("click","li a", function(e){
            e.preventDefault();
            console.log("page click");
            
            var targetPageNum = $(this).attr("href");
            
            console.log("targetPageNum: " + targetPageNum);
            
            pageNum = targetPageNum;
            
            showList(pageNum);
       });    //end replyPageFooter
        
    });
</script><!-- //댓글 -->

<!-- 새 글 등록 클릭 시 회원/비회원 구분 스크립트 , boardList.jsp에도 있다. -->
<script>
	function test(us_id){
	   if(us_id != "") {
	      return true;
	   }else{
	      alert("로그인이 필요한 서비스입니다.")
	      $("a.test").attr("href","${contextPath}/login.do");
	      return false;
	   }
	}
	
	
</script>

<!-- 새로고침 방지 -->
<script language='javascript'>
	function noEvent() {    
		if (event.keyCode == 116) {
			event.keyCode= 2;        
			return false;    
		}  
		else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){        
			return false;    
		}
	}
	document.onkeydown = noEvent;
</script>

<!-- ======================================================= -->

<script>
$(document).ready(function(){
      
      var formObj = $("form");
      
      $('.align_he_ch button').on("click",function(e){
         e.preventDefault();
         
         var operation = $(this).data('oper');
         console.log(operation);
         
         if(operation === 'chat_btn'){
             formObj.attr("action","/room").attr("method","post");
           var bo_numTag =  formObj.find("input[name='bo_num']");
           var NicknameTag =  formObj.find("input[name='my_nickname']");
           var cr_buyer_idTag =  formObj.find("input[name='cr_buyer_id']");
           var cr_sellerTag =  formObj.find("input[name='cr_seller']");
           var cr_seller_idTag =  formObj.find("input[name='cr_seller_id']");
           var us_idTag =  formObj.find("input[name='us_id']");
           formObj.empty();
           formObj.append(bo_numTag);
           formObj.append(NicknameTag);
           formObj.append(cr_sellerTag); 
           formObj.append(cr_buyer_idTag); 
           formObj.append(cr_seller_idTag); 
           formObj.append(us_idTag); 
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
        
        if(order === "align_category"){
            $("#listForm button").on("click",function(e) {
                 e.preventDefault();
               
                 listForm.empty();
                 listForm.attr("action","/board/categoryBook");
                  listForm.append(pageNumTag);
               listForm.append(amountTag);
               listForm.append(typeTag);
               listForm.append(keywordTag);
               listForm.append(align);
                listForm.submit();
            });
         } 
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