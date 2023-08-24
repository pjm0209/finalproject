<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
						$(function(){
							$('.education-search').keyup(function() {
								if($('#edu-search-select').val() == 'edu_app_flag') {
									var str = $('input[name=searchKeyword]').val();
									
									if(str != 'Y' && str != 'N' && str != 'y' && str != 'n') {
										$('input[name=searchKeyword]').val('');
									} else {
										if(str == 'y') {
											$('input[name=searchKeyword]').val('Y');
										} else if(str == 'n') {
											$('input[name=searchKeyword]').val('N');
										}
									}
								}
							});
						});
					</script>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">교육 관리</h2>
</div>

<div class="board-body">
	<div id="board-title">
		<h5>신청자 관리</h5>
		<button class="applicant-button" id="applicant-edit-button">승인</button>
		<button class="applicant-button" id="applicant-delete-button">거절</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/education/applicantList'/>">
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="edu-search-select">					  	
					  	<option value="edu_app_flag" <c:if test="${param.searchCondition=='edu_app_flag'}"> selected="selected" </c:if>>승인 상태</option>
					  	<option value="name" <c:if test="${param.searchCondition=='name'}"> selected="selected" </c:if>>신청자</option>
					  	<option value="ep_name" <c:if test="${param.searchCondition=='ep_name'}"> selected="selected" </c:if>>교육장</option>
					</select>
					
				 	<input type="text" class="form-control education-search" name="searchKeyword" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		<form name="frmDelete" method="post" id="eduAppDelFrm" action="<c:url value='/admin/education/appliUpdate'/>">
		<table class="table" id="educationtb">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col">신청자</th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 기간</th>
					<th scope="col">현재 인원</th>
					<th scope="col">최대 인원</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
					<th scope="col">승인 상태</th>
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
						<c:set var="educationApplicant" value="${educationVo.eduAppNo}"/>
						<tr>
							<th scope="row"><input type="checkbox" class="board-checkbox" name="educationItems[${idx }].eduAppNo" value="${educationVo.eduAppNo }"></th>
							<td>${educationVo.name }</td>
							<td>${educationVo.eduName }</td>
							<td>${educationVo.eduTeaName }</td>
							<td>${educationVo.eduCom }</td>
							<td>${educationVo.qty }</td>
							<td>${educationVo.eduPeopleNumber }</td>
							<td>${educationVo.eduPrice }</td>
							<td>${educationVo.epName }</td>
							<td>${educationVo.eduAppFlag }</td>
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
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/education/applicantList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/education/applicantList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
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