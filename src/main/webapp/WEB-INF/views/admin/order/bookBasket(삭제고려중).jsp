<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">판매 상품 주문 관리</h2>
</div>
<%@ include file="../order/orderSideBody.jsp"%>
<div class="board-body">
	<div id="board-title">
		<h5>장바구니 관리</h5>
	</div>
	<!--  -->
	
	<div>
		<%@ include file="../order/orderSearch.jsp"%>

	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
		
		<table class="table">
			<caption>장바구니 리스트</caption>
			<colgroup>
				<col style="width:10%;" />
				<col style="width:20%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />	
				<col style="width:20%;" />	
			</colgroup>
			<thead>
				<tr class="book-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="book-checkbox"></th>
					<th scope="col" class="bookNo">상품코드</th>
					<th scope="col" class="bookTitle">상품명</th>
					<th scope="col" class="bookImage">상품이미지</th>
					<th scope="col" class="stockQty">수량</th>
					<th scope="col" class="userid">회원명(ID)</th>
					<th scope="col" class="bookRegdate">등록일</th>
					<th scope="col" class="bookManage">관 리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox" class="book-checkbox"></th>
					<td>주문번호</td>
					<td>상품명</td>
					<td>이미지.jgp</td>
					<td>3</td>
					<td>회원아이디이다</td>
					<td>regdate</td>
					<td>
						<button class="btn btn-danger btn-xs" onclick="" type="button" title="장바구니삭제"><i class="fas fa-trash"></i></button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>