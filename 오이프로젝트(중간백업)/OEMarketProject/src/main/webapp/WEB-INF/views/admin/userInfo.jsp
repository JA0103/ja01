<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보-관리자</title>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
</head>
<body>
<%@ include file="../includes/header.jsp"%>
   <section class="insert-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
               <div class="insert-wrap">
                  <img src="/resources/assets/images/cucumber.png">
<%--                      <input type="hidden" name="us_id" value='<c:out value="${user.us_id }"/>'> --%>
                     <h1>${user.us_id} 님 정보</h1><br>
                     <div class="form-group join_id">
                        <input type="text" class="form-control"  name="us_id" readonly="readonly" value='<c:out value="${user.us_id }"/>' >
                     </div>
                    
                     <div class="form-group">
                        <input type="text" name="us_name"  readonly="readonly" value='<c:out value="${user.us_name }"/>' class="form-control" >
                     </div>
                     <div class="form-group">
                        <input type="text" name="us_birth"  readonly="readonly" value='<c:out value="${user.us_birth }"/>'  class="form-control" >
                     </div>
                     <div class="form-group">
                        <input type="text" name="us_email"  readonly="readonly" value='<c:out value="${user.us_email }"/>' size="35" class="form-control" >
                     </div>
                     <div class="form-group">
                        <select name="us_gender" class="form-control"  readonly="readonly">
                           <option <c:out value="${user.us_gender == 'male' ? 'selected' : ' '  }"/>  value="male">남성</option>
                           <option <c:out value="${user.us_gender == 'female' ? 'selected' : ' '  }"/> value="female">여성</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <input type="text" name="us_address1" value='<c:out value="${user.us_address1 }"/>' 
                           id="sggNm" class="form-control" readonly="readonly">
                     </div>
                     <div class="form-group">
                        <input type="text" name="us_address2" value='<c:out value="${user.us_address2 }"/>' 
                           id="emdNm" class="form-control"  readonly="readonly">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control"  readonly="readonly" maxlength="13" onKeyup="addHypen(this);" value='<c:out value="${user.us_phone }"/>' required
                           name="us_phone">
                     </div>
                     <div class="mt-5">
                        <div class="form-group submit">
<!--                            <input type="submit"  class="form-control btn btn-primary"  value="수정하기" onclick="return updateChk()"> -->
                        </div>
                        <div class="form-group submit fr">
<!--                            <button type="button" class="form-control btn btn-primary" onclick="location.href='/'">홈 화면으로</button> -->
                        </div>
                     </div>
               </div>
            </div>
         </div>
      </div>
   </section>
</body>

<!-- jQuery -->
<script src="/resources/assets/js/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="/resources/assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="/resources/assets/js/owl-carousel.js"></script>
<script src="/resources/assets/js/slick.js"></script>

<!-- custom -->
<script src="/resources/assets/js/custom.js"></script>

</html>