<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<div class="head-div">
	<h2 class="text-gray-800">교육 관리</h2>
	<button type="button" class="add-edu-button"
		id="add-edu-button" onclick="location.href='educationWrite'">교육 등록</button>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>교육 리스트</h5>
		<button class="education-button" id="education-edit-button">수정</button>
		<button class="education-button" id="education-delete-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/education/list'/>">
				<div class="input-group mb-3" id="edu-search-div" class="education">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="edu-search-select">					  	
					  	<option value="edu_name" <c:if test="${param.searchCondition=='edu_name'}"> selected="selected" </c:if>>교육 이름</option>
					  	<option value="edu_tea_name" <c:if test="${param.searchCondition=='edu_tea_name'}"> selected="selected" </c:if>>강사명</option>
					  	<option value="ep_name" <c:if test="${param.searchCondition=='ep_name'}"> selected="selected" </c:if>>교육장</option>
					</select>
				 	<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		<form name="frmDelete" method="post" id="eduDelFrm" action="<c:url value='/admin/education/eduDelete'/>">
		<table class="table" id="educationtb">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox" ></th>
					<th scope="col">번호</th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 기간</th>
					<th scope="col">현재 인원</th>
					<th scope="col">최대 인원</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
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
						<c:set var="educationNo" value="${educationVo.eduNo}"/>
						<tr>
							<th scope="row"><input type="checkbox" class="board-checkbox" name="educationItems[${idx }].eduNo" value="${educationVo.eduNo }"/></th>
							<td>${educationVo.eduNo }</td>
							<td>${educationVo.eduName }</td>
							<td>${educationVo.eduTeaName }</td>
							<td>${educationVo.eduCom }</td>
							<td>
								<a href="#"  onclick="eduModal(${educationVo.eduNo})">
									${educationVo.qty }
								</a>
							</td>	
							<td>${educationVo.eduPeopleNumber }</td>
							<td><fmt:formatNumber value="${educationVo.eduPrice }" pattern="#,###"/>
							<td>${educationVo.epName }</td>
						</tr>
						<c:set var="idx" value="${idx + 1 }" />
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<!-- Paging -->
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
<input type="button" style="display: none" id="educationModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#educationModal"/>
<div class="modal fade" id="educationModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="alertModalLabel" ></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div id="modalTable" style="margin-left: 15px;margin-top: 20px">
				<span>회원 : &nbsp;</span>
			</div>
			<form name="messageFrm" method="post" action="<c:url value='/admin/education/list'/>">
				<div class="modal-body" style="margin:0 auto">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>