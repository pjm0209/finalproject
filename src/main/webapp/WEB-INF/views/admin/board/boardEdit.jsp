<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/admin/board/boardHeadSide"></c:import>
<div class="board-body">
	<form>
		<div id="board-title">
			<h5>공지사항</h5>
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board?boardFormNo=1"/>'" value="취소">
			<button class="bg-gradient-secondary" id="board-write-button">저장</button>
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
							<div class="input_group v2"><input type="text" readonly="readonly" value="공지사항" name="board_name" id="board_name" maxlength="50"></div>
						</dd>
						<dt>게시판 설명</dt>
						<dd>
							<div class="input_group v2"><textarea id="board_desc" name="baord_desc" maxlength="300"></textarea></div>
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
				<!-- 기능설정 끝 -->
		</div>
	</form>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>