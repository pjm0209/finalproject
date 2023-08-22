<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">게시판</h2>
	<button type="button" class="bg-orange-primary"	id="add-newBoard-button" onclick="location.href='<c:url value="/admin/board/boardCreate"/>'">새 게시판 추가</button>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>게시판 리스트</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="board-group-list" class="nav">
			<c:if test="${!empty boardList}">
				<c:forEach var="vo" items="${boardList }">
					<div class="board-side-boardItem">
						<div class="board-name">
							<input type="hidden" value="${vo.boardFormNo }">
							<a href="<c:url value='/admin/board/board?boardFormNo=${vo.boardFormNo }'/>">
								<span>${vo.boardFormName }</span>
							</a>
						</div>
						<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
<div class="board-body">
	<form name="paginForm" method="post" action="<c:url value='/admin/board/board'/>">
		<input type="hidden" name="boardFormNo" value="${param.boardFormNo }">
		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
		<input type="hidden" name="currentPage">
	</form>
	<div id="board-title">
		<h5>${boardFormVo.boardFormName }</h5>
		<button class="bg-orange-primary" id="board-write-button" onclick="location.href='<c:url value="/admin/board/boardWrite?boardFormNo=${param.boardFormNo}&boardWriteType=write"/>'">글쓰기</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<span class="search-count"></span>
				<form name="searchForm" method="post" action="<c:url value='/admin/board/board'/>">
					<div class="input-group mb-3" id="board-search-div">
						<div class="board-head-Group1">
							<input type="button" value="삭제" class="btn btn-outline-secondary" id="boardMultiDel">
							<span class="boardDelCount"></span>
						</div>
						<div class="board-head-Group2">
							<input type="hidden" name="boardFormNo" value="${param.boardFormNo }">
							<select class="form-select form-select-lg" aria-label=".form-select-lg example" id="board-search-select" name="searchCondition">					  	
							  	<option value="board_title" <c:if test="${param.searchCondition == 'board_title' }">selected="selected"</c:if>>제목</option>
							  	<option value="board_body" <c:if test="${param.searchCondition == 'board_body' }">selected="selected"</c:if>>내용</option>
							  	<option value="name" <c:if test="${param.searchCondition == 'name' }">selected="selected"</c:if>>작성자</option>
							</select>
						 	<input type="text" class="form-control" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area">
						 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<form name="boardFrm" method="post" action="<c:url value='/admin/board/boardListDel'/>">
			<table class="table board-table">
				<thead>
					<tr class="board-table-colum">
						<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
						<th scope="col" class="board-title">제목</th>
						<th scope="col" class="board-regdate">작성자</th>
						<th scope="col" class="board-writer">작성일</th>
						<th scope="col" class="board-readcount">조회수</th>
					</tr>
				</thead>			
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="4" style="text-align: center;">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<c:set var="idx" value="0"/>
						<c:forEach var="map" items="${list }">
							<tr>
								<th scope="row"><input type="checkbox" class="board-checkbox" name="boardItems[${idx }].boardNo" value="${map['BOARD_NO'] }"></th>
								<input type="hidden" class="board-checkbox" name="boardItems[${idx }].boardGroupNo" value="${map['BOARD_GROUP_NO'] }">
								<input type="hidden" class="board-checkbox" name="boardItems[${idx }].boardStep" value="${map['BOARD_STEP'] }">
								<input type="hidden" class="board-checkbox" name="boardItems[${idx }].boardSort" value="${map['BOARD_SORT'] }">
								<input type="hidden" class="board-checkbox" name="boardItems[${idx }].boardFormNo" value="${map['BOARD_FORM_NO'] }">
								<td class="board-title">
									<c:if test="${map['BOARD_STEP'] > 0 }">
										<c:forEach var="i" begin="0" end="${map['BOARD_STEP'] }">
											&nbsp;
										</c:forEach>
										<i class="bi bi-arrow-return-right"></i>
									</c:if>
									<c:if test="${map['BOARD_DEL_FLAG'] != 'Y' }">
										<c:if test="${map['FILECOUNT'] != 0 and map['BOARD_FILE_ADD_FLAG'] == 'Y'}">
											<img alt="파일이미지" src="<c:url value='/images/file.gif'/>">
										</c:if>
										<a href="<c:url value='/admin/board/boardDetail?boardNo=${map["BOARD_NO"] }'/>"> ${map['BOARD_TITLE']}</a>	
										<c:if test="${map['COMMENTCOUNT'] != 0 and map['COMMENT_FLAG'] == 'Y'}">
											<span>[${map['COMMENTCOUNT'] }]</span>
										</c:if>																
									</c:if>
									<c:if test="${map['BOARD_DEL_FLAG'] == 'Y' }">
										<span>삭제된 글입니다.</span>
									</c:if>
								</td>
								<td class="board-writer">
									<c:if test="${!empty map['NAME'] }">
										${map['NAME'] }
									</c:if>
									<c:if test="${empty map['NAME'] }">
										${map['ADMIN_ID'] }
									</c:if>
								</td>
								<td class="board-regdate"><fmt:formatDate value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd"/> </td>
								<td class="board-readcount">${map['BOARD_READCOUNT'] }</td>
							</tr>
							<c:set var="idx" value="${idx + 1 }"/>
						</c:forEach>
					</c:if>		
				</tbody>
			</table>
		</form>
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
</div>
<!-- End of Main Content -->

<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>