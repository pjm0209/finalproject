<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
button#teacher-edit-button {
	float:  right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}

button#teacher-delete-button {
	float:  right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}

.teacher-button {
	background-color: #858796;
    background-image: linear-gradient(180deg, #858796 10%, #60616f 100%);
    background-size: cover;
}
</style>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">교육 관리</h2>
	<button type="button" class="bg-gradient-primary"
		id="add-newBoard-button" onclick="location.href='educationCreate'">강사 추가</button>
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
		<h5>강사 관리</h5>
		<button class="teacher-button" id="teacher-edit-button">수정</button>
		<button class="teacher-button" id="teacher-delete-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/education/teacher'/>">
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchcondition" id="board-search-select">					  	
					  	<option value="edu_name" <c:if test="${param.searchCondition=='edu_tea_name'}"> selected="selected" </c:if>>이름</option>
					  	<option value="edu_teacher" <c:if test="${param.searchCondition=='edu_tea_id'}"> selected="selected" </c:if>>아이디</option>
					  	<option value="ep_no" <c:if test="${param.searchCondition=='edu_tea_tel'}"> selected="selected" </c:if>>전화번호</option>
					</select>
				 	<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
			</div>
		</div>
		<form name="frmDelete" method="post">
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
			<c:set var="idx" value="0"/>
			<tbody>
				<c:forEach var="educationVo" items="${list}">
					<c:set var="educationPlace" value="${educationVo.eduTeaNo}"/>
					<tr>
						<th scope="row"><input type="checkbox" class="board-checkbox" name="eduTeaNo" value="${educationVo.eduNo }"></th>
						<td>${educationVo.eduTeaNo }</td>
						<td>${educationVo.eduTeaName }</td>
						<td>${educationVo.eduTeaId }</td>
						<td>${educationVo.eduTeaPwd }</td>
						<td>${educationVo.eduTeaEmail }</td>
						<td>${educationVo.eduTeaTel }</td>
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
<script type="text/javascript" src="<c:url value='/admin-css-js/js/education.js'/>"></script>	
<%@ include file="../inc/bottom.jsp"%>