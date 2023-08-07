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
		<h5>전체 주문 내역</h5>
	</div>
	<!--  -->
	<div>
		<%@ include file="../order/orderSearch.jsp"%>
	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
		
		<table class="table">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="board-title">주문번호</th>
					<th scope="col" class="board-regdate">주문상품</th>
					<th scope="col" class="board-writer">회원아이디</th>
					<th scope="col" class="board-readcount">결제금액</th>
					<th scope="col" class="board-readcount">수령자</th>
					<th scope="col" class="board-readcount">결제수단</th>
					<th scope="col" class="board-readcount">주문 상태</th>
					<th scope="col" class="board-readcount">주문일</th>
					<th scope="col" class="board-readcount">주문처리</th>
					<th scope="col" class="board-readcount">관 리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>주문번호코드</td>
					<td>상품명</td>
					<td>아이디</td>
					<td>10000원</td>
					<td>수령자이름</td>
					<td>삼성카드</td>
					<td>결제완료</td>
					<td>sysdate</td>
					<td>배송준비할까??</td>
					<td>
						<button class="btn btn-warning btn-xs" onclick="location.href='orderDetail'" type="button" title="재고저장"><i class="fas fa-edit"></i></button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>