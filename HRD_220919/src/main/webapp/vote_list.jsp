<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.it.hrd.VoteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.it.hrd.VoteDAO"></jsp:useBean>    
<% List<VoteVO> list = dao.getVoteList(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<section>

	<h2>투표검수조회</h2>
	<br>
	
	<div id="table">
		<table border="1">
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<% for(VoteVO vo : list){ %>
			<tr>
				<td><%=vo.getV_name()%></td>
				<% 
					
				//생년월일 포맷 
					//주민번호에서 생년월일만 따로 저장
					String birth = vo.getV_jumin().substring(0,6);
					//심플데이트포맷 타입을 위의 birth 형식에 맞게 포맷 지정
					SimpleDateFormat dateformat = new SimpleDateFormat("yymmdd");
					//위 지정해준 데이트포맷 형식으로 birth를 Date 타입으로 변환
					Date date = dateformat.parse(birth); 

					//최종적으로 변환해 줄 형식으로 심플데이트포맷 형식 지정 
					//SimpleDateFormat newdateformat = new SimpleDateFormat("yyyy년 mm월 dd일");
					//위 형식으로 아까 변환해놓았던 date 넣어서 변환
					//String newBirth = newdateformat.format(date);
					
					//=>
					String newBirth = new SimpleDateFormat("yyyy년 mm월 dd일").format(date);
					
				//성별
					String gender=vo.getV_jumin().substring(6,7);
					if(gender.equals("1") || gender.equals("3")) gender="남";
					if(gender.equals("2") || gender.equals("4")) gender="여";
					
				//만나이로 변환 
					String age = vo.getV_jumin().substring(0,2);
					SimpleDateFormat ageformat = new SimpleDateFormat("yy");
					Date agedate = ageformat.parse(birth); 
					SimpleDateFormat newageformat = new SimpleDateFormat("yyyy");
					String newAge = newageformat.format(date);
					String today = new SimpleDateFormat("yyyy").format(new Date());
					
					//(현재년도 - 주민년도) 
					int ageResult = (Integer.parseInt(today) - Integer.parseInt(newAge));
					
					int month = Integer.parseInt(vo.getV_jumin().substring(2,4));//월
					int nowMonth = Integer.parseInt(new SimpleDateFormat("MM").format(new Date()));
					int day = Integer.parseInt(vo.getV_jumin().substring(4,6));//일
					int nowDay = Integer.parseInt(new SimpleDateFormat("dd").format(new Date()));
					
					System.out.print("day"+day);
					System.out.print("nowDay"+nowDay);
					
					//생일 지나면 -1
					if(month > nowMonth){
						ageResult = ageResult-1;
					}else if(month == nowMonth && day > nowDay ){
						ageResult = ageResult-1;
					}
				%>
				<td><%=newBirth%>생</td>
				<td>만 <%=ageResult%>세</td> 
				<td><%=gender%></td>
				<td><%=vo.getM_no()%></td>
				<td><%=vo.getV_time().substring(0,2)%> : <%=vo.getV_time().substring(2,4)%></td>
				<td><%=vo.getV_confirm()%></td>
			</tr>
			<%} %>
		</table>
	</div>
</section>

<%@include file="footer.jsp" %>
</body>
</html>