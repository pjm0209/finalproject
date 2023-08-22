<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>


<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">교육 관리</h2>
	<button type="button" class="add-edu-button"
		id="add-edu-button" onclick="location.href='locationCreate'">교육장 추가</button>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>교육</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="group-list" class="nav">
		<div class="board-side-boardItem">
				<div class="board-name">
					<a class="applicantList-link" href="<c:url value='/admin/education/list'/>">
						<span>교육 리스트</span>
					</a>
				</div>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name">
					<a class="applicantList-link" href="<c:url value='/admin/education/applicantList'/>">
						<span>신청자 관리</span>
					</a>
				</div>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name">
					<a class="applicantList-link" href="<c:url value='/admin/education/teacher'/>">
						<span>강사 관리</span>
					</a>
				</div>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name">
					<a class="applicantList-link" href="<c:url value='/admin/education/location'/>">
						<span>교육장 관리</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>교육장 관리</h5>
		<button class="location-button" id="location-edit-button">수정</button>
		<button class="location-button" id="location-delete-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/education/location'/>">
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="edu-search-select">					  	
					  	<option value="ep_name" <c:if test="${param.searchCondition=='ep_name'}"> selected="selected" </c:if>>교육장</option>
					  	<option value="ep_address" <c:if test="${param.searchCondition=='ep_address'}"> selected="selected" </c:if>>주소</option>
					  	<option value="ep_tel" <c:if test="${param.searchCondition=='ep_tel'}"> selected="selected" </c:if>>전화번호</option>
					</select>
				 	<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		<form name="frmDelete" method="post">
		<table class="table" id="educationtb">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col">번호</th>
					<th scope="col">교육장</th>
					<th scope="col">우편번호</th>
					<th scope="col">주소</th>
					<th scope="col">전화번호</th>
				</tr>
			</thead>
			<c:set var="idx" value="0"/>
			<tbody>
				<c:forEach var="educationVo" items="${list}">
					<c:set var="educationPlace" value="${educationVo.epNo}"/>
					<tr>
						<th scope="row"><input type="checkbox" class="board-checkbox" name="epNo" value="${educationVo.epNo }"></th>
						<td>${educationVo.epNo }</td>
						<td>${educationVo.epName }</td>
						<td>${educationVo.epZipcode }</td>
						<td>${educationVo.epAddress }</td>
						<td>${educationVo.epTel }</td>
					</tr>
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
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/education/location?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/education/location?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
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
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>