<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../inc/top.jsp"%>
<style>
#bookMain{
	width: 100%;
}

#topImg{
	width: 100%;
	margin: 0;
	padding: 0;
}

#topImg img{
	width: 100%;
	height: 500px;
}

#pdList{
	margin-top: 50px;
	width: 1300px;
	text-align: center;
}
#pdList h1{
	text-align: center;
	
}
#pdList ul{
	width: 1300px;
	text-align: center;
	display: flex;
    justify-content: space-around;
}

#pdList ul li img{
	width: 250px;
	height: 300px;
}

#bookMain .container {
	margin: 0 auto;
	width: 100%;
}

#content {
	width: 100%;
	border: 2px dotted green;
	padding: 18px;
	margin-left: 215px;
	color: darkgrey;
}

#sidebar {
	border: 2px dotted red;
	float: left;
	width: 200px;
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
<section id="bookMain" class="book">
	<div class="container clearfix" style="position: relative;">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner" style="position: relative;">
				<div>
					<ul>
					  <li><a href="#home">Home</a></li>
					  <li><a href="#news">News</a></li>
					  <li><a href="#contact">Contact</a></li>
					  <li><a href="#about">About</a></li>
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
			<div id="pdList">
				<h1 class="display-3">도 서 구 매</h1>
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
	</div>

	
	
	<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
	<script type="text/javascript">
		var a = new StickySidebar('#sidebar', {
			topSpacing : 200,
			containerSelector: '.container'
		});
		
	</script>
</section>

<%@ include file="../../inc/bottom.jsp"%>
