<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
/* 		#yourMsg{
			display: none;
		} */
	</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<p>" + msg + "</p>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

/* 	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	} */

	function send() {
		var uN = $("#us_nickname").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
	}
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
</script>
<body>
	<div id="container" class="container">
		<h1>${cr_seller} 채팅</h1>
		<div id="chating" class="chating">
		</div>
		
			<input type="hidden" value="${us_nickname}" name="us_nickname" id="us_nickname">
	<%-- 	<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="hidden" value="${user}" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div> --%>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
					<th><button onclick="wsOpen()" id="startBtn">시작하기</button></th>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
   
   //로그인 풀린채로 넘어갔을 때 로그인창으로 넘어가게
   var Id = $("input[name='us_nickname']").val();
   console.log("id================"+Id);
   if(Id === ''){
      alert('로그인 후 이용바랍니다.');
      $(location).attr("href","/login");
   }
   </script>
</body>
</html>