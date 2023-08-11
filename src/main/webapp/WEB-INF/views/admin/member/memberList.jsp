<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- Begin Page Content -->
<!-- Page Heading -->
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#board-write-button').click(function(){
			if(confirm("선택한 회원을 삭제하시겠습니까?")){
				var contextpath = "/mbti";
				location.href=contextpath+"/admin/member/memberList";
			}
			
		});	
	});
</script>
<div class="head-div">
	<h2 class="text-gray-800">회원</h2>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>회원 관리 </h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="group-list" class="nav">	
			<div class="board-side-boardItem">
				<div class="board-name" name="notice" value="notice" onclick="showRegisteredMembers()">
					<span>회원 리스트</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>회원 리스트</h5>
			<button class="bg-gradient-secondary" id="board-write-button">탈퇴</button>
	</div>
	<div class="member">
		<div class="member-head">
			<div class="member-search-result">
				<form name="frm" method="post" action="<c:url value='/admin/member/memberList'/>">
				<div class="input-group mb-3" id="member-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="board-search-select">					  	
					  	<option value="name"  <c:if test="${param.searchCondition=='name'}"> selected="selected" </c:if> >이름</option>
					  	<option value="userid" <c:if test="${param.searchCondition=='userid'}"> selected="selected" </c:if>>아이디</option>
					</select>
				 	<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="searchKeyword"
				 	aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
			</div>
		</div>
		
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
			<tbody id="board-table-body">
				<c:forEach var="vo" items="${list}">
					<tr>
						<th scope="row"><input type="checkbox" class="board-checkbox"></th>
						<td>${vo.no}</td>
						<td>${vo.userid}</td>
						<td>${vo.name}</td>
						<td>
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
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
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/mbti/member/memberList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage}">
						<li class="page-item"><a class="page-link" href="<c:url value='/admin/mbti/member/memberList?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">[${i}]</a></li>
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