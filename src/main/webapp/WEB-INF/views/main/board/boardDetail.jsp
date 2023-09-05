<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<section class="boardSection">
	<input type="hidden" class="board_comment_flag" value="${boardMap['COMMENT_FLAG']}">
	<input type="hidden" class="member-userId" value="${boardMap['USERID'] }">
	<input type="hidden" class="admin-adminId" value="${boardMap['ADMIN_ID'] }">
	<input type="hidden" class="session-userId" value="${sessionScope.userid }">
	<input type="hidden" value="${boardMap.BOARD_NO }" class="boardNo">
	<input type="hidden" value="${boardMap.BOARD_GROUP_NO }" name="boardGroupNo">
	<input type="hidden" value="${boardMap.BOARD_STEP }" name="boardStep">

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
					<input type="button" class="boardListBtn btn" onclick="location.href='<c:url value="/main/board/boardList?boardFormNo=${boardMap['BOARD_FORM_NO'] }"/>'" value="목록">
					<c:if test="${boardMap['USERID'] == sessionScope.userid and empty boardMap.ADMIN_ID}">
						<input type="button" class="btn-outline-secondary btn boardDelBtn" value="삭제">
						<input type="button" class="bg-orange-primary btn boardListBtn" onclick="location.href='<c:url value="/main/board/boardEdit?boardNo=${boardMap['BOARD_NO'] }&boardWriteType=edit"/>'" value="수정">
					</c:if>
					<c:if test="${boardMap['BOARD_STEP'] < 1 and boardMap['USERID'] != sessionScope.userid and boardMap.BOARD_FORM_NO != 1 and boardMap.BOARD_FORM_NO != 2 and boardMap.BOARD_FORM_NO != 3}">
						<input type="button" class="bg-orange-primary btn"
							onclick="location.href='<c:url value="/main/board/writeReply?boardNo=${param.boardNo }&boardWriteType=reply&boardFormNo=${boardMap['BOARD_FORM_NO'] }"/>'" 
							class="replyBtn" value="답변">
					</c:if>
				</div>			
			</div>
		</div>
		<div class="boardContent-body">
			<div class="board-title">
				<p class="board-title-name">${boardMap['BOARD_TITLE'] }</p>
				<span class="board-write-user-userId">
					<c:if test="${empty boardMap['ADMIN_NO'] }">${boardMap['NAME'] } (${boardMap['USERID'] })</c:if>
					<c:if test="${!empty boardMap['ADMIN_NO'] }">${boardMap['ADMIN_ID'] } (${boardMap['ADMIN_ID'] })</c:if>
				</span>
				<span class="board-regdate-readcount">
					<fmt:formatDate	value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd HH:mm:ss" /> <i class="bi bi-eye"></i> ${boardMap['BOARD_READCOUNT'] } 
				</span>
			</div>
			<div class="board-content">
				<c:if test="${!empty fileList }">
					<div class="boardFile">
					<button type="button"><i class="bi bi-dropbox"></i> 첨부파일</button>
					<ul class="file-list">
						<c:forEach var="vo" items="${fileList }">
							<c:choose>
						        <c:when test="${fn:length(vo.originalFileName) > 13}">
						        	<a href="<c:url value='/admin/board/fileDown?fileName=${vo.fileName }'/>" data-toggle="tooltip" data-html="true" title="${vo.originalFileName }">
								        <c:out value="${fn:substring(vo.originalFileName, 0, 12)}">
								        </c:out>...
							        </a><br>
						        </c:when>
						        <c:otherwise>
						        	<a href="<c:url value='/admin/board/fileDown?fileName=${vo.fileName }'/>" data-bs-toggle="tooltip" data-bs-title="${vo.originalFileName }">
								        <c:out value="${vo.originalFileName}">
								        </c:out>
							        </a><br>
						        </c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
					</div>
				</c:if>
				<div class="board-content-body">
					${boardMap['BOARD_BODY'] }			
				</div>
			</div>
			
			<div class="board-like">
				<input type="hidden" id="boardLike" value="">
				<span class="u_icon"></span>
				<em class="u_txt">좋아요</em>
				<em class="u_cnt"></em>
			</div>
			<c:if test="${boardMap['COMMENT_FLAG'] == 'Y'}">
				<p class="board-comment-count"></p>
				<div class="commentList"></div>
				<c:if test="${!empty sessionScope.userid }">
					<form name="commentFrm" method="post">
						<p class="board-comment-user">${sessionScope.name } (${sessionScope.userid })</p>
						<div class="textarea-group">
							<textarea id="comment-area" name="commentsBody"></textarea>
							<input type="hidden">				
							<input type="hidden" value="${boardMap['BOARD_NO'] }" name="boardNo">
							<input type="hidden" value="${sessionScope.no }" name="no">
							<input type="button" value="답글등록" id="comment-submit" onclick="commentWrite()">
						</div>
					</form>
				</c:if>
			</c:if>
			
		</div>
	</div>
</section>

<script type="text/javascript" src="<c:url value='/main-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>