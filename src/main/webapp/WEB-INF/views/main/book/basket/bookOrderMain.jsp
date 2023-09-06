<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<%@ include file="./bookBasket.jsp"%>

<section class="booklist_right">
	<ul class="flex">
		<li class="on">
		<span class="material-symbols-outlined"> counter_1 </span>
		장바구니
		</li>
		<li>
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
				
				<button type="submit" onclick="location.href='/mbti/main/book/bookOrdering'">주문하기</button>
		</div>
</section>
<script>
$(function(){
	$('#basket .box2>a').click(function(){
		$(this).parents('.box2').parents('li').hide();
	});
});
</script>
<%@ include file="../../inc/bottom.jsp"%>