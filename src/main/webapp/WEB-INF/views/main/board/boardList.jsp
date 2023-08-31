<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<section class="boardSection">
	<div class="boardContent">
		<div class="boardContent-head">
			<div class="head-content">
				<div class="head-content-box1">
					<nav class="board-nav">
						<ul class="board-ul">
							<li class="board-li-category">게시판 카테고리</li>
							<li class="board-li-category">전체 게시글</li>							
						</ul>
					</nav>
				</div>
				<div class="head-content-box2">
					<select class="form-select form-select-sm" id="mainBoardSearchCondtion" aria-label="Small select example" name="searchCondition">				
						<option value="board_title" <c:if test="${param.searchCondition == 'board_title' }">selected="selected"</c:if>>제목</option>
					  	<option value="board_body" <c:if test="${param.searchCondition == 'board_body' }">selected="selected"</c:if>>내용</option>
					  	<option value="name" <c:if test="${param.searchCondition == 'name' }">selected="selected"</c:if>>작성자</option>
					</select>
					<div class="searchInputText">
						<input type="text" class="boardSearchKeyword" name="seasrchKeyword">
						<i class="bi bi-search"></i>					
					</div>
				</div>
				<div class="head-content-box2">
				</div>			
			</div>
		</div>
		<div class="boardContent-body">
			<div class="boardWritediv">
				<h5><c:if test="${empty param.boardFormNo }">전체게시글</c:if><c:if test="${!empty param.boardFormNo }">${boardList[0].BOARD_FORM_NAME }</c:if></h5>
				<button type="button" class="boardWriteBtn"><span class="boardWrite">게시글작성</span></button>
			</div>
			<ul class="boardFormList">
				
			</ul>
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>