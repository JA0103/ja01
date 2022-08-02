<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${path}/resources/js/join.js"></script>
    <meta charset="UTF-8">
    <title>아이디찾기</title>
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
    <link rel="stylesheet" href="/resources/assets/css/basic.css">
    <link rel="stylesheet" href="/resources/assets/css/main.css">

</head>

<body>


<div class="form-group email-form">
	 <label for="email">이메일</label>
	 <div class="input-group">
	<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
<div class="input-group-addon">
	<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
</div>
	<div class="mail-check-box">
<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
</div>
	<span id="mail-check-warn"></span>
</div>


    <section class="insert-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="insert-wrap">
                        <img src="/resources/assets/images/cucumber.png">
                        <form action="/user/findId" method="post" name="form">
                            <h1>아이디 찾기</h1>
                            <h3>이름과 이메일을 입력하세요.</h3>
                            <table>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이름" required name="us_name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="us_email" id="us_email"
                                        placeholder="이메일">
                                    <button type="button" class="form-control findid_email"
                                        id="mail-Check-Btn">본인인증</button>
                                </div>
                                
								
								
                                <div class="mail-check-box">
                                    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!"
                                        disabled="disabled" maxlength="6">
                                </div><br>
                                <div>
                                    <span id="mail-check-warn"></span>
                                </div><br>
                                <div class="form-group submit">
                                    <button type="submit" class="form-control btn btn-primary"
                                        onclick="return CreateAccountCheck()">아이디 찾기</button>
                                </div>
                                <div class="form-group submit fr">
                                    <button type="button" class="form-control btn btn-primary"
                                        onclick="location.href='/'">홈 화면으로</button>
                                </div>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>

<script>

$('#mail-Check-Btn').click(function() {
	const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send eamil
</script>

	<!-- jQuery -->
    <script src="/resources/assets/js/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/assets/js/owl-carousel.js"></script>
    <script src="/resources/assets/js/slick.js"></script>

    <!-- custom -->
    <script src="/resources/assets/js/custom.js"></script>
</body>
</html>