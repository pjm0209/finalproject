<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">교육 관리</h2>
	<button type="button" class="add-edu-button"
		id="add-edu-button" onclick="location.href='teacherWrite'">강사 등록</button>
</div>

<div class="board-body">
	<div id="board-title">
		<h5>강사 관리</h5>
		<button class="teacher-button" id="teacher-edit-button">수정</button>
		<button class="teacher-button" id="teacher-delete-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/education/teacher'/>">
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="edu-search-select">					  	
					  	<option value="edu_tea_name" <c:if test="${param.searchCondition=='edu_tea_name'}"> selected="selected" </c:if>>이름</option>
					  	<option value="edu_tea_id" <c:if test="${param.searchCondition=='edu_tea_id'}"> selected="selected" </c:if>>아이디</option>
					  	<option value="edu_tea_tel" <c:if test="${param.searchCondition=='edu_tea_tel'}"> selected="selected" </c:if>>전화번호</option>
					</select>
				 	<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		<form name="frmDelete" method="post" id="eduTeaDelFrm" action="<c:url value='/admin/education/teaDelete'/>">
		<table class="table" id="educationtb">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col">번호</th>
					<th scope="col">이름</th>
					<th scope="col">아이디</th>
					<th scope="col">비밀번호</th>
					<th scope="col">이메일</th>
					<th scope="col">전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="idx" value="0"/>
				<c:if test="${empty list }">
					<tr>
						<td colspan="9">해당 검색 내용이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="educationVo" items="${list}">
						<c:set var="educationPlace" value="${educationVo.eduTeaNo}"/>
						<tr>
							<th scope="row"><input type="checkbox" class="board-checkbox" name="educationItems[${idx }].eduTeaNo"value=" ${educationVo.eduTeaNo }"></th>
							<td>${educationVo.eduTeaNo }</td>
							<td>${educationVo.eduTeaName }</td>
							<td>${educationVo.eduTeaId }</td>
							<td>${educationVo.eduTeaPwd }</td>
							<td>${educationVo.eduTeaEmail }</td>
							<td>${educationVo.eduTeaTel }</td>
						</tr>
						<c:set var="idx" value="${idx + 1 }" />
					</c:forEach>
				</c:if>
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
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/education/list?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/education/list?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
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