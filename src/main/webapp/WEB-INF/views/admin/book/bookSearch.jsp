<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	
</script>
<form name="serach" method="post"
	 action="<c:url value='/admin/book/bookList?bookFlag=bookListByKeyword'/>">
	<div class="flex shadow-sm p-3 mb-5 bg-body rounded"
		style="margin: 10px 0px; background: white; margin-right: 15px">
		<h2>상품 검색</h2>
		<div class="box">
			<label>상품카테고리</label>

			<div class="flex_ca">
				<select id="s1" class="form-select" aria-label="Default select example" name="keywordCategory">
					<option value="" selected="selected">선택</option>
					<option value="검사자료">검사자료</option>
					<option value="도서">도서</option>
					<option value="기타">기타</option>
				</select>
				<select class="form-select" aria-label="Default select example">
					<option value="">선택</option>
				</select>
			</div>

		</div>
		<div class="form-group box">
			<label>상품코드</label>
			<div>
				<input class="form-control" name="keywordNo" placeholder="상품코드" type="number">
			</div>
			<label>상품명</label>
			<div>
				<input class="form-control" name="keywordTitle" placeholder="상품명" type="text">
			</div>

		</div>
		<div class="box">
			<label>제조사</label>
			<div>
				<input class="form-control" name="keywordPublisher" placeholder="제조사" type="text" value="">
			</div>
		</div>
		<div class="box">
			<label>사용여부</label>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="flexRadioDefault1"
						name="keywordUseflag" placeholder="사용여부" type="radio" value="Y">
				<label class="form-check-label" for="flexRadioDefault1">
					전체
				</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="form-check-input" type="radio" id="flexRadioDefault2"
						name="keywordUseflag" placeholder="사용여부" type="radio" value="Y">
				<label class="form-check-label" for="flexRadioDefault2">
					사용
				</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="form-check-input" type="radio" id="flexRadioDefault3"
						name="keywordUseflag" placeholder="사용여부" type="radio" value="N">
				<label class="form-check-label" for="flexRadioDefault3">
					미사용
				</label>
			</div>
		</div>
		<div class="box">
			<label>등록일</label>
			<div class="register">
				<input class="form-control" id="" name="keywordRegdate" placeholder="등록일" type="date" >
			</div>
			<div>
				<input class="form-control" id="" name="keywordRegdate2" placeholder="등록일(종료일)" type="date" >
			</div>
		</div>
		<div>
			<div class="box num_01">
				<label>정렬</label>
					<select class="form-select" id="" name="orderBy" style="margin-left: 214px;">
						<option value="" selected="selected">선택</option>
						<option value="book_title">상품명 오름차순</option>
						<option value="book_title_desc">상품명 내림차순</option>
						<option value="book_regdate">상품등록일 오름차순</option>
						<option value="book_regdate_desc">상품등록일 내림차순</option>
						<option value="book_no">상품코드 오름차순</option>
						<option value="book_no_desc">상품코드 내림차순</option>
						<option value="book_price">판매가 오름차순</option>
						<option value="book_price_desc">판매가 내림차순</option>
						<option value="out_qty">판매수 오름차순</option>
						<option value="out_qty_desc">판매수 내림차순</option>
					</select>
			</div>
			<div class="box num_01">
				<label>게시글 수</label>
					<select class="form-select" id="perRecord" name="perRecord">
						<option value="5" selected="selected">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
			</div>
		</div>	
		
		<div class="btn">
			<button type="button" id="searchByKeywordBtn">검색</button>
		</div>

	</div>
</form>
</div>
