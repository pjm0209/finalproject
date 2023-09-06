<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<section id="order_step" class="order_step" >
	<h2>주문/결제</h2>
	<ul class="step">
		<li class="step1 flex">
			<p class="box_tit">배송지 정보</p>
			<div class="rt_box ">
				<button class="search"><span class="material-symbols-outlined "> search </span>주소 찾기</button>
			</div>
		</li>
		<li class="step2">
				<a href="javascript:void(0);" class="slide_box  flex">
					<p class="box_tit">주문 상품</p>
					<div class="rt_box flex">
						<p>총<span>0</span>원</p>
						<span class="material-symbols-outlined"> keyboard_arrow_down </span>
					</div>
				</a>
				<ul class="">
					<li class="flex">
						<a href="javascript:void(0);"> <img alt="mbti책" src="/mbti/images/bookProduct/20025.jpg"> </a>
						<p class="title">MBTI Form M 자가채점용</p>
						<p class="book_count"><span>1</span>개</p>
						<p class="total"><span>15,200</span>원</p>
					</li>
					
					
					
				</ul>
			</li>
		<li class="step3 ">
			<p class="box_tit">결제 수단</p>
			<div class="pay_box flex">
				<a href="javascript:void(0);">신용카드</a>
				<a href="javascript:void(0);">카카오페이</a>
				<a href="javascript:void(0);">온라인입금</a>
				<a href="javascript:void(0);">휴대폰결제</a>
				<a href="javascript:void(0);">무통장입금</a>
			</div>
		</li>
		
	</ul>
	
</section>

<section class="booklist_right">
	<ul class="flex">
		<li>
		<span class="material-symbols-outlined"> counter_1 </span>
		장바구니
		</li>
		<li class="on">
		<span class="material-symbols-outlined  "> counter_2 </span>
		주문/결제
		</li>
		<li>
		<span class="material-symbols-outlined  "> counter_3 </span>
		주문완료
		</li>
	</ul>
	<div class="booklist_area">
			
				<ul>
					<li class="flex">
						<p>상품금액</p>
						<p><span>0</span>원</p>
					</li>
					<li class="flex">
						<p>배송비</p>
						<p><span>0</span>원</p>
					</li>
				</ul>
				<hr>
				<ul>
					<li class="flex">
						<p>총 금액</p>
						<p><span>0</span>원</p>
					</li>
					
				</ul>
				
				<button type="submit" onclick="location.href='/mbti/main/book/bookOrdering'">결제하기</button>
		</div>
</section>
<script>
$(function(){
	$('.order_step .step3 .pay_box a').click(function(){

		$('.order_step .step3 .pay_box a').removeClass('on');
		$(this).addClass('on');
	})
	
	$('.order_step .step2 .slide_box').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
		}else{
			$(this).addClass('on');
		}
		
		
	})
})
</script>
<%@ include file="../../inc/bottom.jsp"%>