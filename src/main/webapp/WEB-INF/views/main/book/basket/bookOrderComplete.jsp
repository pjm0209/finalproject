<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<section id="order_complete" class="order_complete">
	<h2>주문 완료</h2>
	<ul class="complet_list1">
		<li>
			<p><strong>결제 정보</strong></p>
			<div class="flex">
				<p>상품가격</p>
				<p><span>10,000</span>원</p>
			</div>
			<div class="flex">
				<p>베송비</p>
				<p><span>0</span>원</p>
			</div>
		</li>
		<li class="flex">
			<p><strong>총 결제 금액</strong></p>
			<p><strong><span>10,000</span>원</strong></p>
		</li>
		
	</ul>
	<ul class="complet_list2">
		<li>
			<p><strong>홍길동</strong></p>
			<p>(02930)서울특별시 동작구 서울동 234-2</p>
			<p>010-1234-5678</p>
			
			
		</li>
	</ul>
	<ul class="complet_list3">
		<li>
			<p><strong>주문완료</strong></p>
			<ul>
				<li class="flex list">
					<img alt="" src="http://localhost:9091/mbti/images/bookProduct/upload_img/1_20230904005120465.jpg">
					<div class="text_box">
					<p><span>6,800</span>원</p>
					<p><span>MBTI Form M 자가채점용</span> &middot; <span>1</span>개</p>
					</div>
				</li>
				  
			</ul>
		</li>
	</ul>
	<a href="#" class="list_btn">주문목록가기</a>
</section>

<section class="booklist_right">
	<ul class="flex">
		<li><span class="material-symbols-outlined"> counter_1 </span> 장바구니</li>
		<li><span class="material-symbols-outlined  "> counter_2 </span> 주문/결제</li>
		<li class="on"><span class="material-symbols-outlined  "> counter_3 </span> 주문완료</li>
	</ul>

</section>
<script>
	$(function() {
		$('.order_step .step3 .pay_box a').click(function() {

			$('.order_step .step3 .pay_box a').removeClass('on');
			$(this).addClass('on');
		})

		$('.order_step .step2 .slide_box').click(function() {
			if ($(this).hasClass('on')) {
				$(this).removeClass('on');
			} else {
				$(this).addClass('on');
			}

		})
	})
</script>
<%@ include file="../../inc/bottom.jsp"%>