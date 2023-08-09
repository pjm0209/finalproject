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

	</div>
	<div class="board">
		<!-- 기본설정 시작 -->
			<div class="board-title">
				<h2>${map['BOARD_TITLE'] }</h2>
			</div>
			<div class="board-content">
				${map['BOARD_BODY'] }
			</div>
	</div>
</div>
</div>
<!-- End of Main Content -->
<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>