<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
button#member-delete-button{
	float:  right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
	background-color: #eb5d1e;
}

select#member-search-select {
	font-size: 16px;
    margin-right: 20px;
    height: 40px;
    margin-bottom: 0;
    border: 1px solid #d8dce5;
    border-radius: 6px;
    margin-left: 840px;
}
</style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#member-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('탈퇴시킬 회원을 선택하세요.');
				return;
			}
			
			if(confirm('선택한 회원을 탈퇴시키겠습니까?')){
				$('form[name=form-Delete]').prop('action',contextPath+'/admin/member/memberDelete');
				$('form[name=form-Delete]').submit();
			}
		});
	});
	
	function memberDel() {
		$('#selectMemberDelete').attr('action', contextPath + '/admin/member/memberDelete');
		$('form[name=form-Delete]').submit();
	}
	
</script>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">회원 관리</h2>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>회원 리스트</h5>
			<button class="member-button" id="member-delete-button" >삭제</button>
	</div>
	
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/admin/member/memberList'/>">
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="member-search-select">					  	
					  	<option value="name"  <c:if test="${param.searchCondition=='name'}"> selected="selected" </c:if> >이름</option>
					  	<option value="userid" <c:if test="${param.searchCondition=='userid'}"> selected="selected" </c:if>>아이디</option>
					</select>
				 	<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="searchKeyword"
				 	aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		
		<form name="form-Delete" method="post" id="selectMemberDelete" action="<c:url value='/admin/member/memberDelete'/>">
		<table class="table">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="board-no">번호</th>
					<th scope="col" class="board-userid">아이디</th>
					<th scope="col" class="board-name">이름</th>
					<th scope="col" class="board-regdate">가입일</th>
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
					<c:set var="memberInformation" value="${vo.no}"/>
					<tr>
						<th scope="row"><input type="checkbox" class="board-checkbox" name="memberItems[${idx}].no" value="${vo.no }"></th>
						<td>${vo.no}</td>
						<td>${vo.userid}</td>
						<td>${vo.name}</td>
						<td>
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
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
						<li class="page-item active"><a class="page-link" href="<c:url value='/admin/member/memberList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/member/memberList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
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