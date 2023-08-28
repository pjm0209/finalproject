<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
	.modal{
		position: fixed;
	    top: 70px;
	    left: 700;
	    z-index: 1050;
	    display: none;
	    width: 100%;
	    height: 84%;
	    overflow: hidden;
	    outline: 0;
    }
>>>>>>> parent of b1adafa (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
</style>
<%@ include file="../inc/top.jsp"%>

<<<<<<< HEAD
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
>>>>>>> branch 'main' of https://github.com/pjm0209/finalproject.git

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
	<div id="containerWrap" class="container clearfix" style="margin-left: 0; margin-right: 0;position: relative">
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
					<div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
						<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
						</div>
					</div>
					<div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
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
					<input type="text">
						<button type="submit">
							<span class="material-symbols-outlined">search</span>
						</button>
				</div>
			</div>  
			<div class="pdList">
				<a href="#" class="display-3">
					도서부분 인기상품
					<span class="material-symbols-outlined">chevron_right</span>
				</a>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="<c:url value='/main/book/bookDetail'/>">
								<img src="<c:url value='/images/bookProduct/20024.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>
								장바구니 담기
							</a>
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
								<span style="display: block;" class="fas fa-shopping-cart"></span>
								장바구니 담기
							</a>
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
								<span style="display: block;" class="fas fa-shopping-cart"></span>
								장바구니 담기
							</a>
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
								<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
							</a>
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
				<a href="#" class="display-3">
					검사자료부분 인기상품
					<span class="material-symbols-outlined">
					chevron_right
					</span>
				</a>
				<ul class="aa-product-catg">
					<!-- start single product item -->
					<li>
						<figure>
							<a class="aa-product-img" href="">
								<img src="<c:url value='/images/bookProduct/20028.jpg'/>" alt="">
							</a>
							<a class="aa-add-card-btn" href="">
								<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
							</a>
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
								<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
							</a>
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
								<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
							</a>
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
								<span style="display: block;" class="fas fa-shopping-cart"></span>
								장바구니 담기
							</a>
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
				<a href="#" class="display-3">
					기타교구부분 인기상품
					<span class="material-symbols-outlined">
						chevron_right
					</span>
				</a>
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
		<div class="resize-sensor" style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
			<div class="resize-sensor-expand"
				style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
				</div>
			</div>
			<div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
			</div>
		</div>
	</div>
	<!-- open sidebarAPI 호출부분 -->
	<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
	<script type="text/javascript">
		var a = new StickySidebar('#sidebar', {
			topSpacing : 200
		});
		
	</script>
	<!--  -->
</section>
<!-- 직접 만든 sidebar -->
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
<!--  -->

<<<<<<< HEAD
<%@ include file="../inc/bottom.jsp"%>
=======
<%@ include file="../inc/bottom.jsp"%>
=======
<section id="bookMain" class="book">
	<div style="width: 1000px;height: 800px;">
		<!-- Modal HTML embedded directly into document -->
		<div id="ex1" class="modal">
		  <p>Thanks for clicking. That felt good.</p>
		  <a href="#" rel="modal:close">Close</a>
		</div>
		
		<!-- Link to open the modal -->
		<p><a href="#ex1" rel="modal:open">Open Modal</a></p>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
>>>>>>> parent of b1adafa (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
>>>>>>> branch 'main' of https://github.com/pjm0209/finalproject.git
