<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
</script>
<form name="serach">
<%-- <form name="serach" method="post"
	<c:if test="${param.bookFlag eq 'bookList'}">
	 	action="<c:url value='/admin/book/bookList?bookFlag=bookListByKeyword'/>"
	 </c:if>
	 <c:if test="${param.bookFlag eq 'Inventory'}">
	 	action="<c:url value='/admin/book/bookList?bookFlag=InventoryByKeyword'/>"
	 </c:if>
	 > --%>
	 <input id="searchBookFlag" name="bookFlag"  type="hidden"
	 <c:if test="${param.bookFlag == 'bookList' or param.bookFlag == 'bookListByKeyword'}"> value='bookListByKeyword'</c:if>
	 <c:if test="${param.bookFlag == 'Inventory' or param.bookFlag == 'InventoryByKeyword'}"> value='InventoryByKeyword'</c:if>
	 >
	<div class="flex shadow-sm p-3 mb-5 bg-body rounded"
		style="margin: 10px 0px; background: white; margin-right: 15px">
		<h2>상품 검색</h2>
			
		<div class="box">
			<label>상품카테고리</label>

			<div class="flex_ca">
				<select id="s1" class="form-select" aria-label="Default select example" name="keywordCategory">
					<option value="">선택</option>
					<option value="검사자료" <c:if test="${param.keywordCategory=='검사자료'}">selected="selected"</c:if>>검사자료</option>
					<option value="도서" <c:if test="${param.keywordCategory=='도서'}">selected="selected"</c:if>>도서</option>
					<option value="기타" <c:if test="${param.keywordCategory=='기타'}">selected="selected"</c:if>>기타
				</select>
				<select class="form-select" aria-label="Default select example">
					<option value="">선택</option>
				</select>
			</div>

		</div>
		<div class="form-group box">
			<label>상품코드</label>
			<div>
				<input class="form-control" name="keywordNo" placeholder="상품코드" type="number"
					<c:if test="${!empty param.keywordNo}"> value='${param.keywordNo}'</c:if>
				>
			</div>
			<label>상품명</label>
			<div>
				<input class="form-control" name="keywordTitle" placeholder="상품명" type="text"
					<c:if test="${!empty param.keywordTitle}"> value='${param.keywordTitle}'</c:if>
				>
			</div>

		</div>
		<div class="box">
			<label>제조사</label>
			<div>
				<input class="form-control" name="keywordPublisher" placeholder="제조사" type="text"
				 <c:if test="${!empty param.keywordPublisher}"> value='${param.keywordPublisher}'</c:if>
				 >
			</div>
		</div>
		<div class="box">
			<label>사용여부</label>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="flexRadioDefault1"
						name="keywordUseflag" placeholder="사용여부" type="radio" value=""
						checked="checked"
				>
				<label class="form-check-label" for="flexRadioDefault1">
					전체
				</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="form-check-input" type="radio" id="flexRadioDefault2"
						name="keywordUseflag" placeholder="사용여부" type="radio" value="Y"
				>
				<label class="form-check-label" for="flexRadioDefault2">
					사용
				</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="form-check-input" type="radio" id="flexRadioDefault3"
						name="keywordUseflag" placeholder="사용여부" type="radio" value="N"
				>
				<label class="form-check-label" for="flexRadioDefault3">
					미사용
				</label>
			</div>
		</div>
		<div class="box">
			<label>등록일</label>
			<div class="register">
				<input class="form-control" id="" name="keywordRegdate" placeholder="등록일" type="date"
					<c:if test="${!empty param.keywordRegdate}">
							 value=${param.keywordRegdate}
					</c:if>	
				 >
			</div>
			<div>
				<input class="form-control" id="" name="keywordRegdate2" placeholder="등록일(종료일)" type="date"
					<c:if test="${!empty param.keywordRegdate2}">
							 value=${param.keywordRegdate2}
					</c:if>
				 >
			</div>
		</div>
		<div>
			<div class="box num_01">
				<label>정렬</label>
					<select class="form-select" id="" name="orderBy" style="margin-left: 214px;">
						<option value=""
							<c:if test="${!empty param.orderBy}">
								 selected="selected"
							</c:if>
						>선택</option>
						<option value="book_title"
							<c:if test="${param.orderBy eq 'book_title'}">
								 selected="selected"
							</c:if>
						>상품명 오름차순</option>
						<option value="book_title_desc"
							<c:if test="${param.orderBy eq 'book_title_desc'}">
								 selected="selected"
							</c:if>
						>상품명 내림차순</option>
						<option value="book_regdate"
							<c:if test="${param.orderBy eq 'book_regdate'}">
								 selected="selected"
							</c:if>
						>상품등록일 오름차순</option>
						<option value="book_regdate_desc"
							<c:if test="${param.orderBy eq 'book_regdate_desc'}">
								 selected="selected"
							</c:if>
						>상품등록일 내림차순</option>
						<option value="book_no"
							<c:if test="${param.orderBy eq 'book_no'}">
								 selected="selected"
							</c:if>
						>상품코드 오름차순</option>
						<option value="book_no_desc"
							<c:if test="${param.orderBy eq 'book_no_desc'}">
								 selected="selected"
							</c:if>
						>상품코드 내림차순</option>
						<option value="book_price"
							<c:if test="${param.orderBy eq 'book_price'}">
								 selected="selected"
							</c:if>
						>판매가 오름차순</option>
						<option value="book_price_desc"
							<c:if test="${param.orderBy eq 'book_price_desc'}">
								 selected="selected"
							</c:if>
						>판매가 내림차순</option>
						<option value="out_qty"
							<c:if test="${param.orderBy eq 'out_qty'}">
								 selected="selected"
							</c:if>
						>판매수 오름차순</option>
						<option value="out_qty_desc"
							<c:if test="${param.orderBy eq 'out_qty_desc'}">
								 selected="selected"
							</c:if>
						>판매수 내림차순</option>
					</select>
			</div>
			<div class="box num_01">
				<label>게시글 수</label>
					<select class="form-select" id="perRecord" name="perRecord">
						<option value="5"
							<c:if test="${param.orderBy == 5}">
								 selected="selected"
							</c:if>
						>5</option>
						<option value="10"
							<c:if test="${param.orderBy == 10}">
								 selected="selected"
							</c:if>
						>10</option>
						<option value="20"
							<c:if test="${param.orderBy == 20}">
								 selected="selected"
							</c:if>
						>20</option>
						<option value="30"
							<c:if test="${param.orderBy == 30}">
								 selected="selected"
							</c:if>
						>30</option>
						<option value="50"
							<c:if test="${param.orderBy == 50}">
								 selected="selected"
							</c:if>
						>50</option>
					</select>
			</div>
		</div>	
		
		<div class="btn">
			<button type="button" id="searchByKeywordBtn">검색</button>
		</div>
		
		<input id="frmPageIdBookFlag" type="hidden" name="bookFlag">
		<input type="hidden" name="currentPage" value="1">
	</div>
</form>
</div>