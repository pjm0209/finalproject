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
			<c:if test="${param.flag == 'BASKET'}">
				action="<c:url value='/admin/order/bookBasket?flag=BASKET'/>"
			</c:if>
		>
			<div class="flex shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
			<h2>주문 검색</h2>
			<c:if test="${param.flag != 'BASKET'}">
				<div class="box">
					<label>주문번호</label>
						<div class="flex_ca">	
								<input class="form-control" placeholder="주문번호">
						</div>
					<label>PG번호</label>
						<div class="flex_ca">	
								<input class="form-control" placeholder="PG번호">
						</div>
				</div>
			</c:if>
			<div class="form-group box">
				<c:if test="${param.flag != 'BASKET'}">
					<label>결제타입</label>
					<div>
						<select class="form-control" id="s_odm_status" name="s_odm_status">
													<option value="">선택</option>
													<option value="card">카드</option>
													<option value="cash">현금</option>
						</select>
					</div>
					<label>주문상태</label>
					<div>
						<select class="form-control" id="s_odm_status" name="s_odm_status">
													<option value="">선택</option>
													<option value="B1">입금대기</option>
													<option value="C1">결제완료</option>
													<option value="D1">배송준비</option>
													<option value="E1">배송중</option>
													<option value="F1">배송완료</option>
													<option value="G1">구매확정</option>
													<option value="H1">취소신청</option>
													<option value="H2">취소완료</option>
													<option value="I1">반품신청</option>
													<option value="I2">반품완료</option>
													<option value="J1">교환신청</option>
													<option value="J2">교환완료</option>
													<option value="K1">환불신청</option>
													<option value="K2">환불완료</option>
						</select>
					</div>
				</c:if>											
			</div>
			
				<div class="box">
					<c:if test="${param.flag != 'BASKET'}">
					<label>제조사</label>
						<div>
							<input class="form-control" placeholder="제조사" type="text" value="">
						</div>
					</c:if>
					<c:if test="${param.flag == 'BASKET'}">
					<label>회원ID</label>
						<div>
							<input class="form-control" placeholder="회원ID" type="text" value="">
						</div>
					<label>회원명</label>
						<div>
							<input class="form-control" placeholder="회원명" type="text" value="">
						</div>
					</c:if>
				</div>
			<c:if test="${param.flag != 'BASKET'}">
				<div class="box">
					<label>사용여부</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
						<label class="form-check-label" for="flexRadioDefault1">
							전체
						</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
						<label class="form-check-label" for="flexRadioDefault2">
							사용
						</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
						<label class="form-check-label" for="flexRadioDefault3">
							미사용
						</label>
					</div>
				</div>
			</c:if>
			<c:if test="${param.flag != 'BASKET'}">
				<div class="box">
					<label>회원명</label>
					<div class="divName">
						<input class="form-control" id="" name="" placeholder="회원명" type="text" value="">
					</div>
					<div class="divUserID">
						<input class="form-control" id="" name="" placeholder="ID" type="text" value="">
					</div>
				</div>
			</c:if>
			<c:if test="${param.flag == 'BASKET'}">
				<div class="box">
					<label>등록일</label>
					<div class="register">
						<input class="form-control" id="" name="" placeholder="등록일" type="text" value="">
					</div>
					<div>
						<input class="form-control" id="" name="" placeholder="등록일(종료일)" type="text" value="">
					</div>
				</div>
			</c:if>
			<div>
				<c:if test="${param.flag != 'BASKET'}">
					<div class="box num_01">
					<label>정렬</label>
				
						<select class="form-select" id="" name="">
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
				</c:if>
				<div class="box num_01">
				<label>게시글 수</label>
				
					<select class="form-select">
						<option value="5">5</option>
						<option value="10" selected="selected">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
				</div>
			</div>

			<div class="btn">
				<button onclick="" type="submit" title="검색">검색</button>
			</div>

		</div>
		</form>
	</div>