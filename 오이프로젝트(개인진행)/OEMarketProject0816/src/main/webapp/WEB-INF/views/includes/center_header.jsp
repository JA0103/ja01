<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/resources/assets/css/owl-carousel.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">
.center__header{height: 150px; padding-top: 50px; border-bottom: 1px solid #999;}
.center__logo{width: 60px; height: 60px; margin-top: -3px; cursor: pointer;}
.center__title__left{margin-left: -16px; padding-top: 16px; cursor: pointer; font-size: 45px; font-family: 'Jua' !important;}
.center__title__right{margin: 1px 0 0 -41px;}
.center__search{width: 500px; float: right;}
.center__searchIcon{width: 45px; height: 45px; cursor: pointer;}

.center__header__bottom{padding: 16px 0 9px 0; border-bottom: 1px solid #999;}
.center__header__bottom a{cursor: pointer;}

tbody{background-color: white;}
.center__body{padding-top: 90px;}
.center__table{margin-top: -50px;}
.center__thead{text-align: center;}
.column__width__80{width: 80px;}
.column__width__160{width: 160px;}
.center__select__form{margin: -5px 0 0 30px; width: 200px;}
.center__select__text{margin: 5px 0 0 -60px;}

.center__hyperlink{text-decoration: none; font-weight: bold; color: #597; cursor: pointer;}
.center__hyperlink:hover{text-decoration: none; font-weight: bold; color: #375;}

.card__admin{cursor: pointer;}
.card__imgArea{margin: 30px 60px -10px 60px;}
.card__admin__title{padding: 20px 0 10px 0; font-size: 20px; font-weight: bold;}
</style>
</head>
<body>
<header class="center__header">
	<div class="container">
		<div class="row">
			<div class="col-1">
				<img class="center__logo" src="/resources/assets/images/cucumber.png"
				 title="오이마켓 메인페이지로" onclick="location.href='/'">
			</div>
			<div class="col-2">
				<p class="center__title__left" title="오이마켓 메인페이지로" onclick="location.href='/'">오이마켓</p>
			</div>
			<div class="col-2"><p class="h1 center__title__right">고객센터</p></div>
			<div class="col-6">
				<input class="form-control center__search" type="text" placeholder="도움말을 검색하여 궁금한 점을 해결해보세요."
				 onfocus="this.placeholder=''" onblur="this.placeholder='도움말을 검색하여 궁금한 점을 해결해보세요.'">
			</div>
			<div class="col-1">
				<img class="center__searchIcon" src="/resources/assets/images/search.png"
				 title="검색하기">
			</div>
		</div>
	</div>
</header>

<form action="/center/center" method="get" id="goToCenterMain">
	<c:if test="${us_id != null }"><input type="hidden" name="us_id" value='<c:out value="${us_id }" />'></c:if>
</form>
<form action="/center/FAQ" method="get" id="goToFAQList">
	<c:if test="${us_id != null }"><input type="hidden" name="us_id" value='<c:out value="${us_id }" />'></c:if>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>