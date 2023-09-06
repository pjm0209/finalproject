<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<link rel="stylesheet" type="text/css" href="<c:url value='/main-css-js/css/myPageBoard.css'/>">
    
<section id="myPageBoardList">
	<div class="myBoardListTable">
		<h1>내 게시글</h1>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" class="ck"><input type="checkbox" class="chkAll"></th>
					<th scope="col" class="title">제목</th>
					<th scope="col" class="boardForm">게시판</th>					
					<th scope="col" class="readCount">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty myBoardList }">
					<c:set var="i" value="0" />
					<c:forEach var="map" items="${myBoardList }">
						<tr>
							<th scope="row" class="ck"><input type="checkbox" name="boardItems[${i }].boardNo" value="${map.BOARD_NO }"></th>
							<td class="title row">${map.BOARD_TITLE }</td>
							<td class="boardForm">${map.BOARD_FORM_NAME }</td>
							<td class="comments">${map.COMMENTCOUNT }</td>
						</tr>
						<c:set var="i" value="${i + 1 }"/>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</section>
    
<%@include file="../inc/bottom.jsp" %>