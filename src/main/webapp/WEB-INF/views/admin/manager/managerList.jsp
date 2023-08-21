<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
button#manager-edit-button {
	float:  right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}

button#manager-delete-button {
	float:  right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}

.manager-button {
	background-color: #858796;
    background-image: linear-gradient(180deg, #858796 10%, #60616f 100%);
    background-size: cover;
}
</style>

<script type="text/javascript"></script>
<script>
	$(function(){
        $('#add-newBoard-button').click(function(){
            var popupWidth = 600;
            var popupHeight = 550;
            var leftPosition = (screen.width - popupWidth) / 2;
            var topPosition = (screen.height - popupHeight) / 2;

            var popupFeatures = 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition;
            
            window.open('managerAdditional', '_blank', popupFeatures);
        });
	        
		$('#board-write-button').click(function(){
			if(confirm("선택한 관리자를 삭제하시겠습니까?")){
				var contextpath = "/mbti";
				location.href=contextpath+"/admin/manager/managerList";
			}
			
		});	
	});
</script>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">관리자 관리</h2>
	<button type="button" class="bg-gradient-primary"
		id="add-newBoard-button">관리자 추가</button>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>관리자</h6>
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
					<a class="managerList-link" href="<c:url value='/admin/manager/managerList'/>">
						<span>관리자 리스트</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>관리자 리스트</h5>		
		<button class="manager-button" id="manager-delete-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/manager/managerList'/>">
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchcondition" id="board-search-select">					  						  
					  	<option value="admin_id" <c:if test="${param.searchCondition=='adminId'}"> selected="selected" </c:if>>아이디</option>
					  	<option value="admin_email" <c:if test="${param.searchCondition=='adminEmail'}"> selected="selected" </c:if>>이메일</option>					  	
					  	<option value="admin_tel" <c:if test="${param.searchCondition=='adminTel'}"> selected="selected" </c:if>>전화번호</option>
					</select>
				 	<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		<form name="frmDelete" method="post">
		<table class="table" id="managertb">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="number">번호</th>					
					<th scope="col" class="adminId">아이디</th>
					<th scope="col" class="adminEmail">이메일</th>
					<th scope="col" class="adminTel">전화번호</th>
				</tr>
			</thead>
			<c:set var="idx" value="0"/>
			<tbody>
				<c:forEach var="vo" items="${list}">
					<tr>
						<th scope="row"><input type="checkbox" class="board-checkbox"></th>
						<td>${vo.adminNo}</td>
						<td>${vo.adminId}</td>
						<td>${vo.adminEmail}</td>
						<td>${vo.adminTel}</td>
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
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/manager/managerList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/manager/managerList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
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