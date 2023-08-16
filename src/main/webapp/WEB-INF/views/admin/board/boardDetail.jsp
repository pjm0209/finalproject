<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/board/admin/boardHeadSide"></c:import>
<div class="board-body">
	<input type="hidden" name="lastEditAdminId" value="admin">
	<input type="hidden" name="boardNo" value="${param.boardNo }">
	<input type="hidden" class="board_comment_flag" value="${map['COMMENT_FLAG']}">
	<input type="hidden" class="member-userId" value="${map['USERID'] }">
	<input type="hidden" class="admin-adminId" value="${map['ADMIN_ID'] }">
	<div id="board-title">
		<h5>${map['BOARD_FORM_NAME'] }</h5>
		<div class="board-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/board/board?boardFormNo=${map['BOARD_FORM_NO'] }"/>'"	value="목록">
			<input type="button" class="bg-gradient-primary" id="del-board" value="삭제">
			<c:if test="${map['ADMIN_ID'] == sessionScope.adminId}"> 
				<input type="button" class="bg-gradient-primary" onclick="location.href='<c:url value="/board/boardWriteEdit?boardNo=${param.boardNo }"/>'" id="eidt-board" value="수정">
			</c:if>
		</div>
	</div>
	<div class="board">
		<!-- 기본설정 시작 -->
		<div class="board-title">
			<p class="board-title-name">${map['BOARD_TITLE'] }</p>
			<span class="board-write-user-userId">
				<c:if test="${empty map['ADMIN_NO'] }">${map['NAME'] } (${map['USERID'] })</c:if>
				<c:if test="${!empty map['ADMIN_NO'] }">${map['ADMIN_ID'] } (${map['ADMIN_ID'] })</c:if>
			</span>
			<span class="board-regdate-readcount">
				<fmt:formatDate	value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd HH:mm:ss" /> 조회 ${map['BOARD_READCOUNT'] } 
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
					        	<a href="<c:url value='/board/fileDown?fileName=${vo.fileName }'/>" data-toggle="tooltip" data-html="true" title="${vo.originalFileName }">
							        <c:out value="${fn:substring(vo.originalFileName, 0, 12)}">
							        </c:out>...
						        </a><br>
					        </c:when>
					        <c:otherwise>
					        	<a href="<c:url value='/board/fileDown?fileName=${vo.fileName }'/>" data-bs-toggle="tooltip" data-bs-title="${vo.originalFileName }">
							        <c:out value="${vo.originalFileName}">
							        </c:out>
						        </a><br>
					        </c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
				</div>
			</c:if>
			${map['BOARD_BODY'] }			
		</div>
		
		<div class="board-like">
			<input type="hidden" id="boardLike" value="">
			<span class="u_icon"></span>
			<em class="u_txt">좋아요</em>
			<em class="u_cnt"></em>
		</div>
		<c:if test="${map['COMMENT_FLAG'] == 'Y' }">
			<p class="board-comment-count"></p>
			<div class="commentList"></div>
			<form name="commentFrm" action="post">
				<p class="board-comment-user">관리자 (${sessionScope.adminId })</p>
				<div class="textarea-group">
					<textarea id="comment-area" name="commentsBody"></textarea>
					<input type="hidden" value="${map['BOARD_NO'] }" name="boardNo">
					<input type="hidden" value="${sessionScope.adminNo }" name="adminNo">
					<input type="button" value="답글등록" id="comment-submit">
				</div>
			</form>
		</c:if>
	</div>
</div>
</div>
<!-- End of Main Content -->
<script type="text/javascript">
	function comments(comment) {
		var str = "";
		var boardWriter = "";
		
		if($('.member-userId').val().length < 1) {
			boardWriter = $('.admin-adminId').val();
		} else {
			boardWriter = $('.member-userId').val();
			
		}
		
		for(var i = 0; i < comment.length; i++) {
			var map = comment[i];			
			var date = new Date(map.COMMENTS_REGDATE);
			const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];
			
			str += "<div class='comment-item'>";
			
			if(map.ADMIN_ID.length > 0) {
				if(boardWriter === map.ADMIN_ID) {
					str += "<p class='comment-writer'>" + map.ADMIN_ID + "<span class='boardWriter-commentWrite'>작성자</span>" +
					"<span class='comment-write-regdate'>(" + regdate + ")</span><div class='commentEditOrDel'>" + 
					"<span class='comment-more'><i class='bi bi-three-dots-vertical'></i></span><div class='editDel'>" + 
					"<a href='#' class='commentEdit'>수정</a><a href='#' class='commentDel'>삭제</a></div>";
				} else {
					str += "<p class='comment-writer'>" + map.ADMIN_ID + "<span class='comment-write-regdate'>(" + regdate + ")</span>" +
					"<div class='commentEditOrDel'><span class='comment-more'><i class='bi bi-three-dots-vertical'></i></span>" + 
					"<div class='editDel'><a href='#' class='commentDel'>삭제</a></div>";
				}
			} else {
				if(boardWriter === map.NAME) {
					str += "<p class='comment-writer'>" + map.NAME + "<span class='boardWriter-commentWrite'>작성자</span>" + 
					"<span class='comment-write-regdate'>(" + regdate + ")</span><span class='comment-more'>" + 
					"<i class='bi bi-three-dots-vertical'></i></span><div class='editDel'><a href='#' class='commentEdit'>수정</a>" +
					"<a href='#' class='commentDel'>삭제</a></div>";
				} else {
					str += "<p class='comment-writer'>" + map.NAME + "<span class='comment-write-regdate'>(" + regdate + ")</span>";					
				}
			}
			str += "</div>";
			str += "<p class='comment-body'>" + map.COMMENTS_BODY + "</p>";
			
			str += "</div>";
		}
		
		$('div.commentList').html(str);
		$('p.board-comment-count').html("<i class='bi bi-chat-square-dots'>&nbsp</i> 댓글" + comment.length);
	}
</script>

<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>
<script src="<c:url value='/admin-css-js/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>