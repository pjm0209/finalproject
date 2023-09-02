<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<form name="paginForm" method="post" action="<c:url value='/main/board/boardList'/>">
	<input type="hidden" name="boardFormNo" value="${param.boardFormNo }">
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	<c:if test="${param.boardFormNo == 5 }">
		<input type="hidden" name="mbtiNo" value="${param.mbtiNo }">
	</c:if>
	<input type="hidden" name="currentPage">
</form>
<section class="boardSection">
	<div class="boardContent">
		<div class="boardContent-head">
			<div class="head-content">
				<div class="head-content-box1">
					<nav class="board-nav">
						<ul class="board-ul">
							<li class="board-li-category"><a href="<c:url value='/main/board/boardMain'/>">게시판 카테고리</a></li>
							<li class="board-li-category"><a href="<c:url value='/main/board/boardList'/>">전체 게시글</a></li>							
						</ul>
					</nav>
				</div>
				<div class="head-content-box2">
					<select class="form-select form-select-sm" id="mainBoardSearchCondtion" aria-label="Small select example" name="searchCondition">				
						<option value="board_title" <c:if test="${param.searchCondition == 'board_title' }">selected="selected"</c:if>>제목</option>
					  	<option value="board_body" <c:if test="${param.searchCondition == 'board_body' }">selected="selected"</c:if>>내용</option>
					  	<option value="name" <c:if test="${param.searchCondition == 'name' }">selected="selected"</c:if>>작성자</option>
					</select>
					<div class="searchInputText">
						<input type="text" class="boardSearchKeyword" name="seasrchKeyword">
						<i class="bi bi-search"></i>					
					</div>
				</div>		
			</div>
		</div>
		<div class="boardContent-body">
			<div class="boardWritediv">
				<h5><c:if test="${empty param.boardFormNo }">전체게시글</c:if><c:if test="${!empty param.boardFormNo }">${boardFormVo.boardFormName }</c:if></h5>
				<button type="button" class="boardWriteBtn"><span class="boardWrite">게시글작성</span></button>
			</div>
			
			<div class="boardListColumn">
				<div class="Column">
					<div class="boardCommentsCount">
						<i class="bi bi-chat-square"></i>
					</div>
					<div class="boardReadCount">
						<i class="bi bi-eye"></i>
					</div>
					<div class="boardWriter">
						<i class="bi bi-person-fill"></i>
					</div>
				</div>
			</div>
			
			<!-- 게시글 -->
			<ul class="boardFormList">
				<c:if test="${empty boardList }">
					<p class="notingBoardPost">게시글이 없습니다.</p>
				</c:if>
				<c:if test="${!empty boardList }">
					<c:forEach var="map" items="${boardList }">					
						<li class="boardPostItems">
							<c:if test="${map['BOARD_DEL_FLAG'] != 'Y' }">
								<div class="boardPostTitle">
									<c:if test="${map['BOARD_STEP'] > 0 }">
										<c:forEach var="i" begin="0" end="${map['BOARD_STEP'] }">
											&nbsp;
										</c:forEach>
										<i class="bi bi-arrow-return-right"></i>
									</c:if>
										<a href="<c:url value='/admin/board/boardDetail?boardNo=${map["BOARD_NO"] }'/>"> ${map['BOARD_TITLE']}</a>	
										<c:if test="${map['FILECOUNT'] != 0 and map['BOARD_FILE_ADD_FLAG'] == 'Y'}">
											<img alt="파일이미지" src="<c:url value='/images/file.gif'/>">
										</c:if>																									
								</div>
								<div class="boardPostComments">
									<c:if test="${map['COMMENT_FLAG'] == 'Y'}">
										<span>${map['COMMENTCOUNT'] }</span>
									</c:if>
								</div>
								<div class="boardPostReadCount">${map['BOARD_READCOUNT'] }</div>
								<div class="boardPostWriter">
									<c:if test="${!empty map['NAME'] }">
										${map['NAME'] }
									</c:if>
									<c:if test="${empty map['NAME'] }">
										${map['ADMIN_ID'] }
									</c:if>
								</div>
							</c:if>
							<c:if test="${map['BOARD_DEL_FLAG'] == 'Y' }">
								<span class="DelPost">삭제된 글입니다.</span>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
			</ul>
			
			<!-- 페이징 -->
			<nav class="boardPaging" aria-label="Page navigation example">
			  <ul class="pagination">
			  	<c:if test="${pagingInfo.firstPage > 1 }">
				    <li class="page-item">
				      <a class="page-link" href="#" onclick="pageFunc(${pagingInfo.fistPage - 1})" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			    	<c:if test="${i == pagingInfo.currentPage }">
					    <li class="page-item active"><a class="page-link" href="#">${i }</a></li>		    
			    	</c:if>
			    	<c:if test="${i != pagingInfo.currentPage }">
					    <li class="page-item"><a class="page-link" href="#" onclick="pageFunc(${i})">${i }</a></li>		    
			    	</c:if>
			    </c:forEach>
			    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next" onclick="pageFunc(${pagingInfo.lastPage + 1})">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>
	</div>
</section>

<script type="text/javascript" src="<c:url value='/main-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>