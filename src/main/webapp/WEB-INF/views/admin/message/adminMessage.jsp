<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style type="text/css">
	#messateDSend{
		float: right;
		background-color: #eb5d1e;
	    border:0;
		border-radius: 5px;
		padding: 6px 15px;
		margin-top: -6px;
		margin-right: 9px;
		color: white;
	}
	#messateCDelete{
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
		<h5>관리자 쪽지 목록</h5>
		<button class="message-button" id="messateCDelete">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="">
				<form name="frmSearch" method="post" action="<c:url value='/admin/message/adminMessage'/>">
					<div class="input-group mb-3" id="mbti-search-div">
						<select class="form-select form-select-lg" name="searchCondition" aria-label=".form-select-lg example" id="mbti-search-select">					  	
						  	<option value="no" <c:if test="${param.searchCondition=='no'}"> selected="selected" </c:if>>회원번호</option>
						  	<option value="send_id" <c:if test="${param.searchCondition=='send_id'}"> selected="selected" </c:if>>아이디</option>
						  	<option value="send_body" <c:if test="${param.searchCondition=='send_body'}"> selected="selected" </c:if>>내용</option>
						</select>
					 	<input type="text"  class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요"
					 		aria-label="Recipient's username" aria-describedby="button-addon2" id="mbti-search-area" value="${param.searchKeyword}">
					 	<button class="mbti-button4" type="submit" id="mbti-search">검색</button>
					</div>
				</form>
			</div>
		</div>
		<form name="adminMessageFrm2" method="post">
			<table class="table" id="mbtitb">
				<thead>
					<tr class="board-table-colum">
						<th scope="col" class="message-checkbox"><input type="checkbox" id="check-All" class="board-checkbox"></th>
						<th scope="col" class="message-no">회원 번호</th>
						<th scope="col" class="message-no">아이디</th>
						<th scope="col" class="message-body">쪽지 내용</th>
						<th scope="col" class="message-no">날짜</th>
					</tr>
				</thead>
				<c:set var="idx" value="0"/>
				<tbody>
					<c:forEach var="map" items="${list}">
						<input type="hidden" name="sendItems[${idx}].sendDmNo" value="${map['SEND_DM_NO']}" />
						<input type="hidden" name="sendItems[${idx}].readDate" value="${map['READ_DATE']}" />
						<c:if test="${!empty list}">
							<tr>
								<th scope="row">
									<input type="checkbox" name="sendItems[${idx}].sendDmNo" class="board-checkbox check" value="${map['SEND_DM_NO']}">
								</th>
								<td name="no">${map["NO"]}</td>
								<td>${map["SEND_ID"]}</td>
								<td name="messageDetail" style="cursor: pointer;"><span style="float:left;">${map["SEND_BODY"]}</span></td>
								<td><fmt:formatDate value="${map['SEND_REGDATE']}" pattern="yyyy-MM-dd [HH:mm]"/></td>
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
		</form>	
	</div>
</div>

<button type="button" style="display: none" id="messagetModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#messageDetailModal"></button>

<div class="modal fade" id="messageDetailModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="alertModalLabel"></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div style="margin-left: 15px;margin-top: 20px">
				<span id="user_id">보낸 회원 : &nbsp;</span><span id="memberNameModal"></span>
			</div>
			<form name="adminMessageFrm" method="post" action="<c:url value='/admin/message/messageWrite2'/>">
				<div class="modal-body" style="margin:0 auto">
					<p id="input1"></p>
					<p id="input2"></p>
					<p>쪽지 내용</p>
					<textarea readonly="readonly" name="sendBody" id="sendBody" rows="20" cols="88" style="margin:0 auto;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalClose">닫기</button>
					<button type="button" class="btn bg-orange-primary" id="reSendMessage">답장</button>
					<button type="button" class="btn bg-orange-primary" id="sendMessage" style="display: none;">보내기</button>
					
				</div>
			</form>
		</div>
	</div>
</div>
 
<%@ include file="../inc/bottom.jsp" %> 