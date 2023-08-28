<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<%@ include file="../inc/top.jsp"%>
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

.pdList{
	margin-top: 50px;
	width: 1300px;
	
}
.pdList>a{
	text-align: left;
	font-weight:bold;
	font-size:26px;
	color:#222;
	text-decoration: none;
}
.pdList>a span{
	font-size:38px;
	vertical-align:text-bottom;
}
.pdList ul{
	width: 1300px;
	text-align: center;
	display: flex;
    justify-content: space-around;
    list-style:none;
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
	
	margin-left: 215px;
	color: darkgrey;
}

#sidebar {
	
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

.flex{display:flex; justify-content:space-between;}

.flex .bestbook{background:#efefef; padding:40px 40px; width:70%;}
.flex .bestbook .textbox p:nth-child(1){font-size:}

.flex .bestbook>img{width:40%;}
.flex .bestbook .textbox{color:#222; width:48%;}
.flex .bestbook .textbox p:nth-child(1){font-size:30px; font-weight:bold; padding:30px 0;}
.flex .bestbook .textbox p:nth-child(2){font-size:24px; padding-bottom:30px;}
.flex .bestbook .textbox p:nth-child(3){font-size:20px; color:red; font-weight:bold; padding-bottom:50px;}
.flex .bestbook .textbox button{width:100%; border:3px solid #eb5d1e; background:#fff; color:#eb5d1e; font-weight:bold; padding:10px; font-size:20px; border-radius:5px;}

.flex .booksearch {border:1px #efefef solid; padding:20px; border-left:none;}
.flex .booksearch>img{width:100%; margin-top: 30px; margin-bottom:85px;}
.flex .booksearch input{border-right:none; height:50px; border:#eb5d1e 1px solid; margin-left:20px; width:85%;}
.flex .booksearch button{height:50px; vertical-align:top; color:white; background:#eb5d1e; border:0;}
.flex .booksearch span{font-size:50px;}

ul,li{list-style:none;}
/* #bookSellMainImg{
	width:100%;
	height: 500px;
	margin: 0;
	padding: 0;
	margin-bottom: 200px;
	
} */
/* #bookSellMainImg img{
	width:1920px;
	height: 600px;
	margin: 0;
	padding: 0;
} */

.bookslide{width:100%; height:600px; overflow:hidden; position:relative;}
.bookslide .gallery{width:400%; display:flex; position:absolute; top:0; left:0%;}
.bookslide .gallery li{height:600px; width:100%; }
.bookslide .gallery li img{width:100%; height:100%;}
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
  font-weight:bold;
  text-decoration: none;
}

/* Change the link color on hover */
#sidebar li a:hover {
  background-color: #555;
  color: white;
}

.sideBarBestBook{
	position: absolute;
    right: 0;
    top: 760px;
    margin-right: 10px;
    text-align: center;
}

.sideBarBestBook #sidebar li img{
	width: 80px;
	vertical-align: middle;
}

.sideBarBestBook #sidebar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 150px;
	background-color: #efefef;
}

.sideBarBestBook #sidebar li  {
	display: block;
	color: #ee7843;
	padding: 8px 16px;
	font-weight: bold;
	text-decoration: none;
}

/* Change the link color on hover */
.sideBarBestBook li a:hover {
	background-color: #555;
	color: white;
}
</style>

<script type="text/javascript">
$(function(){
	
	$(window).scroll(function(){
		var sc = $(this).scrollTop();
		
		
		if( sc > 500){
			$('.sideBarBestBook').css({position:'fixed', top:200,})
		} else{
			$('.sideBarBestBook').css({position:'absolute', top:760,})
		} 
	});
	
	
	
	function slideImg(){
		$('.gallery').animate({left:'-100%'},1500,function(){
			$('.gallery li:first').appendTo('.gallery');
			$('.gallery').css({left:'0%'});
		});
		
		
	}
	
	setInterval(slideImg,3000);
	
	
})
</script>

<section id="bookMain" class="book">
	<div id='bookSellMainImg' class=" bookslide">
		<ul class="gallery">
			<li><img src="<c:url value='/images/bookProduct/slide_01.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_02.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_03.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_04.jpg'/>"></li>
		</ul>
		
		
	</div>
	<div style="padding-left: 240px;margin-top: 50px;">
		<a href="<c:url value='/main/index'/>"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="<c:url value='/main/book/bookMain'/>">도서 / 자료 구매</a>
	</div>
	<div id="containerWrap" class="container clearfix" style="margin-left: 0;
	margin-right: 0;position: relative">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner shadow-sm bg-body rounded"  style="position: relative;">
				<div>
					<ul>
					  <li><a href="<c:url value='/main/book/bookList1'/>">검 사 자 료</a></li>
					  <li><a href="<c:url value='/main/book/bookList1'/>">도 서</a></li>
					  <li><a href="<c:url value='/main/book/bookList1'/>">기 타 교 구</a></li>
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
			<%-- <div id="topImg" style="text-align: center;">
				<img src="<c:url value='/images/72939_11192_2044.jpg'/>">
			</div> --%>
			
			<div class="flex">
				<div class="bestbook flex">
					 <img src="<c:url value='/images/bookProduct/20025.jpg'/>" alt="">
					 <div class="textbox">
					 	<p>MBTI Form M 자가채점용</p>
					 	<p>MBTI Form M 자가채점용은 검사지, 답안지, 프로파...</p>
					 	<p>18,000원</p>
					 	<button>구매하기</button>
					 </div>
				</div>
				<div class="booksearch">
					<img src="<c:url value='/images/searchBook2.jpg'/>" alt="책검색이미지">
					<input type="text"><button type="submit"><span class="material-symbols-outlined">
search
</span></button>
				</div>
			</div>  
			<div class="pdList">
				<a href="#" class="display-3">도서부분 인기상품<span class="material-symbols-outlined">
chevron_right
</span></a>
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
					<li>
						<figure>
							<a class="aa-product-img" href="">
							 <img src="<c:url value='/images/bookProduct/20027.jpg'/>" alt="">
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
				<a href="#" class="display-3">검사자료부분 인기상품<span class="material-symbols-outlined">
chevron_right
</span></a>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="<c:url value='/main/book/bookDetail'/>">
							 <img src="<c:url value='/images/bookProduct/20028.jpg'/>" alt="">
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
							 <img src="<c:url value='/images/bookProduct/20029.jpg'/>" alt="">
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
							 <img src="<c:url value='/images/bookProduct/20030.jpg'/>" alt="">
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
							 <img src="<c:url value='/images/bookProduct/20031.jpg'/>" alt="">
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
				<a href="#" class="display-3">기타교구부분 인기상품<span class="material-symbols-outlined">
chevron_right
</span></a>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="<c:url value='/main/book/bookDetail'/>">
							 <img src="<c:url value='/images/bookProduct/20032.jpg'/>" alt="">
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
							 <img src="<c:url value='/images/bookProduct/20033.jpg'/>" alt="">
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
							 <img src="<c:url value='/images/bookProduct/20034.jpg'/>" alt="">
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
			topSpacing : 200
		});
		
	</script>
</section>
<nav class="sideBarBestBook">
			<div id="sidebar" class="" style="">
			<div class="sidebar__inner shadow-sm bg-body rounded" style="position: relative;">
				<div>
					<ul>
						<li>이 분야 베스트3</li><br>
						<li>
							<i class="bi bi-1-square-fill"></i><br>
							<img src="<c:url value='/images/bookProduct/1.jpg'/>">
							<div>책 이름 넣기</div>
						</li>
						<li>
							<i class="bi bi-2-square-fill"></i></i><br>
							<img src="<c:url value='/images/bookProduct/1.jpg'/>" >
							<div>책 이름 넣기</div>
						</li>
						<li>
							<i class="bi bi-3-square-fill"></i></i><br>
							<img src="<c:url value='/images/bookProduct/1.jpg'/>">
							<div>책 이름 넣기</div>
						</li>
					</ul>
				</div>
				
			</div>
			
		</div>
		</nav>	

<%@ include file="../inc/bottom.jsp"%>
