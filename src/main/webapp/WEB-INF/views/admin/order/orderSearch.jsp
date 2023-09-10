<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<form name="serach" method="post"
			<c:if test="${param.flag eq 'orderCancle'}">
				action="<c:url value='/admin/order/orderCancleList?flag=orderCancle'/>"
			</c:if>
			<c:if test="${param.flag eq 'order'}">
				action="<c:url value='/admin/order/orderList?flag=order'/>"
			</c:if>
		>
		<input id="searchBookFlag" name="bookFlag"  type="hidden"
			<c:if test="${flag == 'order' or flag == 'orderByKeyword'}"> value='orderByKeyword'</c:if>
			<c:if test="${flag == 'orderCancle' or param.flag == 'orderCancleByKeyword'}"> value='orderCancleByKeyword'</c:if>
		>
			<div class="flex shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;margin-right: 15px">
			<h2>주문 검색</h2>
			<div class="box  flex box_search">
			 		<div>
						<label>주문번호</label>
						<div class="flex_ca">	
								<input class="form-control" name="ordersNo" placeholder="주문번호">
						</div>
					</div>
					<!-- <div>
							<label>PG번호</label>
							<div class="flex_ca">	
									<input class="form-control" placeholder="PG번호">
							</div>
					</div> -->
			</div>
			<div class="form-group box box_search">
				<div class="flex">
					<label>결제타입</label>
					<div>
						<select class="form-control"  name="paymentMethod">
							<option
								<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
								</c:if>
							 value="">선택</option>
							<option
								<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
								</c:if>
							 value="카카오페이">카카오페이</option>
							<option
								<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
								</c:if>
							 value="신용카드">신용카드</option>
							<option
								<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
								</c:if>
							 value="현금">현금</option>
						</select>
					</div>
				</div>
				<div class="flex">
				<label>주문상태</label>
					<div>
						<c:if test="${param.flag eq 'orderCancle'}">
							<select class="form-control" name="ordersState">
								<option 
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="">선택</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								value="입금대기">입금대기</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="결제완료">결제완료</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
										selected="selected"
									</c:if>
								 value="배송준비">배송준비</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
							 			selected="selected"
									</c:if>
								 value="배송중">배송중</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="배송완료">배송완료</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
									 		selected="selected"
									</c:if>
								 value="구매확정">구매확정</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="취소신청">취소신청</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="취소완료">취소완료</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="반품신청">반품신청</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="반품완료">반품완료</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="교환신청">교환신청</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="교환완료">교환완료</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="환불신청">환불신청</option>
								<option
									<c:if test="${param.orderBy eq 'book_regdate'}">
								 		selected="selected"
									</c:if>
								 value="환불완료">환불완료</option>
							</select>
						</c:if>	
					<!--  -->		
					</div>
				</div>
			</div>
			
			<div class="box">
				<c:if test="${param.flag != 'BASKET'}">
				<label>제조사</label>
					<div>
						<input class="form-control" placeholder="제조사" type="text" name="bookPublisher"
							<c:if test="${!empty param.keywordNo}"> value='${param.keywordNo}'</c:if>
						>
					</div>
				</c:if>
				<c:if test="${param.flag == 'BASKET'}">
				<label>회원ID</label>
					<div>
						<input class="form-control" placeholder="회원ID" type="text" name="userid"
							<c:if test="${!empty param.keywordNo}"> value='${param.keywordNo}'</c:if>
						>
					</div>
				<label>회원명</label>
					<div>
						<input class="form-control" placeholder="회원명" type="text" name="name"
							<c:if test="${!empty param.keywordNo}"> value='${param.keywordNo}'</c:if>
						>
					</div>
				</c:if>
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
				<label>회원명</label>
				<div class="divName">
					<input class="form-control" id="" name="name" placeholder="회원명" type="text" value="">
				</div>
				<div class="divUserID">
					<input class="form-control" id="" name="userid" placeholder="ID" type="text" value="">
				</div>
			</div>
			<div class="box">
			<label>등록일</label>
				<div class="register">
					<input class="form-control" id="" name="ordersRegdate1" placeholder="주문일(시작)" type="date"
						<c:if test="${!empty param.keywordRegdate}">
								 value=${param.keywordRegdate}
						</c:if>	
					 >
				</div>
				<div>
					<input class="form-control" id="" name="ordersRegdate2" placeholder="주문일(끝)" type="date"
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
		
		<input id="frmPageIdOrderFlag" type="hidden" name="flag">
		<input type="hidden" name="currentPage" value="1">
		</div>
	</form>
</div>