<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.shop.*,java.util.*"%>
<jsp:useBean id="dao" class="com.it.shop.memberDAO"/>

<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	List<memberVO> list = dao.memberSearch(search);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript" src="script/insertChk.js"></script>
<!-- <style type="text/css">
	
	*{margin:0; padding:0;}
	
	header{ height: 150px; background-color:blue;
		   color:white; text-align: center;  line-height: 150px;}
		   
    nav{height: 35px; background-color:RoyalBlue; line-height:10px;} 
	nav ul li { float: left;  margin: 0 30px; list-style: none;}
	nav ul li a{text-decoration: none; color: white; line-height:30px;}
 	
	section{ height: 500px; background-color:Gainsboro; }
	table{ width:800px; text-align: center; margin: 0 auto; }
	table a{text-decoration: none; color:white;}
	
	footer{color: white; height: 65px; background-color: CornflowerBlue; 
			text-align: center; line-height: 60px;} 
			
</style> -->
</head>
<body>
<%@ include file="header.jsp" %>

	<section>
         <table border="1">
            <tr>
               <th class="text-center" >회원번호</th>
               <th class="text-center" >회원성명</th>
               <th class="text-center" >전화번호</th>
               <th class="text-center" >주소</th>
               <th class="text-center" >가입일자</th>
               <th class="text-center" >고객등급</th>
               <th class="text-center" >거주지역</th>
            </tr>
            <%
               for(memberVO vo : list){
            %>
	            <tr>
	               <td class="text-center" >
	               	<a href="update.jsp?custno=<%=vo.getCustno()%>"><%=vo.getCustno() %></a>
	               </td>
	               <td ><%=vo.getCustname()%></td>
	               <td class="text-center" ><%=vo.getPhone()%></td>
	               <td class="text-center" ><%=vo.getAddress()%></td>
	               <td class="text-center" ><%=vo.getJoindate().substring(0,10)%></td>
	               <td class="text-center" ><%=vo.getGrade()%></td>
	               <td class="text-center" ><%=vo.getCity()%></td>
	            </tr>
            <%
               }
            %>
         </table>

	 	
	</section>
	
	<footer>Copyright © hipenpal.com & ltool.net. All Rights Reserved.</footer>
</body>
</html>