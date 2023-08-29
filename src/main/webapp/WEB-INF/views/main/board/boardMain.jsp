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
				</div>			
			</div>
		</div>
		<div class="boardContent-body">
			<div class="boardWritediv">
				<button type="button" class="boardWriteBtn"><span class="boardWrite">게시글작성</span></button>
			</div>
			<ul class="boardFormList">
				<c:forEach var="map" items="${boardCategoryList }">
					<li class="boardFormItem">
						<div class="boardCategoryTitleImg"></div>
						<div class="boardCategoryContent">
							<a class="boardCategoryContentTitle" href="#">${map.BOARD_FORM_NAME }</a>
							<p class="boardCategoryContentIntro">${map.BOARD_FORM_INTRO }</p>
						</div>
						<div class="boardCategoryWriteCount"><i class="bi bi-chat-square"></i><span class="boardWriteCount">${map.BOARDCOUNT }</span></div>						
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>