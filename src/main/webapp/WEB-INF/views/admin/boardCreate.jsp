<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<!-- Begin Page Content -->
<div class="board-create">
	<!-- Page Heading -->
	<div class="boardCreate-head">
		<h2 class="text-gray-800" id="boardCreate-title">새 게시판 추가</h2>
		<div class="board-create-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-boardCreate" value="저장">
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@ include file="inc/bottom.jsp"%>