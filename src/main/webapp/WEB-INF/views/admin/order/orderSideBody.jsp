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
			<div class="board-side-boardItem">
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="bookList" value="bookList">
						<span><a href="<c:url value=''/>">주문취소내역</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="bookList" value="bookList">
						<span><a href="<c:url value=''/>">전체 주문 내역</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="QTY" value="QTY">
						<span><a href="<c:url value=''/>">입금 대기</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="QTY" value="QTY">
						<span><a href="<c:url value=''/>">취소 완료</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="BASKET" value="BASKET">
						<span><a href="<c:url value=''/>">결재 완료</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="BASKET" value="BASKET">
						<span><a href="<c:url value=''/>">반품 신청</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">배송 준비</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">반품 완료</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">배송중</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">교환신청</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">	
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">배송 완료</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">	
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">교환 완료</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">구매 확정</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="SALES" value="SALES">
						<span><a href="<c:url value=''/>">환불 신청</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<c:if test="${param.flag != 'orderCancle'}">
					<div class="board-name" name="BASKET" value="BASKET">
						<span><a href="<c:url value='/admin/order/bookBasket'/>">장바구니 관리</a></span>
					</div>
				</c:if>
				<c:if test="${param.flag eq 'orderCancle'}">
					<div class="board-name" name="BASKET" value="BASKET">
						<span><a href="<c:url value='/admin/order/bookBasket'/>">환불 완료</a></span>
					</div>
				</c:if>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
		</div>
	</div>
</div>