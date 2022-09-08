<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.ezen.*, java.util.*"%>
<jsp:useBean id="dao" class="com.it.ezen.hrdDAO"/>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   hrdVO vo = dao.selectOne(id);
   List<hrdVO> list = dao.getlecturer();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
   <h2>교과목 수정</h2>
   <form action="update_impl.jsp" method="get">
      <table>
         <tr>
            <th>교과목 코드</th>
            <td class="ir"><input type="text" name="id" size="100" value="<%= vo.getId() %>"></td>
         </tr>
         <tr>
            <th>과목명</th>
            <td class="ir"><input type="text" name="c_name" size="100" value="<%= vo.getC_name() %>"></td>
         </tr>
         <tr>
            <th>담당강사</th>
            <td class="ir">
               <input type="hidden" name="lecturer" value="<%= vo.getLecturer() %>" id="rec">
               <select name="lecturer">
                  <option>담당강사선택</option>
                  <option value="1" id="rec1">김교수</option>
                  <option value="2" id="rec2">이교수</option>
                  <option value="3" id="rec3">박교수</option>
                  <option value="4" id="rec4">우교수</option>
                  <option value="5" id="rec5">최교수</option>
                  <option value="6" id="rec6">강교수</option>
                  <option value="7" id="rec7">황교수</option>
               </select>
            </td>
         </tr>
         <tr>
            <th>학점</th>
            <td class="ir"><input type="text" name="credit" size="100" value="<%= vo.getCredit() %>"></td>
         </tr>
         <tr>
            <th>요일</th>
            <td class="ir">
               <input type="hidden" name="week" value="<%= vo.getWeek() %>" id="weeks">
               <input type="radio" name="week" value="1" id="week1" checked="checked">월&nbsp;&nbsp;
               <input type="radio" name="week" value="2" id="week2">화&nbsp;&nbsp;
               <input type="radio" name="week" value="3" id="week3">수&nbsp;&nbsp;
               <input type="radio" name="week" value="4" id="week4">목&nbsp;&nbsp;
               <input type="radio" name="week" value="5" id="week5">금&nbsp;&nbsp;
               <input type="radio" name="week" value="6" id="week6">토
            </td>
         </tr>
         <tr>
            <th>시작</th>
            <td class="ir"><input type="text" name="start_hour" size="100" value="<%= vo.getStart_hour() %>"></td>
         </tr>
         <tr>
            <th>종료</th>
            <td class="ir"><input type="text" name="end_end" size="100" value="<%= vo.getEnd_end() %>"></td>
         </tr>
      </table>
      <div>
         <button type="button" onclick="location.href='index.jsp'">목록</button>
         <input type="reset" value="취소">
         <input type="submit" value="완료">
      </div>
   </form>
</section>
<script>
   var num = document.getElementById("rec").value;
   var week = document.getElementById("weeks").value;
   if(num == 1){
      document.getElementById("rec1").selected=true;
   } else if (num == 2 ){
      document.getElementById("rec2").selected=true;
   } else if (num == 3 ){
      document.getElementById("rec3").selected=true;
   } else if (num == 4 ){
      document.getElementById("rec4").selected=true;
   } else if (num == 5 ){
      document.getElementById("rec5").selected=true;
   } else if (num == 6 ){
      document.getElementById("rec6").selected=true;
   } else if (num == 7 ){
      document.getElementById("rec7").selected=true;
   }
   
   if(week == 1){
      document.getElementById("week1").checked=true;
   } else if (week == 2){
      document.getElementById("week2").checked=true;
   }else if (week == 3){
      document.getElementById("week3").checked=true;
   }else if (week == 4){
      document.getElementById("week4").checked=true;
   }else if (week == 5){
      document.getElementById("week5").checked=true;
   }else if (week == 6){
      document.getElementById("week6").checked=true;
   }
   
</script>
<%@ include file="footer.jsp" %>
</body>
</html>