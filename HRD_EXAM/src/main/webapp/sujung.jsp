<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String custno = request.getParameter("custno");
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = "system";
   String pwd = "1234";
   String sql = "select  D.custno, D.custname, D.grade, sum(price)   from MONEY_TBL_02 N , MEMBER_TBL_02 D where N.custno = D.custno group by D.CUSTNO, D.custname, D.grade order by custno";
   
   try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(url,id,pwd);
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


   
   <section>
        <h3>회원매출조회</h3>
        <%
      while(rs.next()){
      %>
       <table border="1" style="margin-left: auto; margin-right: auto;">
               <tr>
                   <th>회원번호</th>
                   <td><%=rs.getString(1) %><br></td>
               </tr>
               <tr>
                   <th>회원성명</th>
                   <td><%=rs.getString(2) %></td>
               </tr>
               <tr>
                   <th>고객등급</th>
                   <td><%=rs.getString(3) %></td>
               </tr>
               <tr>
                   <th>매출</th>
                   <td><%=rs.getString(4) %></td>
               </tr>
            
           </table>
 <%
       }
 
 %>
   </section>
    
  
</body>
</html>
<%      
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      try{
         if( rs != null) rs.close();
         if( pstmt != null) pstmt.close();
         if( conn != null) conn.close();
      }catch(Exception e){
         e.printStackTrace();
      }
   }
%>