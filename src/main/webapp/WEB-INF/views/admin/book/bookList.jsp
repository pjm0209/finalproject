<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->

<div class="head-div">
	<h2 class="text-gray-800">판매 상품 관리</h2>
</div>

<!--  -->
<%@ include file="../book/bookSideBody.jsp"%>
<!--  -->

<div class="board-body">
	<div id="board-title">
		<h5>상품 리스트</h5>
		<button class="bg-gradient-secondary"
			 id="board-write-button" onclick="location.href='bookRegister'">새 상품 등록</button>
	</div>
	<!--  -->
	<div>
		
	<%@ include file="../book/bookSearch.jsp"%>

	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
		
		<table class="table">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="board-title">상품코드</th>
					<th scope="col" class="board-regdate">상품명</th>
					<th scope="col" class="board-writer">상품이미지</th>
					<th scope="col" class="board-readcount">카테고리</th>
					<th scope="col" class="board-readcount">판매가</th>
					<th scope="col" class="board-readcount">판매수</th>
					<th scope="col" class="board-readcount">등록일</th>
					<th scope="col" class="board-readcount">관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>코드</td>
					<td>상품명</td>
					<td>상품이미지</td>
					<td>책 > 검사</td>
					<td>10,000원</td>
					<td>1</td>
					<td>regdate</td>
					<td>
						<a class="btn btn-info btn-xs" href="/productsub/fo/0/36/productview.sd" target="_blank" title="상품보기"><i class="fas fa-eye"></i></a>
						<button class="btn btn-info btn-xs" onclick="" type="button" title="복사"><i class="fas fa-copy"></i></button>
						<button class="btn btn-warning btn-xs" onclick="" type="button" title="수정"><i class="fas fa-edit"></i></button>
						<button class="btn btn-danger btn-xs" onclick="" type="button" title="삭제"><i class="fas fa-trash"></i></button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>