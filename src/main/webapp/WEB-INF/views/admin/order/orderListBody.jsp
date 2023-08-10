<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<table class="table">
		<colgroup>
			<col style="width:1%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />	
			<col style="width:9%;" />	
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:14%;" />			
		</colgroup>
		<thead>
			<tr class="book-table-colum">
				<th scope="col"><input type="checkbox" id="check-All" class="book-checkbox"></th>
				<th scope="col" class="orderNo">주문번호</th>
				<th scope="col" class="orderProduct">주문상품</th>
				<th scope="col" class="orderUserid">회원아이디</th>
				<th scope="col" class="orderPrice">결제금액</th>
				<th scope="col" class="orderRecipient">수령자</th>
				<th scope="col" class="orderMethod">결제수단</th>
				<th scope="col" class="orderState">주문 상태</th>
				<th scope="col" class="orderDate">주문일</th>
				<th scope="col" class="orderHandle">주문처리</th>
				<th scope="col" class="orderManage">관 리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><input type="checkbox" class="book-checkbox"></th>
				<td>주문번호코드</td>
				<td>상품명</td>
				<td>아이디</td>
				<td>10000원</td>
				<td>수령자이름</td>
				<td>삼성카드</td>
				<td>결제완료</td>
				<td>sysdate</td>
				<td>
					<c:choose> 
						<c:when test="${param.orderFlag eq 'moneyNotYet'}">
							<a class="green" href="#">결제 완료</a><br>
							<a class="red" href="#">주문 취소</a>
						</c:when> 
						<c:when test="${param.orderFlag eq 'moneyDone'}">
							<a class="green" href="#">배송 준비</a><br>
							<a class="red" href="#">주문 취소</a>
						</c:when> 
						<c:when test="${param.orderFlag eq 'shippingNotYet'}">
							<a class="green" href="#">배송 중</a><br>
							<a class="red" href="#">주문 취소</a>
						</c:when> 
						<c:when test="${param.orderFlag eq 'shipping'}">
							<a class="green" href="#">배송 완료</a><br>
							<a class="red" href="#">주문 취소</a>
						</c:when> 
						<c:when test="${param.orderFlag eq 'shippingDone'}">
							<a class="green" href="#">구매 확정</a><br>
							<a class="red" href="#">주문 취소</a>
						</c:when> 
						<c:otherwise>
							&nbsp;
						</c:otherwise> 
					</c:choose>
				</td>
				<td>
					<button class="btn btn-warning btn-xs" onclick="location.href='orderDetail?orderNo=${vo.orderNo}?orderFlag=${param.orderFlag}'" type="button" title="재고저장"><i class="fas fa-edit"></i></button>
				</td>
			</tr>
			
		</tbody>
	</table>

