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
		<h5>MBTI 질문 관리</h5>
		<button class="mbti-button" id="mbti-write-button">질문지 등록</button>
		<button class="mbti-button" id="mbti-edit-button">질문지 수정</button>
		<button class="mbti-button" id="mbti-delete-button">질문지 삭제</button>
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
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="mbti-writer">번호</th>
					<th scope="col" class="mbti-writer">문제 유형</th>
					<th scope="col" class="mbti-title">질문지</th>
				</tr>
			</thead>
			<c:set var="idx" value="0"/>
			<tbody>
				<c:forEach var="mbtiSurveyVo" items="${list}">
					<c:set var="questionType" value="${mbtiSurveyVo.questionTypeNo}"/>
					<tr>
						<th scope="row"><input type="checkbox" name="surveyItems[${idx}].mbtiSurveyNo" class="board-checkbox check" value="${mbtiSurveyVo.mbtiSurveyNo}"></th>
						<td>${mbtiSurveyVo.mbtiSurveyNo}</td>
						<td>
							<c:choose>
								<c:when test="${questionType == '1'}">F</c:when>
								<c:when test="${questionType == '2'}">P</c:when>
							</c:choose>
						</td>
						<td> 
							<span style="float:left;margin-left: 50px;">
								<c:if test="${fn:length(mbtiSurveyVo.question) > 70}">
									${fn:substring(mbtiSurveyVo.question,0,50)}...
								</c:if>
								<c:if test="${fn:length(mbtiSurveyVo.question) <= 70}">
									${mbtiSurveyVo.question}
								</c:if>
							</span>
						</td>
					</tr>
					<c:set var="idx" value="${idx+1}"/>
				</c:forEach>
			</tbody>
		</table>
		<div style="width: 10%;text-align: center;margin: 0 auto;">
			<ul class="pagination">
				<c:if test="${pagingInfo.firstPage > 1 }">
				    <li class="page-item">
				      <a class="page-link" href="<c:url value='/admin/mbti/mbti?currentPage=${pagingInfo.firstPage-1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				</c:if>
				<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
					<c:if test="${i==pagingInfo.currentPage}">
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/mbti/mbti?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/mbti/mbti?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				    <li class="page-item">
				      <a class="page-link" href="<c:url value='/admin/mbti/mbti?currentPage=${pagingInfo.lastPage+1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>" aria-label="Next">
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