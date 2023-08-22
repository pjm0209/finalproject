<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form name="serach" method="post" action="<c:url value='/admin/book/bookSearch'/>">
	<div class="flex shadow-sm p-3 mb-5 bg-body rounded"
		style="margin: 10px 0px; background: white; margin-right: 15px">
		<h2>상품 검색</h2>
		<div class="box">
			<label>상품카테고리</label>

			<div class="flex_ca">
				<select class="form-select" aria-label="Default select example" name="bookCategory">
					<option value="">선택</option>
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
				<input class="form-control" name="bookNo" placeholder="상품코드" type="text">
			</div>
			<label>상품명</label>
			<div>
				<input class="form-control" name="bookTitle" placeholder="상품명" type="text">
			</div>

		</div>
		<div class="box">
			<label>제조사</label>
			<div>
				<input class="form-control" name="bookPublisher" placeholder="제조사" type="text" value="">
			</div>
		</div>
		<div class="box">
			<label>사용여부</label>
			<div>
				<label>
					<input name="bookUseflag" placeholder="사용여부" type="checkbox" value="" checked="checked">
						전체
				</label>
				<label>
					<input name="bookUseflag" placeholder="사용여부" type="checkbox" value="Y">
						사용
				</label>
				<label> <input name="bookUseflag" placeholder="사용여부" type="checkbox" value="N">
					미사용
				</label>
			</div>
		</div>
		<div class="box">
			<label>등록일</label>
			<div class="register">
				<input class="form-control" id="" name="bookRegdate" placeholder="등록일" type="date" >
			</div>
			<div>
				<input class="form-control" id="" name="bookRegdate" placeholder="등록일(종료일)" type="date" >
			</div>
		</div>
		<div>
			<div class="box num_01">
				<label>정렬</label>
					<select class="form-select" id="" name="orderBy" style="margin-left: 214px;">
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
					<select class="form-select" id="perSrch" name="cntPerRecord">
						<option value="5">5</option>
						<option value="2" selected="selected">2</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
			</div>
		</div>

		<div class="btn">
			<button type="submit">검색</button>
		</div>

	</div>
</form>
</div>
