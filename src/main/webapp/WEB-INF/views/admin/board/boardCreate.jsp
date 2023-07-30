<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

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
	<div class="boardCreate-body">
		<!-- 기본설정 시작 -->
		<div class="boardCreate-setting">
			<div class="boardCreate-setting-head">
				<h3>기본 설정</h3>
				<span class="setting-head">게시판 노출 시 표시되는 정보입니다.</span>
			</div>
			<div class="general-body">
				<dt>게시판명</dt>
				<dd>
					<div class="input_group v2"><input type="text" name="board_name" id="board_name" maxlength="50"></div>
				</dd>
				<dt>게시판 설명</dt>
				<dd>
					<div class="input_group v2"><textarea id="board_desc" name="baord_desc" maxlength="300"></textarea></div>
				</dd>
			</div>
		</div>
		<!-- 기본설정 끝 -->
		<!-- 기능설정 시작 -->
		<div class="boardCreate-setting">
			<div class="boardCreate-setting-head">
				<h3>기능 설정</h3>
				<span class="setting-head">글쓰기 사용 기능에 대한 설정입니다.</span>
			</div>
		</div>
		<!-- 기능설정 끝 -->
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>