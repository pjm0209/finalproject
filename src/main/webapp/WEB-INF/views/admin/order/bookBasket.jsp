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
		<form name="serach" method="post" action="<c:url value='/admin/book/bookList'/>">
			<div class="flex shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
			<h2>장바구니 검색</h2>
			<div class="box">
				<label>상품카테고리</label>
				
					<div class="flex_ca">
						
							<select class="form-select" aria-label="Default select example">
								<option value="">선택</option>
							</select>
						
					
							<select class="form-select" aria-label="Default select example">
								<option value="">선택</option>
							</select>
					
						
					</div>
				
			</div>
			<div class="form-group box">
				<label>상품코드</label>
				<div>
					<input class="" id="" name="" placeholder="상품코드" type="text" value="">
				</div>
				<label>상품명</label>
				<div>
					<input placeholder="상품명" type="text" value="">
				</div>											
				
			</div>
				<div class="box">
					<label>제조사</label>
						<div>
							<input placeholder="제조사" type="text" value="">
						</div>
				</div>
			<div class="box">
				<label>사용여부</label>
				<div>
					<label>
						<input name="" placeholder="사용여부" type="checkbox" value="" checked="checked" >전체
					</label>
					<label>
						<input name="" placeholder="사용여부" type="checkbox" value="Y">사용
					</label>
					<label>
						<input name="" placeholder="사용여부" type="checkbox" value="N">미사용
					</label>
				</div>
			</div>
			<div class="box">
				<label>등록일</label>
				<div class="register">
					<input class="" id="" name="" placeholder="등록일" type="text" value="">
				</div>
				<div>
					<input class="" id="" name="" placeholder="등록일(종료일)" type="text" value="">
				</div>
			</div>
			<div>
				<div class="box num_01">
				<label>정렬</label>
			
					<select class="" id="" name="">
						<option value="" selected="selected">선택</option>
						<option value="">상품명 오름차순</option>
						<option value="">상품명 내림차순</option>
						<option value="">상품등록일 오름차순</option>
						<option value="">상품등록일 내림차순</option>
						<option value="">상품코드 오름차순</option>
						<option value="">상품코드 내림차순</option>
						<option value="">판매가 오름차순</option>
						<option value="">판매가 내림차순</option>
						<option value="">판매수 오름차순</option>
						<option value="">판매수 내림차순</option>
					</select>
				</div>
				<div class="box num_01">
				<label>게시글 수</label>
				
					<select>
						<option value="5">5</option>
						<option value="10" selected="selected">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
				</div>
			</div>

			<div class="btn">
				<button onclick="" type="button" title="검색">검색</button>
			</div>

		</div>
		</form>
	</div>

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
					<th scope="col" class="board-readcount">재고</th>
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
					<td><input class="form-control" name="i_pr_stock" type="number" value="1" style="min-width: 100px;"></td>
					<td>regdate</td>
					<td>
						<button class="btn btn-warning btn-xs" onclick="" type="button" title="재고저장"><i class="fas fa-edit"></i></button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>