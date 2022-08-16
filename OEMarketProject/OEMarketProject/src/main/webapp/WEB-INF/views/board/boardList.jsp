<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<%@ include file="../includes/header.jsp" %>

    <!-- BoardList -->
    <section class="section" id="board_list">
        <div class="container">
            <div class="row">
                <div class="board_list_category">
                    <div class="col-lg-12">
                        <div class="inner-content">
                           <c:choose>
                              <c:when test="${result=='regdate'}">
                                  <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" ><i class="fa fa-check"></i> 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                              </c:when>
                              <c:when test="${result=='lowPrice'}">
                                   <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"><i class="fa fa-check"></i> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                              </c:when>
                              <c:when test="${result=='highPrice'}">
                                   <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"><i class="fa fa-check"></i> 높은 가격 순</a>
                              </c:when>
                               <c:otherwise>
                                  <a id="heart" href="boardListOrderByHeart.do"><i class="fa fa-check"></i> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                               </c:otherwise>
                           </c:choose>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                       <c:choose>
                           <c:when test="${result=='regdate'}">
                                <h2>최신 등록 순</h2>
                           </c:when>
                           <c:when test="${result=='lowPrice'}">
                                <h2>낮은 가격 순</h2>
                           </c:when>
                           <c:when test="${result=='highPrice'}">
                                <h2>높은 가격 순</h2>
                           </c:when>
                            <c:otherwise>
                               <h2>인기 상품 순</h2>
                            </c:otherwise>
                          </c:choose>
                    </div>
                </div>
                <div class="col-lg-6 plus">
                    <a href="boardInsert.do" class="plus-button" id="test" onclick="test('${login.us_id}')"><i class="fa fa-plus"></i>&nbsp;&nbsp; 새 글</a>
                </div>
            </div>
        </div>

      
        <div class="container">
            <div class="row">
                
                <!-- 인기 게시글 -->
                <c:forEach items="${mb_list}" var="mb_board">
                <div class="col-lg-4">
                    <div class="item">
                        <div class="thumb">
                            <div class="hover-content">
                                <ul>
                                    <li><a href="#번호 넘겨서 세부 페이지 받는"><i class="fa fa-eye"></i></a></li>
                                    <li><a href="javascript " id="heartToggle"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#번호 넘겨서 세부 페이지 받는"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            
                            <c:choose>
                               <c:when test="${mb_board.bo_category != null}">
                                  <img src="<spring:url value='/img/${mb_board.bo_image}'/>">
                               </c:when>
                               <c:otherwise>
                                  <img src="<c:out value="${mb_board.bo_image}"/>">
                               </c:otherwise>
                            </c:choose>   
                        
                        </div>
                       <div class="down-content">
                          <h4><c:out value="${mb_board.bo_title}"/></h4>
                          <span><c:out value="${mb_board.bo_price}"/>원</span>
                          <h5><c:out value="${mb_board.bo_address1}"/>&nbsp;<c:out value="${mb_board.bo_address2}"/></h5>
                       </div>
                    </div>
                </div>
                </c:forEach>
                
                
               
                <!-- pagination 페이징 -->
                <div class="col-lg-12">
                    <div class="pagination">
                        <ul>
                            <li>
                                <a href="#">1</a>
                            </li>
                            <li class="active">
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">></a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!--// BoardList -->
    
    <!-- Script -->
    <script>
    /* 새 글 등록 클릭 시 회원/비회원 구분 스크립트 */
	function test(us_id){
	   if(us_id != "") {
	      return true;
	   }else{
	      alert("로그인이 필요한 서비스입니다.")
	      $("#test").attr("href","${contextPath}/login.do");
	      $("#new #test").attr("href", "${contextPath}/login.do");
	   }
	}
   
    var heart = document.querySelector('#heartToggle');
    var heartI = document.querySelector('#heartToggle i');
    const CLICKED_CLASS = "clicked";
    
    function heartClick(){
       heartI.classList.toggle(CLICKED_CLASS);
    }
    
    heart.addEventListener("click", heartClick);
    
    
   </script>
    

    
<%@ include file="../includes/footer.jsp" %>