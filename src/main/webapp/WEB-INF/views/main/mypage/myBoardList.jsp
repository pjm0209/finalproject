<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<link rel="stylesheet" type="text/css" href="<c:url value='/main-css-js/css/myPageBoard.css'/>">
    
<section id="myPageBoardList">
	<div class="background">
		<div class="myBoardListTable">
			<h1>내 게시글</h1>
			<div class="multiDelDiv">
				<input type="button" value="삭제" class="btn btn-outline-secondary" id="boardMultiDel">
				<span class="boardDelCount"></span>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col" class="ck"><input type="checkbox" class="chkAll"></th>
						<th scope="col" class="title">제목</th>
						<th scope="col" class="boardForm">게시판</th>					
						<th scope="col" class="commentCount">댓글수</th>
						<th scope="col" class="readCount">조회수</th>
					</tr>
				</thead>
				<tbody>
					<form name="boardDelMultiFrm" method="POST" action="<c:url value='/main/board/boardListDel'/>">
						<c:if test="${!empty myBoardList }">
							<c:set var="i" value="0" />
							<c:forEach var="map" items="${myBoardList }">
								<c:if test="${map.BOARD_DEL_FLAG == 'N' }">
									<tr>
										<th scope="row" class="ck">
											<input type="checkbox" name="boardItems[${i }].boardNo" value="${map.BOARD_NO }">
											<input type="hidden" name="boardItems[${i }].boardGroupNo" value="${map.BOARD_GROUP_NO }">										
											<input type="hidden" name="boardItems[${i }].boardStep" value="${map.BOARD_STEP }">										
											<input type="hidden" name="boardItems[${i }].boardSort" value="${map.BOARD_SORT }">										
										</th>
										<td class="title">									
											<a href="<c:url value='/main/board/boardDetail?boardNo=${map.BOARD_NO }'/>">
												<c:if test="${map.BOARD_STEP > 0 }">
													답변 - 
												</c:if>
												${map.BOARD_TITLE }
											</a>
											<c:if test="${map.FILECOUNT != 0 and map.BOARD_FILE_ADD_FLAG == 'Y'}">
												<img alt="파일이미지" src="<c:url value='/images/file.gif'/>">
											</c:if>
											<c:if test="${map.BOARD_SECREATE == 'Y' }">
												<i class="bi bi-lock"></i>
											</c:if>									
										</td>
										<td class="boardForm">
											<a href="<c:url value='/main/board/boardList?boardFormNo=${map.BOARD_FORM_NO }'/>">${map.BOARD_FORM_NAME }</a>
										</td>
										<td class="commentCount">${map.COMMENTCOUNT }</td>
										<td class="readCount">${map.BOARD_READCOUNT }</td>
									</tr>
									<c:set var="i" value="${i + 1 }"/>
								</c:if>
							</c:forEach>
						</c:if>
					</form>
				</tbody>
			</table>
		</div>
	</div>
</section>

<script type="text/javascript" src="<c:url value='/main-css-js/js/myPage.js'/>"></script>
    
<%@include file="../inc/bottom.jsp" %>