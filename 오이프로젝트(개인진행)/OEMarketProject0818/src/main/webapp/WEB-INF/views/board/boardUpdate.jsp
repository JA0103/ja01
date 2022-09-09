<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Resister</title>
   
    <!-- Link -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">

</head>
<body>
    
   <section class="insert-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5 shadow">
               <div class="insert-wrap">
                  <img src="/resources/assets/images/cucumber.png">
                  <h3 class="mb-4 text-center">상품 수정</h3>
                  <form id="updateForm" action="/board/boardUpdate" class="insert-form" enctype="multipart/form-data" method="post">
                    <div class="form-group refresh_right">
                        <button type="reset" class="refresh"><i class="fa fa-refresh" aria-hidden="true"></i></button>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="제목" required name="bo_title" value="${mb_list.bo_title }">
                    </div>
                    
                    <!-- 카테고리 -->
                    <div class="form-group">
                        <select name="bo_category" class="form-control" required="required">
                           	<c:if test="${mb_list.bo_category == null}">
	                           	<option value="" selected>카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '도서/티켓/문구'}">
	                           	<option value="">카테고리</option>
	                            <option selected value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '음반/악기'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option selected value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '예술/수집품'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option selected value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '여성의류'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option selected value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '남성의류'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option selected value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '신발'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option selected value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '가방'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option selected value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '시계'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option selected value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '쥬얼리'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option selected value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '가구/인테리어'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option selected value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '차량/오토바이'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option selected value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '키덜트'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option selected value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '생활용품'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option selected value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '반려동물용품'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option selected value="반려동물용품">반려동물용품</option>
	                            <option value="기타">기타</option>
                            </c:if>
                        	<c:if test="${mb_list.bo_category == '기타'}">
	                            <option value="">카테고리</option>
	                            <option value="도서/티켓/문구">도서/티켓/문구</option>
	                            <option value="음반/악기">음반/악기</option>
	                            <option value="예술/수집품">예술/수집품</option>
	                            <option value="여성의류">여성의류</option>
	                            <option value="남성의류">남성의류</option>
	                            <option value="신발">신발</option>
	                            <option value="가방">가방</option>
	                            <option value="시계">시계</option>
	                            <option value="쥬얼리">쥬얼리</option>
	                            <option value="가구/인테리어">가구/인테리어</option>
	                            <option value="차량/오토바이">차량/오토바이</option>
	                            <option value="키덜트">키덜트</option>
	                            <option value="생활용품">생활용품</option>
	                            <option value="반려동물용품">반려동물용품</option>
	                            <option selected value="기타">기타</option>
                            </c:if>
                        </select>
                    </div>
                    <!-- //카테고리 -->
                    
                    <div class="form-group">
                        <input type="text" class="form-control" value="${mb_list.bo_price}" placeholder="가격 ( 숫자만 입력해주세요. )" name="bo_price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    </div>
                    <div class="form-group">
                        <textarea rows="5" cols="20" class="form-control" placeholder="내용" required name="bo_content">${mb_list.bo_content}</textarea>
                    </div>
                    
                    <div class="form-group filebox bs3-primary preview-image">
                        <input class="upload-name" value="파일선택" disabled="disabled" style="width: 250px;">

                        <label for="input-file1" class="input-file-button"><img src="/resources/assets/images/paper-clip.png"></label>
                        <input type="file" multiple="multiple" id="input-file1" class="upload-hidden" name="bo_image">
                    </div>

                    <input type="hidden" name="bo_address1" value="<c:out value='${login.us_address1}'/>"> 
                    <input type="hidden" name="bo_address2" value="<c:out value='${login.us_address2}'/>"> 
                    <input type="hidden" name="bo_id" value="<c:out value='${login.us_id}'/>">
                    <input type="hidden" name="bo_nickname" value="<c:out value='${login.us_nickname}'/>">
                    <input type="hidden" name="bo_num" value="<c:out value='${mb_list.bo_num}'/>">
                    
                    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
	
                     
                    <div class="mt-5">
                        <div class="form-group submit">
                            <button type="submit" class="form-control btn btn-primary up_btn" >수정하기</button>
                        </div>

                        <div class="form-group submit fr">
                            <button type="button" class="form-control btn btn-primary listup_btn">목록으로</button>
                        </div>
                    </div>
                
                  </form>
             
               </div>
            </div>
         </div>
      </div>
   </section>


   <!-- jQuery -->
   <script src="/resources/assets/js/jquery.min.js"></script>
   <!-- Bootstrap -->
   <script src="/resources/assets/js/bootstrap.min.js"></script>
   <!-- Plugins -->
   <script src="/resources/assets/js/owl-carousel.js"></script>
   <script src="/resources/assets/js/slick.js"></script>
   <!-- custom -->
   <script src="/resources/assets/js/custom.js"></script>
   
   <script type="text/javascript">
   $(document).ready(function(){
      var fileTarget = $('.filebox .upload-hidden');
   
       fileTarget.on('change', function(){
           if(window.FileReader){
               // 파일명 추출
               var filename = $(this)[0].files[0].name;
           } 
   
           else {
               // Old IE 파일명 추출
               var filename = $(this).val().split('/').pop().split('\\').pop();
           };
   
           $(this).siblings('.upload-name').val(filename);
       });
   
       //preview image 
       var imgTarget = $('.preview-image .upload-hidden');
   
       imgTarget.on('change', function(){
           var parent = $(this).parent();
           parent.children('.upload-display').remove();
   
           if(window.FileReader){
               //image 파일만
               if (!$(this)[0].files[0].type.match(/image\//)) return;
               
               var reader = new FileReader();
               reader.onload = function(e){
                   var src = e.target.result;
                   parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
               }
               reader.readAsDataURL($(this)[0].files[0]);
           }
   
           else {
               $(this)[0].select();
               $(this)[0].blur();
               var imgSrc = document.selection.createRange().text;
               parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
   
               var img = $(this).siblings('.upload-display').find('img');
               img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
           }
       });
       
       // 0814 수정하고 목록으로 페이징 값 넘겨주기
       var updateForm = $("#updateForm");
       
       var order = '<c:out value="${order}"/>';
       var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
       
       $("#updateForm button.listup_btn").on("click",function(e) {
    	   	e.preventDefault();
    	   	if(order === "regdate"){
    	   		updateForm.attr("action","/board/boardListOrderByRegdate");
    	   	}
    	   	else if(order === "lowPrice"){
    	   		updateForm.attr("action","/board/boardListOrderByLowPrice");
    	   	}
			else if(order === "highPrice"){
    	   		updateForm.attr("action","/board/boardListOrderByHighPrice");
    	   	}else{
    	   		updateForm.attr("action","/board/boardListOrderByHeart");
    	   	}
    	   	updateForm.attr("method","get");
    	   	updateForm.append(align);
       		updateForm.submit();
    	   		
       });
       
       if(order === ""){
	         $("#updateForm button.up_btn").on("click",function(e) {
	       	    e.preventDefault();
	       	    
	       		updateForm.append(align);
	       		updateForm.submit();
	         });
       }
       if(order ===  "regdate") {
           $("#updateForm button.up_btn").on("click",function(e) {
        	    e.preventDefault();
	       	    
       		    updateForm.append(align);
       		    updateForm.submit();
       	 });
       } 
       if(order ===  "lowPrice") {
       	$("#updateForm button.up_btn").on("click",function(e) {
	       		e.preventDefault();
	       	    
	       		updateForm.append(align);
	       		updateForm.submit();
       	});
       } 
       if(order ===  "highPrice") {
       	$("#updateForm button.up_btn").on("click",function(e) {
	       		e.preventDefault();
	       	    
	       		updateForm.append(align);
	       		updateForm.submit();
        	});
       }
       
   });
   </script>

</body>
</html>