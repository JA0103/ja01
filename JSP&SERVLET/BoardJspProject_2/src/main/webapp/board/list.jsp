<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.it.dao.*, java.text.*"%>
<jsp:useBean id="dao" class="com.it.dao.BoardDAO"/>

<%
	//1. 사용자 입력값 받기(page)
	String strpage = request.getParameter("page");
	if(strpage == null){
		strpage = "1";
	}
	int curpage = Integer.parseInt(strpage);
	
	//2. 데이터베이스로부터 데이터를 읽어 온다 (+ 총페이지)
	List<BoardVO> list = dao.boardListData(curpage); 
	int totalPage = dao.boardTotalPage(); 
	
	//페이지 나누기
	final int BLOCK = 3; //<1 2 3> <4 5 6>...<10 11 12> 이런식으로 3개씩으로 잡아준것
	int startPage = ( (curpage-1)/BLOCK*BLOCK ) +1;	
	//curpage:1 >(0/3*3)+1=(startpage)1 , 2>(1/3*3)+1=1,... 4>(3/3*3)+1=(startpage)4 
	//--> <1 2 3>의 시작페이지는 1 , <4 5 6>은 4 이런식
	int endPage = ( (curpage-1)/BLOCK*BLOCK )+BLOCK; 
	
	if(endPage>totalPage)
		endPage = totalPage; //totalPage=5 endPage=6 이면 -> endPage=5
		
	//오늘 날짜
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:960px;
	}
	h1{
		text_align:center;
	}
</style>
</head>
<body>

	<div class="container">
		<h1>자유게시판</h1>
		
		<div class="row">
			<table class="table">
				<tr>
					 <td> <a href="insert.jsp" class="btn btn-sm btn-success">새글</a></td>
					 <td class="text-right" width=30%>
						<form action="search_impl.jsp" method="get">
								<input type="text" class="form-control pull-right" placeholder="Search" name="search"/>
	 						</td>
	 						<td>	
	 							<button class="btn btn-sm btn-primary glyphicon glyphicon-search" type="submit"/>
	 						</td>
						</form>
				</tr>
			</table>
			
			<table class="table">
				<tr class="success">
					<th class="text-center" width=10%>번호</th>
					<th class="text-center" width=45%>제목</th>
					<th class="text-center" width=15%>이름</th>
					<th class="text-center" width=20%>작성일</th>
					<th class="text-center" width=10%>조회수</th>
				</tr>
				<%
					for(BoardVO vo : list){
				%>
				<tr>
					<td class="text-center" width=10%><%=vo.getNo()%></td>
					<td width=45%>
						<a href="detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject()%></a>&nbsp;
						<sup style="color:red">new</sup>
					</td>
					<td class="text-center" width=15%><%=vo.getName()%></td>
					<td class="text-center" width=20%><%=vo.getDbday()%></td>
					<td class="text-center" width=10%><%=vo.getHit()%></td>
				<tr>
				<%
					}
				%>
			</table>
		</div>
		
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<%
					if(startPage > 1){//4,7
				%>
				  <li><a href="list.jsp?page=<%=startPage-1%>">&lt;</a></li>
				  <%
					}
				  %>
				  <%
				  	for(int i=startPage; i<=endPage;i++){
				  		String act="";
				  		if(curpage==i)
				  			act="class=active";
				  		else
				  			act="";
			      %>
					<li <%=act%>><a href="list.jsp?page=<%=i%>"><%=i%></a></li>
		  		  <%
				  	}
				  %>
				  <%
				  	if(endPage<totalPage){
				  %>
				 	 <li><a href="list.jsp?page=<%=endPage+1%>">&gt;</a></li>
				  <%
				  	}
				  %>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>