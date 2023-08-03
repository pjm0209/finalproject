<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">게시판</h2>
	<div class="board-head-button">
		<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board"/>'" value="취소">
		<input type="submit" class="bg-gradient-primary" id="save-boardCreate" value="저장">
	</div>
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
	<form>
		<div id="board-title">
			<h5>공지사항</h5>
			<button class="bg-gradient-secondary" id="board-write-button">저장</button>
		</div>
		<div class="board">
			<!-- 기본설정 시작 -->
				<div class="boardWrite">
					<div class="boardWrite-body">
						<dt>게시판</dt>
						<dd>
							<select id="select_board" name="select_board">
								<option value="notice">공지사항</option>
								<option value="faq">자주묻는질문</option>
								<option value="qna">1:1 문의</option>
							</select>
							<label class="resp_checkbox">
								<input type="checkbox" name="boardTop" value="Y">
								게시판 최상단 고정
							</label>
						</dd>
						<dt>제목</dt>
						<dd>
							<div class="input_group v2 board-write-title">
								<input type="text" name="title" id="board-wirte-title" maxlength="50">
							</div>
						</dd>
						<dt>내용</dt>
						<dd>
							<div>
								<textarea></textarea>
								
							</div>
						</dd>
						<dt>파일첨부</dt>
						<dd>
							
						</dd>
						<dt>비밀글 여부</dt>
						<dd>
							
						</dd>
					</div>
				</div>
				<!-- 기본설정 끝 --> 
				
		</div>
	</form>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>