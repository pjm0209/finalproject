<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<section id="bookMain" class="book">
	<div id='bookSellMainImg' class=" bookslide shadow-sm p-3 mb-5 bg-body rounded">
		<ul class="gallery" style="padding-left: 0;">
			<li><img src="<c:url value='/images/bookProduct/slide_01.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_02.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_03.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_04.jpg'/>"></li>
			<!--추가 이미지  -->
			<li><img src="<c:url value='/images/bookProduct/bookMain1.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/bookMain2.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/bookMain3.jpg'/>"></li>
			<!--  -->
		</ul>
	</div>
	<div style="padding-left: 240px; margin-bottom:20px;">
		<a href="<c:url value='/main/index'/>"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="<c:url value='/main/book/bookMain'/>">도서 / 자료 구매</a>
	</div>
	<div id="containerWrap" class="container clearfix" style="margin-left: 0; margin-right: 0;position: relative">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner shadow-sm bg-body rounded"  style="position: relative;">
				<div>
					<ul>
					  <li><a href="<c:url value='/main/book/bookList1?bookCategory=검사자료'/>">검 사 자 료</a></li>
					  <li><a href="<c:url value='/main/book/bookList1?bookCategory=도서'/>">도 서</a></li>
					  <li><a href="<c:url value='/main/book/bookList1?bookCategory=기타'/>">기 타 교 구</a></li>
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
					 <img src="<c:url value='/images/bookProduct/1.jpg'/>" alt="">
					 <div class="textbox">
					 	<p>MBTI Form M<br> 자가채점용</p>
					 	<p>MBTI Form M 자가채점용은<br> 검사지, 답안지, 프로파...</p>
					 	<p>18,000원</p>
					 	<button onclick="location.href='bookDetail?bookNo=1'">구매하기</button>
					 </div>
				</div>
				<div class="booksearch">
					<img src="<c:url value='/images/searchBook2.jpg'/>" alt="책검색이미지">
					<input name="searchKeyword" type="text"style="margin-top: 26px;" placeholder="저자 또는 상품명">
					<button type="submit" style="margin-top: 26px;">
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
					<c:forEach var="bookVo1" items="${bookList1}">
						<li>
							<figure>
								<a class="aa-product-img"
								 href="<c:url value='/main/book/bookDetail?bookNo=${bookVo1.bookNo}'/>">
									<img
									 src="<c:url value='/images/bookProduct/upload_img/${bookVo1.bookImgName}'/>"
									 alt="${bookVo1.bookTitle}이미지">
								</a>
								<a class="aa-add-card-btn" href="">
									<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
								</a>
								<figcaption>
									<h5 class="aa-product-title">
										<a href="#"></a>
									</h5>
									<span class="aa-product-price">${bookVo1.bookPrice}</span>
								</figcaption>
							</figure>
						</li>
					</c:forEach>
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
					<c:forEach var="bookVo" items="${bookList2}">
						<li>
							<figure>
								<a class="aa-product-img"
								 href="<c:url value='/main/book/bookDetail?bookNo=${bookVo2.bookNo}'/>">
									<img
									 src="<c:url value='/images/bookProduct/upload_img/${bookVo2.bookImgName}'/>"
									 alt="${bookVo2.bookTitle}이미지">
								</a>
								<a class="aa-add-card-btn" href="">
									<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
								</a>
								<figcaption>
									<h5 class="aa-product-title">
										<a href="#"></a>
									</h5>
									<span class="aa-product-price">${bookVo2.bookPrice}</span>
								</figcaption>
							</figure>
						</li>
					</c:forEach>
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
					<c:forEach var="bookVo3" items="${bookList3}">
						<li>
							<figure>
								<a class="aa-product-img"
								 href="<c:url value='/main/book/bookDetail?bookNo=${bookVo3.bookNo}'/>">
									<img
									 src="<c:url value='/images/bookProduct/upload_img/${bookVo3.bookImgName}'/>"
									 alt="${bookVo3.bookTitle}이미지">
								</a>
								<a class="aa-add-card-btn" href="">
									<span style="display: block;" class="fas fa-shopping-cart"></span>
									장바구니 담기
								</a>
								<figcaption>
									<h5 class="aa-product-title">
										<a href="#"></a>
									</h5>
									<span class="aa-product-price">${bookVo3.bookPrice}</span>
								</figcaption>
							</figure>
						</li>
					</c:forEach>
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
<%@ include file="../inc/bottom.jsp"%>
