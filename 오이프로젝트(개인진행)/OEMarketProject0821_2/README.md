

**1. main.css에 6번째 .moveTopBtn에 z-index: 100; cursor: pointer; 줌 --> 화면 줄어들면 상단으로 가는 버튼이 그림들에 가려지는 문제 해결과 커서 표시

**2. main.css에 32번째 .header-area .main-nav .logo span에 top을 0으로 --> 헤더 로고 위 아래 위치 맞춤

**3. footer.jsp에 다음 추가
<!-- Popper -->
<script src="/resources/assets/js/popper.min.js"></script>

<!-- Bootstrap -->
<script src="/resources/assets/js/bootstrap0819.min.js"></script>

<script>
/* header의 카테고리 */
$('.custom-dropdown').on('show.bs.dropdown', function() {
   var that = $(this);
  setTimeout(function(){
	  that.find('.dropdown-menu').addClass('active');
  }, 100);
});
$('.custom-dropdown').on('hide.bs.dropdown', function() {
  $(this).find('.dropdown-menu').removeClass('active');
});
/* //header의 카테고리 */
</script>


--> 카테고리 부분 누르면 나오게 하는 파트 // resources/js에도 위 파일 두개 추가함

**4. 카테고리 부분 누르면 나오는 쪽 css도 main.css에 추가함

/*
--------------------------------------
header - dropdown
--------------------------------------
*/

.custom-dropdown > a {color: #000; }
.custom-dropdown .dropdown-menu {
border: 1px solid transparent !important;
-webkit-box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.2);
box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.2);
margin-top: -10px !important;
padding-top: 0;
padding-bottom: 0;
opacity: 0;
border-radius: 0;
background: #fff;
right: auto !important;
left: auto !important;
-webkit-transition: .3s margin-top ease, .3s opacity ease, .3s visibility ease;
-o-transition: .3s margin-top ease, .3s opacity ease, .3s visibility ease;
transition: .3s margin-top ease, .3s opacity ease, .3s visibility ease;
visibility: hidden; }
.custom-dropdown .dropdown-menu.active {
    opacity: 1;
    visibility: visible;
    margin-top: 80px !important; }
.custom-dropdown .dropdown-menu a {
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  font-size: 14px;
  padding: 15px 15px;
  position: relative;
  color: #b2bac1; }
.custom-dropdown .dropdown-menu a:last-child {
  border-bottom: none; }

.custom-dropdown .dropdown-menu a:hover, .custom-dropdown .dropdown-menu a:active, .custom-dropdown .dropdown-menu a:focus {
  background: #fff;
  color: #000; }
  .custom-dropdown .dropdown-menu a:hover .number, .custom-dropdown .dropdown-menu a:active .number, .custom-dropdown .dropdown-menu a:focus .number {
    color: #fff; }
.custom-dropdown .dropdown-menu a .number {
  padding: 2px 6px;
  font-size: 11px;
  background: #fd7e14;
  position: absolute;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  right: 15px;
  border-radius: 4px;
  color: #fff; }
  
.custom-dropdown .dropdown-item i{margin-right: 10px; color: #4e8f6e;}




**5. main.css에 14번째 줄 .search-wrapper .input-holder select를 다음과 같이 변경
.search-wrapper .input-holder select{padding-left: 10px; width: 180px; height: 50px; border-radius: 10px; margin: 10px; appearance: none; background: url(/resources/assets/images/down-arrow.png) no-repeat; background-size: 20px; background-position: 96%;}
--> index.jsp 검색바의 카테고리 고르는 부분 css 변경

**6. boardDetail.jsp의 하트와 채팅하기 부분 css 변경 그 외의 css변경

맨 위에 .clicked{color:#F26B57;} 추가 --> 찜 누르면 색 변하게 하는

/* detail - content */ 위에 #detail-top .owl-item .item img{height:600px;} 추가

main.css 256번째 줄부터 다음 추가
#detail .detail-content a#heartToggle{cursor:pointer; font-size: 25px;}
#detail .detail-content a#heartToggle:hover{color:#F26B57;}
#detail .detail-content a.clicked{color:#F26B57;}

/* detail - comment 댓글 구현 영역 */
#detail .modal-content h4{padding-left: 10px; font-weight:bold;}
#detail .modal-content label{padding-left: 10px; padding-bottom: 10px; font-size: 20px;}
#detail .detail-comment .comment-show{margin-bottom: 70px;}
#detail .panel-footer{margin: 0 auto;}

267번째 줄 .detail-content .align_he_ch 부분 변경
.detail-content .align_he_ch{margin-top: 25px; transition: all 0.3s ease 0s; display: flex; justify-content: flex-end; align-items: center;}


232번째 줄에 #detail-top .item .thumb img{height: 600px;}로 변경

282번째 줄에 .detail-content button{border: 1px solid #a1a1a1; border-radius: 10px; padding: 10px; margin-left: 10px; color: #fff; background: #a1a1a1;} 추가


**7. boardDetail.jsp에 댓글 등록 부분과 수정 부분에 글자 제대로 바꿔줌 - 값 보느라 다른거 들어가있었는데 제대로 등록과 수정으로 줌

**8. boardInsert.jsp와 boardUpdate.jsp, join.jsp까지 카테고리 고르는 화살표 다시 추가
main.css에 .insert-wrap .form-group select{appearance: none; background: url(/resources/assets/images/down-arrow.png) no-repeat; background-size: 20px; background-position: 96%;}로 변경
