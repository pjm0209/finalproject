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
		<h5>상품 재고 관리</h5>
	</div>
	<!--  -->
	
	<div>
		<%@ include file="../book/bookSearch.jsp"%>
	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
		<table class="table">
			<caption>재고리스트</caption>
			<colgroup>
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />	
				<col style="width:10%;" />	
				<col style="width:10%;" />			
			</colgroup>
			<thead>
				<tr class="book-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="book-checkbox"></th>
					<th scope="col" class="bookNo">상품코드</th>
					<th scope="col" class="bookTitle">상품명</th>
					<th scope="col" class="bookImage">상품이미지</th>
					<th scope="col" class="bookCategory">카테고리</th>
					<th scope="col" class="bookPrice">판매가</th>
					<th scope="col" class="stockQty">재고</th>
					<th scope="col" class="bookUseflag">사용여부</th>
					<th scope="col" class="bookRegdate">등록일</th>
					<th scope="col" class="bookManage">관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox" class="book-checkbox"></th>
					<td>코드</td>
					<td>상품명</td>
					<td>상품이미지</td>
					<td>책 > 검사</td>
					<td>10,000원</td>
					<td><input class="form-control" name="qtys" type="number" value="" style="width: 100px" placeholder="재고"></td>
					<td>Y or N</td>
					<td>regdate</td>
					<td>
						<button class="btn btn-info btn-xs blue" onclick="location.href='bookRegister?bookNo=${'#bookNo'}.val()'" type="button" title="재고저장"><i class="fas fa-save"></i></button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>