<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/admin/board/boardHeadSide"></c:import>

<c:if test="${empty param.boardNo }">
	<c:set var="url" value="<c:if test='/admin/board/boardWrite'/>"/>
	<c:set var="board" value="${board }"/>
</c:if>

<c:if test="${!empty param.boardNo }">
	<c:set var="url" value="<c:if test='/admin/board/boardWriteEdit'/>"/>
	<c:set var="board" value="${map['BOARD_FORM_NAME'] }"/>
</c:if>

<div class="board-body">
	<form name="boardWriteForm" method="post" enctype="multipart/form-data" action="${url }">
		<div id="board-title">
		<input type="hidden" name="adminNo" value="${sessionScope.adminNo }">		
			<h5>${board }</h5>
			<div class="board-head-button">
				<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/board/board?boardFormNo=1"/>'" value="취소">
				<input type="submit" class="bg-gradient-primary" id="save-boardCreate" <c:if test="${empty param.boardNo }"> value="저장" </c:if> <c:if test="${!empty param.boardNo }"> value="수정"</c:if>>
			</div>
		</div>
		<div class="board">
			<!-- 기본설정 시작 -->
				<div class="boardWrite">
					<div class="boardWrite-body">
						<dt>게시판</dt>
						<dd>
							<select id="select_board" name="boardFormNo">		
								<c:if test="${empty param.boardNo }">					
									<c:forEach var="vo" items="${boardList }">
										<option value="${vo.boardFormNo }" <c:if test="${vo.boardFormNo == param.boardFormNo }"> selected = "selected"</c:if>>${vo.boardFormName }</option>
									</c:forEach>
								</c:if>
								<c:if test="${!empty param.boardNo }">
									<option value="${map['BOARD_FORM_NO'] }">${map['BOARD_FORM_NAME'] }</option>
								</c:if>
							</select>
							<label class="resp_checkbox">
								<input type="checkbox" name="boardTop" value="Y">
								게시판 최상단 고정
							</label>
						</dd>
						<dt>제목</dt>
						<dd>
							<div class="input_group v2 board-write-title">
								<input type="text" name="boardTitle" value="${map['BOARD_TITLE'] }" id="board-wirte-title" maxlength="50" placeholder="제목을 입력해주세요.">
							</div>
						</dd>
						<dt>내용</dt>
						<dd>
							<div>
								<textarea id="p_content" name="boardBody">${map['BOARD_BODY'] }</textarea>								
							</div>
						</dd>
						<dt>
							<span>파일첨부</span>
							<span class="i_tooltip" data-bs-toggle="tooltip" data-bs-placement="top" title="하나당 20MB이하의 첨부 파일만 업로드 가능합니다."></span>
						</dt>
						<dd>
							<div class="file_list">
				                <c:if test="${empty fileList }">
				                    <div class="file_input">
				                        <input type="text" readonly />
				                        <label> 첨부파일
				                            <input type="file" name="files" onchange="selectFile(this);" />
				                        </label>
				                    </div>
				                    <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
				                    <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일 추가</span></button>
					            </c:if>					            
				                <c:if test="${!empty fileList }">
				                	<c:forEach var="fileVo" items="${fileList }">
					                    <div class="file_input">
					                        <input type="text" value="${fileVo.originalFileName }" readonly />
					                        <label> 첨부파일
					                            <input type="file" name="files" onchange="selectFile(this);" />
					                        </label>
					                    </div>
					                    <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
				                	</c:forEach>
					                <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일 추가</span></button>
					            </c:if>					            
			                </div>
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