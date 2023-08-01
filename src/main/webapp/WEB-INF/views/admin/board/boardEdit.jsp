<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">게시판</h2>
	<button type="button" class="bg-gradient-primary"
		id="add-newBoard-button" onclick="location.href='boardCreate'">새 게시판 추가</button>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>게시판 리스트</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="board-group-list" class="nav">
			<div class="board-side-boardItem">
				<div class="board-name" name="notice" value="notice">
					<span>공지사항</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="QnA" value="QnA">
					<span>QnA</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="FAQ" value="FAQ">
					<span>FAQ</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>공지사항</h5>
		<button class="bg-gradient-secondary" id="board-write-button">저장</button>
	</div>
	<div class="board">
		<div class="boardEdit-general">
			<div class="boardCreate-setting">
				<div class="boardCreate-setting-head">
					<h3>기본 설정</h3>
					<span class="setting-head">게시판 노출 시 표시되는 정보입니다.</span>
				</div>
				<div class="boardCreate-setting-body">
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
			<div class="boardEdit-general-body">
			</div>
		</div>
		<div class="boardEdit-func">
			<div class="boardEdit-func-head"> 
			</div>
			<div class="boardEdit-func-body">
			</div>
		</div>
	</div>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>