<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id="regBtn" type="button" class="btn btn-xs pull-right">
                            	Register New Board
                            </button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>변경일</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="board">
                                    <tr class="odd gradeX">
                                        <td><c:out value="${board.bno}"/></td>
                                        <td>
                                        	<a class='move' href=<c:out value="${board.bno}"/>>
                                        	<c:out value="${board.title}"/></a>
                                        </td>
<%--                                         <td>
                                        	<a  href="/board/get?bno=<c:out value="${board.bno}"/>">
                                        	<c:out value="${board.title}"/></a>
                                        </td> --%>
                                        <td><c:out value="${board.content}"/></td>
                                        <td><c:out value="${board.writer}"/></td>
                                        <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/> </td>
                                        <td><fmt:formatDate value="${board.updatedate}" pattern="yyyy-MM-dd"/> </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <!-- /.table-responsive -->
                            <!-- 페이지 퍼리 Start -->
                            <div class="pull-right">
							  <ul class="pagination">
							  
							  <c:if test="${pageMaker.prev}">
							    <li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
							  </c:if>
							  
							  <c:forEach var = "num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
							    <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
							    <a href="${num}">${num}</a></li>
							  </c:forEach>
							  
							  <c:if test="${pageMaker.next}">
							    <li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
							  </c:if>
							  
							  </ul>
							 </div>
                            <!-- 페이지 퍼리 End -->
                           
                           <form id="actionForm" action="/board/list" method="get" >
                           	 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                           	 <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                           </form>
                           
                            <!-- Modal 창 추가 -->
                            <div id="myModal" class="modal" tabindex="-1" role="dialog">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title">Modal title</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        처리가 완료되었습니다.
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary">Save changes</button>
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
                             <!-- /Modal 창 추가 -->
                            
                            
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<script>
   // 새로고침해서 등록이 계속 되는것을 방지
   $(document).ready(function() {

      var result = '<c:out value="${result}"/>';
      console.log("result" + result);
      
      checkModal(result);
      
      //뒤로가기 모달창 문제 해결
      history.replaceState({},null,null);
      
      function checkModal(result){
         if(result === '' || history.state){
            return ;
         }
         
         if(parseInt(result) > 0){
            $(".modal-body").html("게시글" + parseInt(result) + "번이 등록됐습니다.");
         }
         
         $("#myModal").modal("show");
      }
      
      $("#regBtn").on("click", function(){
         self.location = "/board/register";
      });
      
      // <<,>> 페이지 값 넘기기 처리
      var actionForm = $("#actionForm");
      $(".paginate_button a").on("click", function(e){
    	  e.preventDefault();
    	  console.log('click');
    	  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    	  actionForm.submit();
      });
      
      $(".move").on("click",function(e){
    	  e.preventDefault();
    	  actionForm.append("<input type = 'hidden' name = 'bno' value='"+$(this).attr("href")+"'>");
      	  actionForm.attr("action","/board/get");
      	  actionForm.submit();
      });
      
   });//end
</script>

            
 <%@include file="../includes/footer.jsp" %>


