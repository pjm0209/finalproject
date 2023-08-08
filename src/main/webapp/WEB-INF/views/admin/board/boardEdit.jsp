<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/admin/board/boardHeadSide"></c:import>
<div class="board-body">
	<form name="boardSetEdit" method="post" action="<c:url value='/admin/board/boardEdit'/>">
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
				<div class="boardEdit-setting">
					<div class="boardEdit-setting-head">
						<h3>기본 설정</h3>
						<span class="setting-head">게시판 노출 시 표시되는 정보입니다.</span>
					</div>
					<div class="boardEdit-setting-body">
						<dt>게시판명</dt>
						<dd>
							<div class="input_group v2"><input type="text" readonly="readonly" value="${vo.boardFormName }" name="boardFormName" id="board_name" maxlength="50"></div>
						</dd>
						<dt>게시판 설명</dt>
						<dd>
							<div class="input_group v2"><textarea id="board_desc" name="boardFormIntro" maxlength="300">${vo.boardFormIntro }</textarea></div>
						</dd>
					</div>
				</div>
				<!-- 기본설정 끝 --> 
				<!-- 기능설정 시작 -->
				<div class="boardEdit-setting">
					<div class="boardEdit-setting-head">
						<h3>기능 설정</h3>
						<span class="setting-head">글쓰기 사용 기능에 대한 설정입니다.</span>
					</div>
					<div class="boardEdit-setting-body">
						<dt>
						<span>댓글사용</span>					
					</dt>
					<dd>
						<div class="checkbox_group">
							<input type="hidden" value="${vo.commentFlag }" class="boardVal">
							<input type="checkbox" id="commentFlag">
							<span class="use_off on">사용안함</span>
							<span class="use_on">사용함</span>
							<input type="hidden" name="commentFlag" value="N" class="boardSet">
						</div>
					</dd>
					
					<dt>
						<span>파일첨부</span>
						<span class="i_tooltip" data-bs-toggle="tooltip" data-bs-placement="top" title="하나당 20MB이하의 첨부 파일만 업로드 가능합니다."></span>
					</dt>
					<dd>
						<div class="checkbox_group">
							<input type="hidden" value="${vo.boardFileAddFlag }" class="boardVal">
							<input type="checkbox" id="boardFileAddFlag">
							<span class="use_off on">사용안함</span>
							<span class="use_on">사용함</span>
							<input type="hidden" name="boardFileAddFlag" value="N" class="boardSet">
						</div>
					</dd>
					
					<dt>
						<span>게시판 사용</span>
					</dt>
					<dd>
						<div class="checkbox_group">
							<input type="hidden" value="${vo.boardFlag }" class="boardVal">
							<input type="checkbox" id="boardFlag">
							<span class="use_off on">사용안함</span>
							<span class="use_on">사용함</span>
							<input type="hidden" name="boardFlag" value="N" class="boardSet">
						</div>
					</dd>
					</div>
				</div>
				<!-- 기능설정 끝 -->
		</div>
	</form>
</div>
</div>
<!-- End of Main Content -->
<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>