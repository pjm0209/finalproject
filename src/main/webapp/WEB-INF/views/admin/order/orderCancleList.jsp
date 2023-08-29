<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">주문 취소 관리</h2>
</div>
<%@ include file="../order/orderSideBody.jsp"%>
<div class="board-body">
	<div id="board-title">
		<c:choose> 
			<c:when test="${param.orderFlag eq 'orderCancleDone'}">
				<h5>취소 완료 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'returnNotYet'}">
				<h5>반품 신청 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'returnDone'}">
				<h5>반품 완료 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'exchangeNotYet'}">
				<h5>교환 신청 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'exchangeDone'}">
				<h5>교환 완료 관리</h5>
			</c:when>
			<c:when test="${param.orderFlag eq 'refundNotYet'}">
				<h5>환불 신청 관리</h5>
			</c:when>
			<c:when test="${param.orderFlag eq 'refundDone'}">
				<h5>환불 완료 관리</h5>
			</c:when>
			<c:otherwise>
				<h5>전체 주문 취소 내역</h5>
			</c:otherwise> 
		</c:choose>
	</div>
	<!--  -->
	
	<div>
		<%@ include file="../order/orderSearch.jsp"%>

	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
	
	
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>