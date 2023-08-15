<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<c:import url="/board/admin/boardHeadSide"></c:import>

<c:if test="${empty param.boardNo }">
	<c:set var="url" value="/board/boardWrite"/>
	<c:set var="board" value="${board }"/>
</c:if>

<c:if test="${!empty param.boardNo }">
	<c:set var="url" value="/board/boardWriteEdit"/>
	<c:set var="board" value="${map['BOARD_FORM_NAME'] }"/>
</c:if>

<div class="board-body">
	<form name="boardWriteForm" method="post" enctype="multipart/form-data" action="<c:url value='${url }'/>">
		<div id="board-title">
		<input type="hidden" name="adminNo" value="${sessionScope.adminNo }">
		<input type="hidden" name="boardNo" value="${param.boardNo }">	
			<h5>${boardFormVo.boardFormName }</h5>
			<div class="board-head-button">
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
						<c:if test="${map['BOARD_FILE_ADD_FLAG'] == 'Y' or boardFormVo.boardFileAddFlag == 'Y' }">
							<dt>
								<span>파일첨부</span>
								<span class="i_tooltip" data-bs-toggle="tooltip" data-bs-placement="top" title="하나당 20MB이하의 첨부 파일만 업로드 가능합니다."></span>
							</dt>
							<dd>
								<div class="file_list">
					                <c:if test="${!empty param.boardFormNo}">
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
						            </c:if>					            
					                <c:if test="${!empty fileList }">
					                <c:set var="i" value="0"/>
					                	<c:forEach var="fileVo" items="${fileList }">
					                		<div>
							                    <div class="file_input">
							                        <input type="text" class="fileOriginName" value="${fileVo.originalFileName }" readonly />
							                        <input type="hidden" class="fileName" value="${fileVo.fileName }">
							                        <input type="hidden" class="fileNo" value="${fileVo.fileNo }">
							                        <input type="hidden" class="fileIdx" value="${i }">
							                        <label> 첨부파일
							                            <input type="file" name="files" onchange="selectFile(this);" />
							                        </label>
							                    </div>
							                    <button type="button" class="btns del_btn edit"><span>삭제</span></button>							                    
							                    <c:if test="${i == 0 }">
									                <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일 추가</span></button>
							                    </c:if>
							                    <c:set var="i" value="${i + 1 }"/>
					                		</div>
					                	</c:forEach>
						            </c:if>					            
				                </div>
							</dd>
						</c:if>
					</div>
				</div>
				<!-- 기본설정 끝 --> 
		</div>
	</form>
</div>
</div>
<!-- End of Main Content -->
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>

<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>