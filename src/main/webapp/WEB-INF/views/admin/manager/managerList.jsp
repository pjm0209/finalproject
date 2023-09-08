<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
.head-div {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

button#add-manager-button{
	font-weight: bold;
	background-color: #eb5d1e;
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
	background-color: #eb5d1e;
}

button#manager-edit-button {
	float:  right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
	background-color: #eb5d1e;
}

select#manager-search-select {
	font-size: 16px;
    margin-right: 20px;
    height: 40px;
    margin-bottom: 0;
    border: 1px solid #d8dce5;
    border-radius: 6px;
    margin-left: 1095px;
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
        $('#add-newBoard-button').click(function(){
            var popupWidth = 600;
            var popupHeight = 550;
            var leftPosition = (screen.width - popupWidth) / 2;
            var topPosition = (screen.height - popupHeight) / 2;

            var popupFeatures = 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + leftPosition + ',top=' + topPosition;
            
            window.open('managerAdditional', '_blank', popupFeatures);
        });
	        
/* 		$('#manager-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				//alert('삭제할 관리자를 선택하세요.');
				$('#alertModalBody').html("삭제할 관리자를 선택하세요.");
			    $('#alertModal').modal('show');
				return;
			}
			
			if(confirm('선택한 관리자를 삭제하시겠습니까?')){
				//$('form[name=form-Delete]').prop('action',contextPath+'/admin/manager/managerDelete');
				//$('form[name=form-Delete]').submit();
				$('#confirmModalBody').html('선택한 관리자를 삭제하시겠습니까?');
				$('#confirmOk').attr('onclick', 'managerDel()');	 		 
	         	$('#confirmModalBtn').trigger('click')
			}
	}); */
	
	$('#manager-delete-button').click(function(){
		var count = $('input[type=checkbox]:checked').length;
		
		if(count < 1) {
			$('#alertModalBody').html('삭제 관리자를 선택하세요.');
			$('#alertModalBtn').trigger('click');
			return false;
		}

		 $('#confirmModalBody').html('선택한 관리자를 삭제하시겠습니까?');		
		 $('#confirmOk').attr('onclick', 'managerDel()');	 		 
         $('#confirmModalBtn').trigger('click');
	});
			
	});	
	function managerDel() {
		$('#selectManagerDelete').attr('action', contextPath + '/admin/manager/managerDelete');
		$('form[name=form-Delete]').submit();
	}
</script>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">관리자 관리</h2>
	<button type="button" class="add-manager-button"
		id="add-manager-button"onclick="location.href='managerAdditional'">관리자 등록</button>	
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
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="manager-search-select">					  						  
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
		
		<form name="form-Delete" method="post" id="selectManagerDelete" action="<c:url value='/admin/manager/managerDelete'/>">
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
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="5">조건에 일치하는 검색결과가 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>			
				<c:forEach var="vo" items="${list}">
					<c:set var="adminInformation" value="${vo.adminNo}"/>
					<tr>
						<th scope="row"><input type="checkbox" class="board-checkbox" name="adminItems[${idx}].adminNo" value="${vo.adminNo }"></th>
						<td>${vo.adminNo}</td>
						<td>${vo.adminId}</td>
						<td>${vo.adminEmail}</td>
						<td>${vo.adminTel}</td>
					</tr>	
				</c:forEach>	
					</c:otherwise>
				</c:choose>									
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
    <button type="button" style="display: none" id="confirmModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmModal"></button>
    
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="confirmModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="confirmModalBody"></p>
	      </div>
	      <div class="modal-footer">
	      	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn bg-orange-primary" id="confirmOk" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>


<%@ include file="../inc/bottom.jsp"%>