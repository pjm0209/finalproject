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
	<c:set var="path" value="${pageContext.request.contextPath }"/>

  <link href="${path }/images/감사콩로아콘.png" rel="shortcut icon" type="image/x-icon">
  <title>ESSENTIAL MBTI</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons --ㅎ
  <link href="${path }/assets/img/favicon.png" rel="icon">
  <link href="${path }/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">


  <!-- Vendor CSS Files -->
  <link href="${path }/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${path }/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path }/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path }/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path }/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${path }/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">


  <!-- Template Main CSS File -->
  <link href="${path }//assets/css/style.css" rel="stylesheet">

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
          <li><a class="nav-link scrollto" href="#services">책</a></li>
          <li><a class="nav-link scrollto" href="#portfolio">MBTI 교육</a></li>
          <li><a class="nav-link scrollto" href="<c:url value='/main/mbti'/>">MBTI 검사</a></li>
          <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="<c:url value='/main/myPage'/>">마이페이지</a></li>
          <li><a class="getstarted scrollto" href="#about">Get Started</a></li>
          <li><a class="nav-link scrollto" href="<c:url value='/main/login'/>">로그인</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
