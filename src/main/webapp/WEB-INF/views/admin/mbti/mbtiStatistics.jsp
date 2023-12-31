<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">MBTI</h2>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>MBTI 검사 관리</h5>
		<button class="mbti-button" id="mbtiStatistics-delete-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/mbti/mbtiStatistics'/>">
					<div class="input-group mb-3" id="mbti-search-div">
						<select class="form-select form-select-lg" name="searchCondition" aria-label=".form-select-lg example" id="mbti-search-select">					  	
						  	<option value="userid" <c:if test="${param.searchCondition=='userid'}"> selected="selected" </c:if> >회원 아이디</option>
						  	<option value="question_type_name" <c:if test="${param.searchCondition=='question_type_name'}"> selected="selected" </c:if>>MBTI 성격 유형</option>
						  	<option value="mbti_type" <c:if test="${param.searchCondition=='mbti_type'}"> selected="selected" </c:if>>MBTI 성격 유형</option>
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
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="mbti-id">회원 아이디</th>
					<th scope="col" class="mbti-kind">MBTI 검사 종류</th>
					<th scope="col" class="mbti-type">MBTI 성격 유형</th>
					<th scope="col" class="mbti-regdate">검사한 날짜</th>
				</tr>
			</thead>
			<c:set var="idx" value="0"/>
			<tbody>
				<c:forEach var="map" items="${list}">
					<input type="hidden" name="mbtiResultItem[${idx}].questionTypeNo" value="${map['QUESTION_TYPE_NO']}">
					<tr>
						<th scope="row"><input type="checkbox" name="mbtiResultItem[${idx}].no" class="board-checkbox check" value="${map['NO']}"></th>
						<td>${map["USERID"]}</td>
						<td>${map["QUESTION_TYPE_NAME"]}</td>
						<td>${map["MBTI_TYPE"]}</td>
						<td><fmt:formatDate value="${map['MBTI_RESULT_REGDATE']}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<c:set var="idx" value="${idx+1}"/>
				</c:forEach>
			</tbody>
		</table>
		<div style="width: 10%;text-align: center;margin: 0 auto;">
			<ul class="pagination">
				<c:if test="${pagingInfo.firstPage > 1 }">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				</c:if>
				<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
					<c:if test="${i==pagingInfo.currentPage}">
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/mbti/mbtiStatistics?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/mbti/mbtiStatistics?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				</c:if>
			</ul>
		</div>
		</form>
	</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>