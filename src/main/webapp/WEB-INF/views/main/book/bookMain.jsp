<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp"%>
=======

<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
>>>>>>> parent of 263901a (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
<style>

#topImg {
	width: 1300px;
	height: 500px;
	text-align: center;
}

img {
	width: 1300px;
	height: 500px;
}

#leftNavi dt {
	padding: 7px 5px 25px 20px;
	font-weight: bold;
}

#leftNavi dd {
	padding-left: 10px;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
#pdList{
	margin-top: 50px;
	width: 1300px;
	text-align: center;
<<<<<<< HEAD
}
.pdList h1{
	text-align: center;
	
}
.pdList ul{
=======
}
#pdList h1{
	text-align: center;
	margin-left: 600px;
}
#pdList ul{
>>>>>>> parent of 263901a (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
	width: 1300px;
	text-align: center;
	display: flex;
    justify-content: space-around;
<<<<<<< HEAD
}

.pdList ul li img{
	width: 150px;
	height: 250px;
}

#bookMain .container {
	margin: 0 auto;
	width: 100%;
}

#content {
	    width: 1420px;
	border: 2px dotted green;
	margin-left: 215px;
	color: darkgrey;
}

#sidebar {
	border: 2px dotted red;
	float: left;
	color: #ffbdbd;
	will-change: min-height;
}

#sidebar .sidebar__inner {
	position: relative;
	transform: translate(0, 0);
	transform: translate3d(0, 0, 0);
	will-change: position, transform;
}

.clearfix:after {
	display: block;
	content: "";
	clear: both;
}


#bookSellMainImg{
	width:100%;
	height: 500px;
	margin: 0;
	padding: 0;
	margin-bottom: 200px;
	
}
#bookSellMainImg img{
	width:1920px;
	height: 600px;
	margin: 0;
	padding: 0;
}

.container .clearfix{
	margin-left: 0;
	margin-right: 0;
}
#sidebar ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 150px;
  background-color: #f1f1f1;
}

#sidebar li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

/* Change the link color on hover */
#sidebar li a:hover {
  background-color: #555;
  color: white;
}
</style>

</head>

<body>
	<header>
		<div class="container">
			<h1>Site Title</h1>
		</div>
	</header>
=======
    margin-left: 308px;
}

#pdList ul li img{
	width: 250px;
	height: 300px;
}
</style>
<%@ include file="../inc/top.jsp"%>

>>>>>>> parent of 263901a (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
<section id="bookMain" class="book">
	<div style="float: left;">
		<nav style="margin-top: 300px; background: #dddddd;">
			<dl id="leftNavi" style="width: 90px; padding: 0 0 0 0;">
				<!-- category list -->
				<dt>도 서</dt>
				<dd>
					<a href="#">검사자료</a>
				</dd>
				<dd>
					<a href="#">도 서</a>
				</dd>
				<dd>
					<a href="#">기 타</a>
				</dd>
			</dl>
		</nav>
	</div>
<<<<<<< HEAD
	<div id="containerWrap" class="container clearfix" style="margin-left: 0;
	margin-right: 0;position: relative">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner" style="position: relative;">
				<div>
					<ul>
					  <li><a href="#home">검 사 자 료</a></li>
					  <li><a href="#news">도 서</a></li>
					  <li><a href="#contact">기 타 교 구</a></li>
					</ul>
				</div>
				<div class="resize-sensor"
					style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
					<div class="resize-sensor-expand"
						style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
						<div
							style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
						</div>
					</div>
					<div class="resize-sensor-shrink"
						style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
						<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div id="topImg" style="text-align: center;">
				<img src="<c:url value='/images/72939_11192_2044.jpg'/>">
			</div>
			<div class="pdList">
				<h1 class="display-3">도서부분 인기상품</h1>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="<c:url value='/main/book/bookDetail'/>">
							 <img src="<c:url value='/images/bookProduct/20024.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20025.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20026.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
				</ul>
			</div>
			<div class="pdList">
				<h1 class="display-3">검사자료부분 인기상품</h1>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="<c:url value='/main/book/bookDetail'/>">
							 <img src="<c:url value='/images/bookProduct/20024.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20025.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20026.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
				</ul>
			</div>
			<div class="pdList">
				<h1 class="display-3">기타교구부분 인기상품</h1>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="<c:url value='/main/book/bookDetail'/>">
							 <img src="<c:url value='/images/bookProduct/20024.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20025.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20026.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
							<figcaption>
								<h5 class="aa-product-title">
									<a href="#"></a>
								</h5>
								<span class="aa-product-price">1700원</span>
		
							</figcaption>
						</figure>
					</li>
				</ul>
			</div>
		</div>
		<div class="resize-sensor"
			style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
			<div class="resize-sensor-expand"
				style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div
					style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
				</div>
			</div>
			<div class="resize-sensor-shrink"
				style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
			</div>
		</div>
=======
	<div class="topImg" style="text-align: center;">
		<img style="margin-right: 84px;" src="<c:url value='/images/72939_11192_2044.jpg'/>">
>>>>>>> parent of 263901a (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
	</div>
	<div id="pdList">
		<h1 class="display-3">도 서 구 매</h1>
		<ul class="aa-product-catg">
			<!-- start single product item -->
			<li>
				<figure>
					<a class="aa-product-img" href="">
					 <img src="<c:url value='/images/bookProduct/20024.jpg'/>" alt="">
					</a>
					<a class="aa-add-card-btn" href="">
						<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
					<figcaption>
						<h5 class="aa-product-title">
							<a href="#"></a>
						</h5>
						<span class="aa-product-price">1700원</span>

					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<a class="aa-product-img" href="">
					 <img src="<c:url value='/images/bookProduct/20025.jpg'/>" alt="">
					</a>
					<a class="aa-add-card-btn" href="">
						<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
					<figcaption>
						<h5 class="aa-product-title">
							<a href="#"></a>
						</h5>
						<span class="aa-product-price">1700원</span>

					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<a class="aa-product-img" href="">
					 <img src="<c:url value='/images/bookProduct/20026.jpg'/>" alt="">
					</a>
					<a class="aa-add-card-btn" href="">
						<span style="display: block;" class="fas fa-shopping-cart"></span>장바구니 담기</a>
					<figcaption>
						<h5 class="aa-product-title">
							<a href="#"></a>
						</h5>
						<span class="aa-product-price">1700원</span>

					</figcaption>
				</figure>
			</li>
		</ul>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>