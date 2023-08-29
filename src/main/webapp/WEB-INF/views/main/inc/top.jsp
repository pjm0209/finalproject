<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<!-- chart meta -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	  
	<c:set var="path" value="${pageContext.request.contextPath }"/>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/admin-css-js/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
  <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
  <link href="${path }/images/감사콩로아콘.png" rel="shortcut icon" type="image/x-icon">
  <title>ESSENTIAL MBTI</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons --ㅎ
  <link href="${path }/assets/img/favicon.png" rel="icon">
  <link href="${path }/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
  
  <!-- kakao -->
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
<!-- Vendor CSS Files -->
  <link href="${path }/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${path }/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path }/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path }/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path }/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${path }/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
	<!-- Custom styles for this template-->
	<link href="<c:url value='/admin-css-js/css/sb-admin-2.css'/>" rel="stylesheet">
	<link href="<c:url value='/admin-css-js/css/mbti.css'/>" rel="stylesheet">
	<link href="<c:url value='/admin-css-js/css/education.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/admin-css-js/css/board.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/admin-css-js/css/boardCreate.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/admin-css-js/css/book-order.css'/>" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>	
	
	<!-- chart js css -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

  <!-- Template Main CSS File -->
  <link href="${path }/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Ninestars
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="${path }/main/index"><span>ESSENTIAL MBTI</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="<c:url value='/main/index'/>">메인</a></li>
          <li><a class="nav-link scrollto" href="#about">About Us</a></li>
          <li class="dropdown"><a class="nav-link scrollto" href="#"><span>MBTI 교육</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
			  <li><a href="<c:url value='/main/education/info'/>">교육 소개</a></li>            
			  <li><a href="<c:url value='/main/education/list'/>">교육 목록</a></li>            
			  <li><a href="<c:url value='/main/education/location'/>">교육장 위치</a></li>            
            </ul>
          </li>
          <li class="dropdown"><a class="nav-link scrollto" href="#"><span>MBTI</span> <i class="bi bi-chevron-down"></i></a>
          	<ul>
			  <li><a class="nav-link scrollto" href="<c:url value='/main/mbti/mbti'/>">MBTI 검사</a></li>            
			  <li><a class="nav-link scrollto" href="<c:url value='/main/mbti/mbtiStatistics'/>">MBTI 통계</a></li>            
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="<c:url value='/main/book/bookMain'/>">도서/자료 구매</a></li>
          <li class="dropdown"><a class="nav-link scrollto" href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
			  <c:import url="/main/board/boardFormList"></c:import>              
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="<c:url value='/main/mypage/mypage'/>">마이페이지</a></li>
          <li><a class="nav-link scrollto">${sessionScope.userid}</a></li>
       	  <!-- 로그인 안된 경우 -->
		  <c:if test="${empty sessionScope.userid }">			
			<li><a class="getstarted scrollto" href="<c:url value='/main/member/memberLogin'/>">로그인</a></li>
		  </c:if>
		  <!-- 로그인 된 경우 -->
		  <c:if test="${!empty sessionScope.userid }">
			<li><a class="getstarted scrollto" href="<c:url value='/main/logout'/>">로그아웃</a></li>
		  </c:if>			
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->