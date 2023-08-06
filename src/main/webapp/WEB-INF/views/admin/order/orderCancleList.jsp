<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">판매 상품 주문 관리</h2>
</div>
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
				<div class="board-name" name="bookList" value="bookList">
					<span><a href="<c:url value='/admin/book/bookList'/>">전체 주문 내역</a></span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="QTY" value="QTY">
					<span><a href="<c:url value='/admin/book/bookInventory'/>">입금 대기</a></span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="BASKET" value="BASKET">
					<span><a href="<c:url value='/admin/book/bookBasket'/>">결재 완료</a></span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="SALES" value="SALES">
					<span>배송 준비</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="SALES" value="SALES">
					<span>배송중</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="SALES" value="SALES">
					<span>배송 완료</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="SALES" value="SALES">
					<span>구매 확정</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="SALES" value="SALES">
					<span><a href="<c:url value='/admin/order/bookBasket'/>">장바구니 관리</a></span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>주문 관리</h5>
		<button class="bg-gradient-secondary" id="board-write-button">새 상품 등록</button>
	</div>
	<!--  -->
	
	<div>
		<div>
			<h2>주문 검색</h2>
		</div>
		<div>
			<div>
				<label>상품카테고리</label>
				<div>
					<div>
						<div>
							<select class="form-select" aria-label="Default select example">
								<option value="">선택</option>
							</select>
						</div>
						<div>
							<select class="form-select" aria-label="Default select example">
								<option value="">선택</option>
							</select>
						</div>
						
					</div>
				</div>
			</div>
			<div class="form-group">
				<label>상품코드</label>
				<div>
					<input class="" id="" name="" placeholder="상품코드" type="text" value="">
				</div>
				<label>상품명</label>
				<div>
					<input placeholder="상품명" type="text" value="">
				</div>											
				<label>제조사</label>
				<div>
					<input placeholder="제조사" type="text" value="">
				</div>
			</div>
			<div>
				<label>사용여부</label>
				<div>
					<label>
						<input name="" placeholder="사용여부" type="radio" value="" checked="checked">전체
					</label>
					<label>
						<input name="" placeholder="사용여부" type="radio" value="Y">사용
					</label>
					<label>
						<input name="" placeholder="사용여부" type="radio" value="N">미사용
					</label>
				</div>
			</div>
			<div>
				<label>등록일</label>
				<div>
					<input class="" id="" name="" placeholder="등록일" type="text" value="">
				</div>
				<div>
					<input class="" id="" name="" placeholder="등록일" type="text" value="">
				</div>
			</div>
			<div>
				<label>정렬</label>
				<div>
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
				<label>게시글 수</label>
				<div>
					<select>
						<option value="5">5</option>
						<option value="10" selected="selected">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
				</div>
			</div>

			<div>
				<button onclick="" type="button" title="검색">검색</button>
			</div>

		</div>
	</div>

	<!--  -->
	<div class="board">
		
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