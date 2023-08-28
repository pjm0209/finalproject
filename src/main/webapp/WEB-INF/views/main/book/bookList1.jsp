<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
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
	font-weight: bold;
	text-decoration: none;
}

/* Change the link color on hover */
#sidebar li a:hover {
	background-color: #555;
	color: white;
}

#content {
	width: 1420px;
	color: darkgrey;
}
/* #bookSellMainImg{
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
} */
.bookslide {
	width: 100%;
	height: 600px;
	overflow: hidden;
	position: relative;
}

.bookslide .gallery {
	width: 400%;
	display: flex;
	position: absolute;
	top: 0;
	left: 0%;
}

.bookslide .gallery li {
	height: 600px;
	width: 100%;
}

.bookslide .gallery li img {
	width: 100%;
	height: 100%;
}
/* 책 리스트 */
ul, li {
	list-style: none;
}

* {
	margin: 0;
	padding: 0;
}

.flex {
	display: flex;
	justify-content: space-between;
}

#section {
	width: 1420px;
	border-top: 2px #ee7843 solid;
	border-bottom: 2px #ee7843 solid;
	padding: 30px 0;
	margin: 30px 0 0 215px;
}

.booklist li:first-child {
	border-top: 1px #aaa solid;
}

.booklist li {
	border-bottom: 1px #aaa solid;
	padding: 30px 30px;
	align-items: center;
}

.booklist li .title {
	padding-left: 30px;
	align-items: center;
}

.booklist li .title>a {
	border: 1px #eee solid;
}

.booklist li .title div {
	padding-left: 30px;
}

.booklist li .title div .box {
	background: #ee7843;
	color: white;
	padding: 5px;
	display: inline;
}

.booklist li .title div p:not(.box) {
	font-weight: bold;
	font-size: 18px;
	color: #666;
	padding-top: 30px;
}

.booklist li .title div p:not(.box) span {
	color: darkslateblue;
}

.booklist li .title div a {
	display: block;
	font-size: 22px;
	font-weight: bold;
	padding-top: 10px;
}

.booklist li .btn a {
	display: block;
	padding: 15px;
	border-radius: 5px;
	background: #666;
	color: white;
}

.booklist li .btn a:nth-child(2) {
	background: #ee7843;
	margin-top: 5px;
}
</style>

<script type="text/javascript">
$(function(){
	function slideImg(){
		$('.gallery').animate({left:'-100%'},1500,function(){
			$('.gallery li:first').appendTo('.gallery');
			$('.gallery').css({left:'0%'});
		});
	}
	setInterval(slideImg,10000);
});


</script>
<section>
	<div id='bookSellMainImg' class=" bookslide">
			<ul class="gallery">
				<li><img src="<c:url value='/images/bookProduct/slide_01.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_02.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_03.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_04.jpg'/>"></li>
			</ul>
	</div>
	<div style="padding-left: 240px;margin-top: 50px;">
		<a href="/mbti/main/index"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="/mbti/main/book/bookMain">도서 / 자료 구매</a>
		/
		<a href="/mbti/main/book/bookMain">검사 자료</a>
	</div>
	<h2 style="margin-left: 236px;margin-top: 20px">검사자료 구매</h2>
	<div id="containerWrap" class="container clearfix" style="margin-left: 0;margin-right: 0;position: relative">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner shadow-sm bg-body rounded"  style="position: relative;">
				<div>
					<ul>
					  <li><a href="<c:url value='/main/book/bookList1'/>">검 사 자 료</a></li>
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
		<div id="section">
			<div id="content">
				<ul class="booklist" style="padding-left:0;">
					<li class="flex">
						<div class="flex title">
							<a href="#"><img alt="#" src="<c:url value='/images/bookProduct/20024.jpg'/>"></a>
							<div>
								<p class="box">검사자료</p>
								<a href="#">MBTI Form M 자가채점용</a>
								<p><span>가격 | </span>1부~9부 : 7,300원 / 10부~99부 : 6,800원 / 100부~ : 6,300원</p>
							</div>
							
						</div>
						<div class="btn">
							<a href="#">장바구니</a>
							<a href="#">바로구매</a>
						</div>
					</li>
					<li class="flex">
						
						<div class="flex title">
							<a href="#"><img alt="#" src="<c:url value='/images/bookProduct/20025.jpg'/>"></a>
							<div>
								<p class="box">검사자료</p>
								<a href="#">MBTI Form M 자가채점용</a>
								<p><span>가격 | </span>1부~9부 : 7,300원 / 10부~99부 : 6,800원 / 100부~ : 6,300원</p>
							</div>
							
						</div>
						<div class="btn">
							<a href="#">장바구니</a>
							<a href="#">바로구매</a>
						</div>
					</li>
					<li class="flex">
						
						<div class="flex title">
							<a href="#"><img alt="#" src="<c:url value='/images/bookProduct/20026.jpg'/>"></a>
							<div>
								<p class="box">검사자료</p>
								<a href="#">MBTI Form M 자가채점용</a>
								<p><span>가격 | </span>1부~9부 : 7,300원 / 10부~99부 : 6,800원 / 100부~ : 6,300원</p>
							</div>
							
						</div>
						<div class="btn">
							<a href="#">장바구니</a>
							<a href="#">바로구매</a>
						</div>
					</li>
					<li class="flex">
						
						<div class="flex title">
							<a href="#"><img alt="#" src="<c:url value='/images/bookProduct/20027.jpg'/>"></a>
							<div>
								<p class="box">검사자료</p>
								<a href="#">MBTI Form M 자가채점용</a>
								<p><span>가격 | </span>1부~9부 : 7,300원 / 10부~99부 : 6,800원 / 100부~ : 6,300원</p>
							</div>
							
						</div>
						<div class="btn">
							<a href="#">장바구니</a>
							<a href="#">바로구매</a>
						</div>
					</li>
					<li class="flex">
						
						<div class="flex title">
							<a href="#"><img alt="#" src="<c:url value='/images/bookProduct/20028.jpg'/>"></a>
							<div>
								<p class="box">검사자료</p>
								<a href="#">MBTI Form M 자가채점용</a>
								<p><span>가격 | </span>1부~9부 : 7,300원 / 10부~99부 : 6,800원 / 100부~ : 6,300원</p>
							</div>
							
						</div>
						<div class="btn">
							<a href="#">장바구니</a>
							<a href="#">바로구매</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="resize-sensor" style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: 	hidden;">
				<div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; 		overflow: hidden; z-index: -1; visibility: hidden;">
					<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; 				height: 100000px;">
					</div>
				</div>
				<div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; 			overflow: hidden; z-index: -1; visibility: hidden;">
					<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
				</div>
			</div>
			<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
			<script type="text/javascript">
				var a = new StickySidebar('#sidebar', {
					topSpacing : 400
				});
				
			</script>
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>