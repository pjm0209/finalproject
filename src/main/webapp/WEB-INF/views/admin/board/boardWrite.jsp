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
		<c:if test="${!empty param.boardNo }">
			<input type="hidden" name="boardNo" value="${param.boardNo }">
		</c:if>	
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
					                <c:set var="i" value="0"/>
					                <c:if test="${!empty param.boardFormNo or empty fileList}">
					                	<div class="file_input">            
								            <span class="fileName"></span>									        
								            <label>
								            	<i class="bi bi-folder-plus"></i>
								                <input type="file" name="files" onchange="selectFile(this);" />
								            </label>
						                    <button type="button" onclick="addFile();" class="btns fn_add_btn"><span><i class="bi bi-plus-lg"></i></span></button>
					                	</div>
						            </c:if>					            
					                <c:if test="${!empty fileList }">
					                	<c:forEach var="fileVo" items="${fileList }">
					                		<div>
							                    <div class="file_input">
							                    	<span class="fileName">${fileVo.originalFileName }</span>	
							                    	<span class="bi bi-x-lg btns del_btn edit" onclick="removeFile(this);"></span>
							                    	<input type="hidden" class="fileName" value="${fileVo.fileName }">
							                        <input type="hidden" class="fileNo" value="${fileVo.fileNo }">
							                        <input type="hidden" class="fileIdx" value="${i }">
							                    </div>							                    					                    
							                    <c:if test="${i == 0 }">
									                <button type="button" onclick="addFile();" class="btns fn_add_btn"><i class="bi bi-plus-lg"></i></button>
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

<script src="<c:url value='/admin-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>