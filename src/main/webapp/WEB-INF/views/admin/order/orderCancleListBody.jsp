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
			<th scope="col" class="orderState">상태값</th>
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
			<td>취소 신청</td>
			<td>sysdate</td>
			<td>
				<c:choose> 
					<c:when test="${param.orderFlag eq 'orderCancle'}">
						<a class="green" href="#">취소 완료</a><br>
						<a class="red" href="#">주문 취소</a>
					</c:when> 
					<c:when test="${param.orderFlag eq 'orderCancleDone'}">
						&nbsp;
					</c:when> 
					<c:when test="${param.orderFlag eq 'returnNotYet'}">
						<a class="green" href="#">반품 완료</a><br>
						<a class="red" href="#">주문 취소</a>
					</c:when> 
					<c:when test="${param.orderFlag eq 'returnDone'}">
						&nbsp;
					</c:when> 
					<c:when test="${param.orderFlag eq 'exchangeNotYet'}">
						<a class="green" href="#">교환 완료</a><br>
						<a class="red" href="#">주문 취소</a>
					</c:when> 
					<c:when test="${param.orderFlag eq 'exchangeDone'}">
						&nbsp;
					</c:when>
					<c:when test="${param.orderFlag eq 'refundNotYet'}">
						<a class="green" href="#">환불 완료</a><br>
						<a class="red" href="#">주문 취소</a>
					</c:when>
					<c:when test="${param.orderFlag eq 'refundDone'}">
						&nbsp;
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