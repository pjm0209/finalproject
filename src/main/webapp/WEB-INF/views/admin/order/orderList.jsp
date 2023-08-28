<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">상품 주문 관리</h2>
</div>
<!--  -->
<%@ include file="../order/orderSideBody.jsp"%>
<!--  -->
<div class="board-body">
	<div id="board-title">
		<c:choose> 
			<c:when test="${param.orderFlag eq 'moneyNotYet'}">
				<h5>입금 대기 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'moneyDone'}">
				<h5>결재 완료 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'shippingNotYet'}">
				<h5>배송 준비 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'shipping'}">
				<h5>배송 중 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'shippingDone'}">
				<h5>배송 완료 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'confirmed'}">
				<h5>구매 확정 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'BASKET'}">
				<h5>장바구니 관리</h5>
			</c:when>
			<c:otherwise>
				<h5>전체 주문 내역</h5>
			</c:otherwise> 
		</c:choose>
	</div>
	<!--  -->
	<div>
		<%@ include file="../order/orderSearch.jsp"%>
	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;margin-right: 15px">
		
		<%@ include file="../order/orderListBody.jsp"%>
		
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>