<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이마켓</title>
<!-- Link -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/owl-carousel.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">


</head>
<body>
	<!-- Header -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- logo -->
                        <a href="#"><i class="fa fa-bars"></i></a>
                        <a href="#"><i class="fa fa-search"></i></a>
                        <a href="${contextPath}/" class="logo">
                            <img src="/resources/assets/images/logo.png" alt="오이마켓">
                        </a>
                        <!--// logo-->
                        <!-- menu -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#popular">상품보기</a></li>
                            <li class="scroll-to-section"><a href="#customer">고객센터</a></li>
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
											<li><a href="${contextPath}/mypage/NewFile?my_id=<c:out value='${login.us_id }'/>"
											>${login.us_nickname }님</a></li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<li><a href="${contextPath}/login">로그인</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--// header-->