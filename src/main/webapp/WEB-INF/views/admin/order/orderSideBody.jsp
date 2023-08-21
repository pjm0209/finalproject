<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="side-body">
	<div class="side-div-title">
		<h6>주문 관리</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="board-group-list" class="nav">
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="orderCancleList" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=orderCancle'/>">주문취소내역</a></span>
					</div>
					<c:if test="${param.flag == 'orderCancle' and (param.orderFlag == 'orderCancle' or param.orderFlag == null)}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="orderList" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=orderList'/>">전체 주문 내역</a></span>
					</div>
					<c:if test="${param.orderFlag == 'orderList' or param.flag == 'order'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="stockQty" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=moneyNotYet'/>">입금 대기</a></span>
					</div>
					<c:if test="${param.orderFlag == 'moneyNotYet'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="orderCancleDone" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=orderCancleDone'/>">취소 완료</a></span>
					</div>
					<c:if test="${param.orderFlag == 'orderCancleDone'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="moneyDone" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=moneyDone'/>">결재 완료</a></span>
					</div>
					<c:if test="${param.orderFlag == 'moneyDone'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="returnNotYet" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=returnNotYet'/>">반품 신청</a></span>
					</div>
					<c:if test="${param.orderFlag == 'returnNotYet'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="shippingNotYet" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=shippingNotYet'/>">배송 준비</a></span>
					</div>
					<c:if test="${param.orderFlag == 'shippingNotYet'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="returnDone" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=returnDone'/>">반품 완료</a></span>
					</div>
					<c:if test="${param.orderFlag == 'returnDone'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="shipping" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=shipping'/>">배송중</a></span>
					</div>
					<c:if test="${param.orderFlag == 'shipping'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="exchangeNotYet" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=exchangeNotYet'/>">교환신청</a></span>
					</div>
					<c:if test="${param.orderFlag == 'exchangeNotYet'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="shippingDone" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=shippingDone'/>">배송 완료</a></span>
					</div>
					<c:if test="${param.orderFlag == 'shippingDone'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="exchangeDone" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=exchangeDone'/>">교환 완료</a></span>
					</div>
					<c:if test="${param.orderFlag == 'exchangeDone'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="confirmed" value="">
						<span><a href="<c:url value='/admin/order/orderList?orderFlag=confirmed'/>">구매 확정</a></span>
					</div>
					<c:if test="${param.orderFlag == 'confirmed'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="refundNotYet" value="">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=refundNotYet'/>">환불 신청</a></span>
					</div>
					<c:if test="${param.orderFlag == 'refundNotYet'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
			<div class="board-side-boardItem addIcon">
				<%-- <c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="BASKET" value="">
						<span><a href="<c:url value='/admin/order/bookBasket?flag=BASKET'/>">장바구니 관리</a></span>
					</div>
				</c:if> --%>
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="refundDone" value="refund">
						<span><a href="<c:url value='/admin/order/orderCancleList?flag=orderCancle&orderFlag=refundDone'/>">환불 완료</a></span>
					</div>
					<c:if test="${param.orderFlag == 'refundDone'}">
						<span class="board-side-icon"><i class="fas fa-fw fa-check"></i></span>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
</div>