<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	//신청하기 버튼을 눌렀을 때 로그인 체크
	function logincheck(eduNo){
		var signIn = "${sessionScope.userid}";
		
		if(signIn == null || signIn == ""){
			$('#alertModalBody').html("먼저 로그인 후 신청하세요.");
			$('#alertModalBtn').trigger('click');
			$('#btnClose').click(function(){
				location.href="<c:url value='/main/member/memberLogin'/>";
				return false;
			})
		}else {
			location.href="<c:url value='/main/education/apply?eduNo="+eduNo+"'/>";
		}
	}
</script>

<section class="education-info-main">
<div id="education-main">
	<pre>MBTI에 대해 더 자세히 알고 싶다면
지금 바로 다양한 교육을 신청해 보세요!</pre>
</div>
	<section class="section-list">
		<div class="inner1200">
			<h2>ESSENTIAL 교육 목록</h2>
		</div>
		<div class="inner1200">
		<div class="list-head">
			<div class="list-search-result">
				<form name="frmSearch" method="post" action="<c:url value='/main/education/list'/>">
				<div class="input-group mb-3" id="edu-search-div" class="education">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchCondition" id="list-search-select">					  	
					  	<option value="edu_name" <c:if test="${param.searchCondition=='edu_name'}"> selected="selected" </c:if>>교육 이름</option>
					  	<option value="edu_tea_name" <c:if test="${param.searchCondition=='edu_tea_name'}"> selected="selected" </c:if>>강사명</option>
					  	<option value="ep_name" <c:if test="${param.searchCondition=='ep_name'}"> selected="selected" </c:if>>교육장</option>
					</select>
				 	<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" id="list-search-area" value="${param.searchKeyword}">
				 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
				</form>
			</div>
		</div>
		<ul class="list-class">
		<c:set var="idx" value="0"/>
		<c:if test="${empty list }">
			<tr>
				<td colspan="9">해당 검색 내용이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
		 <c:forEach var="educationVo" items="${list}">
			<c:set var="educationNo" value="${educationVo.eduNo}"/>
				<li>
					<article>
						  <figure>
							<p class="tea" style="text-align: center; margin-top:10px">
								<img src="<c:url value='/images/education/${educationVo.eduTeaImg }'/>">
							</p>
							<p class="tea-name">
								<span class="name">${educationVo.eduTeaName }<br>강사님</span>	
							</p>
						  </figure>
						  <figcaption>
						  	<div class="classLoc">
						  		<p class="loc">${educationVo.epName }</p>
						  	</div>
						  	<h3 class="tit">${educationVo.eduName }</h3>
						  	<p class="date" style="margin-top:20px;margin-bottom: 0;"><em>일정</em>    ${educationVo.eduCom }</p>
						  	<p class="price"><em>가격</em>    <fmt:formatNumber value="${educationVo.eduPrice }" pattern="#,###"/>원</p>
						  </figcaption>
						  <div class="btnGroup">
						  	<input type="button" id="applyBtn" value="신청하기" onclick='logincheck(${educationVo.eduNo})'/>
						  </div>
					</article>
				</li>
			<c:set var="idx" value="${idx + 1 }" />
		  </c:forEach>
		  </c:if>
			</ul>
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
							<li class="page-item active"><a class="page-link" href="<c:url value='/main/education/list?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage}">
							<li class="page-item"><a class="page-link" href="<c:url value='/main/education/list?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
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

		</div>
	</section>
</section>

<%@ include file="../inc/bottom.jsp"%>