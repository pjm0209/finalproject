<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<form name="serach" method="post" action="<c:url value='/admin/book/bookList'/>">
			<div class="flex shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
			<h2>주문 검색</h2>
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