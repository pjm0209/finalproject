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
				<p>가격</p>
				<p><span>${list[0].SUM_PRICE}</span>원</p>
			</div>
			<div class="flex">
				<p>배송비</p>
				<c:set var="deli" value="${DELIVERY}"/>
				<c:set var="limit" value="${TOTAL_PRICE}"/>
				<c:if test="${deli <  TOTAL_PRICE}">
					<c:set var="deli" value="0"/>
				</c:if>
				<p><span>${deli}</span>원</p>
			</div>
		</li>
		<li class="flex">
			<p><strong>총 결제 금액</strong></p>
			<p><strong><span>${list[0].SUM_PRICE + deli}</span>원</strong></p>
		</li>
		
	</ul>
	<ul class="complet_list2">
		<li>
			<p><strong>수령인</strong></p>
			<p>${list[0].RECIPIENT}</p>
			<p>${list[0].RE_ZIPCODE} ${list[0].RE_ADDRESS} ${list[0].RE_ADDRESS_DETAIL}</p>
			<p>${list[0].RE_HP}</p>
			
			
		</li>
	</ul>
	<ul class="complet_list3">
		<li>
			<p><strong>구매 항목</strong></p>
			<ul>
				<c:forEach var="map" items="${list}">
					<li class="flex list">
						<img alt="${map.BOOK_IMG_ORIGINALNAME}" src="http://localhost:9091/mbti/images/bookProduct/upload_img/${map.BOOK_IMG_NAME}">
						<div class="text_box">
						<p><span>${map.BOOK_PRICE}</span>원</p>
						<p><span>${map.BOOK_TITLE}</span> &middot; <span>${map.ORDERS_QTY}</span>개</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</li>
	</ul>
	<a href="<c:url value='/main/mypage/mypageOrderList'/>" class="list_btn">주문목록가기</a>
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