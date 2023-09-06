<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<section class="boardSection">
	<div class="boardContent">
		<h1>커뮤니티</h1>
		<div class="boardContentR">
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
					</div>			
				</div>
			</div>
			<div class="boardContent-body">
				<div class="boardWritediv">
					<!-- <button type="button" class="boardWriteBtn"><span class="boardWrite">게시글작성</span></button> -->
				</div>
				<ul class="boardFormList">
					<c:forEach var="map" items="${boardCategoryList }">
						<c:if test="${!empty map.BOARDCOUNT}">
							<c:set var="count" value="${map.BOARDCOUNT }"/>
						</c:if>
						<c:if test="${empty map.BOARDCOUNT}">
							<c:set var="count" value="0"/>
						</c:if>
						<c:if test="${map.BOARD_FLAG == 'Y' }">
							<li class="boardFormItem">
								<div class="boardCategoryTitleImg"></div>
								<div class="boardCategoryContent">
									<a class="boardCategoryContentTitle" href="<c:url value='/main/board/boardList?boardFormNo=${map.BOARD_FORM_NO }'/>">${map.BOARD_FORM_NAME }</a>
									<p class="boardCategoryContentIntro">${map.BOARD_FORM_INTRO }</p>
								</div>
								<div class="boardCategoryWriteCount">
									<i class="bi bi-chat-square" data-bs-toggle="tooltip" data-bs-placement="top" title="게시판에 작성된 게시글개수."></i>
									<span class="boardWriteCount">${count }</span>
								</div>						
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="<c:url value='/main-css-js/js/board.js'/>"></script>

<%@ include file="../inc/bottom.jsp"%>