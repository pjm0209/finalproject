<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">게시판</h2>
	<div class="boardFormBtn">
		<button type="button" class="bg-orange-primary"	id="add-newBoard-button" onclick="location.href='<c:url value="/admin/board/boardEdit?boardFormNo=${param.boardFormNo }"/>'">게시판 수정</button>
		<button type="button" class="bg-orange-primary"	id="add-newBoard-button" onclick="location.href='<c:url value="/admin/board/boardCreate"/>'">새 게시판 추가</button>
	</div>
</div>
<div class="board-body">
	<form name="paginForm" method="post" action="<c:url value='/admin/board/board'/>">
		<input type="hidden" name="boardFormNo" value="${param.boardFormNo }">
		<input type="hidden" name="searchCondition" value="${param.searchCondition }">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
		<c:if test="${param.boardFormNo == 5 }">
			<input type="hidden" name="mbtiNo" value="${param.mbtiNo }">
		</c:if>
		<input type="hidden" name="currentPage">
	</form>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">				
				<form name="searchForm" method="post" action="<c:url value='/admin/board/board'/>">
					<div class="input-group mb-3" id="board-search-div">
						<div class="boardNameAndDel">
							<h5>${boardFormVo.boardFormName }</h5>
							<div class="board-head-Group1">
								<input type="button" value="삭제" class="btn btn-outline-secondary" id="boardMultiDel">
								<span class="boardDelCount"></span>
							</div>
						</div>
						<div class="board-head-Group2">
							<c:if test="${param.boardFormNo == 5 }">
								<select class="form-select" aria-label="Default select example" class="mbtiBoardmbti" name="mbtiNo">
									<option value="0">전체글</option>	
									<c:forEach var="mbtiVo" items="${mbtiList }">
										<option value="${mbtiVo.mbtiNo }" <c:if test="${param.mbtiNo == mbtiVo.mbtiNo }"> selected="selected" </c:if>>${mbtiVo.mbtiType }</option>								
									</c:forEach>
								</select>
							</c:if>
							<input type="hidden" name="boardFormNo" value="${param.boardFormNo }">
							<select class="form-select form-select-lg" aria-label=".form-select-lg example" id="board-search-select" name="searchCondition">					  	
							  	<option value="board_title" <c:if test="${param.searchCondition == 'board_title' }">selected="selected"</c:if>>제목</option>
							  	<option value="board_body" <c:if test="${param.searchCondition == 'board_body' }">selected="selected"</c:if>>내용</option>
							  	<option value="name" <c:if test="${param.searchCondition == 'name' }">selected="selected"</c:if>>작성자</option>
							</select>
						 	<input type="text" class="form-control" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area">
						 	<button class="btn btn-outline-secondary" type="submit" id="button-addon2-board">검색</button>
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
							<td colspan="5" style="text-align: center;">등록된 게시글이 없습니다.</td>
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
										<c:if test="${map.BOARD_SECREATE = 'Y' }">
											<i class="bi bi-lock"></i>
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
		<button class="bg-orange-primary" id="board-write-button" >글쓰기</button>
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