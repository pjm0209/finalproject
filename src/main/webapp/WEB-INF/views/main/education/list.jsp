<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	var contextPath = "/mbti";
	
	$(function(){
		var no = $('input[name=no]').val();		
		
		if(no.length > 0) {
			$('.list-class li').each(function(){
				var eduNo = $(this).find('input[name=eduNo]').val();
				
				var result = likeCheck(eduNo, no);
				console.log("result: " + result);
				if(result > 0) {
					$(this).find('.u_icon').addClass('like');
				}
			});
		}
		
		$('.u_icon').click(function(){
			var eduNo = $(this).parents('article').find('input[name=eduNo]').val();			
			
			if(no.length > 0) {
				if($(this).hasClass('like')){
					eduLikeDel(eduNo);
					
					$(this).removeClass('like');
				} else {
					eduLikeIns(eduNo, no);
					
					$(this).addClass('like');
				}
			} else {
				$('#alertModalBody').html("먼저 로그인하세요.");
				$('#alertModalBtn').trigger('click');
				$('#btnClose').click(function(){
					location.href="<c:url value='/main/member/memberLogin'/>";
					return false;
				})
			}
		});
	});
	
	function likeCheck(eduNo, no) {
		var result = 0;
		
		$.ajax({
			url: contextPath + "/educationLike/eduLikeSel",
			type: "POST",
			data: {
				eduNo:eduNo,
				no:no
			},
			async: false,
			success:function(cnt) {
				console.log("cnt: " + cnt);	
				
				result = cnt;
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});
		
		return result;
	}

	//신청하기 버튼을 눌렀을 때 로그인 체크
	function logincheck(eduNo){
		var signIn = "${sessionScope.userid}";
		
		if(signIn == null || signIn == ""){
			$('#alertModalBody').html("먼저 로그인하세요.");
			$('#alertModalBtn').trigger('click');
			$('#btnClose').click(function(){
				location.href="<c:url value='/main/member/memberLogin'/>";
				return false;
			})
		}else {
			educationAjax(eduNo)
		}
	}
	
	/* //찜하기 버튼을 눌렀을 때 로그인 체크
	function logincheckLike(eduNo){
		var signIn = "${sessionScope.userid}";
		
		if(signIn == null || signIn == ""){
			$('#alertModalBody').html("먼저 로그인하세요.");
			$('#alertModalBtn').trigger('click');
			$('#btnClose').click(function(){
				location.href="<c:url value='/main/member/memberLogin'/>";
				return false;
			})
		}else {
			educationLikeAjax(eduNo)
		}
	} */
	
	//교육 중복 신청 막기
	function educationAjax(eduNo) {
		$.ajax({
			url: contextPath + "/main/education/apply",
			type: "POST",
			data: {eduNo:eduNo},
			success:function(result) {
				console.log("result: " + result);	
				
				if(result == 2) {
					$('#alertModalBody').html("이미 신청한 교육입니다.");
					$('#alertModalBtn').trigger('click');
				} else {
					$('#alertModalBody').html("신청이 완료되었습니다.");
					$('#alertModalBtn').trigger('click');					
				}
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});
	}
	
	//교육 중복 찜하기 막기
	function educationLikeAjax(eduNo) {
		$.ajax({
			url: contextPath + "/main//educationLike/eduLikeIns",
			type: "POST",
			data: {eduNo:eduNo},
			success:function(result) {
				console.log("result: " + result);	
				
				if(result == 2) {
					$('#alertModalBody').html("이미 찜한 교육입니다.");
					$('#alertModalBtn').trigger('click');
				} else {
					$('#alertModalBody').html("찜하기가 완료되었습니다.");
					$('#alertModalBtn').trigger('click');					
				}
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});
	}
	
	
</script>

<section class="education-info-main">
<div id="education-main">
	<pre>MBTI에 대해 더 자세히 알고 싶다면
지금 바로 다양한 교육을 신청해 보세요!</pre>
</div>
	<section class="section-list">
		<input type="hidden" value="${sessionScope.no }" name="no">
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
					<input type="hidden" value="${educationVo.eduNo }" name="eduNo">
						  <figure>
							<p class="tea" style="text-align: center; margin-top:10px">
								<img src="<c:url value='/fileUpload/${educationVo.eduTeaImg }'/>">
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
						  	<div class="edu_like">
						  		<em class="u_txt" style="font-size:17px; font-style:normal;">찜하기</em>
							  	<span class="u_icon" style="width:23px; height:23px;"></span>
						  	</div>
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
					      <a class="page-link" href="javascript:void(0);" aria-label="Next">
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