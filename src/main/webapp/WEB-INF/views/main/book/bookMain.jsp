<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
}
#pdList h1{
	text-align: center;
	margin-left: 600px;
}
#pdList ul{
	width: 1300px;
	text-align: center;
	display: flex;
    justify-content: space-around;
    margin-left: 308px;
}

#pdList ul li img{
	width: 250px;
	height: 300px;
}
</style>
<%@ include file="../inc/top.jsp"%>

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
	<div class="topImg" style="text-align: center;">
		<img style="margin-right: 84px;" src="<c:url value='/images/72939_11192_2044.jpg'/>">
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