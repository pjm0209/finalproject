<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/admin/board/boardHeadSide"></c:import>
<div class="board-body">
	<input type="hidden" name="lastEditAdminId" value="admin">
	<input type="hidden" name="boardNo" value="${param.boardNo }">
	<div id="board-title">
		<h5>${map['BOARD_FORM_NAME'] }</h5>
		<div class="board-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board?boardFormNo=${map['BOARD_FORM_NO'] }"/>'" value="목록">
			<input type="button" class="bg-gradient-primary" id="del-board" value="삭제">
			<input type="button" class="bg-gradient-primary" id="eidt-board" value="수정">
		</div>
	</div>
	<div class="board">
		<!-- 기본설정 시작 -->
		<div class="board-title">
			<p class="board-title-name">${map['BOARD_TITLE'] }</p>
			<span class="board-write-user-userId">${map['NAME'] } (${map['USERID'] })</span>
			<span class="board-regdate-readcount"><fmt:formatDate value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd HH:mm:ss"/> 조회수 ${map['BOARD_READCOUNT'] } </span>
		</div>
		<div class="board-content">
			<div class="filebox">
				<ul>
					<li><i class="bi bi-dropbox"></i></li>
				</ul>
			</div>
			${map['BOARD_BODY'] }
		</div>
		
		<p class="board-comment-count">댓글   ${fn:length(commentList) }</p>
		<form name="commentFrm">
			<p class="board-comment-user">관리자 (admin)</p>
			<div class="textarea-group">
				<textarea id="comment-area"></textarea>
				<input type="button" value="답글등록" id="comment-submit">
			</div>
		</form>
	</div>
</div>
</div>
<!-- End of Main Content -->
<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>