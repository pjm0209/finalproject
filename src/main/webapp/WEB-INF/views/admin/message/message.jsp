<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<div class="board-body">
	<div id="board-title">
		<h5>쪽지 관리</h5>
		<button class="message-button">쪽지 보내기</button>
		<button class="message-button">전체 쪽지 보내기</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="">
				<form name="frmSearch" method="post" action="<c:url value='/admin/mbti/mbti'/>">
					<div class="input-group mb-3" id="mbti-search-div">
						<select class="form-select form-select-lg" name="searchCondition" aria-label=".form-select-lg example" id="mbti-search-select">					  	
						  	<option value="question_type_no" <c:if test="${param.searchCondition=='question_type_no'}"> selected="selected" </c:if> >문제 유형</option>
						  	<option value="question" <c:if test="${param.searchCondition=='question'}"> selected="selected" </c:if>>질문지</option>
						</select>
					 	<input type="text"  class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요"
					 		aria-label="Recipient's username" aria-describedby="button-addon2" id="mbti-search-area" value="${param.searchKeyword}">
					 	<button class="mbti-button4" type="submit" id="mbti-search">검색</button>
					</div>
				</form>
			</div>
		</div>
		<form name="frmDelete" method="post">
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
					<c:set var="questionType" value="${mbtiSurveyVo.questionTypeNo}"/>
					<tr>
						<th scope="row"><input type="checkbox" name="sendItems[${idx}].receiveNo" class="board-checkbox check" value="${memVo.no}"></th>
						<td>${memVo.no}</td>
						<td>${memVo.userid}</td>
						<td id="name${memVo.no}">${memVo.name}</td>
						<td>${memVo.hp}</td>
					</tr>
					<c:set var="idx" value="${idx+1}"/>
				</c:forEach>
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
			<form name="messageFrm" method="post" action="<c:url value='/admin/message/message'/>">
				<div class="modal-body" style="margin:0 auto">
					<p>보낼 내용</p>
					<textarea name="sendItems[0].sendBody" id="sendBody" rows="20" cols="84" style="margin:0 auto"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn bg-orange-primary" id="messageOkBtn" >확인</button>
				</div>
			</form>
		</div>
	</div>
</div>

	<%@ include file="../inc/bottom.jsp"%>