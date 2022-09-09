<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이마켓</title>
<!-- Link -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/resources/assets/css/owl-carousel.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


</head>
<body>
	<!-- Header -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- category -->
						<div class="dropdown custom-dropdown">
                          <a href="#" data-toggle="dropdown" class="dropdown-link text-left" aria-haspopup="true" aria-expanded="false" data-offset="0, 20">
                            <i class="fa fa-bars" aria-hidden="true"></i>
                          </a>
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#"><i class="fa fa-book" aria-hidden="true"></i> 도서/티켓/문구</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-music" aria-hidden="true"></i> 음반/악기</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-paint-brush" aria-hidden="true"></i> 예술/희귀/수집품</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 여성의류</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 남성의류</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 신발</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-briefcase" aria-hidden="true"></i> 가방</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 시계</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 쥬얼리</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-bed" aria-hidden="true"></i> 가구/인테리어</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-car" aria-hidden="true"></i> 차량/오토바이</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 키덜트</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 생활용품</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-paw" aria-hidden="true"></i> 반려동물용품</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-exclamation" aria-hidden="true"></i> 기타</a>
                          </div>
                          
                          <a href="${contextPath}/board/boardListOrderByHeart" class="search_btn"><i class="fa fa-search"></i></a>
						<!-- logo -->
						<a href="${contextPath}/" class="logo">
							<img src="/resources/assets/images/cucumber.png" alt="오이마켓">
							<span>오이마켓</span>
						</a>
						<!--// logo-->
						<!-- menu -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#popular">상품보기</a></li>
							<li class="scroll-to-section">
							<c:choose>
								<c:when test="${login.us_id != null }">
									<a href='/center/center?us_id=<c:out value="${login.us_id }" />' style="cursor: pointer;">고객센터</a>
								</c:when>
								<c:otherwise>
									<a href='/center/center' style="cursor: pointer;">고객센터</a>
								</c:otherwise>
							</c:choose>
							</li>
							<c:choose>
								<c:when test="${isLogOn==true and not empty login}">
									<c:choose>
										<c:when test="${ login.us_id=='admin' }">
											<li><a href="${contextPath}/logout">로그아웃</a></li>
											<li><a href="${contextPath}/adminMode">관리자</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="${contextPath}/logout">로그아웃</a></li>
											<li><a href="${contextPath}/mypage/mypage?my_id=<c:out value='${login.us_id }'/>"
											>${login.us_nickname }님</a></li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<li><a href="${contextPath}/login">로그인</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
                        </div>							
						
					</nav>
				</div>
			</div>
		</div>
	</header>
	
	<!--// header-->
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>