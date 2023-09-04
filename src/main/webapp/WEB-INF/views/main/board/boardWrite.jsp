<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>    
    
<c:if test="${param.boardWriteType == 'write' }">
	<c:set var="url" value="/main/board/boardWrite"/>
	<c:set var="cancelUrl" value="${param.boardFormNo }"/>
	<c:set var="board" value="${boardFormVo.boardFormName }"/>
	<c:set var="buttonType" value="저장"/>
</c:if>

<c:if test="${param.boardWriteType == 'edit' }">
	<c:set var="url" value="/main/board/boardEdit"/>
	<c:set var="cancelUrl" value="${map['BOARD_FORM_NO'] }"/>
	<c:set var="board" value="${map['BOARD_FORM_NAME'] }"/>
	<c:set var="buttonType" value="수정"/>
</c:if>

<c:if test="${param.boardWriteType == 'reply' }">
	<c:set var="url" value="/main/board/writeReply"/>
	<c:set var="cancelUrl" value="${param.boardFormNo }"/>
	<c:set var="cancelUrl" value="${map['BOARD_FORM_NO'] }"/>
	<c:set var="board" value="${map['BOARD_FORM_NAME'] }"/>
	<c:set var="buttonType" value="저장"/>
</c:if>

<section class="boardSection">
	<div class="boardContent">
		<div class="boardContent-head">
			<div class="head-content">
				<div class="head-content-box1">
					<nav class="board-nav">
						<ul class="board-ul">
							<li class="board-li-category"><a href="<c:url value='/main/board/boardMain'/>">게시판 카테고리</a></li>
							<li class="board-li-category"><a href="<c:url value='/main/board/boardList'/>">전체 게시글</a></li>								
						</ul>
					</nav>
				</div>
				<div class="head-content-box2">
					<input type="button" class="bg-orange-primary boardListBtn btn" onclick="location.href='<c:url value="/main/board/boardList?boardFormNo=${cancelUrl }"/>'" value="목록">
					<input type="button" class="bg-orange-primary btn boardSubmitBtn" value="${buttonType }">
				</div>			
			</div>
		</div>
		<form name="boardWriteForm" method="POST" enctype="multipart/form-data" action="<c:url value='${url }'/>">
			<input type="hidden" name="no" value="${sessionScope.no }">
			<c:if test="${!empty param.boardNo }">
				<input type="hidden" name="boardNo" value="${param.boardNo }">
			</c:if>
			<c:if test="${param.boardWriteType == 'reply' }">
				<input type="hidden" name="boardGroupNo" value="${map.BOARD_GROUP_NO }">
			</c:if>
			<div class="boardContent-body">
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
								<c:if test="${param.boardFormNo == 5 }">
									<select class="form-select writembti" aria-label="Default select example" name="mbtiNo">
										<c:if test="${param.boardWriteType != 'reply' }">
											<c:forEach var="mbtiVo" items="${mbtiList }">
												<option value="${mbtiVo.mbtiNo }" <c:if test="${mbtiVo.mbtiNo == param.mbtiNo }"> selected = "selected"</c:if>>${mbtiVo.mbtiType }</option>								
											</c:forEach>
										</c:if>
										<c:if test="${param.boardWriteType == 'reply' }">
											<c:forEach var="mbtiVo" items="${mbtiList }">
												<c:if test="${map['MBTI_NO'] == mbtiVo.mbtiNo }">
													<option value="${map['MBTI_NO'] }">${mbtiVo.mbtiType }</option>
												</c:if>
											</c:forEach>
										</c:if>
									</select>
								</c:if>
							</dd>
							<dt>제목</dt>
							<dd>
								<div class="input_group v2 board-write-title">
									<input type="text" name="boardTitle" value="${map['BOARD_TITLE'] }" id="board-write-title" maxlength="50" placeholder="제목을 입력해주세요.">
								</div>
							</dd>
							<dt>내용</dt>
							<dd>
								<div class="boardContentArea">
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
								                    	<span class="bi bi-x-lg btns del_btn edit" id="edit${i + 1 }"></span>
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
				</div>
		</form>
	</div>
</section>

<script type="text/javascript" src="<c:url value='/main-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>