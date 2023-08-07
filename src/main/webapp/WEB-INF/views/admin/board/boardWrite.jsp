<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/admin/board/boardHeadSide"></c:import>
<div class="board-body">
	<form name="boardWriteForm" method="post" enctype="multipart/form-data" action="<c:url value='/admin/board/boardWrite'/>">
		<div id="board-title">
		<input type="hidden" name="boardFormNo" value="4">
		<input type="hidden" name="no" value="1">
			<h5>공지사항</h5>
			<div class="board-head-button">
				<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board?boardFormNo=1"/>'" value="취소">
				<input type="submit" class="bg-gradient-primary" id="save-boardCreate" value="저장">
			</div>
		</div>
		<div class="board">
			<!-- 기본설정 시작 -->
				<div class="boardWrite">
					<div class="boardWrite-body">
						<dt>게시판</dt>
						<dd>
							<select id="select_board" name="select_board">
								<c:forEach var="vo" items="${boardList }">
									<option value="${vo.boardFormNo }">${vo.boardFormName }</option>
								</c:forEach>
							</select>
							<label class="resp_checkbox">
								<input type="checkbox" name="boardTop" value="Y">
								게시판 최상단 고정
							</label>
						</dd>
						<dt>제목</dt>
						<dd>
							<div class="input_group v2 board-write-title">
								<input type="text" name="boardTitle" id="board-wirte-title" maxlength="50" placeholder="제목을 입력해주세요.">
							</div>
						</dd>
						<dt>내용</dt>
						<dd>
							<div>
								<textarea id="p_content" name="boardBody"></textarea>								
							</div>
						</dd>
						<dt>
							<span>파일첨부</span>
							<span class="i_tooltip" data-bs-toggle="tooltip" data-bs-placement="top" title="하나당 20MB이하의 첨부 파일만 업로드 가능합니다."></span>
						</dt>
						<dd>
							<div class="file_list">
				                <div>
				                    <div class="file_input">
				                        <input type="text" readonly />
				                        <label> 첨부파일
				                            <input type="file" name="files" onchange="selectFile(this);" />
				                        </label>
				                    </div>
				                    <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
				                    <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일 추가</span></button>
				                </div>
				            </div>
						</dd>
							
						</dd>
					</div>
				</div>
				<!-- 기본설정 끝 --> 
				
		</div>
	</form>
</div>
</div>
<!-- End of Main Content -->

<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>