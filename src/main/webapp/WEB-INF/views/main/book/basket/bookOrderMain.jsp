<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<script type="text/javascript">
var contextPath = "/mbti";
	$(function(){
		
		var total = 0;
		$(".middleVal").each(function(){
			total += parseInt($(this).text()); 
		});
		$("#totalPriceSpan").text(total);
		var delivery = parseInt($("input[name=delivery]").val());
		var limit = parseInt($("input[name=limit]").val());
		if($("#totalPriceSpan").text() >= limit){
			$("#delTax").text(0);
		}else{
			$("#delTax").text(delivery);
		}
		
		$("#totalPrice").text(parseInt($("#delTax").text()) + total);
		
		var price1 = 0;
		var price2 = 0;
		$(".remove").click(function(idx, item){
			var cnt = $(this).parent().find('.tt').text();
			var bookPrice = $(this).parents('.box2').prev('.box1').find('.bookPrice > span').text();
			var wonIdx = bookPrice.indexOf('원');
			bookPrice = bookPrice.substring(0, wonIdx);
			price1 = $(this).parent().prev('.middleVal').text();
			
			cnt = cnt - 1;
			if(cnt < 1) {
				cnt = 0;
			}
			
			price1 = cnt * bookPrice;
			
			$(this).parent().find('.tt').text(cnt);
			$(this).parent().prev('.middleVal').text(price1);
			
			var total = 0;
			$(".middleVal").each(function(){
				total += parseInt($(this).text()); 
			});
			
			$("#totalPriceSpan").text(total);
			var x = $("#totalPriceSpan").text();
			if(parseInt(x) < limit){
				$("#delTax").text(delivery);
			}else{
				$("#delTax").text(0);
			}
			$("#totalPrice").text(parseInt($("#delTax").text()) + total);
			var a = $("#totalPrice").text(parseInt($("#delTax").text()) + total);
			$("#frmBasket input[name=sumPrice]").val(a);
			
			var basketNo=$(this).parents('.box2').prev('.box1').find("input[name=basketNo]").val();
			qtyUpdate(basketNo, cnt);
		});
		
		$(".plus").click(function(idx, item){
			var delivery = parseInt($("input[name=delivery]").val());
			var cnt = $(this).parent().find('.tt').text();
			var bookPrice = $(this).parents('.box2').prev('.box1').find('.bookPrice > span').text();
			var wonIdx = bookPrice.indexOf('원');
			bookPrice = bookPrice.substring(0, wonIdx);
			var price2 = parseInt($(this).parent().prev('.middleVal').text());
			
			cnt++;
			
			price2 = cnt * bookPrice;
			
			$(this).parent().find('.tt').text(cnt);
			$(this).parent().prev('.middleVal').text(price2);
			
			var total = 0;
			$(".middleVal").each(function(){
				total += parseInt($(this).text()); 
			});
			
			$("#totalPriceSpan").text(total);
			var x = $("#totalPriceSpan").text();
			if(parseInt(x) < limit){
				$("#delTax").text(delivery);
			}else{
				$("#delTax").text(0);
			}
			$("#totalPrice").text(parseInt($("#delTax").text()) + total);
			var a = $("#totalPrice").text(parseInt($("#delTax").text()) + total);
			$("#frmBasket input[name=sumPrice]").val(a);
			
			var basketNo=$(this).parents('.box2').prev('.box1').find("input[name=basketNo]").val();
			
			qtyUpdate(basketNo, cnt);
		});
		
		
		$(".box2 a").click(function(){
			var basketNo=$(this).parents('.box2').prev('.box1').find("input[name=basketNo]").val();
			deleteUpdate(basketNo);
			
			$(this).parents('.BookInBasket').remove();
		});
	});
	
	function qtyUpdate(basketNo, qty){
		alert(basketNo);
		$.ajax({
			url: contextPath + "/main/book/basket/bookAjaxQty",
			type:"post",
			data: {
				basketNo: basketNo,
				basketQty: qty
			},
			success:function(result){
				if(result > 0){
					alert("수정 성공");	
				} else {
					alert("수정 실패 ㅠ");
				}
			},
			error:function(xhr, status, error){
				alert(xhr + status + error);
			}
		});	
	}
		
	function deleteUpdate(basketNo){
		$.ajax({
			url: contextPath + "/main/book/basket/bookAjaxDelete",
			type:"post",
			data: {
				basketNo: basketNo,
			},
			success:function(result){
				if(result > 0){
					alert("삭제 성공");	
				} else {
					alert("삭제 실패 ㅠ");
				}
			},
			error:function(xhr, status, error){
				alert(xhr + status + error);
			}
		});	
	}
	
	
</script>

<div style="background: white;margin: 0 30px;" class="shadow-sm p-3 mb-5 bg-body rounded">
<div class="check_box flex">
	<div class="inner flex">
		<div class="check_all flex">
			<input type="checkbox" id="check">
			<label for="check"> 전체선택 </label>
		</div>
		<div class="check_remove">
			<a href="javascript:void(0);">전체삭제</a>
		</div>
	</div>
</div>

<section id="basket" class="flex" >
	<c:if test="${empty mapList }">
		<ul class="list">
			<li class="flex"style="height: 500px;">
				<div style="height: 500px; text-align: center;">
					<div style="margin-left: 275px;margin-top: 110px;">
						<p>장바구니가 비어있습니다.</p>
						<img src="<c:url value='/images/empty.jpg'/>" alt="빈 장바구니"
						 class="">
					</div>
				</div>
			</li>
		</ul>
	</c:if>
	<c:if test="${!empty mapList }">
		<ul class="list">
			<c:forEach var="map" items="${mapList}">
				<li class="flex BookInBasket">
					<div class="flex box1">
						<input type="checkbox">
						<div class="flex">
							<input name="basketNo" type="hidden" value="${map['BASKET_NO']}">
							<input type="hidden" value="${map['NO']}">
							<img src="<c:url value='/images/bookProduct/upload_img/${map["BOOK_IMG_NAME"]}'/>" alt="${map['BOOK_IMG_ORIGINALNAME']}" width="140px;"
							style="vertical-align: middle;">
							<P class="bookPrice">${map['BOOK_TITLE']}<span>${map['BOOK_PRICE']}원</span></P>
						</div>
					</div>
					<div class="box2">
						<a href="javascript:void(0);"><span class="material-symbols-outlined"> close </span></a>
						<p class="middleVal"> ${map.BOOK_PRICE * map.BASKET_QTY } </p>
						<div class="flex">
							<button class="remove" type="button">
								<span class="material-symbols-outlined"> remove </span>
							</button>
							<p class="tt">${map['BASKET_QTY']}</p>
							<button class=plus type="button">
								<span class="material-symbols-outlined"> add </span>
							</button>
						</div>
					</div>
				</li>
			</c:forEach> 
		</ul>
	</c:if>
</section>

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
						<p ><span  id="totalPriceSpan">0</span>원</p>
					</li>
					<li class="flex">
						<p>배송비</p>
						<INPUT name="delivery" type="hidden" value="${DELIVERY}"/>
						<INPUT name="limit" type="hidden" value="${TOTAL_PRICE}"/>
						<p><span id="delTax">0</span>원</p>
					</li>
				</ul>
				<hr>
				<ul>
					<li class="flex">
						<p>총 금액</p>
						<p><span id="totalPrice">0</span>원</p>
					</li>
					
				</ul>
				
				<button type="buttom" 
					onclick="location.href='<c:url value="/main/book/basket/bookOrdering"/>'">
				주문하기</button>
		</div>
</section>

</div>

<%-- <%@ include file="../../inc/bottom.jsp"%> --%>