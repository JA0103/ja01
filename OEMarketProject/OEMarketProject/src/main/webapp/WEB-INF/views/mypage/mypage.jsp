<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@   taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@   taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
   .baseTable{width:700px; margin:0 auto;}
   .baseTable_left{width:200px;}
   .baseTable_mid{width:100px;}
   .baseTable_right{width:400px; float:right;}
</style>
</head>
<%@ include file="../includes/header.jsp" %>
<section style="padding-top:150px;">
   <div class="container">
      <h1 class="mb-4 text-center">마이페이지</h1>
   </div>
   <div class="container">
      <form role="form" name="fileForm" action="/mypage/profileEdit" method="post">
         <input type="hidden" name="my_id" value='<c:out value="${mypage.my_id }"/>'>
         <input type="hidden" name="my_image" value='<c:out value="${mypage.my_image }"/>'>
         <input type="hidden" name="us_id" value='<c:out value="${mypage.my_id }"/>'>
         <table class="baseTable">
            <tr>
               <th colspan="3" align="left"><h2>프로필 설정</h2><br></th>
            </tr>
            <tr>
               <td class="baseTable_left" rowspan="2" align="center">
               <img src="<spring:url value='/img/${mypage.my_image}'/>" alt="my_image" width="150" height="150"></td>
               <td class="baseTable_mid">닉네임</td>
               <td><input class="baseTable_right" name="my_nickname" value='<c:out value="${mypage.my_nickname }"/>'></td>
            </tr>
            <tr>
               <td class="baseTable_mid">자기소개</td>
               <td><textarea class="baseTable_right" name="my_intro"><c:out value="${mypage.my_intro }"/></textarea></td>
            </tr>
            <tr>
               <td colspan="2" class="baseTable_left" align="left"><br><input type="file" name="file" /></td>
               <td align="right"><br><button type="submit" data-oper='profileEdit_btn' onclick="alertChk()">변경사항 적용</button></td>
            </tr>
         </table>
         <br><br>
      

         <table class="baseTable">
            <tr>
               <th colspan="2" align="left"><h2>개인 정보 보호</h2><br></th>
            </tr>
            <tr>
               <td align="center"><button data-oper='update_btn' type="submit">회원정보수정</button></td>
               <td align="center"><button  data-oper='withdrawal_btn' type="submit">회원 탈퇴</button></td>
            </tr>
         </table>
         <br><br>
      <table class="baseTable">
         <tr>
            <th colspan="3" align="left"><h2>활동 보기</h2></th>
         </tr>
         <tr>
            <td colspan="3"><c:out value="${mypage.my_nickname }" />님은 <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${user.us_joindate }" />부터 오이마켓과 함께했어요.</td>
         </tr>
         <tr>
            <td>
               <table>
                  <tr>
                     <td>판매 횟수</td>
                  </tr>
                  <tr>
                  <td><button type="button" data-oper='sellBoard_btn' >${sellCount}</button></td>
                  </tr>
               </table>
            </td>
            <td>
               <table>
                  <tr>
                     <td>구매 횟수</td>
                  </tr>
                  <tr>
                     <td><button type="button" data-oper='buyBoard_btn' >${buyCount}</button></td>
                  </tr>
               </table>
            </td>
            <td>
               <table>
                  <tr>
                     <td>찜♥ 개수</td>
                  </tr>
                  <tr>
                     <td><button onclick="location.href='/mypage/heartBoard?he_id=<c:out value="${mypage.my_id }" />'"><c:out value="${countingHeart }" /></button></td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr><td colspan="3">※숫자를 클릭하시면, 해당 활동의 상세 목록을 조회하실 수 있습니다.</td><tr>
      </table><br>
      </form>
   </div>
   
   <script>
      function alertChk() {
         if (!confirm("변경된 내용을 저장하시겠습니까?")) {
            return false;
         } else {
            alert("저장되었습니다.");
            return true;
         }
      }
      
      window.onpageshow = function(e) {
         if (e.persisted || (window.performance && window.performance.navigation.type == 2)) { //뒤로가기 감지
            location.reload(); //현재 페이지 새로고침
         }
      }
      
      
      $(document).ready(function(){
  		
  		var formObj = $("form");
  		
  		$('button').on("click",function(e){
  			e.preventDefault();
  			
  			var operation = $(this).data('oper');
  			console.log(operation);
  			
  			if(operation === 'sellBoard_btn'){
  				formObj.attr("action","/mypage/sellBoard").attr("method","get");
  				var myIdTag = $("input[name='my_id']").clone();
  				formObj.empty();
  				formObj.append(myIdTag);
  			}else if(operation === 'buyBoard_btn'){
  				formObj.attr("action","/mypage/buyBoard").attr("method","get");
  				var myIdTag = $("input[name='my_id']").clone();
  				formObj.empty();
  				formObj.append(myIdTag);
  			}else if(operation === 'profileEdit_btn'){
  				formObj.attr( "enctype","multipart/form-data");
  				var myIdTag = $("input[name='my_id']").clone();
  				var myImageTag = $("input[name='my_image']").clone();
  				var myNicknameTag = $("input[name='my_nickname']").clone();
  				var fileTag = $("input[name='file']").clone();
  				var myIntroTag = $("textarea[name='my_intro']").clone();
  				formObj.empty();
  				formObj.append(myIdTag);
  				formObj.append(myImageTag);
  				formObj.append(myNicknameTag);
  				formObj.append(fileTag);
  				formObj.append(myIntroTag);
  			}else if(operation === 'withdrawal_btn'){
  				formObj.attr("action","/mypage/withdrawal").attr("method","get");
  				var myIdTag = $("input[name='my_id']").clone();
  				formObj.empty();
  				formObj.append(myIdTag);
  			}else if(operation === 'update_btn'){
  				formObj.attr("action","/user/update").attr("method","get");
  				var myIdTag = $("input[name='us_id']").clone();
  				formObj.empty();
  				formObj.append(myIdTag);
  			}
  			formObj.submit();
  		});
  	});
      
   </script>
   
</section>

<%@ include file="../includes/footer.jsp" %>