<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
   <title>Room</title>
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
      .roomContainer{
         background-color: #F6F6F6;
         width: 500px;
         height: 500px;
         overflow: auto;
      }
      .roomList{
         border: none;
      }
      .roomList th{
         border: 1px solid #FFBB00;
         background-color: #fff;
         color: #FFBB00;
      }
      .roomList td{
         border: 1px solid #FFBB00;
         background-color: #fff;
         text-align: left;
         color: #FFBB00;
      }
      .roomList .num{
         width: 75px;
         text-align: center;
      }
      .roomList .room{
         width: 350px;
      }
      .roomList .go{
         width: 71px;
         text-align: center;
      }
      button{
         background-color: #FFBB00;
         font-size: 14px;
         color: #000;
         border: 1px solid #000;
         border-radius: 5px;
         padding: 3px;
         margin: 3px;
         float:right;
      }
      .inputTable th{
         padding: 5px;
      }
      .inputTable input{
         width: 330px;
         height: 25px;
      }
   </style>
</head>


<body>
   <div class="container">
      <h1>채팅목록</h1>
      <div id="roomContainer" class="roomContainer">
         <table id="roomList" class="roomList"></table>
      
      <div>
	         <table>
				<c:forEach items="${room }" var="room">
				<tr>
			      	<%-- <td><input type="hidden" name="cr_buyer" value="${room.cr_buyer }"></td>
			      	<td><input type="hidden" name="my_nickname" value="${login.us_nickname }"></td>
			      	<td><input type="hidden" name="cr_seller" value="${room.cr_roomName }"></td> --%>
					<td><c:out value="${room.cr_roomName}"/></td>
					<td><button type="button" id="roomJoin_btn" onclick="location.href='/chat?cr_seller=${room.cr_seller}&us_id=${login.us_id}'">참여</button></td>
				</tr>
				</c:forEach>
			</table>
      </div>
   </div>
   </div>

<script type="text/javascript">

//폼 실행
/* $(document).ready(function(){
   var formObj = $("form");
   
   $('button').on("click", function(e){
      e.preventDefault();
      
      var operation = $(this).data('oper');
      console.log(operation);
      
      if(operation === 'move'){
         formObj.attr("action","/room").attr("method","post");
         // var NicknameTag = $("input[name='my_nickname']").clone();
          //formObj.empty();
          //formObj.append(NicknameTag);
      }
      formObj.submit();
   });
    */
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
   
   
//
});
	
</script>


</body>




</html>


