<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/admin/board/boardHeadSide"></c:import>
<div class="board-body">
	<input type="hidden" name="lastEditAdminId" value="admin">
	<input type="hidden" name="boardFormNo" value="${param.boardFormNo }">
	<div id="board-title">
		<h5>${vo.boardFormName }</h5>
		<div class="board-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board?boardFormNo=1"/>'" value="취소">			
			<input type="submit" class="bg-gradient-primary" id="save-boardWrite" value="저장">
		</div>
	</div>
	<div class="board">
		<!-- 기본설정 시작 -->
			<div class="">
				
			</div>
			<!-- 기본설정 끝 --> 
			
	</div>
</div>
</div>
<!-- End of Main Content -->
<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>