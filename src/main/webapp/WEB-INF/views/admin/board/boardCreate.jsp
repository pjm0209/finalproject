<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<div class="board-create">
	<!-- Page Heading -->
	<form name="boardCreate-frm" method="post" action="<c:url value='/admin/board/boardCreate'/>">
	<div class="boardCreate-head">
		<h2 class="text-gray-800" id="boardCreate-title">새 게시판 추가</h2>
		<div class="board-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board?boardFormNo=1"/>'" value="취소">
			<input type="submit" class="bg-orange-primary" id="save-boardCreate" value="저장">
		</div>
	</div>
		<div class="boardCreate-body">
			<!-- 기본설정 시작 -->
			<div class="boardCreate-setting">
				<div class="boardCreate-setting-head">
					<h3>기본 설정</h3>
					<span class="setting-head">게시판 노출 시 표시되는 정보입니다.</span>
				</div>
				<div class="boardCreate-setting-body">
					<dt>게시판명</dt>
					<dd>
						<div class="input_group v2"><input type="text" name="boardFormName" id="board_name" maxlength="50"></div>
					</dd>
					<dt>게시판 설명</dt>
					<dd>
						<div class="input_group v2"><textarea id="board_desc" name="boardFormIntro" maxlength="300"></textarea></div>
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
				<div class="boardCreate-setting-body">
					<dt>
						<span>댓글사용</span>					
					</dt>
					<dd>
						<div class="checkbox_group">
							<input type="checkbox" id="commentFlag">
							<span class="use_off on">사용안함</span>
							<span class="use_on">사용함</span>
							<input type="hidden" name="commentFlag" value="N">
						</div>
					</dd>
					
					<dt>
						<span>파일첨부</span>
						<span class="i_tooltip" data-bs-toggle="tooltip" data-bs-placement="top" title="하나당 20MB이하의 첨부 파일만 업로드 가능합니다."></span>
					</dt>
					<dd>
						<div class="checkbox_group">
							<input type="checkbox" id="boardFileAddFlag">
							<span class="use_off on">사용안함</span>
							<span class="use_on">사용함</span>
							<input type="hidden" name="boardFileAddFlag" value="N">
						</div>
					</dd>
					
					<dt>
						<span>게시판 사용</span>
					</dt>
					<dd>
						<div class="checkbox_group">
							<input type="checkbox" id="boardFlag">
							<span class="use_off on">사용안함</span>
							<span class="use_on">사용함</span>
							<input type="hidden" name="boardFlag" value="N">
						</div>
					</dd>
				</div>
			</div>
			<input type="hidden" name="firstAdminId" value="admin">
			<!-- 기능설정 끝 -->
		</div>
	</form>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>
<script src="<c:url value='/admin-css-js/js/boardCreate.js'/>"></script>    

<%@ include file="../inc/bottom.jsp"%>