<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style type="text/css">
	#messateB{
		float: right;
		background-color: #eb5d1e;
	    border:0;
		border-radius: 5px;
		padding: 6px 15px;
		margin-top: -6px;
		margin-right: 9px;
		color: white;
	}
	#messateA{
		float: right;
		background-color: #eb5d1e;
	    border:0;
		border-radius: 5px;
		padding: 6px 15px;
		margin-top: -6px;
		margin-right: 9px;
		color: white;
	}
</style>
<div class="board-body">
	<div id="board-title">
		<h5>회원에게 쪽지 보내기</h5>
		<button class="message-button" id="messateA">전체 쪽지 보내기</button>
		<button class="message-button" id="messateB">쪽지 보내기</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="">
				<form name="frmSearch" method="post" action="<c:url value='/admin/message/message'/>">
					<div class="input-group mb-3" id="mbti-search-div">
						<select class="form-select form-select-lg" name="searchCondition" aria-label=".form-select-lg example" id="mbti-search-select">					  	
						  	<option value="no" <c:if test="${param.searchCondition=='no'}"> selected="selected" </c:if>>회원번호</option>
						  	<option value="userid" <c:if test="${param.searchCondition=='userid'}"> selected="selected" </c:if>>아이디</option>
						  	<option value="name" <c:if test="${param.searchCondition=='name'}"> selected="selected" </c:if>>회원 이름</option>
						  	<option value="hp" <c:if test="${param.searchCondition=='hp'}"> selected="selected" </c:if>>전화번호</option>
						</select>
					 	<input type="text"  class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요"
					 		aria-label="Recipient's username" aria-describedby="button-addon2" id="mbti-search-area" value="${param.searchKeyword}">
					 	<button class="mbti-button4" type="submit" id="mbti-search">검색</button>
					</div>
				</form>
			</div>
		</div>
		<table class="table" id="mbtitb">
			<thead>
				<tr class="board-table-colum">
					<th scope="col" class="message-checkbox"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="message-no">회원 번호</th>
					<th scope="col" class="mbti-writer">아이디</th>
					<th scope="col" class="mbti-writer">회원 이름</th>
					<th scope="col" class="mbti-writer">전화번호</th>
				</tr>
			</thead>
			<c:set var="idx" value="0"/>
			<tbody>
				<c:forEach var="memVo" items="${list}">
					<c:if test="${!empty list}">
						<c:set var="questionType" value="${mbtiSurveyVo.questionTypeNo}"/>
						<tr>
							<th scope="row"><input type="checkbox" name="sendItems[${idx}].receiveNo" class="board-checkbox check" value="${memVo.no}"></th>
							<td>${memVo.no}</td>
							<td>${memVo.userid}</td>
							<td id="name${memVo.no}">${memVo.name}</td>
							<td>${memVo.hp}</td>
						</tr>
					</c:if>
					<c:set var="idx" value="${idx+1}"/>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">해당 검색 내용이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

<button type="button" style="display: none" id="messagetModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#messageModal"></button>

<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="alertModalLabel" ></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div style="margin-left: 15px;margin-top: 20px">
				<span>받는 회원 : &nbsp;</span><span id="memberNameModal"></span>
			</div>
			<form name="adminMessageFrm" method="post" action="<c:url value='/admin/message/messageWrite'/>">
				<div class="modal-body" style="margin:0 auto">
					<p id="input"></p>
					<p>보낼 내용</p>
					<textarea name="sendItems[0].sendBody" id="sendBody" rows="20" cols="88" style="margin:0 auto"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn bg-orange-primary" id="messageOkBtn">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>

	<%@ include file="../inc/bottom.jsp"%>