<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.it.shop.*"%>
    <jsp:useBean id="dao" class="com.it.shop.memberDAO"></jsp:useBean>
    
<%
	
	// 데이터베이스로 부터 데이터를 읽어 온다
	List<memberVO> price = dao.memberSalse(); 
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	*{margin:0; padding:0;}
	
	header{ height: 150px; background-color:blue;
		   color:white; text-align: center;  line-height: 150px;}
		   
    nav{height: 35px; background-color:RoyalBlue; line-height:10px;} 
	nav ul li { float: left;  margin: 0 30px; list-style: none;}
	nav ul li a{text-decoration: none; color: white; line-height:30px;}
 	
	section{ height: 500px; background-color:Gainsboro; }
	section h3{margin: 0 auto; text-align: center; line-height: 100px;}
	table{ width:800px; text-align: center; margin: 0 auto; }
	table a{text-decoration: none; color:white;}
	
	footer{color: white; height: 65px; background-color: CornflowerBlue; 
			text-align: center; line-height: 60px;} 
			
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
	<h3>회원매출조회</h3>
  		<table border="1">
  			<tr>
  				<th>회원번호</th>
  				<th>회원성명</th>
  				<th>고객등급</th>
  				<th>매출</th>
  			</tr>
  			 <%
               for(memberVO vo : price){
            %>
            <tr>
               <td class="text-center" ><%=vo.getCustno() %></td>
               <td class="text-center" ><%=vo.getCustname()%></td>
               <td class="text-center" ><%=vo.getGrade()%></td>
               <td class="text-center" ><%=vo.getPrice()%></td>
            </tr>
            <%      
               }
            %>
  		</table>
	 	
	</section>
	
	<footer>Copyright © hipenpal.com & ltool.net. All Rights Reserved.</footer>

</body>
</html>