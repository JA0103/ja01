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
                  </thead>
                  <tbody>
                     <c:forEach items="${ad_board}" var="board">
                        <tr>
                           <td><a href="#"><c:out value="${board.bo_title}" /></a></td>
                           <td><c:out value="${board.bo_nickname}" /></td>
                           <c:set var="regdate" value="${board.bo_regdate }"></c:set>
                           <td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${regdate}" /></td>
                           <c:choose>
                                   <c:when test="${board.bo_grade == 1}">
                                    <td>
                                       <button value="${board.bo_num}" class="btn btn-danger center__tinybutton"
                                          id="${board.bo_num}" onclick="blind_click(this.id)"> 블라인드 처리</button>
                                      </td>
                                   </c:when>
                                   <c:when test="${board.bo_grade == 0}">
                                      <td>블라인드 처리된 게시글입니다</td>
                                   </c:when>
                            </c:choose>
                        </tr>
                     </c:forEach>
                        <form id="goAdmin"><input type="hidden" name="bo_num" id="bo_num" value=""></form>
                        <div id="myModal" class="modal fade" role="dialog" tabindex="-1">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h5 class="modal-title">
                                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                                          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                       </svg>
                                       &nbsp;알림
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal"   aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="modal-body text-center"><p></p> </div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary modal-btn" id="modal-ok-btn">확인</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                  </tbody>
               </table>
            </div>
         </div>
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
<!--// BoardList -->

<%@ include file="../includes/footer.jsp"%>

<script>
function blind_click(bo_num){
   var formObj = $("#goAdmin"); 
   var modal = $("#myModal"); 
   var bo_NumTag = $("input[name='bo_num']").attr('value', bo_num);
   console.log(bo_NumTag);
modal.find("p").text("게시글을 차단 하시겠습니까?");
$("#myModal").modal("show");
$("#modal-ok-btn").on('click',function(){ 
   $("#myModal").modal("hide");
formObj.attr("action","/admin/boardBlind").attr("method","post");
formObj.empty();
formObj.append(bo_NumTag); 
formObj.submit();
alert("차단되었습니다."); 
}); 
};
</script>